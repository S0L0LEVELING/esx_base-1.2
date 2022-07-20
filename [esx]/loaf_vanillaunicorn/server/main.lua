ESX = nil
TriggerEvent("esx:getSharedObject", function(obj)
    ESX = obj
end)

TriggerEvent("esx_society:registerSociety", "unicorn", "Unicorn", "society_unicorn", "society_unicorn", "society_unicorn", {type = "private"})

CreateThread(function()
    while Config == nil do 
        Wait(50) 
    end

    Wait(100)

    for club, v in pairs(Config.Locations) do
        for k, v in pairs(v.Poledance) do
            GlobalState[club .. "poledance" .. k] = false
        end

        for k, v in pairs(v.Lapdance) do
            GlobalState[club .. "lapdance" .. k] = false
            GlobalState[club .. "sit" .. k] = false
        end

        for k, v in pairs(v.Lean) do
            GlobalState[club .. "lean" .. k] = false
        end

        GlobalState[club .. "storage"] = false
    end
    
    RegisterNetEvent("loaf_unicornjob:occupy")
    AddEventHandler("loaf_unicornjob:occupy", function(type, club, id)
        local src = source
    
        if type and id and club then
            local v = club .. type .. id

            if GlobalState[v] == false then
                GlobalState[v] = src
            elseif GlobalState[v] == src then
                GlobalState[v] = false
            end
        elseif type == "storage" and club then
            if GlobalState[club .. type] == false then
                GlobalState[club .. type] = src
            elseif GlobalState[club .. type] == src then
                GlobalState[club .. type] = false
            end
        end
    end)

    RegisterNetEvent("loaf_unicornjob:throw_money")
    AddEventHandler("loaf_unicornjob:throw_money", function(club, pole)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer and xPlayer.getMoney() >= Config.ThrowMoney then
            if pole and club and Config.Locations[club].Poledance[pole] then
                local stripper = GlobalState[club .. "poledance" .. pole]
                if stripper and GetPlayerName(stripper) then
                    xPlayer.removeMoney(Config.ThrowMoney)
                    local stripper = ESX.GetPlayerFromId(stripper)
                    if stripper then 
                        stripper.addMoney(Config.ThrowMoney) 
                    end
                    TriggerClientEvent("esx:showNotification", stripper.source, string.format(Strings["threw"], Config.ThrowMoney))
                end
            end
        end
    end)

    ESX.RegisterServerCallback("loaf_vanillaunicorn:get_money", function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            cb(xPlayer.getMoney())
        end
    end)

    -- BAR
    RegisterNetEvent("loaf_vanillaunicorn:purchase_bar")
    AddEventHandler("loaf_vanillaunicorn:purchase_bar", function(item_type, item_id, amount)
        local xPlayer = ESX.GetPlayerFromId(source)
        amount = math.floor(tonumber(amount))
        if item_type == "item" then
            local data = Config.Bar.Items[item_id]
            if data then
                local price = math.floor(data[2] * amount)
                TriggerEvent("esx_addonaccount:getSharedAccount", "society_unicorn", function(account)
                    if account.money >= price then
                        TriggerEvent("esx_addoninventory:getSharedInventory", "unicorn_bar", function(inventory)
                            inventory.addItem(data[1], amount)
                            account.removeMoney(price)
                            xPlayer.showNotification(string.format(Strings["you_purchased"], amount, ESX.GetItemLabel(data[1]), price))
                        end)
                    else
                        xPlayer.showNotification(Strings["company_no_money"])
                    end
                end)
            end
        elseif item_type == "bundle" then
            local data = Config.Bar.Recipes[item_id]
            if data then
                local prices = {}
                for k, v in pairs(Config.Bar.Items) do
                    prices[v[1]] = v[2]
                end

                local items = {}
                local price = 0
                for k, v in pairs(data.Ingredients) do
                    price = price + (v[2] * prices[v[1]] or 0)
                    table.insert(items, v[1])
                    if not prices[v[1]] then
                        print("Price for item " .. v[1] .. "doesn't exist.")
                    end
                end
                price = math.floor(price * amount)
                TriggerEvent("esx_addonaccount:getSharedAccount", "society_unicorn", function(account)
                    if account.money >= price then
                        TriggerEvent("esx_addoninventory:getSharedInventory", "unicorn_bar", function(inventory)
                            for k, v in pairs(data.Ingredients) do
                                inventory.addItem(v[1], v[2] * amount)
                            end
                            account.removeMoney(price)
                            xPlayer.showNotification(string.format(Strings["you_purchased"], amount, data.Label, price))
                        end)
                    else
                        xPlayer.showNotification(Strings["company_no_money"])
                    end
                end)
            end
        end
    end)

    ESX.RegisterServerCallback("loaf_vanillaunicorn:mix_drink", function(source, cb, drink)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer and xPlayer.job.name == "unicorn" then
            TriggerEvent("esx_addoninventory:getSharedInventory", "unicorn_bar", function(inventory)
                local hasitems = false
                for k, v in pairs(Config.Bar.Recipes[drink].Ingredients) do
                    local itemdata = inventory.getItem(v[1])
                    if itemdata and itemdata.count >= v[2] then
                        hasitems = true
                    end
                end

                if hasitems then
                    for k, v in pairs(Config.Bar.Recipes[drink].Ingredients) do
                        inventory.removeItem(v[1], v[2])
                    end
                    cb(true)
                    Wait(5000)
                    xPlayer.addInventoryItem(Config.Bar.Recipes[drink].Name, 1)
                    xPlayer.showNotification(string.format(Strings["mixed"], Config.Bar.Recipes[drink].Label))
                else
                    xPlayer.showNotification(Strings["missing_ingredients"])
                    cb(false)
                end
            end)
        else
            cb(false)
        end
    end)

    ESX.RegisterServerCallback("loaf_vanillaunicorn:getBar", function(source, cb)
        TriggerEvent("esx_addoninventory:getSharedInventory", "unicorn_bar", function(inventory)
            cb(inventory.items)
        end)
    end)
    -- END OF BAR

    -- STORAGE
    ESX.RegisterServerCallback("loaf_vanillaunicorn:get_loadout", function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            cb(xPlayer.getLoadout())
        end
    end)

    ESX.RegisterServerCallback("loaf_vanillaunicorn:getInventory", function(source, cb, club, invtype)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer and xPlayer.job.name == "unicorn" and xPlayer.job.grade >= Config.Options.Inventory then
            if GlobalState[club .. "storage"] == source then
                if invtype == "items" then
                    TriggerEvent("esx_addoninventory:getSharedInventory", "society_unicorn", function(inventory)
                        cb(inventory.items)
                    end)
                elseif invtype == "weapons" then
                    TriggerEvent("esx_datastore:getSharedDataStore", "society_unicorn", function(store)
                        cb(store.get("weapons") or {})
                    end)
                end
            else
                print(xPlayer.identifier .. " tried to open unicorn inventory, but someone else has it open!")
            end
        else
            print(xPlayer.identifier .. " tried to open unicorn inventory, but does not have access!")
        end
    end)

    RegisterNetEvent("loaf_vanillaunicorn:withdraw")
    AddEventHandler("loaf_vanillaunicorn:withdraw", function(item, amount)
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)

        if amount then -- if amount is defined, it is an item
            TriggerEvent("esx_addoninventory:getSharedInventory", "society_unicorn", function(inventory)
                local itemdata = inventory.getItem(item)
                if itemdata and itemdata.count >= amount and amount > 0 then
                    if xPlayer.canCarryItem(item, amount) then
                        inventory.removeItem(item, amount)
                        xPlayer.addInventoryItem(item, amount)
                        xPlayer.showNotification(string.format(Strings["withdrew"], amount, xPlayer.getInventoryItem(item).label))
                    else
                        xPlayer.showNotification(Strings["cant_carry"])
                    end
                end
            end)
        else
            TriggerEvent("esx_datastore:getSharedDataStore", "society_unicorn", function(datastore)
                local weapons = datastore.get("weapons") or {}

                for k, v in pairs(weapons) do
                    if v.name == item and v.count > 0 then
                        v.count = v.count - 1
                        xPlayer.addWeapon(item, 250)
                    end
                end
                
                datastore.set("weapons", weapons)
            end)
        end
    end)

    RegisterNetEvent("loaf_vanillaunicorn:deposit")
    AddEventHandler("loaf_vanillaunicorn:deposit", function(item, amount)
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)

        if amount then -- if amount is defined, it is an item
            local itemdata = xPlayer.getInventoryItem(item)
            if itemdata then
                if itemdata.count >= amount then
                    TriggerEvent("esx_addoninventory:getSharedInventory", "society_unicorn", function(inventory)
                        xPlayer.removeInventoryItem(item, amount)
                        inventory.addItem(item, amount)
                        xPlayer.showNotification(string.format(Strings["deposited"], amount, itemdata.label))
                    end)
                end
            end
        else
            local loadoutNum, weapon = xPlayer.getWeapon(item)

            if weapon then
                xPlayer.removeWeapon(item)

                TriggerEvent("esx_datastore:getSharedDataStore", "society_unicorn", function(datastore)
                    local weapons = datastore.get("weapons") or {}

                    local found = false
                    for k, v in pairs(weapons) do
                        if v.name == item then
                            v.count = v.count + 1
                            found = true
                            break
                        end
                    end

                    if not found then
                        table.insert(weapons, {
                            name = item,
                            label = weapon.label,
                            count = 1
                        })
                    end

                    xPlayer.showNotification(string.format(Strings["deposited"], 1, weapon.label))
                    datastore.set("weapons", weapons)
                end)
            end
        end
    end)
    -- END OF STORAGE

    ESX.RegisterServerCallback("loaf_vanillaunicorn:getLabels", function(source, cb, items)
        local labels = {}
        for k, v in pairs(items) do
            local label = ESX.GetItemLabel(v)
            if label then
                labels[v] = label
            end
        end

        cb(labels)
    end)
    
    AddEventHandler("playerDropped", function()
        local src = source
    
        for club, v in pairs(Config.Locations) do
            for k, v in pairs(v.Poledance) do
                if GlobalState[club .. "poledance" .. k] == src then
                    GlobalState[club .. "poledance" .. k] = false
                end
            end

            for k, v in pairs(v.Lapdance) do
                if GlobalState[club .. "lapdance" .. k] == src then
                    GlobalState[club .. "lapdance" .. k] = false
                end

                if GlobalState[club .. "sit" .. k] == src then
                    GlobalState[club .. "sit" .. k] = false
                end
            end

            for k, v in pairs(v.Lean) do
                if GlobalState[club .. "lean" .. k] == src then
                    GlobalState[club .. "lean" .. k] = false
                end
            end

            if GlobalState[club .. "storage"] == src then
                GlobalState[club .. "storage"] = false
            end
        end
    end)
end)
