
ESX = nil
local CopsConnected = 0
local cooldown = 0

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('boomba:EnoughCops', function(source, cb, configvalue)	
	if CopsConnected < Config.cops then
		cb(false)
		return
	else
		cb(true)
		return
	end
end)

ESX.RegisterServerCallback('boomba:isActive',function(source, cb)
    cb(activity, cooldown)
  end)

RegisterServerEvent('boomba:CountCops')
AddEventHandler('boomba:CountCops', function()
	local xPlayers = ESX.GetPlayers()
	CopsConnected = 0

	for k,Player in pairs(xPlayers) do
		local xPlayer = ESX.GetPlayerFromId(Player)
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	if Config.EnableCopCheckMessage then
		print('[',os.date("%H:%M"),']', 'boomba Scripts Drug Runs: Counted all online cops: ', CopsConnected)
	end
end)

Citizen.CreateThread(function()
	if Config.RequireCopsOnline then
		while true do
			Citizen.Wait(Config.CopsCheckRefreshTime * 60000)
            TriggerEvent('boomba:log-drugruns', Config.wh_copcounter, "💎boomba Drugruns: ", "💎 Status: Cops Counted \n 💎 Amount of cops: "..CopsConnected, "boomba-Drugruns",  62207)
			TriggerEvent('boomba:CountCops')
		end
	end
end)

Citizen.CreateThread(function()
	if Config.RequireCopsOnline then
		Citizen.Wait(5 * 60000)
		TriggerEvent('boomba:CountCops')
	end
end)

RegisterServerEvent('boomba:checkcooldown')
AddEventHandler('boomba:checkcooldown', function()
    cooldown = Config.CooldownMinutes * 60000
end)

RegisterServerEvent('boomba:drugrun:removeitem:weed')
AddEventHandler('boomba:drugrun:removeitem:weed', function(id)
    xPlayer = ESX.GetPlayerFromId(id) 
    local Amount = xPlayer.getInventoryItem(Config.Item['Wiet']).count
    if Amount < Config.limitpersell then 
        xPlayer.removeInventoryItem(Config.Item['Wiet'], Amount)
        xPlayer.addAccountMoney('black_money', Config.MoneyWeed*Amount)
    else 
        xPlayer.removeInventoryItem(Config.Item['Wiet'], Config.limitpersell)
        xPlayer.addAccountMoney('black_money', Config.MoneyWeed*Config.limitpersell)
    end 
end)

RegisterServerEvent('boomba:drugrun:removeitem:meth')
AddEventHandler('boomba:drugrun:removeitem:meth', function(id)
    xPlayer = ESX.GetPlayerFromId(id) 
    local Amount = xPlayer.getInventoryItem(Config.Item['Meth']).count
    if Amount < Config.limitpersell then 
        xPlayer.removeInventoryItem(Config.Item['Meth'], Amount)
        xPlayer.addAccountMoney('black_money', Config.MoneyMeth*Amount)
    else 
        xPlayer.removeInventoryItem(Config.Item['Meth'], Config.limitpersell)
        xPlayer.addAccountMoney('black_money', Config.MoneyMeth*Config.limitpersell)
    end 
end)

RegisterServerEvent('boomba:drugrun:removeitem:coke')
AddEventHandler('boomba:drugrun:removeitem:coke', function(id)
    xPlayer = ESX.GetPlayerFromId(id) 
    local Amount = xPlayer.getInventoryItem(Config.Item['Coke']).count
    if Amount < Config.limitpersell then 
        xPlayer.removeInventoryItem(Config.Item['Coke'], Amount)
        xPlayer.addAccountMoney('black_money', Config.MoneyCoke*Amount)
    else
        xPlayer.removeInventoryItem(Config.Item['Coke'], Config.limitpersell)
        xPlayer.addAccountMoney('black_money', Config.MoneyCoke*Config.limitpersell)
    end 
end)

RegisterServerEvent('boomba:drugrun:removeitem:weed:nocops')
AddEventHandler('boomba:drugrun:removeitem:weed:nocops', function(id)
    xPlayer = ESX.GetPlayerFromId(id) 
    local Amount = xPlayer.getInventoryItem(Config.Item['Wiet']).count
    if Amount < Config.limitpersellwithnocops then 
        xPlayer.removeInventoryItem(Config.Item['Wiet'], Amount)
        xPlayer.addAccountMoney('black_money', 60*Amount)
    else 
        xPlayer.removeInventoryItem(Config.Item['Wiet'], Config.limitpersellwithnocops)
        xPlayer.addAccountMoney('black_money', 60*Config.limitpersellwithnocops)
    end 
end)

RegisterServerEvent('boomba:drugrun:removeitem:meth:nocops')
AddEventHandler('boomba:drugrun:removeitem:meth:nocops', function(id)
    xPlayer = ESX.GetPlayerFromId(id) 
    local Amount = xPlayer.getInventoryItem(Config.Item['Meth']).count
    if Amount < Config.limitpersellwithnocops then 
        xPlayer.removeInventoryItem(Config.Item['Meth'], Amount)
        xPlayer.addAccountMoney('black_money', 110*Amount)
    else 
        xPlayer.removeInventoryItem(Config.Item['Meth'], Config.limitpersellwithnocops)
        xPlayer.addAccountMoney('black_money', 110*Config.limitpersellwithnocops)
    end 
end)

RegisterServerEvent('boomba:drugrun:removeitem:coke:nocops')
AddEventHandler('boomba:drugrun:removeitem:coke:nocops', function(id)
    xPlayer = ESX.GetPlayerFromId(id) 
    local Amount = xPlayer.getInventoryItem(Config.Item['Coke']).count
    if Amount < Config.limitpersellwithnocops then 
        xPlayer.removeInventoryItem(Config.Item['Coke'], Amount)
        xPlayer.addAccountMoney('black_money', 90*Amount)
    else
        xPlayer.removeInventoryItem(Config.Item['Coke'], Config.limitpersellwithnocops)
        xPlayer.addAccountMoney('black_money', 90*Config.limitpersellwithnocops)
    end 
end)

RegisterServerEvent('boomba:notifycops')
AddEventHandler('boomba:notifycops', function(coords, policealertmessage, blipname)
    TriggerClientEvent('boomba:notifyPolice', -1, coords, policealertmessage, blipname)
end)

RegisterServerEvent('boomba:drugruns:hascheckedcops')
AddEventHandler('boomba:drugruns:hascheckedcops', function()
    if copcount > 0 then 
        TriggerClientEvent('boomba:drugruns:putlocation')
        print(copcount)
    else 
        print(copcount)
    end 
end)

RegisterServerEvent('boomba:log-drugruns')
AddEventHandler('boomba:log-drugruns', function(webhook, title, message, footer, color)
        local embed = {
            {
                ["color"] = color,
                ["title"] = "**".. title .."**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = footer..' // boomba Scripts - ©2022',
                },
            }
        }
    
      PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end)

AddEventHandler('onResourceStart', function(resource)
	while true do
		Wait(5000)
		if cooldown > 0 then
			cooldown = cooldown - 5000
		end
	end
end)