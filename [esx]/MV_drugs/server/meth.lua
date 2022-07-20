local playersProcessingMeth = {}
local webhook_methverwerk = "https://discord.com/api/webhooks/913756433231806505/SiuZDdnK2VCTpNPP-dYyk-sJP06iAZiUdNiUqoUbYl9K6GJm-DEtOC-AO9Pmh7QDdiKg"

RegisterServerEvent('esx_illegal:pickedUpHydrochloricAcid')
AddEventHandler('esx_illegal:pickedUpHydrochloricAcid', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.canCarryItem('hydrochloric_acid', 1) then
		xPlayer.addInventoryItem('hydrochloric_acid', 1)
	else
		xPlayer.showNotification(_U('hydrochloric_acid_inventoryfull'))
	end
end)

RegisterServerEvent('esx_illegal:pickedUpSodiumHydroxide')
AddEventHandler('esx_illegal:pickedUpSodiumHydroxide', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.canCarryItem('sodium_hydroxide', 1) then
		xPlayer.addInventoryItem('sodium_hydroxide', 1)
	else
		xPlayer.showNotification(_U('sodium_hydroxide_inventoryfull'))
	end
end)

RegisterServerEvent('esx_illegal:pickedUpSulfuricAcid')
AddEventHandler('esx_illegal:pickedUpSulfuricAcid', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.canCarryItem('sulfuric_acid', 1) then
		xPlayer.addInventoryItem('sulfuric_acid', 1)
	else
		xPlayer.showNotification(_U('sulfuric_acid_inventoryfull'))
	end
end)

RegisterServerEvent('esx_illegal:processMeth')
AddEventHandler('esx_illegal:processMeth', function()
	if not playersProcessingMeth[source] then
		local _source = source

		playersProcessingMeth[_source] = ESX.SetTimeout(Config.Delays.MethProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xmeth = xPlayer.getInventoryItem('meth')
			
			if xmeth.count > 5 then
				if xPlayer.canSwapItem('meth', 5, 'meth_pooch', 1) then
					xPlayer.removeInventoryItem('meth', 5)
					xPlayer.addInventoryItem('meth_pooch', 1)
					xPlayer.showNotification(_U('meth_processed'))
				else
					xPlayer.showNotification(_U('meth_processingfull'))
				end
			else
				xPlayer.showNotification(_U('meth_processingenough'))
			end

			playersProcessingMeth[_source] = nil
		end)
	else
		print(('esx_illegal: %s attempted to exploit meth processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingMeth[playerID] then
		ESX.ClearTimeout(playersProcessingMeth[playerID])
		playersProcessingMeth[playerID] = nil
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
