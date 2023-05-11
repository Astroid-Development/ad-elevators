QBCore = exports["qb-core"]:GetCoreObject()
PlayerData = {}

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    PlayerData = QBCore.Functions.GetPlayerData()
    CreateElevatorZones()
end)

RegisterNetEvent("QBCore:Client:OnPlayerUnload", function()
    DestroyElevatorZones()
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate", function()
    PlayerData = QBCore.Functions.GetPlayerData() 
    PlayerJob = PlayerData.job.name
    Rank = PlayerData.job.grade.level
end)

RegisterNetEvent("QBCore:Client:OnGangUpdate", function()
    PlayerData = QBCore.Functions.GetPlayerData()  
    PlayerGang = PlayerData.gang.name
    Rank = PlayerData.job.grade.level
end)

AddEventHandler("onResourceStop", function(resource)
	if GetCurrentResourceName() ~= resource then return end
	if ADElevators.Debug.DeleteZonesOnRestart then 
		if ADElevators.Config.Target.UseTarget then
			DestroyTargetZones()
		end
		if not ADElevators.Config.Target.UseTarget then 
			exports["qb-radialmenu"]:RemoveOption(ElevatorOption)
		end
        DestroyElevatorZones()
    end
end)

AddEventHandler("onResourceStart", function(resource)
	if GetCurrentResourceName() ~= resource then return end
    PlayerData = QBCore.Functions.GetPlayerData() 
    PlayerJob = PlayerData.job.name
    PlayerGang = PlayerData.gang.name
    Rank = PlayerData.job.grade.level 
    CreateElevatorZones()
end)

function AccessElevator(Zone, FloorName)
	local Type, Menu = GenerateElevatorMenu(Zone, FloorName)
	if Type == "qb-menu" then
		exports["qb-menu"]:openMenu(Menu)
	elseif Type == "ox_lib" then
		lib.showContext(Menu)
	end
end

function DrawText(Text, Type)
	if ADElevators.Config.Target.DrawText then
		exports["qb-core"]:DrawText(Text, Type)
	end
end

function TakeElevator(data)
    QBCore.Functions.Progressbar("Using Elevator", data.Progressbar, ADElevators.Config.Teleport.WaitTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = ADElevators.Config.Animation.Dict,
        anim = ADElevators.Config.Animation.Anim,
        flags = 16,
    }, {}, {}, function()
		StopAnimTask(PlayerPedId(), ADElevators.Config.Animation.Dict, ADElevators.Config.Animation.Anim, 0)
		TriggerServerEvent("InteractSound_SV:PlayOnSource", "elevator", 0.05)
		DoScreenFadeOut(ADElevators.Config.Teleport.Fade)
		Wait(ADElevators.Config.Teleport.WaitTime)
        if ADElevators.Config.Teleport.VehicleTeleport then 
            if IsPedInAnyVehicle(PlayerPedId()) == 1 and data.VehicleCoords ~= nil then
                VehicleTarget = GetVehiclePedIsUsing(PlayerPedId())
                SetEntityCoords(VehicleTarget, data.VehicleCoords.x, data.VehicleCoords.y, data.VehicleCoords.z, 0, 0, 1)
                SetEntityHeading(VehicleTarget, data.VehicleCoords.w)
            else
                SetEntityCoords(PlayerPedId(), data.Coords.x, data.Coords.y, data.Coords.z, 0, 0, 1)
                SetEntityHeading(PlayerPedId(), data.Coords.w)
            end
        else
			SetEntityCoords(PlayerPedId(), data.Coords.x, data.Coords.y, data.Coords.z, 0, 0, 1)
			SetEntityHeading(PlayerPedId(), data.Coords.w)
            ClearPedTasks(PlayerPedId())
        end
		Wait(ADElevators.Config.Teleport.WaitTime)
		DoScreenFadeIn(ADElevators.Config.Teleport.Fade)
    end, function()
        ClearPedTasks(PlayerPedId())
    end, "fas fa-elevator")
end

RegisterNetEvent("ad-elevators:client:radialelevator", function()
    AccessElevator(Zone, Name)
end)

function HasAccess(Jobs)
    for Job, Grade in pairs(Jobs) do
        if PlayerJob == Job and Rank == Grade or PlayerGang == Job and Rank == Grade or PlayerData.citizenid == Job and Rank == Grade then 
            return true
        end
    end
end