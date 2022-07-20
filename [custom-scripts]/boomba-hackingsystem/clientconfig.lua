
-- [ Vars DONT TOUCH ] -- 
local blackout = false 
-- [ Vars DONT TOUCH ] --

-- [ Command Configuration ] -- 
RegisterNUICallback('commandentered', function(data)
    local finaldata = json.encode(data)
    local dump = nil 
    if string.find(finaldata, Config.anonymoustwitterhack) then
        ESX.TriggerServerCallback("getdumpdata", function(cb)
            SendNUIMessage({
                type = "datadump",
                display = true, 
                dump = Config.anonymoustwitterhack.." "..cb 
            })
            TriggerServerEvent("boomba-hackingsystem:logtodiscord", Config.legitcommand_wh, "Boomba Hacking System For FiveM", "Event: Known command\nPlayer: "..GetPlayerName(PlayerId()).." ["..GetPlayerServerId(PlayerId()).."]", 16711900)   
        end, "anontwt") 
    elseif string.find(finaldata, Config.bankdatahack) then
        ESX.TriggerServerCallback("getdumpdata", function(cb)
            SendNUIMessage({
                type = "datadump",
                display = true, 
                dump = Config.bankdatahack.." "..cb 
            })
            TriggerServerEvent("boomba-hackingsystem:logtodiscord", Config.legitcommand_wh, "Boomba Hacking System For FiveM", "Event: Known command\nPlayer: "..GetPlayerName(PlayerId()).." ["..GetPlayerServerId(PlayerId()).."]", 16711900)   
        end, "bank") 
    elseif string.find(finaldata, Config.blackouthack) then
        SendNUIMessage({
            type = "datadump",
            display = true, 
            dump = "City has a blackout for 120 seconds!"
        })
        TriggerServerEvent("boomba-hackingsystem:logtodiscord", Config.legitcommand_wh, "Boomba Hacking System For FiveM", "Event: Known command\nPlayer: "..GetPlayerName(PlayerId()).." ["..GetPlayerServerId(PlayerId()).."]", 16711900)   
        TriggerServerEvent("boomba-hackingsystem:blackout") 
    else
        TriggerServerEvent("boomba-hackingsystem:logtodiscord", Config.unknowncommand_wh, "Boomba Hacking System For FiveM", "Event: Unknown command\nPlayer: "..GetPlayerName(PlayerId()).." ["..GetPlayerServerId(PlayerId()).."]", 16711900)   
        SendNUIMessage({
            type = "datadump",
            display = true, 
            dump = "command not found"
        })
    end 
end)
-- [ Command Configuration ] -- 

-- [ Blackout ] -- 
RegisterNetEvent("boomba-hackingsystem:blackoutsync")
AddEventHandler("boomba-hackingsystem:blackoutsync", function()
    blackout = true 
    exports['okokNotify']:Alert("Kerncentrale: ", "Centrale gehacked! Systems restarting. Time remaining: 120 seconds", 5000, 'error') 
    Citizen.Wait(30000)
    exports['okokNotify']:Alert("Kerncentrale: ", "Systems restarting. Time remaining: 90 seconds", 5000, 'error') 
    Citizen.Wait(30000)
    exports['okokNotify']:Alert("Kerncentrale: ", "Systems restarting. Time remaining: 60 seconds", 5000, 'error') 
    Citizen.Wait(30000)
    exports['okokNotify']:Alert("Kerncentrale: ", "Systems restarting. Time remaining: 30 seconds", 5000, 'error') 
    Citizen.Wait(30000)
    blackout = false
    exports['okokNotify']:Alert("Kerncentrale: ", "Systems back online!", 5000, 'success')
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5) 
        if blackout then 
            SetBlackout(true)
        else 
            SetBlackout(false)
        end 
    end 
end)
-- [ Blackout ] -- 