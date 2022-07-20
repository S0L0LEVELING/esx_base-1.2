ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_opiumcar:start')
AddEventHandler('esx_opiumcar:start', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.getInventoryItem('acetone').count >= 5 and xPlayer.getInventoryItem('lithium').count >= 2 and xPlayer.getInventoryItem('kookstel').count >= 1 then
		if xPlayer.getInventoryItem('meth').count >= 500 then
				TriggerClientEvent('esx_opiumcar:notify', _source, "~r~~h~Je kan niet meer opium dragen.")
		else
			TriggerClientEvent('esx_opiumcar:startprod', _source)
			xPlayer.removeInventoryItem('acetone', 5)
			xPlayer.removeInventoryItem('lithium', 2)
		end

		
		
	else
		TriggerClientEvent('esx_opiumcar:notify', _source, "~r~~h~Je hebt niet genoeg middelen om opium te maken.")

	end
	
end)
RegisterServerEvent('esx_opiumcar:stopf')
AddEventHandler('esx_opiumcar:stopf', function(id)
local _source = source
	local xPlayers = ESX.GetPlayers()
	local xPlayer = ESX.GetPlayerFromId(_source)
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('esx_opiumcar:stopfreeze', xPlayers[i], id)
	end
	
end)
RegisterServerEvent('esx_opiumcar:make')
AddEventHandler('esx_opiumcar:make', function(posx,posy,posz)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.getInventoryItem('kookstel').count >= 1 then
	
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			TriggerClientEvent('esx_opiumcar:smoke',xPlayers[i],posx,posy,posz, 'a') 
		end
		
	else
		TriggerClientEvent('esx_opiumcar:stop', _source)
	end
	
end)
RegisterServerEvent('esx_opiumcar:finish')
AddEventHandler('esx_opiumcar:finish', function(qualtiy)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	print(qualtiy)
	local rnd = math.random(0, 100)
	TriggerEvent('KLevels:addXP', _source, 150)
	xPlayer.addInventoryItem('meth', math.floor(qualtiy) + 79)
	
end)

RegisterServerEvent('esx_opiumcar:blow')
AddEventHandler('esx_opiumcar:blow', function(posx, posy, posz)
	local _source = source
	local xPlayers = ESX.GetPlayers()
	local xPlayer = ESX.GetPlayerFromId(_source)
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('esx_opiumcar:blowup', xPlayers[i],posx, posy, posz)
	end
	xPlayer.removeInventoryItem('kookstel', 1)
end)

