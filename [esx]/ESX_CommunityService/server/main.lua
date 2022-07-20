ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- TOKENIZED -----------------------------------------

-- DISCORD LOGGING [ MIDDELVEENRP ]
local esx_communityservice_endCommunityServiceCommand_wh = "https://discord.com/api/webhooks/940537303762337822/aiigeNjKX6VfBQKrgCzd1zitm-W6O8tT3n8qCz-_4ne9wgu5c8SqMhCScRUEle2TcPTQ"
local esx_communityservice_finishCommunityService_wh = "https://discord.com/api/webhooks/940539634780352613/kRrB8xlbCFgWKpcdUU5U5tU0F5p_TMGkwpW7Vk3qbxtFIg-1mzjIG8S5aivUMWR4Ktym"
local esx_communityservice_completeService_wh = "https://discord.com/api/webhooks/940540999502008320/axp3NU-N3Cs37wkvhD6A5le6hF0_AQJ42VgxHr0wR1Woz7veTzPOg7fQVZSu_DnfaeTI"
local esx_communityservice_extendService_wh = "https://discord.com/api/webhooks/940540834732974120/2vcDvefGIAXaW9HkdVXcahuWvnvqvWX8LwIHEfWHoHMe8RkbnNo0os4fh-dSaLXn8xSf" 
local esx_communityservice_sendToCommunityService_wh = "https://discord.com/api/webhooks/940541455074721872/uQ7-0-qIrJD8JxWewFtXHaRmysfXLKLwXdYgY129YwN_rLw20mVxDercan0vbdl7W9wt"
local esx_communityservice_checkIfSentenced_wh = "https://discord.com/api/webhooks/940542440400629780/GWHm_oleqDG_8FdGzh4ZW35Ej5osr1JO_AjqmDhZrFmZvbgElG--pUB4DV8dZTUpviOv"

--[[TriggerEvent('es:addGroupCommand', 'comserv', 'admin', function(source, args, user)
	if args[1] and GetPlayerName(args[1]) ~= nil and tonumber(args[2]) then
		TriggerEvent('esx_communityservice:sendToCommunityService', tonumber(args[1]), tonumber(args[2]))
	else
		TriggerClientEvent('chat:addMessage', source, { args = { _U('system_msn'), _U('invalid_player_id_or_actions') } } )
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { _U('system_msn'), _U('insufficient_permissions') } })
end, {help = _U('give_player_community'), params = {{name = "id", help = _U('target_id')}, {name = "actions", help = _U('action_count_suggested')}}})
_U('system_msn') ]]


TriggerEvent('es:addGroupCommand', 'endcomserv', 'admin', function(source, args, user)
	if args[1] then
		if GetPlayerName(args[1]) ~= nil then
			TriggerEvent('esx_communityservice:endCommunityServiceCommand', tonumber(args[1]))
		else
			TriggerClientEvent('chat:addMessage', source, { args = { _U('system_msn'), _U('invalid_player_id')  } } )
		end
	else
		TriggerEvent('esx_communityservice:endCommunityServiceCommand', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { _U('system_msn'), 'insufficient_permissions'}})
end, {help = _U('unjail_people'), params = {{name = "id", help = _U('target_id')}}})

-- Tokenized
RegisterServerEvent('esx_communityservice:endCommunityServiceCommand')
AddEventHandler('esx_communityservice:endCommunityServiceCommand', function(source)
	if source ~= nil then
		releaseFromCommunityService(source)
		TriggerEvent("middelveen:log", esx_communityservice_endCommunityServiceCommand_wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\nTrigger name: esx_communityservice:endCommunityServiceCommand \nExecuting player: "..GetPlayerName(source), 62207) 
	end
end)

-- Tokenized
-- unjail after time served
RegisterServerEvent('esx_communityservice:finishCommunityService')
AddEventHandler('esx_communityservice:finishCommunityService', function(token)
	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end
	releaseFromCommunityService(source)
	TriggerEvent("middelveen:log", esx_communityservice_finishCommunityService_wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\nTrigger name: esx_communityservice:finishCommunityService \nExecuting player: "..GetPlayerName(source), 62207) 
end)

-- Tokenized
RegisterServerEvent('esx_communityservice:completeService')
AddEventHandler('esx_communityservice:completeService', function(token)

	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]

	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end
	TriggerEvent("middelveen:log", esx_communityservice_completeService_wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\nTrigger name: esx_communityservice:completeService \nExecuting player: "..GetPlayerName(source), 62207) 
	
	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)

		if result[1] then
			MySQL.Async.execute('UPDATE communityservice SET actions_remaining = actions_remaining - 1 WHERE identifier = @identifier', {
				['@identifier'] = identifier
			})
		else
			print ("ESX_CommunityService :: Problem matching player identifier in database to reduce actions.")
		end
	end)
end)

-- Tokenized
RegisterServerEvent('esx_communityservice:extendService')
AddEventHandler('esx_communityservice:extendService', function(token)

	local _source = source
	local identifier = GetPlayerIdentifiers(_source)[1]

	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), _source, token) then
		return false
	end
	TriggerEvent("middelveen:log", esx_communityservice_extendService_wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\nTrigger name: esx_communityservice:extendService \nExecuting player: "..GetPlayerName(source), 62207) 

	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)

		if result[1] then
			MySQL.Async.execute('UPDATE communityservice SET actions_remaining = actions_remaining + @extension_value WHERE identifier = @identifier', {
				['@identifier'] = identifier,
				['@extension_value'] = Config.ServiceExtensionOnEscape
			})
		else
			print ("ESX_CommunityService :: Problem matching player identifier in database to reduce actions.")
		end
	end)
end)

-- Tokenized
RegisterServerEvent('esx_communityservice:sendToCommunityService')
AddEventHandler('esx_communityservice:sendToCommunityService', function(target, actions_count, token, sourceplayer)

	local identifier = GetPlayerIdentifiers(target)[1]

	if not exports['salty_tokenizer']:secureServerEvent(GetCurrentResourceName(), sourceplayer, token) then
		return false
	elseif sourceplayer == "" then 
		return true
	end 
	TriggerEvent("middelveen:log", esx_communityservice_sendToCommunityService_wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\nTrigger name: esx_communityservice:sendToCommunityService", 62207) 

	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] then
			MySQL.Async.execute('UPDATE communityservice SET actions_remaining = @actions_remaining WHERE identifier = @identifier', {
				['@identifier'] = identifier,
				['@actions_remaining'] = actions_count
			})
		else
			MySQL.Async.execute('INSERT INTO communityservice (identifier, actions_remaining) VALUES (@identifier, @actions_remaining)', {
				['@identifier'] = identifier,
				['@actions_remaining'] = actions_count
			})
		end
	end)

	TriggerClientEvent('chat:addMessage', -1, { 
		template = '<div style="padding: 0.3vw; margin: 0.1vw;  background-color: rgba(41, 41, 41, 0.6); border-radius: 3px;"><i class="fas fa-user-crown"></i> {0}:<br> {1}</div>',
		args = { _U('judge'), _U('comserv_msg', GetPlayerName(target), actions_count) }, color = { 147, 196, 109 }
	})
	TriggerClientEvent('esx_kmarjob:unrestrain', target)
	TriggerClientEvent('esx_communityservice:inCommunityService', target, actions_count)
end)


RegisterServerEvent('esx_communityservice:checkIfSentenced')
AddEventHandler('esx_communityservice:checkIfSentenced', function()
	local _source = source -- cannot parse source to client trigger for some weird reason
	local identifier = GetPlayerIdentifiers(_source)[1] -- get steam identifier

	TriggerEvent("middelveen:log", esx_communityservice_checkIfSentenced_wh, "Er wordt een server/client event getriggerd!", "Script name: "..GetCurrentResourceName().."\nTrigger name: esx_communityservice:checkIfSentenced \nExecuting player: "..GetPlayerName(source), 62207) 

	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] ~= nil and result[1].actions_remaining > 0 then
			--TriggerClientEvent('chat:addMessage', -1, { args = { _U('judge'), _U('jailed_msg', GetPlayerName(_source), ESX.Math.Round(result[1].jail_time / 60)) }, color = { 147, 196, 109 } })
			TriggerClientEvent('esx_communityservice:inCommunityService', _source, tonumber(result[1].actions_remaining))
		end
	end)
end)


function releaseFromCommunityService(target)

	local identifier = GetPlayerIdentifiers(target)[1]
	MySQL.Async.fetchAll('SELECT * FROM communityservice WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(result)
		if result[1] then
			MySQL.Async.execute('DELETE from communityservice WHERE identifier = @identifier', {
				['@identifier'] = identifier
			})

			--TriggerClientEvent('chat:addMessage', -1, { args = { _U('judge'), _U('comserv_finished', GetPlayerName(target)) }, color = { 147, 196, 109 } })
			TriggerClientEvent('chat:addMessage', -1, { 
				template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.6); border-radius: 5px;"><i class="fas fa-user-crown"></i> {0}:<br> {1}</div>',
				args = { _U('judge'), _U('comserv_finished', GetPlayerName(target)) }, color = { 147, 196, 109 }
			})
		end
	end)

	TriggerClientEvent('esx_communityservice:finishCommunityService', target)
end
