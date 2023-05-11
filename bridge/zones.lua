if GetResourceState("ox_lib") == "started" then
	function CreateElevatorZones()
		for i = 1, #ADElevators.Elevators do 
			for j = 1, #ADElevators.Elevators[i].Zones do 
				Box = lib.zones.box({
					coords = vec3(ADElevators.Elevators[i].Zones[j].coords.x, ADElevators.Elevators[i].Zones[j].coords.y, ADElevators.Elevators[i].Zones[j].coords.z),
					size = vec3(ADElevators.Elevators[i].Zones[j].length, ADElevators.Elevators[i].Zones[j].width, 3),
					rotation = ADElevators.Elevators[i].Zones[j].coords.w,
					debug = ADElevators.Debug.ShowElevatorZones,
					onEnter = function()
						if ADElevators.Config.Target.UseTarget then 
							DrawText("[Interact] Elevator:")
						else
							DrawText("[Radial] Elevator:")
							AddRadialOption()
							Name = ADElevators.Elevators[i].Zones[j].name
							Zone = i
						end
					end,
					onExit = function()
						exports["qb-core"]:HideText()
						if not ADElevators.Config.Target.UseTarget then 
							exports["qb-radialmenu"]:RemoveOption(ElevatorOption)
						end
					end
				})
			end
		end
	end
	function DestroyElevatorZones()
		for i = 1, #ADElevators.Elevators do 
			for j = 1, #ADElevators.Elevators[i].Zones do 
				Box:remove()
			end
		end
	end
elseif GetResourceState("PolyZone") == "started" then
	function CreateElevatorZones()
		for i = 1, #ADElevators.Elevators do 
			for j = 1, #ADElevators.Elevators[i].Zones do 
				BoxZone = BoxZone:Create(ADElevators.Elevators[i].Zones[j].coords, ADElevators.Elevators[i].Zones[j].length, ADElevators.Elevators[i].Zones[j].width, {
					heading = ADElevators.Elevators[i].Zones[j].coords.w,
					minZ = ADElevators.Elevators[i].Zones[j].minz,
					maxZ = ADElevators.Elevators[i].Zones[j].maxz,
					debugPoly = ADElevators.Debug.ShowElevatorZones,
					name = ADElevators.Elevators[i].Zones[j].name,
				})
				BoxZone:onPlayerInOut(function(isPointInside)
					if isPointInside then
						if ADElevators.Config.Target.UseTarget then 
							DrawText("[Interact] Elevator:")
						else
							DrawText("[Radial] Elevator:")
							AddRadialOption()
							Name = ADElevators.Elevators[i].Zones[j].name
							Zone = i
						end
					else
						exports["qb-core"]:HideText()
						if not ADElevators.Config.Target.UseTarget then 
							exports["qb-radialmenu"]:RemoveOption(ElevatorOption)
						end
					end
				end)
			end
		end
	end
	function DestroyElevatorZones()
		for i = 1, #ADElevators.Elevators do 
			for j = 1, #ADElevators.Elevators[i].Zones do 
				BoxZone:destroy()
			end
		end
	end
end

function AddRadialOption()
    ElevatorOption = exports["qb-radialmenu"]:AddOption({
        id = "elevator",
        title = "Elevator",
        icon = "arrow-circle-up",
        type = "client",
        event = "ad-elevators:client:radialelevator",
        shouldClose = true
    }, ElevatorOption)
end