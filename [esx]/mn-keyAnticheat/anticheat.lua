

--[[
    mn-keyAnticheat,
    mn#0810,
    Made by mn#0810
]]

ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local banslist = LoadResourceFile(GetCurrentResourceName(), "bans.json")


bannedData = {}



resources = {}




Citizen.CreateThread(function()
    loadData()
end)



loadData = function() 
    bannedData = json.decode(banslist)
end


saveData = function() 
    SaveResourceFile(GetCurrentResourceName(), "bans.json", json.encode(bannedData)) 
end


RegisterServerEvent("mn-keyAnticheat:server:unbanPlayer")
AddEventHandler("mn-keyAnticheat:server:unbanPlayer", function(id)
    local src = source 
    local user = ESX.GetPlayerFromId(src) 
    local identifier = user.identifier 

    if (IsAdmin(identifier)) then 
        table.remove(bannedData, id)
        TriggerClientEvent('mn-keyAnticheat:client:openBanMenu', src, bannedData)
        saveData()
    else
        banPlayer(src, GetCurrentResourceName())
    end
end)


RegisterCommand("banme", function(source, args)
    local src = source
    local identifiers = GetPlayerIdentifiers(src)


    table.insert(bannedData, {
        steamname = GetPlayerName(src),
        resource = "test",
        identifiers = identifiers
    })

    saveData()
end)





local function PlayerJoining(name, setKickReason, deferrals)
    local player = source
    local isBanned
    local license
    local identifiers = GetPlayerIdentifiers(player)
    deferrals.defer()

    Wait(0)

    deferrals.update(string.format("Hallo %s. U word op het moment gecheckt door de mn-keyAnticheat", name))

    for _, v in pairs(identifiers) do
        if string.find(v, "license:") then
            license = v
            break
        end
    end


    local isBanned = checkPlayer(player)
    local identifierString = ""

    Wait(0)

    if not license then
        deferrals.done("\n❌ Er kon geen informatie worden opgehaald vanuit uw Rockstar Account")
    elseif isBanned then
        deferrals.done("\n🔨 U bent verbannen van de server! \n Injected resource: ".. isBanned.resource.." \n Reden: ongeldige key")
    else
        deferrals.done()
    end
end


ESX.RegisterServerCallback("mn-keyAnticheat:server:requestKey", function(source, callback, resourceName)
    local src = source


    if resourceName == nil then logtoDiscord("🔨 Player (" .. GetPlayerName(src) .. ") banned \n Speler probeerde script sleutel op te vragen van script: " .. resourceName) banPlayer(src, resourceName) DropPlayer(src, "\n [mn-keyAnticheat] BANNED") return end
    if resources[resourceName] == nil then logtoDiscord("❌ script (" .. resourceName .. ") is niet op de juiste manier geregistreerd... \n Key request is afgewezen om false bans tegen te gaan") return end
    if resources[resourceName].players[src] ~= nil then logtoDiscord("🔨 Player (" .. GetPlayerName(src) .. ") banned \n Speler probeerde script sleutel op te vragen van script: " .. resourceName) banPlayer(src, resourceName) DropPlayer(src, "\n [mn-keyAnticheat] BANNED")  return end

    resources[resourceName].players[src] = true 

    callback(resources[resourceName].key)

end)


RegisterNetEvent("mn-keyAnticheat:server:banPlayer")
AddEventHandler("mn-keyAnticheat:server:banPlayer", function(source, resourceName)
    logtoDiscord("🔨 Player (" .. GetPlayerName(source) .. ") banned \n Speler gaf de verkeerde key door aan de server | Resource: " .. resourceName)
    banPlayer(source, resourceName)
end)


banPlayer = function(source, resourceName)
    local src = source
    local identifiers = GetPlayerIdentifiers(src)


    table.insert(bannedData, {
        steamname = GetPlayerName(src),
        resource = resourceName,
        identifiers = identifiers
    })

    saveData()
end


AddEventHandler('onResourceStop', function(resourceName)
    for k,v in pairs(resources) do 
        if k == resourceName then 
            resources[k] = nil 
            print('[mn-keyAnticheat] ' .. resourceName .. " has stopped and has been removed from mn-keyAnticheat")
            return
        end
    end
end)


RegisterNetEvent("mn-keyAnticheat:server:registerScript")
AddEventHandler("mn-keyAnticheat:server:registerScript", function(resourceName, callback)
    if resourceName == nil then return end
    if resources[resourceName] ~= nil then print("[mn-keyAnticheat] " .. resourceName .. " already has been initialized returning...") return end 
    local new_key = genarateKey()
    resources[resourceName] = {
        key = new_key,
        players = {}
    }
    print("[mn-keyAnticheat] " .. resourceName .. " has been initialized")
    logtoDiscord("🛠️ [mn-keyAnticheat] " .. resourceName .. " has been initialized \n Key: " .. new_key)

    callback(new_key)
end)


logtoDiscord = function(msg)
    local discordInfo = {
        ["color"] = "15158332",
        ["type"] = "rich",
        ["description"] = msg,
        ["footer"] = {
        ["text"] = "mn-keyAnticheat"
        }
    }
    PerformHttpRequest("https://discord.com/api/webhooks/944230756966887457/-K1YZln9kQBFYzwC2zMuzB3NfOTdczA4YKrIZQCNPBkaOeplDceN9Ywz7iebPwWo6goZ", function(err, text, headers) end, 'POST', json.encode({ username = 'mn-keyAnticheat', embeds = { discordInfo } }), { ['Content-Type'] = 'application/json' })
end


genarateKey = function()
    return "mnAC-" .. math.random(1,10000) .. "-" ..  math.random(1,10000) .. "-" .. math.random(1,10000)
end


checkPlayer = function(player) 
    local identifiers = GetPlayerIdentifiers(player)


    for i=1, #identifiers, 1 do
        for k,v in pairs(bannedData) do 
            for j,l in pairs(v.identifiers) do 
                if l == identifiers[i] then 
                    return bannedData[k]
                end
            end
        end
    end
    return false
end

AddEventHandler("playerConnecting", PlayerJoining)


admins = {
    "steam:1100001434831a7"
}

RegisterCommand("keyAnticheat", function(source ,args)
    local src = source 
    local user = ESX.GetPlayerFromId(src)
    if IsAdmin(user.identifier) then 
        TriggerClientEvent('mn-keyAnticheat:client:openBanMenu', src, bannedData)
    end
end)

IsAdmin = function(identifier)

    for k,v in pairs(admins) do 
        if v == identifier then 
            return true 
        end
    end
    return false
end