if GetResourceState("ox_inventory") == "started" then
	function HasItemAccess(Items)
		local HasItem = false
		if next(exports.ox_inventory:Search("slots", Items)) then return true else return false end
	end
elseif GetResourceState("qb-inventory") == "started" or GetResourceState("lj-inventory") == "started" then
	function HasItemAccess(Items)
		local HasItem = false
		for ID, Item in pairs(Items) do 
			QBCore.Functions.TriggerCallback("QBCore:HasItem", function(HasItem)
				if HasItem then
					HasItems = true
				else
					HasItems = false
				end
			end, Item)
			Wait(100)
			if HasItems then
				return true
			else
				return false
			end
		end
	end
end