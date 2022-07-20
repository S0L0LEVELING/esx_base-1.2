RegisterNetEvent("mn-keyAnticheat:client:openBanMenu")
AddEventHandler("mn-keyAnticheat:client:openBanMenu", function(bans)
    SendNUIMessage({
        action = "open",
        bans = bans
    })
    SetNuiFocus(true, true)
end)


RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
end)


RegisterNUICallback("unbanPlayer", function(param)
    local id = param.id 
    TriggerServerEvent("mn-keyAnticheat:server:unbanPlayer", id)
end)