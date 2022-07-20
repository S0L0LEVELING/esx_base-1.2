function OpenBodySearchMenu(player)
    TriggerEvent("esx_inventoryhud:openPlayerInventory", GetPlayerServerId(player), GetPlayerName(player))
end

    






RegisterCommand("fouilleer", function(source)
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 3.0 then
            OpenFouilleerMenu(closestPlayer)
        else
            ESX.ShowNotification('Er is niemand in de buurt')
        end
    )


        function OpenFouilleerMenu()
            ESX.UI.Menu.CloseAll()
        
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'police_actions', {
                title    = 'Fouilleer verzoek',
                align    = 'top-left',
                elements = {
                    {label = ('Accepteer of weiger fouilleer verzoek'), value = 'fouilleer'},
            }}, function(data, menu)
                if data.current.value == 'fouilleer' then
                    local elements = {
                     
                        {label = ('Ja'), value = 'yes'},
                        {label = ('Nee'), value = "no"}
                    }
        
                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
                        title    = ('Ja of Nee'),
                        align    = 'top-left',
                        elements = elements
                    }, function(data2, menu2)
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestPlayer ~= -1 and closestDistance <= 3.0 then
                            local action = data2.current.value
        
                        if action == 'yes' then
                                OpenBodySearchMenu(source)
                        elseif action == 'no' then
                            ESX.ShowNotification("Fouilleer verzoek is afgewezen")
                        end)
                    )
                end
            end 


) 