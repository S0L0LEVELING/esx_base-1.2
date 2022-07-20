local rob = false
local robbers = {}
PlayersCrafting    = {}
local CopsConnected  = 0
ESX = nil

-- Completly tokenized -----------------------------------------------------------------------------------------------------

-- DISCORD LOGGING [ MIDDELVEENRP ]
local lesterven_wh = "https://discord.com/api/webhooks/940355495624060968/8km1hsHUyx1ZFDPUC7aL4-b-54VvFvCsJljhFoV3kxRWmonqiruUCr3u1b5q2X1F-iWt" -- Commonly abused event for money 
local jewel_gioelli_wh = "https://discord.com/api/webhooks/940357944141287465/k-z2ymW6HhGl04QbqFsC4rDiWJUQ8MoGolZq9cbBpcLXuP4gPps6cm7bABglLlp0sTo6"
local esx_vangelico_robbery_rob_wh = "https://discord.com/api/webhooks/940359551314718770/j3FuLGhX13UAQ42UNZq4o06CtMWJx1GENILZR8Rx_L052G-cSiUgpu7F7DNAj9_3QZ8y"
local esx_vangelico_robbery_endrob = "https://discord.com/api/webhooks/940360268913967134/jLas7eBl5n3KrfcwrzioYZkC342sUyT4YG2Me6WFkjDQjYqiBl2LnWP1au3ndUBKJc7R"
local esx_vangelico_robbery_toofar_wh = "https://discord.com/api/webhooks/940361653441138738/7HpRMBIyWA4dBHw81hZV6goWrOeTDyoCmL6-d7Pbt8NnKR06Cso4QbFraU0oGZGsV2lE"

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function get3DDistance(x1, y1, z1, x2, y2, z2)
	return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2) + math.pow(z1 - z2, 2))
end

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
		if xPlayer.job.name == 'kmar' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(120 * 1000, CountCops)
end

CountCops()

-- Tokenized
RegisterServerEvent('esx_vangelico_robbery:toofar')
AddEventHandler('esx_vangelico_robbery:toofar', function(robb, token)
	local source = source
	local xPlayers = ESX.GetPlayers()
	local store = Stores[robb]
	rob = false

	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end
	TriggerEvent("middelveen:log", esx_vangelico_robbery_toofar_wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\nTrigger name: esx_vangelico_robbery:toofar \nExecuting player: "..xPlayer.name.." ["..xPlayer.identifier.."]", 62207)

	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. store.nameofstore)
			--TriggerClientEvent('rocket-notify:grootnotify', xPlayers[i], 'Juwelier', _U('robbery_cancelled_at') .. store.nameofstore, 'far fa-gem', '5000', '#dea507', true)
			TriggerClientEvent('esx_vangelico_robbery:killblip', xPlayers[i])
			TriggerEvent('logs:juwelierlogcancel', source, store.nameofstore)
		end
		if xPlayer.job.name == 'kmar' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at') .. store.nameofstore)
			--TriggerClientEvent('rocket-notify:grootnotify', xPlayers[i], 'Juwelier', _U('robbery_cancelled_at') .. store.nameofstore, 'far fa-gem', '5000', '#dea507', true)
			TriggerClientEvent('esx_vangelico_robbery:killblip', xPlayers[i])
			TriggerEvent('logs:juwelierlogcancel', source, store.nameofstore)
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_vangelico_robbery:toofarlocal', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_cancelled') .. store.nameofstore)
	end
end)

-- Tokenized
RegisterServerEvent('esx_vangelico_robbery:endrob')
AddEventHandler('esx_vangelico_robbery:endrob', function(robb, token)
	local source = source
	local xPlayers = ESX.GetPlayers()
	local store = Stores[robb]
	rob = false
	
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end
	TriggerEvent("middelveen:log", esx_vangelico_robbery_rob_wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\nTrigger name: esx_vangelico_robbery:endrob \nExecuting player: "..GetPlayerName(source), 62207)

	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('end'))
			TriggerClientEvent('esx_vangelico_robbery:killblip', xPlayers[i])
			TriggerEvent('logs:juwelierlogend', source, store.nameofstore)
		end
		if xPlayer.job.name == 'kmar' then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('end'))
			TriggerClientEvent('esx_vangelico_robbery:killblip', xPlayers[i])
			TriggerEvent('logs:juwelierlogend', source, store.nameofstore)
		end
	end
	if(robbers[source])then
		TriggerClientEvent('esx_vangelico_robbery:robberycomplete', source)
		robbers[source] = nil
		TriggerClientEvent('esx:showNotification', source, _U('robbery_has_ended') .. Stores[robb].nameofstore)
	end
end)

-- Tokenized 
RegisterServerEvent('esx_vangelico_robbery:rob')
AddEventHandler('esx_vangelico_robbery:rob', function(robb, token)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end
	TriggerEvent("middelveen:log", esx_vangelico_robbery_rob_wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\nTrigger name: esx_vangelico_robbery:rob \nExecuting player: "..xPlayer.name.." ["..xPlayer.identifier.."]", 62207)

	if Stores[robb] then

		local store = Stores[robb]

		if (os.time() - store.lastrobbed) < Config.SecBetwNextRob and store.lastrobbed ~= 0 then

            TriggerClientEvent('esx_vangelico_robbery:togliblip', source)
			TriggerClientEvent('esx:showNotification', source, _U('already_robbed') .. (Config.SecBetwNextRob - (os.time() - store.lastrobbed)) .. _U('seconds'))
			return
		end

		if rob == false then

			rob = true
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'police' then
					TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog') .. store.nameofstore)
					TriggerClientEvent('esx_vangelico_robbery:setblip', xPlayers[i], Stores[robb].position)
				end
				if xPlayer.job.name == 'kmar' then
					TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog') .. store.nameofstore)
					TriggerClientEvent('esx_vangelico_robbery:setblip', xPlayers[i], Stores[robb].position)
				end
			end

			TriggerClientEvent('esx:showNotification', source, _U('started_to_rob') .. store.nameofstore .. _U('do_not_move'))
			TriggerEvent('logs:juwelierlogstart', source, store.nameofstore)
			TriggerClientEvent('esx:showNotification', source, _U('alarm_triggered'))
			TriggerClientEvent('esx:showNotification', source, _U('hold_pos'))
			TriggerClientEvent('esx_vangelico_robbery:currentlyrobbing', source, robb)
            CancelEvent()
			Stores[robb].lastrobbed = os.time()
		else
			TriggerClientEvent('esx:showNotification', source, _U('robbery_already'))
		end
	end
end)

-- Tokenized 
RegisterServerEvent('esx_vangelico_robbery:gioielli')
AddEventHandler('esx_vangelico_robbery:gioielli', function(token)
	local xPlayer = ESX.GetPlayerFromId(source)
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end
	TriggerEvent("middelveen:log", jewel_gioelli_wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\nTrigger name: esx_vangelico_robbery:gioielli \nExecuting player: "..xPlayer.name.." ["..xPlayer.identifier.."]", 62207)
	xPlayer.addInventoryItem('jewels', math.random(Config.MinJewels, Config.MaxJewels))
end)

-- Tokenized 
RegisterServerEvent('lester:vendita')
AddEventHandler('lester:vendita', function(token)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local reward = math.floor(Config.PriceForOneJewel * Config.MaxJewelsSell)

	-- Tokenizer check 
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end
	TriggerEvent("middelveen:log", lesterven_wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\nTrigger name: lester:vendita \nExecuting player: "..xPlayer.name.." ["..xPlayer.identifier.."]", 62207)
	xPlayer.removeInventoryItem('jewels', Config.MaxJewelsSell)
	--xPlayer.addMoney(reward)
	xPlayer.addAccountMoney('black_money', reward)
end)

ESX.RegisterServerCallback('esx_vangelico_robbery:conteggio', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	cb(CopsConnected)
end)

