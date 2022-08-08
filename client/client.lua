local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}

Elevator = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    ElevatorZones:CreateElevatorZones()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    ElevatorZones:DestroyElevatorZones()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function()
    PlayerData = QBCore.Functions.GetPlayerData() 
    PlayerJob = PlayerData.job.name
    Rank = PlayerData.job.grade.level
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function()
    PlayerData = QBCore.Functions.GetPlayerData()  
    PlayerGang = PlayerData.gang.name
    Rank = PlayerData.job.grade.level
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if DeleteZonesOnRestart then 
            ElevatorZones:DestroyElevatorZones()
        end
    end
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerData = QBCore.Functions.GetPlayerData() 
        PlayerJob = PlayerData.job.name
        PlayerGang = PlayerData.gang.name
        Rank = PlayerData.job.grade.level 
        ElevatorZones:CreateElevatorZones()
   end
end)

function Elevator:ElevatorMenu(Zone, FloorName)
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.metadata["isdead"] or PlayerData.metadata["inlaststand"] or isHandcuffed then 
            QBCore.Functions.Notify("You can't do that right now", "error")
        else
            elevatorMenu = {{header = Zone.." ".."Elevator:", txt = "Current Floor:".." "..FloorName, isMenuHeader = true}}
            if Elevators[Zone] ~= nil then
                elevatorMenu[#elevatorMenu+1] = {header = "Public Floors:",isMenuHeader = true}
                for k = 1, #Elevators[Zone].Floors, 1 do 
                    elevatorMenu[#elevatorMenu+1] = {
                        header = Elevators[Zone].Floors[k].menuheader,
                        txt = Elevators[Zone].Floors[k].menutxt, 
                        icon = "fas fa-check",
                        params = {
                            event = "mb-elevators:client:uselevator",
                            args = {
                                zone = Zone, 
                                coords = Elevators[Zone].Floors[k].coords,
                                heading = Elevators[Zone].Floors[k].heading,
                                progresstime = Elevators[Zone].WaitTime,
                                progressmsg = Elevators[Zone].Floors[k].pbtxt,
                                vehcoords = Elevators[Zone].Floors[k].vehcoords,
                                vehheading = Elevators[Zone].Floors[k].vehheading
                            }
                        }
                    }
                end
            else
                elevatorMenu[#elevatorMenu+1] = {header = "No public floors found!", icon = "fas fa-circle-exclamation", isMenuHeader = false}
            end
            
            if Restricted[Zone] ~= nil then
                if HasAccess(Zone) or HasItemAccess(Zone) then
                    elevatorMenu[#elevatorMenu+1] = {header = "Restricted Floors:", isMenuHeader = true,}
                    for k = 1, #Restricted[Zone].Floors, 1 do 
                        elevatorMenu[#elevatorMenu+1] = {
                            header = Restricted[Zone].Floors[k].menuheader,
                            txt = Restricted[Zone].Floors[k].menutxt, 
                            icon = "fas fa-lock",
                            params = {
                                event = "mb-elevators:client:uselevator",
                                args = {
                                    zone = Zone, 
                                    coords = Restricted[Zone].Floors[k].coords,
                                    heading = Restricted[Zone].Floors[k].heading,
                                    progresstime = Restricted[Zone].WaitTime,
                                    progressmsg = Restricted[Zone].Floors[k].pbtxt,
                                    vehcoords = Restricted[Zone].Floors[k].vehcoords,
                                    vehheading = Restricted[Zone].Floors[k].vehheading
                                }
                            }
                        }
                    end
                end
            end 
        
            if GradedAccess[Zone] ~= nil then 
                if HasGradedAccess(Zone, Rank) then 
                    elevatorMenu[#elevatorMenu+1] = {header = "Grade Restricted Floors: ("..PlayerData.job.grade.name..")",isMenuHeader = true}
                    for k = 1, #GradedAccess[Zone][Rank].Floors, 1 do 
                        elevatorMenu[#elevatorMenu+1] = {
                            header = GradedAccess[Zone][Rank].Floors[k].menuheader,
                            txt = GradedAccess[Zone][Rank].Floors[k].menutxt, 
                            icon = "fas fa-lock",
                            params = {
                                event = "mb-elevators:client:uselevator",
                                args = {
                                    zone = Zone, 
                                    coords = GradedAccess[Zone][Rank].Floors[k].coords,
                                    heading = GradedAccess[Zone][Rank].Floors[k].heading,
                                    progresstime = GradedAccess[Zone][Rank].WaitTime,
                                    progressmsg = GradedAccess[Zone][Rank].Floors[k].pbtxt,
                                    vehcoords = GradedAccess[Zone][Rank].Floors[k].vehcoords,
                                    vehheading = GradedAccess[Zone][Rank].Floors[k].vehheading
                                }
                            }
                        }
                    end
                end
            end
            elevatorMenu[#elevatorMenu+1] = {header = "Close Menu", icon = "fas fa-arrow-left-long", params = { event = "qb-menu:client:closeMenu"}}
            exports['qb-menu']:openMenu(elevatorMenu)
        end
    end)
end

RegisterNetEvent("mb-elevators:client:uselevator", function(data)
    QBCore.Functions.Progressbar("Using Elevator", data.progressmsg, data.progresstime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@apt_trans@elevator",
        anim = "elev_1",
        flags = 16,
    }, {}, {}, function()
        if VehicleTeleport then 
            DoScreenFadeOut(1000)
            Wait(5000)
            if IsPedInAnyVehicle(PlayerPedId()) == 1 and data.vehcoords ~= nil and data.vehheading ~= nil then
                VehicleTarget = GetVehiclePedIsUsing(PlayerPedId())
                SetEntityCoords(VehicleTarget, data.vehcoords.x, data.vehcoords.y, data.vehcoords.z, 0, 0, 1)
                SetEntityHeading(VehicleTarget, data.vehheading)
            else
                SetEntityCoords(PlayerPedId(), data.coords.x, data.coords.y, data.coords.z, 0, 0, 1)
                SetEntityHeading(PlayerPedId(), data.heading)
            end
            Wait(2000)
            DoScreenFadeIn(2000)
        else
            DoScreenFadeOut(1000)
            Wait(5000)
            SetEntityCoords(PlayerPedId(), data.coords.x, data.coords.y, data.coords.z, 0, 0, 1)
            SetEntityHeading(PlayerPedId(), data.heading)
            Wait(2000)
            DoScreenFadeIn(2000)
            ClearPedTasks(PlayerPedId())
        end
    end, function() -- Cancel 
        ClearPedTasks(PlayerPedId())
    end, "fas fa-elevator")
end)

function HasAccess(Zone)
    if (Restricted[Zone].Locked) ~= nil then
        for k,v in pairs(Restricted[Zone].Locked) do
            if PlayerJob == v or PlayerGang == v or PlayerData.citizenid == v then 
                return true
            end
        end
    end
end

function HasGradedAccess(Zone, Rank)
    if (GradedAccess[Zone][Rank].Locked) ~= nil then
        for k,v in pairs(GradedAccess[Zone][Rank].Locked) do 
            if PlayerJob == v or PlayerGang == v or PlayerData.citizenid == v then 
                return true 
            end
        end 
    end
end

local HasItem = false
function HasItemAccess(Zone)
    if (Restricted[Zone].Item) ~= nil then 
        for k,v in pairs(Restricted[Zone].Item) do 
            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
                if HasItem then
                    HasItems = true
                else
                    HasItems = false
                end
            end, v)
            Wait(100)
            if HasItems then
                return true
            else
                return false
            end
        end
    end
end