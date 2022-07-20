Bartender = function(club, data)
    while #(GetEntityCoords(Cache.self) - data.Bar.Teleport.In.xyz) <= 1.0 do
        Wait(0)
        DrawTxt3D(data.Bar.Teleport.In.xyz, Strings["enter_bar"])
        if IsControlJustReleased(0, 51) then
            SetEntityCoordsNoOffset(Cache.self, data.Bar.Teleport.Out.xyz)
            SetEntityHeading(Cache.self, data.Bar.Teleport.Out.w)
        end
    end

    while #(GetEntityCoords(Cache.self) - data.Bar.Teleport.Out.xyz) <= 1.0 do
        Wait(0)
        DrawTxt3D(data.Bar.Teleport.Out.xyz, Strings["exit_bar"])
        if IsControlJustReleased(0, 51) then
            SetEntityCoordsNoOffset(Cache.self, data.Bar.Teleport.In.xyz)
            SetEntityHeading(Cache.self, data.Bar.Teleport.In.w)
        end
    end

    while #(GetEntityCoords(Cache.self) - data.Bar.Fridge) <= 1.0 do
        Wait(0)
        DrawTxt3D(data.Bar.Fridge, Strings["open_fridge"])
        if IsControlJustReleased(0, 51) then
            OpenFridge()

            while not ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "fridge") do
                Wait(50)
            end
        
            while ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "fridge") do
                Wait(50)
                if #(GetEntityCoords(Cache.self) - data.Bar.Fridge) > 1.5 then
                    ESX.UI.Menu.CloseAll()
                end
            end
        end
    end

    while #(GetEntityCoords(Cache.self) - data.Bar.Mix.xyz) <= 1.0 do
        Wait(0)
        DrawTxt3D(data.Bar.Mix.xyz, Strings["mix_drink"])
        if IsControlJustReleased(0, 51) then
            local elements = {}
            for k, v in pairs(Config.Bar.Recipes) do
                table.insert(elements, {
                    label = v.Label,
                    value = k
                })
            end
            local bardata = data
            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "mix_select", {
                title = Strings["select_drink"],
                align = ((Config.Options and Config.Options.MenuAlign) or ("bottom-right")),
                elements = elements
            }, function(data, menu)
                local elements = {
                    {label = string.format(Strings["make_drink"], data.current.label), value = "make"}
                }
                for k, v in pairs(Config.Bar.Recipes[data.current.value].Ingredients) do
                    table.insert(elements, {
                        label = string.format(Strings["amount_ingredient"], v[2], Cache.labels[v[1]] or v[1])
                    })
                end

                ESX.UI.Menu.Open("default", GetCurrentResourceName(), "confirm_mix", {
                    title = data.current.label,
                    align = ((Config.Options and Config.Options.MenuAlign) or ("bottom-right")),
                    elements = elements
                }, function(data2, menu2)
                    if data2.current.value == "make" then
                        ESX.TriggerServerCallback("loaf_vanillaunicorn:mix_drink", function(success)
                            if success then
                                menu2.close()
                                menu.close()
                                SetEntityCoordsNoOffset(Cache.self, bardata.Bar.Mix.xyz)
                                SetEntityHeading(Cache.self, bardata.Bar.Mix.w)
                                TaskPlayAnim(Cache.self, LoadDict("mini@drinking"), "shots_barman_b", 8.0, -8.0, -1, 1, 0, false, false, false)
                                Wait(7000)
                                ClearPedTasks(Cache.self)
                            end
                        end, data.current.value)
                    end
                end, function(data2, menu2)
                    menu2.close()
                end)

            end, function(data, menu)
                menu.close()
            end)
        end
    end
end