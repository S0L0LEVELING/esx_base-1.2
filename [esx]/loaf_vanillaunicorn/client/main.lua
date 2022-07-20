CreateThread(function()
    while not Cache.loaded do
        Wait(250)
    end

    while true do
        while Cache.hasJob do
            Wait(500)
            Cache.self = PlayerPedId()

            for k, v in pairs(Config.Locations) do
                if Cache.job.grade_name == "bartender" then
                    Bartender(k, v)
                end

                if Cache.job.grade_name == "dancer" then
                    Dancer(k, v)
                end

                if Cache.job.grade_name == "boss" then
                    Boss(k, v)
                end

                while Cache.job.grade >= Config.Options.Inventory and #(GetEntityCoords(Cache.self) - v.Boss.Storage) <= 1.0 do
                    Wait(0)
                    
                    if GlobalState[k .. "storage"] == false then
                        DrawTxt3D(v.Boss.Storage, Strings["inventory"])
                        if IsControlJustReleased(0, 51) then
                            ESX.UI.Menu.CloseAll()
                            
                            TriggerServerEvent("loaf_unicornjob:occupy", "storage", k)
                            local elements = {}
                            if Config.Options.Items then
                                table.insert(elements, {label = Strings["items"], value = "items"})
                            end
                            if Config.Options.Items then
                                table.insert(elements, {label = Strings["weapons"], value = "weapons"})
                            end

                            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_inventory", {
                                title = Strings["storage"],
                                align = ((Config.Options and Config.Options.MenuAlign) or ("bottom-right")),
                                elements = elements
                            }, function(data, menu)
                                OpenStorage(k, data.current.value)
                            end, function(data, menu)
                                menu.close()
                            end)

                            while ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "select_inventory") do
                                Wait(250)

                                if #(GetEntityCoords(Cache.self) - v.Boss.Storage) > 1.0 then
                                    ESX.UI.Menu.CloseAll()
                                    break
                                end
                            end

                            TriggerServerEvent("loaf_unicornjob:occupy", "storage", k)
                        end
                    else
                        DrawTxt3D(v.Boss.Storage, Strings["occupied"])
                    end
                end

                while #(GetEntityCoords(Cache.self) - v.Locker) <= 1.5 and Outfits[Cache.job.grade_name] do
                    Wait(0)

                    DrawTxt3D(v.Locker, Strings["change_clothes"])
                    if IsControlJustReleased(0, 51) then

                        TriggerEvent('skinchanger:getSkin', function(skin)
                            local clothes = Outfits[Cache.job.grade_name]
                            local elements = {{label = Strings["regular"], outfit = "civilian"}}

                            local to_use = "male"
                            if skin.sex == 1 then to_use = "female" end
                            for k, v in pairs(clothes) do
                                if v[to_use] then
                                    table.insert(elements, {label = v.label, outfit = v[to_use]})
                                end
                            end

                            ESX.UI.Menu.Open("default", GetCurrentResourceName(), "select_outfit", {
                                title = Strings["wardrobe"],
                                align = ((Config.Options and Config.Options.MenuAlign) or ("bottom-right")),
                                elements = elements
                            }, function(data, menu)

                                local outfit = data.current.outfit
                                if outfit == "civilian" then
                                    ESX.TriggerServerCallback("esx_skin:getPlayerSkin", function(skin)
                                        TriggerEvent("skinchanger:loadSkin", skin)
                                    end)
                                else
                                    TriggerEvent("skinchanger:loadClothes", skin, outfit)
                                end

                            end, function(data, menu)
                                menu.close()
                            end)
                        end)

                        while not ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "select_outfit") do
                            Wait(50)
                        end

                        while ESX.UI.Menu.IsOpen("default", GetCurrentResourceName(), "select_outfit") do
                            Wait(50)
                            if #(GetEntityCoords(Cache.self) - v.Locker) > 1.5 then
                                ESX.UI.Menu.CloseAll()
                            end
                        end
                    end
                end
            end
        end

        while not Cache.hasJob do
            Wait(500)
            Cache.self = PlayerPedId()

            for club, v in pairs(Config.Locations) do
                for k, v in pairs(v.Lapdance) do
                    while #(GetEntityCoords(Cache.self) - v.sit.xyz) <= 1.5 do
                        Wait(0)

                        if GlobalState[club .. "sit" .. k] == false then
                            DrawTxt3D(v.sit.xyz, Strings["sit"])

                            if IsControlJustReleased(0, 51) then
                                TriggerServerEvent("loaf_unicornjob:occupy", "sit", club, k)
                                FreezeEntityPosition(Cache.self, true)
                                SetEntityCoords(Cache.self, v.sit.xyz - vector3(0.0, 0.0, 1.0)) 
                                SetEntityHeading(Cache.self, v.sit.w)

                                local dict = (v.animations and v.animations.sit and v.animations.sit.dict) or "mini@strip_club@lap_dance_2g@ld_2g_reach"
                                local anim = (v.animations and v.animations.sit and v.animations.sit.anim) or "ld_2g_sit_idle"

                                TaskPlayAnim(Cache.self, LoadDict(dict), anim, 8.0, -8.0, -1, 1, 0, false, false, false)

                                while true do
                                    Wait(0)

                                    HelpText(Strings["cancel_sit"], true)
                                    if IsControlJustReleased(0, 73) or IsDisabledControlJustReleased(0, 73) then
                                        ClearPedTasksImmediately(Cache.self)
                                        FreezeEntityPosition(Cache.self, false)
                                        break
                                    end
                                end
                                TriggerServerEvent("loaf_unicornjob:occupy", "sit", club, k)
                            end
                        else
                            DrawTxt3D(v.sit.xyz, Strings["occupied"])
                        end
                    end
                end

                for k, v in pairs(v.Lean) do
                    while #(GetEntityCoords(Cache.self) - v.xyz) <= 0.6 do
                        Wait(0)

                        if GlobalState[club .. "lean" .. k] == false then
                            DrawTxt3D(v.xyz, Strings["lean"])
                            if IsControlJustReleased(0, 51) then
                                TriggerServerEvent("loaf_unicornjob:occupy", "lean", club, k)
                                local is_female = function()
                                    return(GetEntityModel(PlayerPedId()) == `mp_f_freemode_01` and "_female" or "")
                                end

                                SetEntityCoordsNoOffset(Cache.self, v.xyz)
                                SetEntityHeading(Cache.self, v.w)
                                FreezeEntityPosition(Cache.self, true)
                                Wait(50)

                                TaskPlayAnim(Cache.self, LoadDict("mini@strip_club@leaning@enter"), "enter" .. is_female(), 8.0, -8.0, -1, 0, 0, false, false, false)
                                Wait(2750)
                                TaskPlayAnim(Cache.self, LoadDict("mini@strip_club@leaning@base"), "base" .. is_female(), 8.0, -8.0, -1, 1, 0, false, false, false)

                                while true do
                                    Wait(0)
                                    DisableControlAction(0, 73, true)

                                    HelpText(Strings["cancel_lean"])
                                    if IsControlJustReleased(0, 47) then
                                        local money = nil
                                        ESX.TriggerServerCallback("loaf_vanillaunicorn:get_money", function(cash)
                                            money = cash
                                        end)
                                        while money == nil do
                                            Wait(0)
                                        end
                                        if money >= Config.ThrowMoney then
                                            local model = LoadModel("prop_anim_cash_note_b")
                                            if model.loaded then
                                                local can_throw = true

                                                if Config.Locations[club].Poledance then
                                                    local closest = false
                                                    local dist = 9999.0

                                                    for k, v in pairs(Config.Locations[club].Poledance) do
                                                        if #(GetEntityCoords(Cache.self) - v.Position) < dist then
                                                            closest = k 
                                                            dist = #(GetEntityCoords(Cache.self) - v.Position)
                                                        end
                                                    end

                                                    if closest and GlobalState[club .. "poledance" .. closest] then
                                                        TriggerServerEvent("loaf_unicornjob:throw_money", club, closest)
                                                    else
                                                        ESX.ShowNotification(Strings["no_dancer"])
                                                        can_throw = false
                                                    end
                                                end

                                                if can_throw then
                                                    local pos = GetPedBoneCoords(Cache.self, 28422, 0.0, 0.0, 0.0)
                                                    local cash = CreateObject(model.model, pos, true, false, false)
                                                    AttachEntityToEntity(cash, Cache.self, GetPedBoneIndex(Cache.self, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                                                    TaskPlayAnim(Cache.self, LoadDict("mini@strip_club@leaning@toss"), "toss" .. is_female(), 8.0, -8.0, -1, 2, 0, false, false, false)
                                                    Wait(1000)
                                                    DeleteEntity(cash)
                                                    TaskPlayAnim(Cache.self, LoadDict("mini@strip_club@leaning@base"), "base" .. is_female(), 8.0, -8.0, -1, 1, 0, false, false, false)
                                                end
                                            end
                                        else
                                            ESX.ShowNotification(Strings["no_money"])
                                        end
                                    elseif IsControlJustReleased(0, 73) or IsDisabledControlJustReleased(0, 73) then
                                        break
                                    end
                                end
                                
                                FreezeEntityPosition(Cache.self, false)
                                TaskPlayAnim(Cache.self, LoadDict("mini@strip_club@leaning@exit"), "exit" .. is_female(), 8.0, -8.0, -1, 0, 0, false, false, false)
                                Wait(2000)
                                TriggerServerEvent("loaf_unicornjob:occupy", "lean", club, k)
                            end
                        else
                            DrawTxt3D(v.xyz, Strings["occupied"])
                        end
                    end
                end
            end
        end

        Wait(100)
    end
end)