ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("jail", function(src, args, raw)

	local xPlayer = ESX.GetPlayerFromId(src)

	if xPlayer["job"]["name"] == "police" or xPlayer["job"]["name"] == "kmar" then

		local jailPlayer = args[1]
		local jailTime = tonumber(args[2])
		local jailReason = args[3]
		local jailReason = args[4]
		local jailReason = args[5]

		if GetPlayerName(jailPlayer) ~= nil then

			if jailTime ~= nil then
				JailPlayer(jailPlayer, jailTime)

				TriggerClientEvent('rocket-notify:grootnotify',src, 'Politie', GetPlayerName(jailPlayer) .. " Gevangen voor " .. jailTime .. " maanden!", 'fas fa-bars', '5000', '#dea507', true)
				
				if args[3] ~= nil then
					GetRPName(jailPlayer, function(Firstname, Lastname)
						TriggerClientEvent('chat:addMessage', -1, { 
							template = '<div style="padding: 0.3vw; margin: 0.1vw;  background-color: rgba(41, 41, 41, 0.6); border-radius: 3px;"><i class="fas fa-globes"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
							args = { "Rechter",  Firstname .. " " .. Lastname .. " Zit in de gevangenis reden: " .. args[3] .. " "  .. args[4] .. " " .. args[5] }, color = { 249, 166, 0 } -- 128, 128, 128
						})
					end)
				end
			else
				TriggerClientEvent('okokNotify:Alert', src, "Politie", "Deze tijd is ongeldig!", 5000, 'info')
				--TriggerClientEvent('rocket-notify:grootnotify',src, 'Politie', "Deze tijd is ongeldig!", 'fas fa-bars', '5000', '#dea507', true)
			end
		else
			TriggerClientEvent('okokNotify:Alert', src, "Politie", "Dit ID is niet online!", 5000, 'info')
			--TriggerClientEvent('rocket-notify:grootnotify',src, 'Politie', "Dit ID is niet online!", 'fas fa-bars', '5000', '#dea507', true)
		end
	else
		TriggerClientEvent('okokNotify:Alert', src, "Politie", "Je bent geen agent!", 5000, 'info')
		--TriggerClientEvent('rocket-notify:grootnotify',src, 'Politie', "Je bent geen agent!", 'fas fa-bars', '5000', '#dea507', true)
	end
end)

RegisterCommand("unjail", function(src, args)

	local xPlayer = ESX.GetPlayerFromId(src)

	if xPlayer["job"]["name"] == "police" or xPlayer["job"]["name"] == "kmar" then

		local jailPlayer = args[1]

		if GetPlayerName(jailPlayer) ~= nil then
			UnJail(jailPlayer)
		else
			TriggerClientEvent('okokNotify:Alert', src, "Politie", "Dit ID is niet online!", 5000, 'info')
			--TriggerClientEvent('rocket-notify:grootnotify',src, 'Politie', "Dit ID is niet online!", 'fas fa-bars', '5000', '#dea507', true)
		end
	else
		TriggerClientEvent('okokNotify:Alert', src, "Politie", "Je bent geen agent!", 5000, 'info')
		--TriggerClientEvent('rocket-notify:grootnotify',src, 'Politie', "Je bent geen agent!", 'fas fa-bars', '5000', '#dea507', true)
	end
end)

RegisterCommand("unjails", function(src, args)

	local source = src
	local xPlayer = ESX.GetPlayerFromId(src)

	if IsPlayerAceAllowed(src, "no.kick") then

		local jailPlayer = args[1]

		if GetPlayerName(jailPlayer) ~= nil then
			UnJail(jailPlayer)
		else
			TriggerClientEvent('okokNotify:Alert', src, "Politie", "Dit ID is niet online!", 5000, 'info')
			--TriggerClientEvent('rocket-notify:grootnotify',src, 'Politie', "Dit ID is niet online!", 'fas fa-bars', '5000', '#dea507', true)
		end
	end
end)

RegisterServerEvent("esx-qalle-jail:jailPlayer")
AddEventHandler("esx-qalle-jail:jailPlayer", function(targetSrc, jailTime, jailReason)
	local src = source
	local targetSrc = tonumber(targetSrc)

	JailPlayer(targetSrc, jailTime)

	GetRPName(targetSrc, function(Firstname, Lastname)
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(41, 41, 41, 0.6); border-radius: 5px;"><i class="fas fa-globes"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
			args = { "Rechter",  Firstname .. " " .. Lastname .. " Zit in de gevangenis reden: " .. args[3] .. " "  .. args[4] .. " " .. args[5] }, color = { 249, 166, 0 } -- 128, 128, 128
		})
	end)
	TriggerClientEvent('okokNotify:Alert', src, "Politie", GetPlayerName(targetSrc) .. " Gevangen voor " .. jailTime .. " maanden!", 5000, 'info')
	--TriggerClientEvent('rocket-notify:grootnotify',src, 'Politie', GetPlayerName(targetSrc) .. " Gevangen voor " .. jailTime .. " maanden!", 'fas fa-bars', '5000', '#dea507', true)
end)

RegisterServerEvent("esx-qalle-jail:unJailPlayer")
AddEventHandler("esx-qalle-jail:unJailPlayer", function(targetIdentifier)
	local src = source
	local xPlayer = ESX.GetPlayerFromIdentifier(targetIdentifier)

	if xPlayer ~= nil then
		UnJail(xPlayer.source)
	else
		MySQL.Async.execute(
			"UPDATE users SET jail = @newJailTime WHERE identifier = @identifier",
			{
				['@identifier'] = targetIdentifier,
				['@newJailTime'] = 0
			}
		)
	end

	TriggerClientEvent('okokNotify:Alert', src, "Politie", xPlayer.name .. " Unjailed!", 5000, 'info')
	--TriggerClientEvent('rocket-notify:grootnotify',src, 'Politie', xPlayer.name .. " Unjailed!", 'fas fa-bars', '5000', '#dea507', true)
end)

RegisterServerEvent("esx-qalle-jail:updateJailTime")
AddEventHandler("esx-qalle-jail:updateJailTime", function(newJailTime)
	local src = source

	EditJailTime(src, newJailTime)
end)

function JailPlayer(jailPlayer, jailTime)
	TriggerClientEvent("esx-qalle-jail:jailPlayer", jailPlayer, jailTime)

	EditJailTime(jailPlayer, jailTime)
end

function UnJail(jailPlayer)
	TriggerClientEvent("esx-qalle-jail:unJailPlayer", jailPlayer)

	EditJailTime(jailPlayer, 0)
end

function EditJailTime(source, jailTime)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier

	MySQL.Async.execute(
       "UPDATE users SET jail = @newJailTime WHERE identifier = @identifier",
        {
			['@identifier'] = Identifier,
			['@newJailTime'] = tonumber(jailTime)
		}
	)
end

function GetRPName(playerId, data)
	local Identifier = ESX.GetPlayerFromId(playerId).identifier

	MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		data(result[1].firstname, result[1].lastname)

	end)
end

ESX.RegisterServerCallback("esx-qalle-jail:retrieveJailedPlayers", function(source, cb)
	
	local jailedPersons = {}

	MySQL.Async.fetchAll("SELECT firstname, lastname, jail, identifier FROM users WHERE jail > @jail", { ["@jail"] = 0 }, function(result)

		for i = 1, #result, 1 do
			table.insert(jailedPersons, { name = result[i].firstname .. " " .. result[i].lastname, jailTime = result[i].jail, identifier = result[i].identifier })
		end

		cb(jailedPersons)
	end)
end)

ESX.RegisterServerCallback("esx-qalle-jail:retrieveJailTime", function(source, cb)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier


	MySQL.Async.fetchAll("SELECT jail FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		local JailTime = tonumber(result[1].jail)

		if JailTime > 0 then

			cb(true, JailTime)
		else
			cb(false, 0)
		end

	end)
end)