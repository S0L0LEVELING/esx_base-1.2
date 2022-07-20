
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('twt', function(source, args, rawCommand)
	local message = table.concat(args, ' ')
	if not IsEntityDead(GetPlayerPed(-1)) then
		TriggerServerEvent('ck_scripting:sendmessage', GetPlayerServerId(PlayerId()), 'twitter', message)
	else
		ESX.ShowNotification('Chatten is geblokkeerd wegens dat je dood bent!')
	end
end)

RegisterCommand('fb', function(source, args, rawCommand)
	local message = table.concat(args, ' ')
	if not IsEntityDead(GetPlayerPed(-1)) then
		TriggerServerEvent('ck_scripting:sendmessage', GetPlayerServerId(PlayerId()), 'facebook', message)
	else
		ESX.ShowNotification('Chatten is geblokkeerd wegens dat je dood bent!')
	end
end)

RegisterCommand('anontwt', function(source, args, rawCommand)
	local message = table.concat(args, ' ')
	if not IsEntityDead(GetPlayerPed(-1)) then
		TriggerServerEvent('ck_scripting:sendmessage', GetPlayerServerId(PlayerId()), 'anontwt', message)
	else
		ESX.ShowNotification('Chatten is geblokkeerd wegens dat je dood bent!')
	end
end)

RegisterCommand('ad', function(source, args, rawCommand)
	local message = table.concat(args, ' ')
	if not IsEntityDead(GetPlayerPed(-1)) then
		TriggerServerEvent('ck_scripting:sendmessage', GetPlayerServerId(PlayerId()), 'advertentie', message)
	else
		ESX.ShowNotification('Chatten is geblokkeerd wegens dat je dood bent!')
	end
end)


local messages = {}
local offset = 0.125
local chat = false -- if you want messages to be duplicated in chat
local messagesColor = {164, 98, 193, 215} -- r,g,b,a
local colores ={}

local function DrawText3D(x ,y, z, text, color)
	local r,g,b,a = {255, 255, 255, 215}
	if color then
		r,g,b = table.unpack(color)
	end
	a = 215
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local p = GetGameplayCamCoords()
  local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
  local scale = (1 / distance) * 2
  local fov = (1 / GetGameplayCamFov()) * 100
  local scale = scale * fov
  if onScreen then
		SetTextScale(0.6, 0.6)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(r, g, b, a)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		EndTextCommandDisplayText(_x, _y)
    end
end

local function AddMessage(type, msg, color, owner, timeout)
	if not messages[owner] then
		messages[owner] = {}
	end

	table.insert(messages[owner], {
		--type = type,
		type = string.sub(type,4),
		--msg = msg,
		msg = string.sub(msg,3),
		color = color
	})
	SetTimeout(timeout, function()
		table.remove(messages[owner], 1)
		if #messages[owner] == 0 then
			messages[owner] = nil
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		for k,v in pairs(messages) do
			for i,d in pairs(messages[k]) do
				local x,y,z = table.unpack(GetEntityCoords(k))
				z = z + 0.9 + offset*i
				--DrawText3D(x, y, z, d.type..' | '..d.msg, d.color)
				if d.type == 'Resultado' then
					local initColor = ''
					local recorte = string.sub(d.msg,4)
					if recorte == 'Éxito' then
						initColor = '~g~'
					else
						initColor = '~r~'
					end
					DrawText3D(x, y, z, d.type..'~w~: '..initColor..recorte..'~w~', d.color)
				else
					DrawText3D(x, y, z, d.type..' '..d.msg, d.color)
				end
			end
		end
		
		Wait(0)
	end
end)

RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color, to3d, type, color2)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if target == source then

		if type == 'ooc' then
			TriggerEvent('chat:addMessage', { 
				template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.6); border-radius: 3px;"><i class="fas fa-user-friends"></i> {0}:{1}</div>',
				args = { title, message }, color = color 
			})
		elseif type == 'me' then
			TriggerEvent('chat:addMessage', { 
				template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(170, 102, 204, 0.6); border-radius: 3px;"><i class="fas fa-user"></i> {0}<br> {1}</div>',
				args = { title, message }, color = color 
			})
		elseif type == 'do' then
			TriggerEvent('chat:addMessage', { 
				template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 187, 51, 0.6); border-radius: 3px;"><i class="fas fa-user"></i> {0}<br> {1}</div>',
				args = { title, message }, color = color 
			})
		elseif type == 'try' then
			TriggerEvent('chat:addMessage', { 
				template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 128, 0, 0.6); border-radius: 3px;"><i class="fas fa-dice"></i> {0}<br> {1}</div>',
				args = { title, message }, color = color 
			})

		end
		--TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
		--
		if to3d then
			AddMessage(title, message, color2, sourcePed, 10000)
		end
	elseif GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 20 then
	
		if type == 'ooc' then
			TriggerEvent('chat:addMessage', { 
				template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.6); border-radius: 3px;"><i class="fas fa-user-friends"></i> {0}: {1}</div>',
				args = { title, message }, color = color 
			})
		elseif type == 'me' then
			TriggerServerEvent('sendtodiscord:servertrigger', webhook_me, GetPlayerName(source)..' gaf een /me uit.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** Stuurde een /me met inhoud: **'..name..':** **'..args..'**' ,62207)
			TriggerEvent('chat:addMessage', { 
				template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(170, 102, 204, 0.6); border-radius: 3px;"><i class="fas fa-user"></i> {0} {1}</div>',
				args = { title, message }, color = color 
			})
		elseif type == 'do' then
			TriggerEvent('chat:addMessage', { 
				template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 187, 51, 0.6); border-radius: 3px;"><i class="fas fa-user"></i> {0} {1}</div>',
				args = { title, message }, color = color 
			})
		elseif type == 'try' then
			TriggerEvent('chat:addMessage', { 
				template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 128, 0, 0.6); border-radius: 3px;"><i class="fas fa-dice"></i> {0} {1}</div>',
				args = { title, message }, color = color 
			})
		end

		--TriggerEvent('chat:addMessage', { args = { title, message }, color = color })
		if to3d and HasEntityClearLosToEntity(sourcePed, targetPed, 17) == 1 then
			AddMessage(title, message, color2, targetPed, 10000)
		end
	end
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/twt [Bericht]' , 'Praat in twitter. OOC praten = 30min ban!')
	TriggerEvent('chat:addSuggestion', '/anontwt [Bericht]', 'Praat anoniem in twitter. OOC praten = 30min ban!')
	TriggerEvent('chat:addSuggestion', '/me',   _U('me_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/do',   _U('do_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/ooc',  _U('ooc_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )	
	TriggerEvent('chat:addSuggestion', '/ad',   _U('try_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )	
	TriggerEvent('chat:addSuggestion', '/radiovolume [Volume]' , 'Verander je volume van je Porto') 
	TriggerEvent('chat:removeSuggestion', '/staff')
	TriggerEvent('chat:addSuggestion', '/geefsleutel',   _U('geefsleutel_help'),  { { name = _U('geefsleutel_argument_name'), help = _U('geefsleutel_argument_help') } } )	
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/twt')
		TriggerEvent('chat:removeSuggestion', '/me')
		TriggerEvent('chat:removeSuggestion', '/do')
		TriggerEvent('chat:removeSuggestion', '/ooc')
		TriggerEvent('chat:removeSuggestion', '/ad')
		TriggerEvent('chat:removeSuggestion', '/getpos')
		TriggerEvent('chat:removeSuggestion', '/sc')
		TriggerEvent('chat:removeSuggestion', '/anontwt')
		TriggerEvent('chat:removeSuggestion', '/fb')
	end
end)