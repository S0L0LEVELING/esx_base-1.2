ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

MySQL.ready(function()
	ParkBoats()
end)

function ParkBoats()
	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = true WHERE `stored` = false AND type = @type', {
		['@type'] = 'boat'
	}, function (rowsChanged)
		if rowsChanged > 0 then
			print(('esx_boat: %s boat(s) have been stored!'):format(rowsChanged))
		end
	end)
end

ESX.RegisterServerCallback('esx_boat:buyBoat', function(source, cb, vehicleProps)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price   = getPriceFromModel(vehicleProps.model)

	-- vehicle model not found
	if price == 0 then
		print(('esx_boat: %s attempted to exploit the shop! (invalid vehicle model)'):format(xPlayer.identifier))
		cb(false)
	else
		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, garage_name, type, `stored`) VALUES (@owner, @plate, @vehicle, @garage_name, @type, @stored)', {
				['@owner']   = xPlayer.identifier,
				['@plate']   = vehicleProps.plate,
				['@vehicle'] = json.encode(vehicleProps),
				['@garage_name'] = 'Haven',
				['@type']    = 'boat',
				['@stored']  = true
			}, function(rowsChanged)
				cb(true)
			end)
		else
			cb(false)
		end
	end
	sendToDiscord("https://discord.com/api/webhooks/904365716457812008/_3dawEzJRBedg2gJQlkAu16rLm58Qf6lPvSjT3OYWBB4jmBbVZPnnNisPLcOXSwpacMF", xPlayer.name..' Kocht een vaartuig', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** heeft vaartuig gekocht met nummerplaat **'..vehicleProps.plate..'**',16711680)
end)

RegisterServerEvent('esx_boat:takeOutVehicle')
AddEventHandler('esx_boat:takeOutVehicle', function(plate)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = @stored WHERE owner = @owner AND plate = @plate', {
		['@stored'] = false,
		['@owner']  = xPlayer.identifier,
		['@plate']  = plate
	}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('esx_boat: %s exploited the garage!'):format(xPlayer.identifier))
		end
	end)
end)

ESX.RegisterServerCallback('esx_boat:storeVehicle', function (source, cb, plate)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = @stored WHERE owner = @owner AND plate = @plate', {
		['@stored'] = true,
		['@owner']  = xPlayer.identifier,
		['@plate']  = plate
	}, function(rowsChanged)
		if rowsChanged == 0 then
			print(('esx_boat: %s attempted to store an boat they don\'t own!'):format(xPlayer.identifier))
		end

		cb(rowsChanged)
	end)
end)

ESX.RegisterServerCallback('esx_boat:getGarage', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT vehicle FROM owned_vehicles WHERE owner = @owner AND type = @type AND `stored` = @stored', {
		['@owner']  = xPlayer.identifier,
		['@type']   = 'boat',
		['@stored'] = true
	}, function(result)
		local vehicles = {}

		for i=1, #result, 1 do
			table.insert(vehicles, result[i].vehicle)
		end

		cb(vehicles)
	end)
end)

ESX.RegisterServerCallback('esx_boat:buyBoatLicense', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= Config.LicensePrice then
		xPlayer.removeMoney(Config.LicensePrice)

		TriggerEvent('esx_license:addLicense', source, 'boat', function()
			cb(true)
		end)
	else
		cb(false)
	end
end)

function getPriceFromModel(model)
	for k,v in ipairs(Config.Vehicles) do
		if GetHashKey(v.model) == model then
			return v.price
		end
	end

	return 0
end

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