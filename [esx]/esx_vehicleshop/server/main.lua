ESX = nil
local categories, vehicles = {}, {}

-- DISCORD LOGGING [ MIDDELVEENRP ] 
local esx_vehicleshop_setVehicleOwnedPlayerId_wh = "https://discord.com/api/webhooks/940912190007951400/Cd6VM7EvGK9p8G3TAh0VlxbDiLgJ9Fw3FmVv3-3kN58TO0nmS2x7FVgXqfJb2ruXoOMS"
local esx_vehicleshop_rentVehicle_wh = "https://discord.com/api/webhooks/940913412890853406/Et6AWfZ5TZfXvFhNFYwdvJjkaD9OpA2qT7li5fFLlR8V-0kjrkpZRO0hOZ3ba3QdsoCk" 
local esx_vehicleshop_getStockItem_wh = "https://discord.com/api/webhooks/940913862675423252/1JV1LdwlnOPiKHq5vgvze_UajEpGbxywvad1cDFuiFDIvLiX0SW60EJ-0ANcsKdRxeZL" 
local esx_vehicleshop_putStockItems_wh = "https://discord.com/api/webhooks/940914478353104937/ZTrC9SBEv7RLQHk93gTVfFmCtkGyfcsXZehjlYEbelX60w6qPXjraJPqZlnaze6_fk4l"
local esx_vehicleshop_buyVehicle_cb__wh = "https://discord.com/api/webhooks/940915591001309266/00FoUYxY-m_TYssRBkp5mCzL4XocCW1plIszsWqH_qrII--etT5orXjBiJiGOfn1OYAo" 
local esx_vehicleshop_buyCardealerVehicle_cb__wh = "https://discord.com/api/webhooks/940915443210780672/EwyEYrciqzbjkkqv4h78fKHNzvvHZJad2OP9AnduYriY6tVXxVHTSLcwivftdcz6W2fm" 
local esx_vehicleshop_resellVehicle_cb__wh = "https://discord.com/api/webhooks/940916183757107261/Y3_8mZClk2MayuoPEU08XsP9QI4JFFRXLK6QAlaD7ghxJXot2CwmOMHhieTKVDS4-GmR"

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('esx_phone:registerNumber', 'cardealer', _U('dealer_customers'), false, false)
TriggerEvent('esx_society:registerSociety', 'cardealer', _U('car_dealer'), 'society_cardealer', 'society_cardealer', 'society_cardealer', {type = 'private'})

Citizen.CreateThread(function()
	local char = Config.PlateLetters
	char = char + Config.PlateNumbers
	if Config.PlateUseSpace then char = char + 1 end

	if char > 8 then
		print(('[esx_vehicleshop] [^3WARNING^7] Plate character count reached, %s/8 characters!'):format(char))
	end
end)

function RemoveOwnedVehicle(plate)
	MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	})
end

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM vehicle_categories', {}, function(_categories)
		categories = _categories

		MySQL.Async.fetchAll('SELECT * FROM vehicles', {}, function(_vehicles)
			vehicles = _vehicles

			for k,v in ipairs(vehicles) do
				for k2,v2 in ipairs(categories) do
					if v2.name == v.category then
						vehicles[k].categoryLabel = v2.label
						break
					end
				end
			end

			-- send information after db has loaded, making sure everyone gets vehicle information
			TriggerClientEvent('esx_vehicleshop:sendCategories', -1, categories)
			TriggerClientEvent('esx_vehicleshop:sendVehicles', -1, vehicles)
		end)
	end)
end)

function getVehicleLabelFromModel(model)
	for k,v in ipairs(vehicles) do
		if v.model == model then
			return v.name
		end
	end

	return
end

-- Tokenized 
RegisterNetEvent('esx_vehicleshop:setVehicleOwnedPlayerId')
AddEventHandler('esx_vehicleshop:setVehicleOwnedPlayerId', function(playerId, vehicleProps, model, label, token)
	local xPlayer, xTarget = ESX.GetPlayerFromId(source), ESX.GetPlayerFromId(playerId)

	-- Token Checker 
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	elseif _source == "" then 
		return true
	end

	-- Discord log 
	TriggerEvent("middelveen:log", esx_vehicleshop_setVehicleOwnedPlayerId_wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\nTrigger name: esx_vehicleshop:setVehicleOwnedPlayerId \nExecuting player: "..GetPlayerName(source), 62207)

	if xPlayer.job.name == 'cardealer' and xTarget then
		MySQL.Async.fetchAll('SELECT id FROM cardealer_vehicles WHERE vehicle = @vehicle LIMIT 1', {
			['@vehicle'] = model
		}, function(result)
			if result[1] then
				local id = result[1].id

				MySQL.Async.execute('DELETE FROM cardealer_vehicles WHERE id = @id', {
					['@id'] = id
				}, function(rowsChanged)
					if rowsChanged == 1 then
						MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
							['@owner']   = xTarget.identifier,
							['@plate']   = vehicleProps.plate,
							['@vehicle'] = json.encode(vehicleProps)
						}, function(rowsChanged)
							xPlayer.showNotification(_U('vehicle_set_owned', vehicleProps.plate, xTarget.getName()))
							xTarget.showNotification(_U('vehicle_belongs', vehicleProps.plate))
						end)

						local dateNow = os.date('%Y-%m-%d %H:%M')

						MySQL.Async.execute('INSERT INTO vehicle_sold (client, model, plate, soldby, date) VALUES (@client, @model, @plate, @soldby, @date)', {
							['@client'] = xTarget.getName(),
							['@model'] = label,
							['@plate'] = vehicleProps.plate,
							['@soldby'] = xPlayer.getName(),
							['@date'] = dateNow
						})
					end
				end)
			end
		end)
		sendToDiscord("https://discord.com/api/webhooks/904335587534860349/a4oH-qwvUKdj0OjmJjcx-2S3E3YY3ZzXJy8tQy24GXreg6qmYVtR5QrQBWDXxn-Ryqa3",xPlayer.name..' verkocht auto', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** heeft een auto met model **'..model..'** overgeschreven aan **'..GetPlayerName(playerId)..'** **('..GetPlayerIdentifier(playerId)..')**',16711680)
	end
end)

ESX.RegisterServerCallback('esx_vehicleshop:getSoldVehicles', function(source, cb)
	MySQL.Async.fetchAll('SELECT client, model, plate, soldby, date FROM vehicle_sold', {}, function(result)
		cb(result)
	end)
end)

-- Tokenized
RegisterNetEvent('esx_vehicleshop:rentVehicle')
AddEventHandler('esx_vehicleshop:rentVehicle', function(vehicle, plate, rentPrice, playerId, token)
	local xPlayer, xTarget = ESX.GetPlayerFromId(source), ESX.GetPlayerFromId(playerId)

	-- Token Checker 
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	elseif _source == "" then 
		return true
	end

	-- Discord log 
	TriggerEvent("middelveen:log", esx_vehicleshop_rentVehicle_wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\nTrigger name: esx_vehicleshop:rentVehicle \nExecuting player: "..GetPlayerName(source), 62207)

	if xPlayer.job.name == 'cardealer' and xTarget then
		MySQL.Async.fetchAll('SELECT id, price FROM cardealer_vehicles WHERE vehicle = @vehicle LIMIT 1', {
			['@vehicle'] = vehicle
		}, function(result)
			if result[1] then
				local price = result[1].price

				MySQL.Async.execute('DELETE FROM cardealer_vehicles WHERE id = @id', {
					['@id'] = result[1].id
				}, function(rowsChanged)
					if rowsChanged == 1 then
						MySQL.Async.execute('INSERT INTO rented_vehicles (vehicle, plate, player_name, base_price, rent_price, owner) VALUES (@vehicle, @plate, @player_name, @base_price, @rent_price, @owner)', {
							['@vehicle']     = vehicle,
							['@plate']       = plate,
							['@player_name'] = xTarget.getName(),
							['@base_price']  = price,
							['@rent_price']  = rentPrice,
							['@owner']       = xTarget.identifier
						}, function(rowsChanged2)
							xPlayer.showNotification(_U('vehicle_set_rented', plate, xTarget.getName()))
						end)
					end
				end)
			end
		end)
	end
end)

-- Tokenized
RegisterNetEvent('esx_vehicleshop:getStockItem')
AddEventHandler('esx_vehicleshop:getStockItem', function(itemName, count, token)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	-- Token Checker 
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	elseif _source == "" then 
		return true
	end

	-- Discord log 
	TriggerEvent("middelveen:log", esx_vehicleshop_getStockItem_wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\nTrigger name: esx_vehicleshop:getStockItem \nExecuting player: "..GetPlayerName(source), 62207)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cardealer', function(inventory)
		local item = inventory.getItem(itemName)

		-- is there enough in the society?
		if count > 0 and item.count >= count then

			-- can the player carry the said amount of x item?
			if xPlayer.canCarryItem(itemName, count) then
				inventory.removeItem(itemName, count)
				xPlayer.addInventoryItem(itemName, count)
				xPlayer.showNotification(_U('have_withdrawn', count, item.label))
			else
				xPlayer.showNotification(_U('player_cannot_hold'))
			end
		else
			xPlayer.showNotification(_U('not_enough_in_society'))
		end
	end)
end)

RegisterNetEvent('esx_vehicleshop:putStockItems')
AddEventHandler('esx_vehicleshop:putStockItems', function(itemName, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	-- Token Checker 
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	elseif _source == "" then 
		return true
	end

	-- Discord log 
	TriggerEvent("middelveen:log", esx_vehicleshop_putStockItems_wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\nTrigger name: esx_vehicleshop:putStockItems \nExecuting player: "..GetPlayerName(source), 62207)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cardealer', function(inventory)
		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
			xPlayer.showNotification(_U('have_deposited', count, item.label))
		else
			xPlayer.showNotification(_U('invalid_amount'))
		end
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getCategories', function(source, cb)
	cb(categories)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getVehicles', function(source, cb)
	cb(vehicles)
end)

ESX.RegisterServerCallback('esx_vehicleshop:buyVehicle', function(source, cb, model, plate, token, playerid)
	local xPlayer = ESX.GetPlayerFromId(source)
	local modelPrice

	-- Token Checker 
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), playerid, token) then
		return false
	elseif playerid == "" then 
		return true
	end

	-- Discord log 
	TriggerEvent("middelveen:log", esx_vehicleshop_buyVehicle_cb__wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\n**Callback** name: esx_vehicleshop:buyVehicle \nExecuting player: "..GetPlayerName(source), 62207)

	for k,v in ipairs(vehicles) do
		if model == v.model then
			modelPrice = v.price
			break
		end
	end

	if modelPrice and xPlayer.getMoney() >= modelPrice then
		xPlayer.removeMoney(modelPrice)

		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
			['@owner']   = xPlayer.identifier,
			['@plate']   = plate,
			['@vehicle'] = json.encode({model = GetHashKey(model), plate = plate})
		}, function(rowsChanged)
			xPlayer.showNotification(_U('vehicle_belongs', plate))
			cb(true)
		end)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('esx_vehicleshop:getCommercialVehicles', function(source, cb)
	MySQL.Async.fetchAll('SELECT price, vehicle FROM cardealer_vehicles ORDER BY vehicle ASC', {}, function(result)
		cb(result)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:buyCarDealerVehicle', function(source, cb, model, token, playerid)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	-- Token Checker 
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), playerid, token) then
		return false
	elseif playerid == "" then 
		return true
	end

	-- Discord log 
	TriggerEvent("middelveen:log", esx_vehicleshop_buyCardealerVehicle_cb__wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\n**Callback** name: esx_vehicleshop:buyCardealerVehicle \nExecuting player: "..GetPlayerName(source), 62207)

	if xPlayer.job.name == 'cardealer' then
		local modelPrice

		for k,v in ipairs(vehicles) do
			if model == v.model then
				modelPrice = v.price
				break
			end
		end

		if modelPrice then
			TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
				if account.money >= modelPrice then
					account.removeMoney(modelPrice)

					MySQL.Async.execute('INSERT INTO cardealer_vehicles (vehicle, price) VALUES (@vehicle, @price)', {
						['@vehicle'] = model,
						['@price'] = modelPrice
					}, function(rowsChanged)
						cb(true)
					end)
				else
					cb(false)
				end
			end)
		end
		sendToDiscord("https://discord.com/api/webhooks/904331059271974913/LckvWfufzImB6YBlfrfLL64Fh_MmOBnu8cQH1Jje51MEGJEE0VFVCvD6zSX0-XXKSZ54",xPlayer.name..' kocht een '..model, 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** heeft een **'..model..'** Gekocht bij de cardealer!',762640)
	end
end)

RegisterNetEvent('esx_vehicleshop:returnProvider')
AddEventHandler('esx_vehicleshop:returnProvider', function(vehicleModel)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'cardealer' then
		MySQL.Async.fetchAll('SELECT id, price FROM cardealer_vehicles WHERE vehicle = @vehicle LIMIT 1', {
			['@vehicle'] = vehicleModel
		}, function(result)
			if result[1] then
				local id = result[1].id

				MySQL.Async.execute('DELETE FROM cardealer_vehicles WHERE id = @id', {
					['@id'] = id
				}, function(rowsChanged)
					if rowsChanged == 1 then
						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
							local price = ESX.Math.Round(result[1].price * 0.75)
							local vehicleLabel = getVehicleLabelFromModel(vehicleModel)

							account.addMoney(price)
							xPlayer.showNotification(_U('vehicle_sold_for', vehicleLabel, ESX.Math.GroupDigits(price)))
						end)
					end
				end)
			else
				print(('[esx_vehicleshop] [^3WARNING^7] %s attempted selling an invalid vehicle!'):format(xPlayer.identifier))
			end
		end)
	end
end)

ESX.RegisterServerCallback('esx_vehicleshop:getRentedVehicles', function(source, cb)
	MySQL.Async.fetchAll('SELECT * FROM rented_vehicles ORDER BY player_name ASC', {}, function(result)
		local vehicles = {}

		for i=1, #result, 1 do
			table.insert(vehicles, {
				name = result[i].vehicle,
				plate = result[i].plate,
				playerName = result[i].player_name
			})
		end

		cb(vehicles)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:giveBackVehicle', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT base_price, vehicle FROM rented_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		if result[1] then
			local vehicle = result[1].vehicle
			local basePrice = result[1].base_price

			MySQL.Async.execute('DELETE FROM rented_vehicles WHERE plate = @plate', {
				['@plate'] = plate
			}, function(rowsChanged)
				MySQL.Async.execute('INSERT INTO cardealer_vehicles (vehicle, price) VALUES (@vehicle, @price)', {
					['@vehicle'] = vehicle,
					['@price']   = basePrice
				})

				RemoveOwnedVehicle(plate)
				cb(true)
			end)
		else
			cb(false)
		end
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:resellVehicle', function(source, cb, plate, model, token, playerid)
	local xPlayer, resellPrice = ESX.GetPlayerFromId(source)

	-- Token Checker 
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), playerid, token) then
		return false
	elseif playerid == "" then 
		return true
	end

	-- Discord log 
	TriggerEvent("middelveen:log", esx_vehicleshop_resellVehicle_cb__wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\n**Callback** name: esx_vehicleshop:resellVehicle \nExecuting player: "..GetPlayerName(source), 62207)

	if xPlayer.source then
		-- calculate the resell price
		for i=1, #vehicles, 1 do
			if GetHashKey(vehicles[i].model) == model then
				resellPrice = ESX.Math.Round(vehicles[i].price / 100 * Config.ResellPercentage)
				break
			end
		end

		if not resellPrice then
			print(('[esx_vehicleshop] [^3WARNING^7] %s attempted to sell an unknown vehicle!'):format(xPlayer.identifier))
			cb(false)
		else
			MySQL.Async.fetchAll('SELECT * FROM rented_vehicles WHERE plate = @plate', {
				['@plate'] = plate
			}, function(result)
				if result[1] then -- is it a rented vehicle?
					cb(false) -- it is, don't let the player sell it since he doesn't own it
				else
					MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND @plate = plate', {
						['@owner'] = xPlayer.identifier,
						['@plate'] = plate
					}, function(result)
						if result[1] then -- does the owner match?
							local vehicle = json.decode(result[1].vehicle)

							if vehicle.model == model then
								if vehicle.plate == plate then
									xPlayer.addMoney(resellPrice)
									RemoveOwnedVehicle(plate)
									cb(true)
								else
									print(('[esx_vehicleshop] [^3WARNING^7] %s attempted to sell an vehicle with plate mismatch!'):format(xPlayer.identifier))
									cb(false)
								end
							else
								print(('[esx_vehicleshop] [^3WARNING^7] %s attempted to sell an vehicle with model mismatch!'):format(xPlayer.identifier))
								cb(false)
							end
						end
					end)
				end
			end)
		end
	end
end)

ESX.RegisterServerCallback('esx_vehicleshop:getStockItems', function(source, cb)
	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_cardealer', function(inventory)
		cb(inventory.items)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items = xPlayer.inventory

	cb({items = items})
end)

ESX.RegisterServerCallback('esx_vehicleshop:isPlateTaken', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		cb(result[1] ~= nil)
	end)
end)

ESX.RegisterServerCallback('esx_vehicleshop:retrieveJobVehicles', function(source, cb, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE owner = @owner AND type = @type AND job = @job', {
		['@owner'] = xPlayer.identifier,
		['@type'] = type,
		['@job'] = xPlayer.job.name
	}, function(result)
		cb(result)
	end)
end)

RegisterNetEvent('esx_vehicleshop:setJobVehicleState')
AddEventHandler('esx_vehicleshop:setJobVehicleState', function(plate, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = @stored WHERE plate = @plate AND job = @job', {
		['@stored'] = state,
		['@plate'] = plate,
		['@job'] = xPlayer.job.name
	}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('[esx_vehicleshop] [^3WARNING^7] %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)

function PayRent(d, h, m)
	local tasks, timeStart = {}, os.clock()
	print('[esx_vehicleshop] [^2INFO^7] Paying rent cron job started')

	MySQL.Async.fetchAll('SELECT owner, rent_price FROM rented_vehicles', {}, function(result)
		for i=1, #result, 1 do
			table.insert(tasks, function(cb)
				local xPlayer = ESX.GetPlayerFromIdentifier(result[i].owner)

				if xPlayer then -- message player if connected
					xPlayer.removeAccountMoney('bank', result[i].rent_price)
					xPlayer.showNotification(_U('paid_rental', ESX.Math.GroupDigits(result[i].rent_price)))
				else -- pay rent by updating SQL
					MySQL.Sync.execute('UPDATE users SET bank = bank - @bank WHERE identifier = @identifier', {
						['@bank'] = result[i].rent_price,
						['@identifier'] = result[i].owner
					})
				end

				TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
					account.addMoney(result[i].rent_price)
				end)

				cb()
			end)
		end

		Async.parallelLimit(tasks, 5, function(results) end)

		local elapsedTime = os.clock() - timeStart
		print(('[esx_vehicleshop] [^2INFO^7] Paying rent cron job took %s seconds'):format(elapsedTime))
	end)
end

TriggerEvent('cron:runAt', 22, 00, PayRent)

function sendToDiscord(webhook, title, message, color)
	local embed = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. title .."**",
			  ["description"] = message,
			  ["footer"] = {
				  ["text"] = 'MiddelveenRP - ©2021',
			  },
		  }
	  }
  
	PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end