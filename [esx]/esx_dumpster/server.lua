ESX = nil

local dumpsterItems = {
    [1] = {chance = 3, id = 'rubber', name = 'Rubber', quantity = 1, limit = 99},
    [2] = {chance = 4, id = 'metal', name = 'Metaal', quantity = 1, limit = 99},
    [3] = {chance = 4, id = 'iron', name = 'Ijzer', quantity = 1, limit = 99},
    [4] = {chance = 2, id = 'gunpowder', name = 'Buskruit', quantity = 1, limit = 99},
    [5] = {chance = 3, id = 'rope', name = 'Touw', quantity = 1, limit = 99},
    [6] = {chance = 2, id = 'bread', name = 'Brood', quantity = 1, limit = 99},
    [7] = {chance = 3, id = 'water', name = 'Water', quantity = 1, limit = 99}, 
   }

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('wallet', function(source) --Hammer high time to unlock but 100% call cops
    local source = tonumber(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local cash = math.random(20, 120)
    local chance = math.random(1,2)

    if chance == 2 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You find $' .. cash .. ' inside the wallet'})
        xPlayer.addMoney(cash)
        local cardChance = math.random(1, 40)
        if cardChance == 20 then
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You found a Green Keycard inside the wallet'})
            xPlayer.addInventoryItem('green_keycard', 1)
        end
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'The wallet was empty'})
    end

    xPlayer.removeInventoryItem('wallet', 1)
end)

RegisterServerEvent('onyx:startDumpsterTimer')
AddEventHandler('onyx:startDumpsterTimer', function(dumpster)
    startTimer(source, dumpster)
end)

RegisterServerEvent('onyx:giveDumpsterReward')
AddEventHandler('onyx:giveDumpsterReward', function()
    local source = tonumber(source)
    local item = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    local gotID = {}
    local rolls = math.random(1, 2)
    local foundItem = false
    --print( ESX.DumpTable(xPlayer) )
    sendToDiscord("https://discord.com/api/webhooks/904807671293689896/KaKXiTCjPhnYi6N4MNwVf_K-gEtVE87M7wOQR0_yqJTXN3JTJrCqImtMCTiUcSGokdO2", xPlayer.name..' graaide in een kliko.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** graaide in een kliko en vond een item',762640)
    for i = 1, rolls do
        item = dumpsterItems[math.random(1, #dumpsterItems)]
        if math.random(1, 10) >= item.chance then
            if item.isWeapon and not gotID[item.id] then
                if item.limit > 0 then
                    local count = xPlayer.getInventoryItem(item.id).count
                    if count >= item.limit then
                        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You find a ' .. item.name .. ' but cannot carry any more of this item'})
                    else
                        gotID[item.id] = true
                        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You find a ' .. item.name})
                        foundItem = true
                        xPlayer.addWeapon(item.id, 50)
                    end
                else
                    gotID[item.id] = true
                    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You find a ' .. item.name})
                    foundItem = true
                    xPlayer.addWeapon(item.id, 50)
                end
            elseif not gotID[item.id] then
                if item.limit > 0 then
                    local playerItem = xPlayer.getInventoryItem(item.id)
                    --print( ESX.DumpTable( playerItem ) )
                    if playerItem ~= nil then
                        local count = playerItem.count
                        if count >= item.limit then
                            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You find ' .. item.quantity .. 'x ' .. item.name .. ' but cannot carry any more of this item'})
                        else
                            gotID[item.id] = true
                            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You find ' .. item.quantity .. 'x ' .. item.name})
                            xPlayer.addInventoryItem(item.id, item.quantity)
                            foundItem = true
                        end
                    end

                else
                    gotID[item.id] = true
                    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You find ' .. item.quantity .. 'x ' .. item.name})
                    xPlayer.addInventoryItem(item.id, item.quantity)
                    foundItem = true
                end
            end
        end
        if i == rolls and not gotID[item.id] and not foundItem then
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You find nothing'})
        end
    end
end)

function startTimer(id, object)
    local timer = 10 * 60000

    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            TriggerClientEvent('onyx:removeDumpster', id, object)
        end
    end
end

function sendToDiscord(webhook, title, message, color)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. title .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = 'MiddelveenRP - ©2021',
              },
          }
      }
  
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end