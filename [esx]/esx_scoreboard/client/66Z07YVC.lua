local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local StreamModus = false
local idVisable = true
local updated = false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	--[[Citizen.Wait(2000)
	[ESX.TriggerServerCallback('esx_scoreboard:getConnectedPlayers', function(connectedPlayers)
		UpdatePlayerTable(connectedPlayers)
	end)]]
end)

Citizen.CreateThread(function()
	Citizen.Wait(500)
	SendNUIMessage({
		action = 'updateServerInfo',

		maxPlayers = GetConvarInt('sv_maxclients', 256),
		uptime = 'onbekend',
		playTime = '00u 00m'
	})
end)

local allowedToUse = false
local Ontvangen = false

Citizen.CreateThread(function()
    TriggerServerEvent("scoreboard.getIsAllowed")
end)

RegisterNetEvent("scoreboard.returnIsAllowed")
AddEventHandler("scoreboard.returnIsAllowed", function(isAllowed)
    allowedToUse = isAllowed
end)

RegisterNetEvent('esx_scoreboard:updateConnectedPlayers')
AddEventHandler('esx_scoreboard:updateConnectedPlayers', function(connectedPlayers)
	UpdatePlayerTable(connectedPlayers)
end)

RegisterNetEvent('esx_scoreboard:updatePing')
AddEventHandler('esx_scoreboard:updatePing', function(connectedPlayers)
	SendNUIMessage({
		action  = 'updatePing',
		players = connectedPlayers
	})
end)


RegisterNetEvent('uptime:tick')
AddEventHandler('uptime:tick', function(uptime)
	SendNUIMessage({
		action = 'updateServerInfo',
		uptime = uptime
	})
end)

function UpdatePlayerTable(connectedPlayers)
	local formattedPlayerList, num = {}, 1
	local ambulance, offambulance, police, offpolice, kmar, offkmar, taxi, mechanic, offmechanic, maffia, maffia2, motorclub, cardealer, realestateagent, players = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	
	if StreamModus then
		spelersID = "Verborgen"
	else
		spelersID = GetPlayerServerId(PlayerId())
	end
	
	for k,v in pairs(connectedPlayers) do
		if allowedToUse and not StreamModus then
			if num == 1 then
				table.insert(formattedPlayerList, ('<tr><td>%s</td><td>%s</td>'):format(v.name, v.joblabel))
				num = 2
			elseif num == 2 then
				table.insert(formattedPlayerList, ('<td>%s</td><td>%s</td>'):format(v.name, v.joblabel))
				num = 3
			elseif num == 3 then
				table.insert(formattedPlayerList, ('<td>%s</td><td>%s</td>'):format(v.name, v.joblabel))
				num = 4
			elseif num == 4 then
				table.insert(formattedPlayerList, ('<td>%s</td><td>%s</td>'):format(v.name, v.joblabel))
				num = 5
			elseif num == 5 then
				table.insert(formattedPlayerList, ('<td>%s</td><td>%s</td>'):format(v.name, v.joblabel))
				num = 6
			elseif num == 6 then
				table.insert(formattedPlayerList, ('<td>%s</td><td>%s</td></tr>'):format(v.name, v.joblabel))
				num = 1
			end
			SendNUIMessage({
			action  = 'setplayerlist'
			})
		end

		players = players + 1
		if v.job == 'ambulance' then
			ambulance = ambulance + 1
		elseif v.job == 'offambulance' then
			offambulance = offambulance + 1
		elseif v.job == 'police' then
			police = police + 1
		elseif v.job == 'offpolice' then
			offpolice = offpolice + 1
		elseif v.job == 'kmar' then
			kmar = kmar + 1
		elseif v.job == 'offkmar' then
			offkmar = offkmar + 1
		elseif v.job == 'taxi' then
			taxi = taxi + 1
		elseif v.job == 'realestateagent' then
			realestateagent = realestateagent + 1
		elseif v.job == 'mechanic' then
			mechanic = mechanic + 1
		elseif v.job == 'offmechanic' then
			offmechanic = offmechanic + 1
		elseif v.job == 'maffia' then
			maffia = maffia + 1
		elseif v.job == 'maffia2' then
			maffia2 = maffia2 + 1
		elseif v.job == 'motorclub' then
			motorclub = motorclub + 1
		elseif v.job == 'cardealer' then
			cardealer = cardealer + 1
		end
	end

	if police >= 8 then 
		police = '8+'
	end

	if num == 1 then
		table.insert(formattedPlayerList, '</tr>')
	end

	SendNUIMessage({
		action  = 'updatePlayerList',
		players = table.concat(formattedPlayerList)
	})
	
	SendNUIMessage({
		action  = 'updateplayerID',
		ID = {spelerID = spelersID}
	})

	SendNUIMessage({
		action = 'updatePlayerJobs',
		jobs   = {ambulance = ambulance, offambulance = offambulance, police = police, offpolice = offpolice, kmar = kmar, offkmar = offkmar, taxi = taxi, mechanic = mechanic, offmechanic = offmechanic, maffia = maffia, maffia2 = maffia2, motorclub = motorclub, cardealer = cardealer, realestateagent = realestateagent, player_count = players}
	})
end


local ScoreboardOpen = false

RegisterCommand('+scoreboard', function()
	UpplayerTable()
    ToggleScoreBoard()
end, false)
RegisterCommand('-scoreboard', function()
    ToggleScoreBoard()
end, false)
RegisterKeyMapping('+scoreboard', 'Spelerlijst', 'keyboard', 'DELETE')

-- Close scoreboard when game is paused
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)

		if IsPauseMenuActive() and not IsPaused then
			IsPaused = true
			SendNUIMessage({
				action  = 'close'
			})
		elseif not IsPauseMenuActive() and IsPaused then
			IsPaused = false
		end
	end
end)

function ToggleScoreBoard()
	SendNUIMessage({
		action = 'toggle'
	})
end

function UpplayerTable()
ESX.TriggerServerCallback('esx_scoreboard:getConnectedPlayers', function(connectedPlayers)
		UpdatePlayerTable(connectedPlayers)
	end)
end

Citizen.CreateThread(function()
	local playMinute, playHour = 0, 0

	while true do
		Citizen.Wait(1000 * 60) -- every minute
		playMinute = playMinute + 1
	
		if playMinute == 60 then
			playMinute = 0
			playHour = playHour + 1
		end

		SendNUIMessage({
			action = 'updateServerInfo',
			playTime = string.format("%02du %02dm", playHour, playMinute)
		})
	end
end)

-------------------Player IDS ------------------

local Idsaan = false


RegisterKeyMapping('+ids', 'Speler ids', 'keyboard', 'PAGEDOWN')

disPlayerNames = 5 --distance you see IDs at 
keyToToggleIDs = 207 -- Toets PAGE DOWN

playerDistances = {}
showIDsAboveHead = false

RegisterCommand('+ids', function()
        if not showIDsAboveHead then
            showIDsAboveHead = true
			exports['mythic_notify']:DoHudText('success', 'IDs aangezet (LET OP! Dit geeft lag!)')
			print("changed")
            Wait(50)
		elseif showIDsAboveHead then
			showIDsAboveHead = false
			exports['mythic_notify']:DoHudText('error', 'IDs uitgezet')
			print("changed")
            Wait(50)
        end
        Wait(0)
end)

RegisterCommand('-ids', function()
end)

Citizen.CreateThread(function()
    while true do
        for id = 0, 255 do
            if GetPlayerPed(id) ~= GetPlayerPed(-1) then
                x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
                playerDistances[id] = distance
            end
        end
        Citizen.Wait(1000)
    end
end)




Citizen.CreateThread(function()
    while true do
        if showIDsAboveHead then
            for id = 0, 255 do 
                if NetworkIsPlayerActive(id) then
                    if GetPlayerPed(id) ~= GetPlayerPed(-1) then
                        if (playerDistances[id] < disPlayerNames) then
                            x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                            if NetworkIsPlayerTalking(id) then
                                DrawText3D(x2, y2, z2+1, GetPlayerServerId(id), 0, 153, 255)
                            else
                                DrawText3D(x2, y2, z2+1, GetPlayerServerId(id), 255,255,255)
                            end
                        end  
                    end
                end
            end
        end
        Citizen.Wait(0)
    end
end)


function DrawText3D(x,y,z, text, r,g,b) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end


RegisterNetEvent('gr_streammode:switch')
AddEventHandler('gr_streammode:switch', function(switch)
	if switch then
		StreamModus = true
	else
		StreamModus = false
	end
end)