Actions = {}

JobMenu = function()
    if Cache.loaded and Cache.job.name == Config.Job.Name then
        ESX.UI.Menu.CloseAll()
        Wait(50)

        local elements = {
            {label = Strings.BillPlayer, value = "bill"},
            {label = Strings.TransferHouse, value = "transfer"},
        }

        if Cache.job.grade >= Config.Job.Create then
            table.insert(elements, {label = Strings.AddHouse, value = "create"})
            table.insert(elements, {label = Strings.RemoveHouse, value = "remove"})
        end

        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "jobmenu", {
            title = Strings.JobmenuLabel,
            align = Config.Align,
            elements = elements
        }, function(data, menu)
            local action = data.current.value
            if Actions[action] then
                Actions[action]()
            end
        end, function(data, menu)
            menu.close()
        end)
    end
end

ChooseInterior = function(housedata, cb)
    TriggerEvent("loaf_housing:get_shells", function(Shells)
        local interior_elements = {}
        local shells = Shells[housedata.ShellType]
        for i = 1, #shells do
            table.insert(interior_elements, {
                label = Strings.InteriorNumber:format(i),
                value = i
            })
        end
        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_interior", {
            title = Strings.WhatInterior,
            align = Config.Align,
            elements = interior_elements,
        }, function(data, menu)
            ESX.UI.Menu.CloseAll()
            cb(data.current.value)
        end, function(data, menu)
            menu.close()
        end)
    end)
end

Actions.transfer = function()
    TriggerEvent("loaf_housing:get_houses", function(Houses)
        ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "houseid", {
            title = Strings.HouseTransfer
        }, function(data, menu)
            local houseid = tonumber(data.value)
            if houseid and Houses[houseid] then
                menu.close()
                local plr, dist = ESX.Game.GetClosestPlayer()
                if plr == -1 or dist > 3.0 then
                    if Config.AllowTransferSelf then
                        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "transfer_self", {
                            title = Strings.TransferSelf:format(houseid),
                            align = Config.Align,
                            elements = {
                                {label = Strings.Yes, value = "y"},
                                {label = Strings.No, value = "n"},
                            }
                        }, function(data2, menu2)
                            if data2.current.value == "y" then
                                menu2.close()
                                if not Houses[houseid].ShellId then
                                    ChooseInterior(Houses[houseid], function(interior)
                                        TriggerServerEvent("loaf_rea:transfer_house", GetPlayerServerId(PlayerId()), houseid, interior)
                                    end)
                                else
                                    TriggerServerEvent("loaf_rea:transfer_house", GetPlayerServerId(PlayerId()), houseid, Houses[houseid].ShellId)
                                end
                            else
                                menu2.close()
                            end
                        end, function(data2, menu2)
                            menu2.close()
                        end)
                    else
                        ESX.ShowNotification(Strings.NooneNearby)
                    end
                else
                    if not Houses[houseid].ShellId then
                        ChooseInterior(Houses[houseid], function(interior)
                            TriggerServerEvent("loaf_rea:transfer_house", GetPlayerServerId(plr), houseid, interior)
                        end)
                    else
                        TriggerServerEvent("loaf_rea:transfer_house", GetPlayerServerId(plr), houseid, Houses[houseid].ShellId)
                    end
                end
            else
                ESX.ShowNotification(Strings.InvalidHouse)
            end
        end, function(data, menu)
            menu.close()
        end)
    end)
end

Actions.bill = function()
    ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "billing_reason", {
        title = Strings.BillReason
    }, function(data, menu)
        local reason = data.value
        if reason then
            menu.close()
            ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "billing_amount", {
                title = Strings.BillAmount
            }, function(data2, menu2)
                local amount = tonumber(data2.value)
                if amount and amount > 0 then
                    menu2.close()
                    local plr, dist = ESX.Game.GetClosestPlayer()
                    if plr == -1 or dist > 3.0 then
                        if Config.AllowTransferSelf then
                            TriggerServerEvent("esx_rekening:sendBill", GetPlayerServerId(plr), "society_" .. Config.Job.Name, reason, amount)
                            ESX.ShowNotification(Strings.Billed:format(tostring(amount), reason))
                        else
                            ESX.ShowNotification(Strings.NooneNearby)
                        end
                    else
                        TriggerServerEvent("esx_rekening:sendBill", GetPlayerServerId(plr), "society_" .. Config.Job.Name, reason, amount)
                        ESX.ShowNotification(Strings.Billed:format(tostring(amount), reason))
                    end
                else
                    ESX.ShowNotification(Strings.InvalidAmount)
                end
            end, function(data2, menu2)
                menu2.close()
            end)
        else
            ESX.ShowNotification(Strings.InvalidReason)
        end
    end, function(data, menu)
        menu.close()
    end)
end

Actions.create = function()
    if Cache.loaded and Cache.job.name == Config.Job.Name and Cache.job.grade >= Config.Job.Create then
        local door, garage_enter, garage_exit, category, id
        local price = 0

        TriggerEvent("loaf_housing:get_shells", function(Shells)

            local elements = {
                {label = Strings.DoorPos, value = "door"},
                {label = Strings.GaragePos, value = "garage_entrance"},
                {label = Strings.GarageExit, value = "garage_exit"},
                {label = Strings.SelectInterior, value = "select_interior"},
                {label = Strings.Create, value = "create"}
            }

            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "creator", {
                title = Strings.HouseCreator,
                align = Config.Align,
                elements = elements
            }, function(data, menu)
                local action = data.current.value
    
                if action == "door" then
                    local pos = GetEntityCoords(PlayerPedId())
                    door = vector4(pos.x, pos.y, pos.z, GetEntityHeading(PlayerPedId()))
                elseif action == "garage_entrance" then
                    garage_enter = GetEntityCoords(PlayerPedId())
                elseif action == "garage_exit" then
                    local pos = GetEntityCoords(PlayerPedId())
                    garage_exit = vector4(pos.x, pos.y, pos.z, GetEntityHeading(PlayerPedId()))
                elseif action == "select_interior" then
                    local elements = {}
                    for category, v in pairs(Shells) do
                        table.insert(elements, {
                            label = category,
                            category = category,
                        })
                    end
                    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_category", {
                        title = Strings.SelectCategory,
                        align = Config.Align,
                        elements = elements,
                    }, function(data2, menu2)
                        local elements = {}
                        for k, v in pairs(Shells[data2.current.category]) do
                            table.insert(elements, {
                                label = v.object .. " [#"..k.."]",
                                interiorid = k
                            })
                        end
                        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_interior", {
                            title = Strings.SelectInterior,
                            align = Config.Align,
                            elements = elements,
                        }, function(data3, menu3)
                            category = data2.current.category
                            id = data3.current.interiorid
                            menu3.close()
                            menu2.close()
                        end, function(data3, menu3)
                            menu3.close()
                        end)
                    end, function(data2, menu2)
                        menu2.close()
                    end)
                elseif action == "create" then
                    if door and category and id then
                        ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "house_label", {
                            title = Strings.HouseName
                        }, function(data2, menu2)
                            if Config.ChoosePrice then
                                ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "billing_amount", {
                                    title = Strings.Price
                                }, function(data3, menu3)
                                    local amount = tonumber(data3.value)
                                    if amount and amount > 0 then
                                        if garage_exit then
                                            garage_exit = garage_exit - vector4(0.0, 0.0, 0.5, 0.0)
                                        end
                                        menu3.close()
                                        menu2.close()
                                        menu.close()
                                        TriggerServerEvent("loaf_rea:create_house", data2.value, "house", door, category, id, garage_enter, garage_exit, amount)
                                    end
                                end, function(data3, menu3)
                                    menu3.close()
                                end)
                            else
                                menu2.close()
                                menu.close()
                                if garage_exit then
                                    garage_exit = garage_exit - vector4(0.0, 0.0, 0.5, 0.0)
                                end
                                TriggerServerEvent("loaf_rea:create_house", data2.value, "house", door, category, id, garage_enter, garage_exit, price)
                            end
                        end, function(data2, menu2)
                            menu2.close()
                        end)
                    else
                        ESX.ShowNotification(Strings.MustSelect)
                    end
                end
            end, function(data, menu)
                menu.close()
            end)
    
            while ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "creator") do
                Wait(0)
    
                if door then
                    DrawTxt3D(door.xyz, Strings.Door)
                    DrawMarker(1, door.xyz - vec3(0.0, 0.0, 1.0), vec3(0.0, 0.0, 0.0), vec3(0.0, 0.0, 0.0), vec3(0.4, 0.4, 0.4), 255, 255, 0, 200)
                end
    
                if garage_enter then
                    DrawTxt3D(garage_enter.xyz, Strings.GarageEntrance)
                    DrawMarker(1, garage_enter.xyz - vec3(0.0, 0.0, 1.0), vec3(0.0, 0.0, 0.0), vec3(0.0, 0.0, 0.0), vec3(0.4, 0.4, 0.4), 255, 255, 0, 200)
                end
    
                if garage_exit then
                    DrawTxt3D(garage_exit.xyz, Strings.GarageSpawn)
                    DrawMarker(1, garage_exit.xyz - vec3(0.0, 0.0, 1.0), vec3(0.0, 0.0, 0.0), vec3(0.0, 0.0, 0.0), vec3(0.4, 0.4, 0.4), 255, 255, 0, 200)
                end
            end

        end)
    else
        ESX.ShowNotification(Strings.NoAccess)
    end
end

Actions.remove = function()
    ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "house_remove", {
        title = Strings.HouseRemove
    }, function(data, menu)
        local houseid = tonumber(data.value)
        if houseid then
            menu.close()
            TriggerServerEvent("loaf_rea:remove_house", houseid)
        else    
            ESX.ShowNotification(Strings.InvalidHouse)
        end
    end, function(data, menu)
        menu.close()
    end)
end