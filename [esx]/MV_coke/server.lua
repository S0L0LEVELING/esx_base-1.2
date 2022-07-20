

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




RegisterServerEvent("FMW:krijg")
AddEventHandler("FMW:krijg", function()
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	
		
				if xPlayer.getInventoryItem('coca_leaf').count <= 500 then
					xPlayer.addInventoryItem("coca_leaf", math.random(1,2))
					else
					TriggerClientEvent('esx:showNotification', source, '~r~Je kan niet meer coke bladeren bij je dragen!')
				end

			
end)



ESX.RegisterServerCallback('FMW:proces', function (source, cb)
	
	local _source = source
	
	local xPlayer  = ESX.GetPlayerFromId(_source)
			
			
				if xPlayer.getInventoryItem('coca_leaf').count >= 2 then
					xPlayer.removeInventoryItem('coca_leaf', 2)
					--xPlayer.removeInventoryItem('zakjes', 1)  
					xPlayer.addInventoryItem('coke_pooch', 1) 
					cb(true)
				else
				TriggerClientEvent('esx:showNotification', source, '~r~Je hebt niet genoeg coke bladeren!')
				cb(false)
				end
			

end)