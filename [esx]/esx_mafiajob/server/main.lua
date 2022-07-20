ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_mafiajob:handcuff')
AddEventHandler('esx_mafiajob:handcuff', function(target)
  TriggerClientEvent('esx_mafiajob:handcuff', target)
end)

RegisterServerEvent('esx_mafiajob:drag')
AddEventHandler('esx_mafiajob:drag', function(target)
  local _source = source
  TriggerClientEvent('esx_mafiajob:drag', target, _source)
end)

local webhook_putin = "https://discord.com/api/webhooks/907997963874349076/yjH6QEdRhXmOB_O7iajUwP9gPOQws9VbHaw4wf-woDsoPXMnjLb0MWnwrc797OyvSGbn"

RegisterServerEvent('esx_mafiajob:putInVehicle')
AddEventHandler('esx_mafiajob:putInVehicle', function(target)
  TriggerClientEvent('esx_mafiajob:putInVehicle', target)
end)

RegisterServerEvent('esx_mafiajob:OutVehicle')
AddEventHandler('esx_mafiajob:OutVehicle', function(target)
    TriggerClientEvent('esx_mafiajob:OutVehicle', target)
end)

RegisterServerEvent('Commandapproved:maffia')
AddEventHandler('Commandapproved:maffia', function()
  if IsPlayerAceAllowed(source, "gangmenurechten") then 
    TriggerClientEvent('NB:openMenuMafia', source) 
  else 
    TriggerClientEvent('chatMessage', source, '^7[^1Gang Menu^7]^2', {0,0,0}, 'Je hebt hier geen permissie voor!')
      -- TriggerClientEvent('no-perms1', source)
  end 
end)
