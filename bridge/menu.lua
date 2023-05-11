if GetResourceState("ox_lib") == "started" then
	function GenerateElevatorMenu(Zone, FloorName)
		local ElevatorMenu = {}
		local LockedFloors = {}
		if ADElevators.Elevators[Zone] ~= nil then
		ElevatorMenu[#ElevatorMenu+1] = {title = ("Current Floor: %s"):format(FloorName), disabled = true}
			for k = 1, #ADElevators.Elevators[Zone].Floors, 1 do 
				if ADElevators.Elevators[Zone].Floors[k].Header ~= FloorName then
					if ADElevators.Elevators[Zone].Floors[k].Locked or ADElevators.Elevators[Zone].Floors[k].Items then
						table.insert(LockedFloors, ADElevators.Elevators[Zone].Floors[k])
					else
						ElevatorMenu[#ElevatorMenu+1] = {
							title = ADElevators.Elevators[Zone].Floors[k].Header,
							description = ADElevators.Elevators[Zone].Floors[k].Description, 
							icon = "fas fa-check",
							onSelect = function(data)
								TakeElevator(data)
							end,
							args = {
								Zone = Zone, 
								Coords = ADElevators.Elevators[Zone].Floors[k].TeleportCoords,
								Progressbar = ADElevators.Elevators[Zone].Floors[k].Progressbar,
								VehicleCoords = ADElevators.Elevators[Zone].Floors[k].VehicleCoords,
							}
						}
					end
				end
			end
			if LockedFloors then
				if #ElevatorMenu <= 1 then
					ElevatorMenu[#ElevatorMenu+1] = {title = "No public floors found!", icon = "fas fa-circle-exclamation", disabled = true}
				end
				ElevatorMenu[#ElevatorMenu+1] = {title = "Restricted Floors:", disabled = true}
				for FloorID, Zone in pairs(LockedFloors) do 
					if Zone.Locked and HasAccess(Zone.Locked) then
						HasAccessToFloor = true
					end
					if Zone.Items and HasItemAccess(Zone.Items) then 
						HasAccessToFloor = true
					end
					if HasAccessToFloor then
						ElevatorMenu[#ElevatorMenu+1] = {
							title = Zone.Header,
							description = Zone.Description, 
							icon = "fas fa-check",
							onSelect = function(data)
								TakeElevator(data)
							end,
							args = {
								Zone = Zone, 
								Coords = Zone.TeleportCoords,
								Progressbar = Zone.Progressbar,
								VehicleCoords = Zone.VehicleCoords,
							}
						}
						HasAccessToFloor = false
					end
				end
			end
		end
		if ElevatorMenu[#ElevatorMenu].title == "Restricted Floors:" then
			table.remove(ElevatorMenu, #ElevatorMenu)
		end
		if not next(ElevatorMenu) then
			ElevatorMenu[#ElevatorMenu+1] = {title = "No public floors found!", icon = "fas fa-circle-exclamation", disabled = true}
		end
		lib.registerContext({id = "elevator_menu", title = ADElevators.Elevators[Zone].Name, options = ElevatorMenu})
		return "ox_lib", "elevator_menu"
	end
elseif GetResourceState("qb-menu") == "started" then
	function GenerateElevatorMenu(Zone, FloorName)
		local ElevatorMenu = {{header = ADElevators.Elevators[Zone].Name, txt = "Current Floor:".." "..FloorName, isMenuHeader = true}}
		local LockedFloors = {}
		if ADElevators.Elevators[Zone] ~= nil then
			for k = 1, #ADElevators.Elevators[Zone].Floors, 1 do 
				if ADElevators.Elevators[Zone].Floors[k].Header ~= FloorName then
					if ADElevators.Elevators[Zone].Floors[k].Locked or ADElevators.Elevators[Zone].Floors[k].Items then
						table.insert(LockedFloors, ADElevators.Elevators[Zone].Floors[k])
					else
						ElevatorMenu[#ElevatorMenu+1] = {
							header = ADElevators.Elevators[Zone].Floors[k].Header,
							txt = ADElevators.Elevators[Zone].Floors[k].Description, 
							icon = "fas fa-check",
							params = {
								isAction = true,
								event = TakeElevator,
								args = {
									Zone = Zone, 
									Coords = ADElevators.Elevators[Zone].Floors[k].TeleportCoords,
									Progressbar = ADElevators.Elevators[Zone].Floors[k].Progressbar,
									VehicleCoords = ADElevators.Elevators[Zone].Floors[k].VehicleCoords,
								}
							}
						}
					end
				end
			end
			if LockedFloors then
				if #ElevatorMenu <= 1 then
					ElevatorMenu[#ElevatorMenu+1] = {header = "No public floors found!", icon = "fas fa-circle-exclamation", isMenuHeader = true}
				end
				ElevatorMenu[#ElevatorMenu+1] = {header = "Restricted Floors:", isMenuHeader = true}
				for FloorID, Zone in pairs(LockedFloors) do 
					if Zone.Locked and  HasAccess(Zone.Locked) then
						HasAccessToFloor = true
					end
					if Zone.Items and HasItemAccess(Zone.Items) then 
						HasAccessToFloor = true
					end
					if HasAccessToFloor then
						ElevatorMenu[#ElevatorMenu+1] = {
							header = Zone.Header,
							txt = Zone.Description, 
							icon = "fas fa-check",
							onSelect = function(data)
								TakeElevator(data)
							end,
							args = {
								Zone = Zone, 
								Coords = Zone.TeleportCoords,
								Progressbar = Zone.Progressbar,
								VehicleCoords = Zone.VehicleCoords,
							}
						}
						HasAccessToFloor = false
					end
				end
			end
		end
		if ElevatorMenu[#ElevatorMenu].header == "Restricted Floors:" then
			table.remove(ElevatorMenu, #ElevatorMenu)
		end
		if not next(ElevatorMenu) then
			ElevatorMenu[#ElevatorMenu+1] = {header = "No public floors found!", icon = "fas fa-circle-exclamation", isMenuHeader = true}
		end
		ElevatorMenu[#ElevatorMenu+1] = {header = "Close Menu", icon = "fas fa-arrow-left-long", params = { event = "qb-menu:client:closeMenu"}}
		return "qb-menu", ElevatorMenu
	end
end