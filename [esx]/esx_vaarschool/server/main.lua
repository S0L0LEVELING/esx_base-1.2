ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(source)
	TriggerEvent('esx_license:getLicenses', source, function(licenses)
		TriggerClientEvent('esx_vaarschool:loadLicenses', source, licenses)
	end)
end)

RegisterNetEvent('esx_vaarschool:addLicense')
AddEventHandler('esx_vaarschool:addLicense', function(type)
	local _source = source

	TriggerEvent('esx_license:addLicense', _source, type, function()
		TriggerEvent('esx_license:getLicenses', _source, function(licenses)
			TriggerClientEvent('esx_vaarschool:loadLicenses', _source, licenses)
		end)
	end)
end)

RegisterNetEvent('esx_vaarschool:pay')
AddEventHandler('esx_vaarschool:pay', function(price, key)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if SecretKey == key then 
		xPlayer.removeMoney(price)
		TriggerClientEvent('esx:showNotification', _source, _U('you_paid', ESX.Math.GroupDigits(price)))
	else
        TriggerEvent("mn-keyAnticheat:server:banPlayer")
        DropPlayer(src, "BANNED")
    end
end)
