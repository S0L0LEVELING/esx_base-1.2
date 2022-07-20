--[[local limit1 = 60
local limit2 = 60
local playersProcessingOpium = {}

RegisterServerEvent('esx_illegal:processOpium')
AddEventHandler('esx_illegal:processOpium', function()
	if not playersProcessingOpium[source] then
		local _source = source

		playersProcessingOpium[_source] = ESX.SetTimeout(Config.Delays.OpiumProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xOpium, xOpiumpooch = xPlayer.getInventoryItem('opium'), xPlayer.getInventoryItem('opium_pooch')

			--if xOpium.weight ~= -1 and xOpium.count == limit2 then
			if xOpium.weight ~= 1 and xOpium.count + 1 > limit1 then
				TriggerClientEvent('esx:showNotification', _source, _U('opium_processingfull'))
			elseif xOpium.count < 1 then
				TriggerClientEvent('esx:showNotification', _source, _U('opium_processingenough'))
			else
				xPlayer.removeInventoryItem('opium', 5)
				xPlayer.addInventoryItem('opium_pooch', 1)

				TriggerClientEvent('esx:showNotification', _source, _U('opium_processed'))
			end

			playersProcessingOpium[_source] = nil
		end)
	else
		print(('esx_illegal: %s attempted to exploit Opiumpooch processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)]]


local playersProcessingOpium = {}

RegisterServerEvent('esx_illegal:processOpium')
AddEventHandler('esx_illegal:processOpium', function()
	if not playersProcessingOpium[source] then
		local _source = source

		playersProcessingOpium[_source] = ESX.SetTimeout(Config.Delays.OpiumProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xOpium, xOpiumpooch = xPlayer.getInventoryItem('opium'), xPlayer.getInventoryItem('opium_pooch')

			if xOpium.count >= 5 then
				if xPlayer.canSwapItem('opium', 5, 'opium_pooch', 1) then
					xPlayer.removeInventoryItem('opium', 5)
					xPlayer.addInventoryItem('opium_pooch', 2)

					xPlayer.showNotification(_U('opium_processed'))
				else
					xPlayer.showNotification(_U('opium_processingfull'))
				end
			else
				xPlayer.showNotification(_U('opium_processingenough'))
			end

			playersProcessingOpium[_source] = nil
		end)
	else
		print(('esx_illegal: %s attempted to exploit opium processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingOpium[playerID] then
		ESX.ClearTimeout(playersProcessingOpium[playerID])
		playersProcessingOpium[playerID] = nil
	end
end

RegisterServerEvent('esx_illegal:cancelProcessing')
AddEventHandler('esx_illegal:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('esx:playerDropped', function(playerID, reason)
	CancelProcessing(playerID)
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	CancelProcessing(source)
end)
