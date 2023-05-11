if ADElevators.Config.Target.UseTarget then 
	if GetResourceState("ox_target") == "started" then
		local OXTargets = {}
		for i = 1, #ADElevators.Elevators do 
			for j = 1, #ADElevators.Elevators[i].Zones do 
				local Target = exports.ox_target:addBoxZone({
					coords = vec3(ADElevators.Elevators[i].Zones[j].coords.x, ADElevators.Elevators[i].Zones[j].coords.y, ADElevators.Elevators[i].Zones[j].coords.z),
					size = vec3(ADElevators.Elevators[i].Zones[j].length, ADElevators.Elevators[i].Zones[j].width, 3),
					rotation = ADElevators.Elevators[i].Zones[j].coords.w,
					debug = ADElevators.Debug.ShowElevatorZones,
					options = {
						{
							type = "client",
							icon = "fas fa-elevator",
							label = "Use Elevator",
							onSelect = function()
								AccessElevator(i, ADElevators.Elevators[i].Zones[j].name)
							end,
						},
					},
					distance = ADElevators.Elevators[i].Zones[j].distance
				})
				table.insert(OXTargets, Target)
			end
		end
		function DestroyTargetZones()
			for ID, Zone in pairs(OXTargets) do 
				exports.ox_target:removeZone(Zone)
			end
		end
	elseif GetResourceState("qb-target") == "started" then
		for i = 1, #ADElevators.Elevators do 
			for j = 1, #ADElevators.Elevators[i].Zones do 
				exports["qb-target"]:AddBoxZone(ADElevators.Elevators[i].Zones[j].name, ADElevators.Elevators[i].Zones[j].coords, ADElevators.Elevators[i].Zones[j].length, ADElevators.Elevators[i].Zones[j].width, {
					name = ADElevators.Elevators[i].Zones[j].name,
					heading = ADElevators.Elevators[i].Zones[j].coords.w,
					debugPoly = ADElevators.Debug.ShowElevatorZones,
					minZ = ADElevators.Elevators[i].Zones[j].minz,
					maxZ = ADElevators.Elevators[i].Zones[j].maxz,
				}, {
				options = {
					{
						type = "client",
						icon = "fas fa-elevator",
						label = "Use Elevator",
						action = function()
							AccessElevator(i, ADElevators.Elevators[i].Zones[j].name)
						end,
					},
				},
					distance = ADElevators.Elevators[i].Zones[j].distance
				})
			end
		end
	end
	function DestroyTargetZones()
		for i = 1, #ADElevators.Elevators do 
			for j = 1, #ADElevators.Elevators[i].Zones do 
				exports["qb-target"]:RemoveZone(ADElevators.Elevators[i].Zones[j].name)
			end
		end
	end
end