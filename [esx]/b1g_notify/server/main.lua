ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx:addCommand', 'adm', function()
end, {help = ''})

RegisterServerEvent('Notify:admNotifyCheck')
AddEventHandler('Notify:admNotifyCheck', function(args)
	
	local xPlayer = ESX.GetPlayerFromId(source)
	if IsPlayerAceAllowed(source, "no.kick") then
		TriggerEvent('Notify:adminNotifyAllPlayers', args, 'adm')
	end
end)

RegisterServerEvent('Notify:adminNotifyAllPlayers')
AddEventHandler('Notify:adminNotifyAllPlayers', function(args, tipo)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		TriggerClientEvent('b1g_notify:client:Notify', xPlayers[i], {type = tipo, text = args})
	end
	
end)
