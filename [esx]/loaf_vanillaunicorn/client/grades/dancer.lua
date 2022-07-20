Dancer = function(club, v)
    for k, v in pairs(v.Poledance) do
        while #(GetEntityCoords(Cache.self) - v.Position) <= 1.5 do
            Wait(0)

            if GlobalState[club .. "poledance" .. k] == false then
                DrawTxt3D(v.Position, Strings["poledance"])
                if IsControlJustReleased(0, 51) then
                    TriggerServerEvent("loaf_unicornjob:occupy", "poledance", club, k)

                    local dict = LoadDict(v.dict or "mini@strip_club@pole_dance@pole_dance1")
                    local anim = (v.anim or "pd_dance_01")

                    local scene = NetworkCreateSynchronisedScene(v.Position, vector3(0.0, 0.0, 0.0), 2, false, true, 1065353216, 0, 1.3)
                    NetworkAddPedToSynchronisedScene(Cache.self, scene, dict, anim, 1.5, -4.0, 1, 1, 1148846080, 0)
                    NetworkStartSynchronisedScene(scene)
                    
                    while true do
                        Wait(0)
                        
                        HelpText(Strings["cancel_dance"], true)
                        if IsControlJustReleased(0, 73) or IsDisabledControlJustReleased(0, 73) then
                            break
                        end
                    end
                    
                    TriggerServerEvent("loaf_unicornjob:occupy", "poledance", club, k)
                    NetworkStopSynchronisedScene(scene)
                end
            else
                DrawTxt3D(v.Position, Strings["occupied"])
            end
        end
    end

    for k, v in pairs(v.Lapdance) do
        while #(GetEntityCoords(Cache.self) - v.dance.xyz) <= 1.0 do
            Wait(0)
            
            if GlobalState[club .. "lapdance" .. k] == false then
                DrawTxt3D(v.dance.xyz, Strings["lapdance"])
                if IsControlJustReleased(0, 51) then
                    -- TO DO: TOUCHING?
                    TriggerServerEvent("loaf_unicornjob:occupy", "lapdance", club, k)
                    local scene = NetworkCreateSynchronisedScene(v.dance.xyz, vector3(0.0, 0.0, v.dance.w), 2, false, true, 1065353216, 0, 1.3)

                    local dict = (v.animations and v.animations.dance and v.animations.dance.dict) or "mini@strip_club@private_dance@part2"
                    local anim = (v.animations and v.animations.dance and v.animations.dance.anim) or "priv_dance_p2"

                    NetworkAddPedToSynchronisedScene(Cache.self, scene, LoadDict(dict), anim, 1.5, -4.0, 1, 1, 1148846080, 0)
                    NetworkStartSynchronisedScene(scene)

                    while true do
                        Wait(0)
                        
                        HelpText(Strings["cancel_dance"], true)
                        if IsControlJustReleased(0, 73) or IsDisabledControlJustReleased(0, 73) then
                            break
                        end
                    end

                    TriggerServerEvent("loaf_unicornjob:occupy", "lapdance", club, k)
                    NetworkStopSynchronisedScene(scene)
                end
            else
                DrawTxt3D(v.dance.xyz, Strings["occupied"])
            end
        end
    end
end