Cache = {}
ESX = nil

CreateThread(function()
    while not NetworkIsSessionStarted() do 
        Wait(250)
    end
    
    while ESX == nil do 
        TriggerEvent(esx_event, function(obj) 
            ESX = obj 
        end) 
        Wait(250) 
    end

    -- Wait(5000) -- allows you to restart the script in-game

    while ESX.GetPlayerData().job == nil or ESX.GetPlayerData().job.name == nil do
        Wait(250)
    end

    for k, v in pairs(Config.Locations) do
        AddBlip(v.Location, 121, 8, Strings["blip"])
    end

    if ESX.GetPlayerData().job.name == "unicorn" then
        Cache.hasJob = true
        Cache.job = ESX.GetPlayerData().job
    end

    local items = {}
    for k, v in pairs(Config.Bar.Items) do
        table.insert(items, v[1])
    end
    
    ESX.TriggerServerCallback("loaf_vanillaunicorn:getLabels", function(labels)
        Cache.labels = labels
    end, items)

    Cache.loaded = true

    ReloadMarkers()
end)

ReloadMarkers = function()
    if not Cache.checkPoints then Cache.checkPoints = {} end
    for k, v in pairs(Cache.checkPoints) do
        DeleteCheckpoint(v)
    end

    for k, v in pairs(Config.Locations) do
        if Cache.hasJob and Config.Options.JobMarkers then
            if Cache.job.grade >= Config.Options.Inventory then
                table.insert(Cache.checkPoints, CreateMarker(v.Boss.Storage, Config.Options.MarkerColour, 0.3, 0.3))
            end

            if Outfits[Cache.job.grade_name] then
                table.insert(Cache.checkPoints, CreateMarker(v.Locker, Config.Options.MarkerColour, 0.3, 0.3))
            end

            if Cache.job.grade_name == "bartender" then
                table.insert(Cache.checkPoints, CreateMarker(v.Bar.Teleport.In.xyz, Config.Options.MarkerColour, 0.3, 0.3))
                table.insert(Cache.checkPoints, CreateMarker(v.Bar.Teleport.Out.xyz, Config.Options.MarkerColour, 0.3, 0.3))
                table.insert(Cache.checkPoints, CreateMarker(v.Bar.Fridge, Config.Options.MarkerColour, 0.3, 0.3))
                table.insert(Cache.checkPoints, CreateMarker(v.Bar.Mix.xyz, Config.Options.MarkerColour, 0.3, 0.3))
            end

            if Cache.job.grade_name == "dancer" then
                for k, v in pairs(v.Poledance) do
                    table.insert(Cache.checkPoints, CreateMarker(v.Position, Config.Options.MarkerColour, 0.3, 0.3))
                end

                for k, v in pairs(v.Lapdance) do
                    table.insert(Cache.checkPoints, CreateMarker(v.dance.xyz, Config.Options.MarkerColour, 0.3, 0.3))
                end
            end

            if Cache.job.grade_name == "boss" then
                table.insert(Cache.checkPoints, CreateMarker(v.Boss.Employ, Config.Options.MarkerColour, 0.3, 0.3))
            end
        elseif not Cache.hasJob and Config.Options.Markers then
            for k, v in pairs(v.Lapdance) do
                table.insert(Cache.checkPoints, CreateMarker(v.sit.xyz + vec3(0.0, 0.0, 0.8), Config.Options.MarkerColour, 0.3, 0.3))
            end

            for k, v in pairs(v.Lean) do
                table.insert(Cache.checkPoints, CreateMarker(v.xyz, Config.Options.MarkerColour, 0.3, 0.3))
            end
        end 
    end
end

CreateMarker = function(coords, rgba, height, scale)
    coords = coords - vector3(0.0, 0.0, 1.0)
    local checkPoint = CreateCheckpoint(45, coords, coords, scale, rgba.red, rgba.green, rgba.blue, rgba.alpha, 0)
    SetCheckpointCylinderHeight(checkPoint, height, height, scale)

    return checkPoint
end

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
	if job.name == "unicorn" then
        Cache.hasJob = true
        Cache.job = ESX.GetPlayerData().job
    else
        Cache.hasJob = false
    end
    ReloadMarkers()
end)

LoadDict = function(Dict)
    while not HasAnimDictLoaded(Dict) do 
        Wait(0)
        RequestAnimDict(Dict)
    end

    return Dict
end

AddBlip = function(coords, sprite, colour, label)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip)

    return blip
end

HelpText = function(text, sound)
    AddTextEntry(GetCurrentResourceName(), text)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(0, 0, (sound == true), -1)
end

DrawTxt3D = function(coords, text, sound, force)
    if not Config.Use3DText and not force then
        HelpText(text, sound)
        return
    end

    local str = text

    local start, stop = string.find(text, "~([^~]+)~")
    if start then
        start = start - 2
        stop = stop + 2
        str = ""
        str = str .. string.sub(text, 0, start) .. "   " .. string.sub(text, start+2, stop-2) .. string.sub(text, stop, #text)
    end

    AddTextEntry(GetCurrentResourceName(), str)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(2, false, false, -1)

	SetFloatingHelpTextWorldPosition(1, coords)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
end

LoadModel = function(model)
    local ogmodel = model
    if type(model) == "string" then model = GetHashKey(model) elseif type(model) ~= "number" then return {loaded = false, model = model} end
    local timer = GetGameTimer() + 10000 -- 10 seconds to load

    if not HasModelLoaded(model) and IsModelInCdimage(model) then
        RequestModel(model)
        while not HasModelLoaded(model) and timer >= GetGameTimer() do -- give it time to load
            Wait(50)
        end
    end

    BusyspinnerOff()

    if HasModelLoaded(model) then
        return {loaded = true, model = model}
    else
        if not IsModelInCdimage(model) then
            ESX.ShowNotification("Model " .. ogmodel .. " is not in cd image")
        else
            ESX.ShowNotification("Contact your server owner, the model couldn't load (doesn't exist?): " .. ogmodel)
        end
        return {loaded = false, model = model}
    end
end

OpenStorage = function(club, invtype)
    if GlobalState[club .. "storage"] == GetPlayerServerId(PlayerId()) then

        local elements = {}
        ESX.UI.Menu.Open("default", GetCurrentResourceName(), invtype, {
            title = Strings[invtype],
            align = ((Config.Options and Config.Options.MenuAlign) or ("bottom-right")),
            elements = {
                {label = Strings["put_" .. invtype], value = "put"},
                {label = Strings["get_" .. invtype], value = "get"},
            }
        }, function(data, menu)
            if data.current.value == "get" then
                ESX.TriggerServerCallback("loaf_vanillaunicorn:getInventory", function(items)
                    local elements = {}

                    for k, v in pairs(items) do
                        if v.count > 0 then
                            table.insert(elements, {
                                label = "x" .. v.count .. " " .. (v.label or v.item or "unknown"),
                                value = v.name,
                                amount = v.count
                            })
                        end
                    end

                    if #elements == 0 then
                        elements = {{label = Strings["no_" .. invtype]}}
                    end

                    ESX.UI.Menu.Open("default", GetCurrentResourceName(), data.current.value, {
                        title = data.current.label,
                        align = ((Config.Options and Config.Options.MenuAlign) or ("bottom-right")),
                        elements = elements
                    }, function(data2, menu2)
                        local item = data2.current.value
                        if item then

                            if invtype == "items" then
                                ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "select_amount_" .. data.current.value, {
                                    title = Strings["quantity"]
                                }, function(data3, menu3)
                                    local amount = tonumber(data3.value)
                                    if amount and amount <= data2.current.amount then
                                        TriggerServerEvent("loaf_vanillaunicorn:withdraw", item, amount)
                                        menu3.close()
                                        menu2.close()
                                    else
                                        ESX.ShowNotification(Strings["invalid_amount"])
                                    end
                                end, function(data3, menu3)
                                    menu3.close()
                                end)
                            elseif invtype == "weapons" then
                                TriggerServerEvent("loaf_vanillaunicorn:withdraw", item)
                                menu2.close()
                            end
                        end
                    end, function(data2, menu2)
                        menu2.close()
                    end)
                    
                end, club, invtype)
            elseif data.current.value == "put" then
                local elements = {}
                if invtype == "items" then
                    local inventory = ESX.GetPlayerData().inventory

                    for k, v in pairs(inventory) do
                        if v.count > 0 then
                            table.insert(elements, {
                                label = "x" .. v.count .. " " .. (v.label or v.item or "unknown"),
                                value = v.name,
                                amount = v.count
                            })
                        end
                    end
                elseif invtype == "weapons" then
                    local loadout = nil

                    ESX.TriggerServerCallback("loaf_vanillaunicorn:get_loadout", function(weapons)
                        loadout = weapons
                    end)

                    while loadout == nil do
                        Wait(0)
                    end
                    for k, v in pairs(loadout) do
                        table.insert(elements, {
                            label = (v.label or v.item or "unknown"),
                            value = v.name
                        })
                    end
                end

                if #elements == 0 then
                    elements = {{label = Strings["no_" .. invtype]}}
                end

                ESX.UI.Menu.Open("default", GetCurrentResourceName(), data.current.value, {
                    title = data.current.label,
                    align = ((Config.Options and Config.Options.MenuAlign) or ("bottom-right")),
                    elements = elements
                }, function(data2, menu2)
                    if data2.current.value then

                        if invtype == "items" then
                            ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "select_amount_" .. data.current.value, {
                                title = Strings["quantity"]
                            }, function(data3, menu3)
                                local amount = tonumber(data3.value)
                                if amount and amount <= data2.current.amount then
                                    TriggerServerEvent("loaf_vanillaunicorn:deposit", data2.current.value, amount)
                                    menu3.close()
                                    menu2.close()
                                else
                                    ESX.ShowNotification(Strings["invalid_amount"])
                                end
                            end, function(data3, menu3)
                                menu3.close()
                            end)
                        elseif invtype == "weapons" then
                            TriggerServerEvent("loaf_vanillaunicorn:deposit", data2.current.value)
                            menu2.close()
                        end

                    end
                end, function(data2, menu2)
                    menu2.close()
                end)
            end
        end, function(data, menu)
            menu.close()
        end)

    else
        ESX.ShowNotification(Strings["inventory_occupied"])
    end
end

OpenFridge = function()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "fridge", {
        title = Strings["fridge"],
        align = ((Config.Options and Config.Options.MenuAlign) or ("bottom-right")),
        elements = {
            {label = Strings["browse_items"], value = "browse"},
            {label = Strings["purchase_items"], value = "purchase"},
            {label = Strings["purchase_bundles"], value = "bundles"}
        }
    }, function(data, menu)
        if data.current.value == "browse" then
            ESX.TriggerServerCallback("loaf_vanillaunicorn:getBar", function(items)
                local elements = {}
                for k, v in pairs(items) do
                    if v.count > 0 then
                        table.insert(elements, {
                            label = "x" .. v.count .. " " .. (v.label or v.item or "unknown"),
                            value = v.name,
                            amount = v.count
                        })
                    end
                end
                if #elements == 0 then
                    elements = {{label = Strings["no_items"]}}
                end
                ESX.UI.Menu.Open("default", GetCurrentResourceName(), "bar_items", {
                    title = data.current.label,
                    align = ((Config.Options and Config.Options.MenuAlign) or ("bottom-right")),
                    elements = elements
                }, function(data2, menu2)
                    if data.current.value then
                        --[[ WITHDRAWING ITEMS DISABLED, WHEN MAKING A DRINK IT USES ITEMS FROM THE FRIDGE
                            ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "select_amount_" .. data.current.value, {
                            title = Strings["quantity"],
                        }, function(data3, menu3)
                            local amount = tonumber(data3.value)
                            if amount and amount <= data2.current.amount then
                                TriggerServerEvent("loaf_vanillaunicorn:withdraw_bar", data2.current.value, amount)
                                menu3.close()
                                menu2.close()
                            else
                                ESX.ShowNotification(Strings["invalid_amount"])
                            end
                        end, function(data3, menu3)
                            menu3.close()
                        end)
                        ]]
                    end
                end, function(data2, menu2)
                    menu2.close()
                end)
            end)
        elseif data.current.value == "purchase" then
            local elements = {}
            for k, v in pairs(Config.Bar.Items) do
                table.insert(elements, {
                    label = string.format(Strings["listing_item"], Cache.labels[v[1]] or v[1], v[2]),
                    value = k,
                })
            end
            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "purchase", {
                title = data.current.label,
                align = ((Config.Options and Config.Options.MenuAlign) or ("bottom-right")),
                elements = elements
            }, function(data2, menu2)
                ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "select_amount_" .. data.current.value, {
                    title = string.format(Strings["amount_buy"], data2.current.label)
                }, function(data3, menu3)
                    local amount = tonumber(data3.value)
                    if amount and amount > 0 then
                        TriggerServerEvent("loaf_vanillaunicorn:purchase_bar", "item", data2.current.value, amount)
                        menu3.close()
                        menu2.close()
                    else
                        ESX.ShowNotification(Strings["invalid_amount"])
                    end
                end, function(data3, menu3)
                    menu3.close()
                end)
            end, function(data2, menu2)
                menu2.close()
            end)
        elseif data.current.value == "bundles" then
            local prices = {}
            for k, v in pairs(Config.Bar.Items) do
                prices[v[1]] = v[2]
            end
            local elements = {}
            for k, v in pairs(Config.Bar.Recipes) do
                local price = 0
                for k, v in pairs(v.Ingredients) do
                    price = price + (v[2] * prices[v[1]] or 0)
                    if not prices[v[1]] then
                        print("Price for item " .. v[1] .. "doesn't exist.")
                    end
                end
                table.insert(elements, {
                    label = string.format(Strings["purchase_bundle"], v.Label, price),
                    value = k
                })
            end
            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "purchase", {
                title = data.current.label,
                align = ((Config.Options and Config.Options.MenuAlign) or ("bottom-right")),
                elements = elements
            }, function(data2, menu2)
                ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "select_amount_" .. data.current.value, {
                    title = string.format(Strings["amount_buy"], data2.current.label)
                }, function(data3, menu3)
                    local amount = tonumber(data3.value)
                    if amount and amount > 0 then
                        TriggerServerEvent("loaf_vanillaunicorn:purchase_bar", "bundle", data2.current.value, amount)
                        menu3.close()
                        menu2.close()
                    else
                        ESX.ShowNotification(Strings["invalid_amount"])
                    end
                end, function(data3, menu3)
                    menu3.close()
                end)
            end, function(data2, menu2)
                menu2.close()
            end)
        end
    end, function(data, menu)
        menu.close()
    end)
end