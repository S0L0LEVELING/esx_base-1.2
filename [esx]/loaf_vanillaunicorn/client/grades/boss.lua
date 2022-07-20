Boss = function(club, data)
    while #(GetEntityCoords(Cache.self) - data.Boss.Employ) <= 1.0 and Cache.job.grade_name == "boss" do
        Wait(0)
        
        DrawTxt3D(data.Boss.Employ, Strings["boss_actions"])
        if IsControlJustReleased(0, 51) then
            ESX.UI.Menu.CloseAll()

            TriggerEvent(society_event or "esx_society:openBossMenu", "unicorn", function(data, menu)
                menu.close()
            end, Config.Options.SocietyOptions)
        end
    end
end