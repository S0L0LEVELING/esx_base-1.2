RegisterCommand("generate_sql", function()
    local house_sql = "INSERT INTO `loaf_houses` (`id`, `label`, `property_type`, `shell_type`, `entrance`, `garage_entrance`, `garage_exit`, `price`) VALUES"

    TriggerEvent("loaf_housing:fetch_housecfg", function(Houses)
        for k, v in pairs(Houses) do
            local garage_entrance, garage_exit = "{}", "{}"
            if v.Garage then
                local entrance, exit = v.Garage.Entrance, v.Garage.Exit
                if entrance then
                    garage_entrance = json.encode({x = entrance.x, y = entrance.y, z = entrance.z})
                end
                if exit then
                    garage_exit = json.encode({x = exit.x, y = exit.y, z = exit.z, h = exit.w})
                end
            end
    
            local entrance = {x = v.Entrance.x, y = v.Entrance.y, z = v.Entrance.z, h = v.Entrance.w}
    
            local toinsert = ("\n    (%s, '%s', '%s', '%s', '%s', '%s', '%s', %s)"):format(k, v.Label, v.Type, v.ShellType, json.encode(entrance), garage_entrance, garage_exit, v.Price or 0)
            if k < #Houses then toinsert = toinsert .. "," else toinsert = toinsert .. "\n;" end
            house_sql=house_sql..toinsert
        end
    
        SaveResourceFile(GetCurrentResourceName(), "houses.sql", house_sql, -1)
    
        print"generated houses sql file"
    end)
end, true)