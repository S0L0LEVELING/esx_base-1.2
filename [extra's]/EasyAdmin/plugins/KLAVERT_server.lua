--Join bericht
AddEventHandler('playerConnecting', function()
	for i,_ in pairs(OnlineAdmins) do 
	    TriggerClientEvent('showNotification', i,"~g~".. GetPlayerName(source).."~w~ joined.")
	    end
end)
--Leave bericht
AddEventHandler('playerDropped', function(reason)
	for i,_ in pairs(OnlineAdmins) do 
	    TriggerClientEvent('showNotification', i,"~r~".. GetPlayerName(source).."~w~ left. ("..reason..')')
    end
end)
--Dood bericht
RegisterServerEvent('playerDied')
AddEventHandler('playerDied',function(killer,reason)
for i,_ in pairs(OnlineAdmins) do 
        if reason == 0 then
            TriggerClientEvent('showNotification', i,"~o~".. GetPlayerName(source).."~w~ died. ")
	    else
            TriggerClientEvent('showNotification', i,"~o~".. GetPlayerName(source).."~w~ died.")
        end
    end
end)
--Blips en playernames
local updateIntervals = {
    [256]   = 1000 * 4,
    [128]   = 1000 * 2,
    [96]    = 1000 * 1,
    [64]    = 1000 * 1,
    [0]     = 1000
}

local updateSpacing = 100

local sendNames = {
    [0]     = true
}

local threadTimeWarnings = true
local mainThreadTimeThreshold = 10
local updateThreadTimeThreshold = 10

local lastBlipsUpdate = {}
local lastIntervalValue = 0
local shouldSendNames = false

function math.clamp(low, n, high)
    return math.min(math.max(n, low), high)
end

AddEventHandler("playerDropped", function()
    TriggerClientEvent("_bigmode:evaluateBlips", -1, source)
end)

Citizen.CreateThread(function()
    while true do
        local mt_begin = GetGameTimer()

        local players = GetPlayers()


        local updateInterval = 0
        local updateIntervalLimit = 0
        for limit, interval in pairs(updateIntervals) do
            if(limit <= #players) then
                updateInterval = interval
                updateIntervalLimit = limit
            end
        end

        if(lastIntervalValue ~= updateIntervalLimit) then
            lastIntervalValue = updateIntervalLimit
            print(string.format("[^2BigMode^7] Updated blip update interval to ^2%dms (%d) ^7due to ^2%d ^7players being connected.", updateInterval, updateIntervalLimit, #players))
        end

        local sendNamesLimit = 0
        for limit, sendName in pairs(sendNames) do
            if(limit <= #players) then
                shouldSendNames = sendName
                sendNamesLimit = limit
            end
        end


        if(#players > 0) then

            Citizen.CreateThread(function()
                local up_begin = GetGameTimer()

                players = GetPlayers()

                local blips = {}
                for index, player in ipairs(players) do
                    local playerPed = GetPlayerPed(player)

                    if(DoesEntityExist(playerPed)) then
                        local coords = GetEntityCoords(playerPed)

                        local obj = {
                            player, NetworkGetNetworkIdFromEntity(playerPed),
                            { coords.x, coords.y, coords.z }
                        }

                        if(shouldSendNames) then
                            obj[4] = obj[3]
                            obj[3] = GetPlayerName(player)
                        end

                        table.insert(blips, obj)
                    end
                end

                Citizen.CreateThread(function()
                    for index, player in ipairs(players) do
                        if(DoesEntityExist(GetPlayerPed(player))) then
                            local final = {}

                            for index, blip in ipairs(blips) do
                                if(blip[1] ~= player) then
                                    table.insert(final, blip)
                                end
                            end
							if IsPlayerAceAllowed(player, "chat.staffreport") then
								TriggerClientEvent("_bigmode:updateBlips", player, final)
							else
							end

                            Citizen.Wait(math.clamp(10, updateSpacing, 100))
                        end
                    end
                end)

                lastBlipsUpdate = blips

                if(threadTimeWarnings) then
                    local up_loopTime = GetGameTimer() - up_begin
                    if(up_loopTime > updateThreadTimeThreshold) then
                        print(string.format("[^2BigMode^7] Update thread loopTime: ^3%i ms ^7(your server is ^1lagging ^7or ^3updateThreadTimeThreshold ^7is too low)", up_loopTime))
                    end
                end
            end)
        end

        if(threadTimeWarnings) then
            local mt_loopTime = GetGameTimer() - mt_begin
            if(mt_loopTime > mainThreadTimeThreshold) then
                print(string.format("[^2BigMode^7] Main thread loopTime: ^1%i ms ^7(your server is ^1lagging ^7or ^1mainThreadTimeThreshold ^7is too low)", mt_loopTime))
            end
        end

        Citizen.Wait(updateInterval)
    end
end)