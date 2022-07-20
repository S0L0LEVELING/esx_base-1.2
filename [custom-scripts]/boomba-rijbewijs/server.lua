ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    print('The resource ' .. resourceName .. ' has been started. //  boomba Scripts // Discord.boomba.nl')
  end)  

RegisterNetEvent('boomba:addLicense')
AddEventHandler('boomba:addLicense', function(type)
	local _source = source

	TriggerEvent('esx_license:addLicense', _source, type, function()
		TriggerEvent('esx_license:getLicenses', _source, function(licenses)
			TriggerClientEvent('boomba:loadLicenses', _source, licenses)
		end)
	end)
end)

AddEventHandler('esx:playerLoaded', function(source)
	TriggerEvent('esx_license:getLicenses', source, function(licenses)
		TriggerClientEvent('boomba:loadLicenses', source, licenses)
 	end)
end)

RegisterServerEvent("boomba:CheckCanAfford")
AddEventHandler("boomba:CheckCanAfford", function(amount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    local canAfford = false

    if xPlayer.getMoney() >= amount then
        canAfford = true
        xPlayer.removeMoney(amount)
    elseif xPlayer.getAccount('bank').money >= amount then
        canAfford = true
        xPlayer.removeAccountMoney('bank', amount)
    end

    if not canAfford then
        TriggerClientEvent('esx:showNotification', _source, 'You cannot afford this')
        TriggerClientEvent('boomba:CanPurchase', false)
    else
        TriggerClientEvent('boomba:CanPurchase', true)
    end
end)

RegisterServerEvent('boomba:log-rijbewijs')
AddEventHandler('boomba:log-rijbewijs', function(webhook, title, footer, color)
        local embed = {
            {
                ["color"] = color,
                ["title"] = "**".. title .."**",
                ["footer"] = {
                    ["text"] = footer..' // boomba Scripts - ©2022',
                },
            }
        }
    
      PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end)