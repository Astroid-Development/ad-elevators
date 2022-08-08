ElevatorZones = {}

function ElevatorZones:CreateElevatorZones()
    if not UseRadialMenu then 
        for k,v in pairs(TargetPolyZones) do
            exports['qb-target']:AddBoxZone(v.name, v.coords, v.length, v.width, {
                name = v.name,
                heading = v.heading,
                debugPoly = ShowElevatorZones,
                minZ = v.minz,
                maxZ = v.maxz,
                }, {
                    options = {
                        {
                            type = 'client',
                            icon = 'fas fa-elevator',
                            label = 'Use Elevator',
                            action = function()
                                Elevator:ElevatorMenu(v.zone, v.name)
                            end,
                        },
                    },
                distance = v.distance
            })
        end
    end
    for k,v in pairs(RadialPolyZones) do 
        BoxZone = BoxZone:Create(v.coords, v.length, v.width, {
            heading = v.heading,
            minZ = v.minz,
            maxZ = v.maxz,
            debugPoly = ShowElevatorZones,
            name = v.name,
        })
        BoxZone:onPlayerInOut(function(isPointInside)
            if isPointInside then
                if not UseRadialMenu then 
                    exports['qb-core']:DrawText("[Interact] <b>Elevator:</b>")
                else
                    exports['qb-core']:DrawText("[Radial] <b>Elevator:</b>")
                    Zone = v.zone 
                    Name = v.name
                    AddRadialOption()
                end
            else
                exports['qb-core']:HideText()
                if UseRadialMenu then 
                    if elevatorid ~= nil then 
                        exports['qb-radialmenu']:RemoveOption(elevatorid)
                        elevatorid = nil 
                    end
                end
            end
        end)
        if UseRadialMenu then 
            function AddRadialOption()
                if elevatorid == nil then 
                    elevatorid = exports['qb-radialmenu']:AddOption({
                        id = 'elevator',
                        title = 'Elevator',
                        icon = 'arrow-circle-up',
                        type = 'client',
                        event = "mb-elevators:client:radialelevator",
                        shouldClose = true
                    }, elevatorid)
                end
            end
        end
    end
end

RegisterNetEvent("mb-elevators:client:radialelevator", function()
    Elevator:ElevatorMenu(Zone, Name)
end)

function ElevatorZones:DestroyElevatorZones()
    for k,v in pairs(TargetPolyZones) do 
        exports['qb-target']:RemoveZone(v.name)
    end
    for k,v in pairs(RadialPolyZones) do 
        BoxZone:destroy()
    end
end