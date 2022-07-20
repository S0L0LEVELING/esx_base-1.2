CreateThread(function()
    while not Cache.loaded do
        Wait(500)
    end

    RegisterCommand(Config.Job.Command, JobMenu)
    RegisterKeyMapping(Config.Job.Command, Strings.Description, "keyboard", Config.Job.MenuKey)

    while true do 
        -- Teleport in / out of building
        while #(Cache.coords - Config.Interior.Entrance.xyz) <= 1.5 do
            DrawTxt3D(Config.Interior.Entrance, Strings["Enter"])
            if IsControlJustReleased(0, Config.DefaultControl) then
                Teleport(Config.Interior.Exit)
            end
            Wait(0)
        end

        while #(Cache.coords - Config.Interior.Exit.xyz) <= 1.5 do
            DrawTxt3D(Config.Interior.Exit, Strings["Exit"])
            if IsControlJustReleased(0, Config.DefaultControl) then
                Teleport(Config.Interior.Entrance)
            end
            Wait(0)
        end

        -- Boss actions
        while #(Cache.coords - Config.Interior.BossActions) <= 1.5 and Cache.job.grade >= Config.Job.Boss do            
            DrawTxt3D(Config.Interior.BossActions, Strings.BossActions)
            if IsControlJustReleased(0, Config.DefaultControl) then
                ESX.UI.Menu.CloseAll()

                local open = true
                TriggerEvent("esx_society:openBossMenu", Config.Job.Name, function(data, menu)
                    menu.close()
                    open = false
                end, Config.SocietyOptions)

                while open do
                    Wait(50)
                    if #(Cache.coords - Config.Interior.BossActions) > 1.5 then
                        ESX.UI.Menu.CloseAll()
                        open = false
                    end
                end
            end
            
            Wait(0)
        end

        Wait(500)
    end
end)