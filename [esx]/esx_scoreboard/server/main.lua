ESX = nil
local connectedPlayers = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('esx_scoreboard:getConnectedPlayers', function(source, cb)
	cb(connectedPlayers)
end)

AddEventHandler('esx:setJob', function(playerId, job, lastJob)
	connectedPlayers[playerId].job = job.name

	--TriggerClientEvent('esx_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
	AddPlayersToScoreboard()
end)

AddEventHandler('esx:playerLoaded', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
		AddPlayerToScoreboard(xPlayer, true)
end)

AddEventHandler('esx:playerDropped', function(playerId)
	connectedPlayers[playerId] = nil

	--TriggerClientEvent('esx_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		UpdatePing()
	end
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.CreateThread(function()
			Citizen.Wait(1000)
			AddPlayersToScoreboard()
		end)
	end
end)

function AddPlayerToScoreboard(xPlayer, update)
	local playerId = xPlayer.source
	local playerName = GetPlayerName(playerId) 
	if playerName == nil then
		
	else

	connectedPlayers[playerId] = {}
	connectedPlayers[playerId].ping = GetPlayerPing(playerId)
	connectedPlayers[playerId].name = "["..playerId.."] "..playerName
	connectedPlayers[playerId].job = xPlayer.job.name
	connectedPlayers[playerId].joblabel = xPlayer.job.label
	if xPlayer.job.name == "police" then
		connectedPlayers[playerId].joblabel = "<span style='color:#306bff;'>"..xPlayer.job.label.."</span>"
	elseif xPlayer.job.name == "offpolice" then
		connectedPlayers[playerId].joblabel = "<span style='color:blue;'>"..xPlayer.job.label.."</span>"
	elseif xPlayer.job.name == "ambulance" then
		connectedPlayers[playerId].joblabel = "<span style='color:#ff8400;'>"..xPlayer.job.label.."</span>"
	elseif xPlayer.job.name == "offambulance" then
		connectedPlayers[playerId].joblabel = "<span style='color:#a85700;'>"..xPlayer.job.label.."</span>"
	elseif xPlayer.job.name == "kmar" then
		connectedPlayers[playerId].joblabel = "<span style='color:#0a4513;'>"..xPlayer.job.label.."</span>"
	elseif xPlayer.job.name == "offkmar" then
		connectedPlayers[playerId].joblabel = "<span style='color:#153a1a;'>"..xPlayer.job.label.."</span>"	
	elseif xPlayer.job.name == "mechanic" then
		connectedPlayers[playerId].joblabel = "<span style='color:#ff4d00;'>"..xPlayer.job.label.."</span>"
	elseif xPlayer.job.name == "offmechanic" then
		connectedPlayers[playerId].joblabel = "<span style='color:#ab3400;'>"..xPlayer.job.label.."</span>"
	elseif xPlayer.job.name == "taxi" then
		connectedPlayers[playerId].joblabel = "<span style='color:#ffe600;'>"..xPlayer.job.label.."</span>"
	elseif xPlayer.job.name == "offtaxi" then
		connectedPlayers[playerId].joblabel = "<span style='color:#ad9c00;'>"..xPlayer.job.label.."</span>"
	else
		connectedPlayers[playerId].joblabel = "<span style='color:grey;'>"..xPlayer.job.label.."</span>"
	end 
	

	if update then
		----TriggerClientEvent('esx_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
	end

	--if xPlayer.player.getGroup() == 'user' then
	--	Citizen.CreateThread(function()
	--		Citizen.Wait(3000)
	--		TriggerClientEvent('esx_scoreboard:toggleID', playerId, false)
	--	end)
	--end
	end
end

function AddPlayersToScoreboard()
	local players = ESX.GetPlayers()

	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		AddPlayerToScoreboard(xPlayer, false)
	end

	--TriggerClientEvent('esx_scoreboard:updateConnectedPlayers', -1, connectedPlayers)
end

function UpdatePing()
	for k,v in pairs(connectedPlayers) do
		v.ping = GetPlayerPing(k)
	end

	--TriggerClientEvent('esx_scoreboard:updatePing', -1, connectedPlayers)
end

TriggerEvent('es:addGroupCommand', 'screfresh', 'admin', function(source, args, user)
	AddPlayersToScoreboard()
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SISTEMA', 'Geen toegang.' } })
end, {help = "Ricarica nomi lista giocatori!"})

TriggerEvent('es:addGroupCommand', 'sctoggle', 'admin', function(source, args, user)
	TriggerClientEvent('esx_scoreboard:toggleID', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SISTEMA', 'Geen toegang.' } })
end, {help = "Togli colonna degli ID!"})


RegisterServerEvent("scoreboard.getIsAllowed")
AddEventHandler("scoreboard.getIsAllowed", function()
    if IsPlayerAceAllowed(source, "chat.staffreport") then
        TriggerClientEvent("scoreboard.returnIsAllowed", source, true)
    else
        TriggerClientEvent("scoreboard.returnIsAllowed", source, false)
    end
end)

local forbiddenNames = {
	"<script",
	"kanker"
}

AddEventHandler("playerConnecting", function(playerName, setKickReason)
	for name in pairs(forbiddenNames) do
		if(string.gsub(string.gsub(string.gsub(string.gsub(playerName:lower(), "-", ""), ",", ""), "%.", ""), " ", ""):find(forbiddenNames[name])) then
			setKickReason("Je naam is niet toegestaan! Pas je naam aan en probeer opnieuw!")
			CancelEvent()
			break
		end
	end
end)