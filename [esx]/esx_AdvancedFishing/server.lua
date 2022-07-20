ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('turtlebait', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "turtle")
		
		xPlayer.removeInventoryItem('turtlebait', 1)
		TriggerClientEvent('fishing:message', _source, "~g~You attach the turtle bait onto your fishing rod")
	else
		TriggerClientEvent('fishing:message', _source, "~r~Je hebt geen vishengel")
	end
	
end)

ESX.RegisterUsableItem('fishbait', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "fish")
		
		xPlayer.removeInventoryItem('fishbait', 1)
		TriggerClientEvent('fishing:message', _source, "~g~You attach the fish bait onto your fishing rod")
		
	else
		TriggerClientEvent('fishing:message', _source, "~r~Je hebt geen vishengel")
	end
	
end)

ESX.RegisterUsableItem('turtle', function(source)

	local _source = source
	xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getInventoryItem('fishingrod').count > 0 then
		TriggerClientEvent('fishing:setbait', _source, "shark")
		
		xPlayer.removeInventoryItem('turtle', 1)
		TriggerClientEvent('fishing:message', _source, "~g~You attach the turtle meat onto the fishing rod")
	else
		TriggerClientEvent('fishing:message', _source, "~r~Je hebt geen vishengel")
	end
	
end)

ESX.RegisterUsableItem('fishingrod', function(source)

	local _source = source
	TriggerClientEvent('fishing:fishstart', _source)
	
	

end)


				
RegisterNetEvent('fishing:catch')
AddEventHandler('fishing:catch', function(bait)
	
	_source = source
	local weight = 2
	local rnd = math.random(1,100)
	xPlayer = ESX.GetPlayerFromId(_source)
	if bait == "turtle" then
		if rnd >= 78 then
			if rnd >= 94 then
				TriggerClientEvent('fishing:setbait', _source, "none")
				TriggerClientEvent('fishing:message', _source, "~r~Het was groot en heeft je hengel gebroken!")
				TriggerClientEvent('fishing:break', _source)
				xPlayer.removeInventoryItem('fishingrod', 1)
			else
				TriggerClientEvent('fishing:setbait', _source, "none")
				if xPlayer.getInventoryItem('turtle').count > 4 then
					TriggerClientEvent('fishing:message', _source, "~r~Je kan niet meer schildpadden bij je dragen")
				else
					TriggerClientEvent('fishing:message', _source, "~g~Je hebt een schildpad gevangen\n~r~Deze zijn schaars en illegaal om te verkopen")
					xPlayer.addInventoryItem('turtle', 1)
				end
			end
		else
			if rnd >= 75 then
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~je kan niet meer vis bij je hebben.")
				else
					weight = math.random(4,9)
					TriggerClientEvent('fishing:message', _source, "~g~Je hebt een vis gevangen van: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
				
			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~je kan niet meer vis bij je hebben.")
				else
					weight = math.random(2,6)
					TriggerClientEvent('fishing:message', _source, "~g~Je hebt een vis gevangen van: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
			end
		end
	else
		if bait == "fish" then
			if rnd >= 75 then
				TriggerClientEvent('fishing:setbait', _source, "none")
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~Je kan niet meer vis bij je dragen")
				else
					weight = math.random(4,11)
					TriggerClientEvent('fishing:message', _source, "~gJe hebt een vis gevangen van: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
				
			else
				if xPlayer.getInventoryItem('fish').count > 100 then
					TriggerClientEvent('fishing:message', _source, "~r~Je kan niet meer vis bij je dragen")
				else
					weight = math.random(1,6)
					TriggerClientEvent('fishing:message', _source, "~g~Je hebt een vis gevangen van: ~y~~h~" .. weight .. "kg")
					xPlayer.addInventoryItem('fish', weight)
				end
			end
		end
		if bait == "none" then
			
			if rnd >= 70 then
			TriggerClientEvent('fishing:message', _source, "~y~Je bent aan het vissen zonder aas")
				if  xPlayer.getInventoryItem('fish').count > 100 then
						TriggerClientEvent('fishing:message', _source, "~r~Je kan niet meer vis bij je dragen")
					else
						weight = math.random(2,4)
						TriggerClientEvent('fishing:message', _source, "~g~Je hebt een vis gevangen van: ~y~~h~" .. weight .. "kg")
						xPlayer.addInventoryItem('fish', weight)
					end
					
				else
				TriggerClientEvent('fishing:message', _source, "~y~Je bent aan het vissen zonder aas")
					if xPlayer.getInventoryItem('fish').count > 100 then
						TriggerClientEvent('fishing:message', _source, "~r~Je kan niet meer vis bij je dragen")
					else
						weight = math.random(1,2)
						TriggerClientEvent('fishing:message', _source, "~g~Je hebt een vis gevangen van: ~y~~h~" .. weight .. "kg")
						xPlayer.addInventoryItem('fish', weight)
					end
				end
		end
		if bait == "shark" then
			if rnd >= 82 then
			
						if rnd >= 91 then
							TriggerClientEvent('fishing:setbait', _source, "none")
							TriggerClientEvent('fishing:message', _source, "~r~Het was groot en heeft je hengel gebroken!")
							TriggerClientEvent('fishing:break', _source)
							xPlayer.removeInventoryItem('fishingrod', 1)
						else
							if xPlayer.getInventoryItem('shark').count > 0  then
									TriggerClientEvent('fishing:setbait', _source, "none")
									TriggerClientEvent('fishing:message', _source, "~r~Je kan niet meer haaien bij je dragen")
							else
									TriggerClientEvent('fishing:message', _source, "~g~You caught a shark!\n~r~These are endangered species and are illegal to posses")
									TriggerClientEvent('fishing:spawnPed', _source)
									xPlayer.addInventoryItem('shark', 1)
							end
						end	
							else
									if xPlayer.getInventoryItem('fish').count > 100 then
										TriggerClientEvent('fishing:message', _source, "~r~Je kan niet meer vis bij je dragen")
									else
										weight = math.random(4,8)
										TriggerClientEvent('fishing:message', _source, "~g~Je hebt een vis gevangen van: ~y~~h~" .. weight .. "kg")
										xPlayer.addInventoryItem('fish', weight)
									end
								
							end
			end
			
		end
	
	
end)

RegisterServerEvent("fishing:lowmoney")
AddEventHandler("fishing:lowmoney", function(money)
    local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeMoney(money)
end)

RegisterServerEvent('fishing:startSelling')
AddEventHandler('fishing:startSelling', function(item)

	local _source = source
	
	local xPlayer  = ESX.GetPlayerFromId(_source)
			if item == "fish" then
					local FishQuantity = xPlayer.getInventoryItem('fish').count
						if FishQuantity <= 4 then
						TriggerClientEvent('esx:showNotification', source, '~r~Je hebt niet genoeg~s~ vis')			
					else   
						xPlayer.removeInventoryItem('fish', 5)
						local payment = Config.FishPrice.a
						payment = math.random(Config.FishPrice.a, Config.FishPrice.b) 
						TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Je hebt 5X vis verkocht voor ' ..payment.. ' Euro', style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
						xPlayer.addAccountMoney('bank', payment)
						
						
			end
				
				

				

				
			end
			if item == "turtle" then
				local FishQuantity = xPlayer.getInventoryItem('turtle').count

				if FishQuantity <= 0 then
					TriggerClientEvent('esx:showNotification', source, '~r~Je hebt niet genoeg~s~ schildpadden')			
				else   
					xPlayer.removeInventoryItem('turtle', 1)
					local payment = Config.TurtlePrice.a
					payment = math.random(Config.TurtlePrice.a, Config.TurtlePrice.b) 
					TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Je hebt 1X Schildpad verkocht voor ' ..payment.. ' Euro', style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
					xPlayer.addAccountMoney('black_money', payment)
					
					
				end
			end
			if item == "shark" then
				local FishQuantity = xPlayer.getInventoryItem('shark').count

				if FishQuantity <= 0 then
					TriggerClientEvent('esx:showNotification', source, '~r~Je hebt niet genoeg~s~ haaien')			
				else   
					xPlayer.removeInventoryItem('shark', 1)
					local payment = Config.SharkPrice.a
					payment = math.random(Config.SharkPrice.a, Config.SharkPrice.b)
					TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Je hebt 1X Haaien verkocht voor ' ..payment.. ' Euro', style = { ['background-color'] = '#ffffff', ['color'] = '#000000' } })
					xPlayer.addAccountMoney('black_money', payment)
					
					
				end
			end
			
	
end)

