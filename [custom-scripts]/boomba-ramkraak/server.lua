-- ESX Init ------------------------------------------------------
ESX = nil   	                                                --
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)--
------------------------------------------------------------------
local CopsConnected = 0
local cooldown = 0

ESX.RegisterServerCallback('boomba-ramkraak:EnoughCops', function(source, cb, configvalue)	
	if CopsConnected < Config.minimumcops then
		cb(false)
		return
	else
		cb(true)
		return
	end
end)

ESX.RegisterServerCallback('boomba-ramkraak:isActive',function(source, cb)
    cb(activity, cooldown)
end)

RegisterServerEvent("boomba-ramkraak:setjob")
AddEventHandler("boomba-ramkraak:setjob", function(playerid)
    local xPlayer = ESX.GetPlayerFromId(playerid)
	local oldjob = xPlayer.job.name
	xPlayer.setJob('ramkraak', 0)
	print(source)
	Citizen.Wait(120000)
	xPlayer.setJob(oldjob, 0)
end)


RegisterServerEvent('boomba-ramkraak:CountCops')
AddEventHandler('boomba-ramkraak:CountCops', function()
	local xPlayers = ESX.GetPlayers()
	CopsConnected = 0

	for k,Player in pairs(xPlayers) do
		local xPlayer = ESX.GetPlayerFromId(Player)
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end
end)

RegisterServerEvent("boomba-ramkraak:checkifcop")
AddEventHandler("boomba-ramkraak:checkifcop", function(id)
	local xPlayer = ESX.GetPlayerFromId(id)
	if xPlayer.job.name == 'police' then
		TriggerClientEvent("boomba-ramkraak:callcops")
	end 
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(Config.CopsCheckRefreshTime)
		TriggerEvent('boomba-ramkraak:CountCops')
	end
end)

RegisterCommand("checkramkraakcooldown", function(source)
	local cooldown2 = cooldown / 60000
	TriggerClientEvent('chatMessage', source, '', { 255, 255, 255 }, 'De cooldown van de ramkraak duurt nog: '..cooldown2.." minuten!")
end)

Citizen.CreateThread(function()
	Citizen.Wait(5 * 60000)
	TriggerEvent('boomba-ramkraak:CountCops')
end)

RegisterServerEvent('boomba-ramkraak:checkcooldown')
AddEventHandler('boomba-ramkraak:checkcooldown', function()
    cooldown = Config.CooldownMinutes * 60000
end)

RegisterServerEvent('boomba-ramkraak:notifycops')
AddEventHandler('boomba-ramkraak:notifycops', function()
    TriggerClientEvent('boomba-ramkraak:notifyPolice', -1)
end)

RegisterServerEvent('boomba-ramkraak:hascheckedcops')
AddEventHandler('boomba-ramkraak:hascheckedcops', function()
    if copcount > 0 then 
        print(copcount)
    else 
        print(copcount)
    end 
end)

RegisterServerEvent("boomba-ramkraak:pay")
AddEventHandler("boomba-ramkraak:pay", function(source)
    xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addAccountMoney("black_money", Config.amountperlootcircle)
    print("Betaling voor een lootcirkel uitgekeerd!")
end)

AddEventHandler('onResourceStart', function(resource)
	while true do
		Wait(5000)
		if cooldown > 0 then
			cooldown = cooldown - 5000
		end
	end
end)
