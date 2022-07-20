RegisterCommand("unicorn_job", function()
	if Cache.hasJob then
        ESX.UI.Menu.CloseAll()

        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "job_menu", {
            title = Strings["job_menu"],
            align = ((Config.Options and Config.Options.MenuAlign) or ("bottom-right")),
            elements = {
                {label = Strings["bill_closest"], value = "bill"}
            }
        }, function(data, menu)
            if data.current.value == "bill" then

                ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "billing_reason", {
                    title = Strings["bill_reason"]
                }, function(data2, menu2)
                    local reason = data2.value
                    if reason then
                        menu2.close()

                        ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "billing_amount", {
                            title = Strings["bill_amount"]
                        }, function(data3, menu3)
                            local amount = tonumber(data3.value)
                            if amount and amount > 0 then
                                menu3.close()
                                local plr, dist = ESX.Game.GetClosestPlayer()
                                if plr == -1 or dist > 3.0 then
                                    ESX.ShowNotification(Strings["noone_nearby"])
                                else
                                    TriggerServerEvent("esx_billing:sendBill", GetPlayerServerId(plr), "society_unicorn", reason, amount)
                                    ESX.ShowNotification(string.format(Strings["billed"], tostring(amount), reason))
                                end
                            else
                                ESX.ShowNotification(Strings["invalid_amount"])
                            end
                        end, function(data3, menu3)
                            menu3.close()
                        end)

                    else
                        ESX.ShowNotification(Strings["invalid_reason"])
                    end
                end, function(data2, menu2)
                    menu2.close()
                end)

            end
        end, function(data, menu)
            menu.close()
        end)
    end
end, false)

RegisterKeyMapping("unicorn_job", Strings["open_menu"], "keyboard", "F6")