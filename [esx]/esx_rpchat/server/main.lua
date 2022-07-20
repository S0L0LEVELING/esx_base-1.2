ESX = nil

-- Loging to Discord 
local webhook_twt = "https://discord.com/api/webhooks/893889252193083463/K2wq_xwlQzbIYETfcv7GcKAhMmmRlAnxg9R8FVzEgNNGNXZ_alYI7g7bn-l7c465R6QO"
local webhook_fb = "https://discord.com/api/webhooks/893891680766394399/OftPnQU1dbcY8vAnw9f2UUPC64yMD2kxyR_xqNr-uxNLfK1gYBEjCN1xmctDoiGysGfO"
local webhook_atwt = "https://discord.com/api/webhooks/893889631022645298/TEOwWLkBSzt73K16qDjOba_4ej9rVoNfYaR2JjYi-9NoNaN36V5SPTwAFD_HhIVxS_Aj"
local webhook_ad = "https://discord.com/api/webhooks/893891840347078686/pnE7V8Mp4H2DyiOvWtLxdCpuwzOJnGyGuNhaYE3JLEMqEl9IiRoHb1mZ3fLLbp2rHa1q"
local webhook_nlalert = "https://discord.com/api/webhooks/904809541047296000/sU68CGZ2mM_DrphYdCq8cp86VxZgzsv69j2nA0nU4KXGs91kC7XDdLZhsu9y6XJPd6B7"

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('chatMessage', function(source, name, message)
	if string.sub(message, 1, string.len('/')) ~= '/' then
		CancelEvent()

	if Config.EnableESXIdentity then name = GetPlayerName(source) end
	end
end)

TriggerClientEvent("pNotify:SetQueueMax", -1, alerts, 5)

TriggerEvent('es:addGroupCommand', 'nlalert', "steam",function(source, args, user)
	TriggerEvent('InteractSound_SV:PlayOnAll', 'alert', 0.8)
	TriggerClientEvent("pNotify:SendNotification", -1, {
				text = "<center><b style='color:red'>NLALERT</b> <br/><b style='color:white'> </br>" ..table.concat(args, " ").. "</b><br /></center>",
				type = "alert",
				queue = "alerts",
				timeout = 30000,
				layout = "centerLeft",
				theme = "gta",
			})	
			TriggerEvent('sendtodiscord:servertrigger', webhook_nlalert, GetPlayerName(source)..' gaf een NLalert uit.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** gaf een NLalert uit' ,762640)
end, {help = "Geef NL Alert uit"})

function GetPlayerName(playerId)
	local xPlayer = ESX.GetPlayerFromId(playerId)

	if xPlayer then
		if Config.EnableESXIdentity then
			if Config.OnlyFirstname then
				return xPlayer.get('firstName')
			else
				return xPlayer.getName()
			end
		else
			return xPlayer.getName()
		end
	else
		return GetPlayerName(playerId)
	end
end


RegisterServerEvent('ck_scripting:sendmessage')
AddEventHandler('ck_scripting:sendmessage', function(source, type, message)
	local name = GetPlayerName(source)

	if type == 'twitter' then
		if IsPlayerAceAllowed(source, "donateur") then 
			TriggerEvent('sendtodiscord:servertrigger', webhook_twt, GetPlayerName(source)..' gaf een Twitter bericht uit.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** Stuurde een twitter bericht met inhoud: **'..name..':** **'..message..'**' ,62207)
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(28, 160, 242, 0.6); border-radius:10px;"><i class="fab fa-twitter"></i> {0}:<br> {1}</div>', --@{0}:<br> {1}
				args = { "💎"..name, message }
			})
		else 
			TriggerEvent('sendtodiscord:servertrigger', webhook_twt, GetPlayerName(source)..' gaf een Twitter bericht uit.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** Stuurde een twitter bericht met inhoud: **'..name..':** **'..message..'**' ,62207)
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(28, 160, 242, 0.6); border-radius:10px;"><i class="fab fa-twitter"></i> {0}:<br> {1}</div>', --@{0}:<br> {1}
				args = { name, message }
			})
		end 
		TriggerEvent("diamond-hackingsystem:dumptodatabase", GetPlayerName(source), message, os.time(), "twt")
	elseif type == 'facebook' then
		TriggerEvent('sendtodiscord:servertrigger', webhook_fb, GetPlayerName(source)..' gaf een Facebook bericht uit.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** Stuurde een Facebook bericht met inhoud: **'..name..':** **'..message..'**' ,62207)
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(59, 89, 152, 1); border-radius: 10px;"><i class="fab fa-facebook"></i> {0}:<br> {1}</div>', --@{0}:<br> {1}
			args = { name, message }
		})
		TriggerEvent('logs:chatfb', name, args)
		TriggerEvent("diamond-hackingsystem:dumptodatabase", GetPlayerName(source), message, os.time(), "fb")
	elseif type == 'advertentie' then
		TriggerEvent('sendtodiscord:servertrigger', webhook_ad, GetPlayerName(source)..' gaf een Advertentie bericht uit.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** Stuurde een Advertentie bericht met inhoud: **'..name..':** **'..message..'**' ,62207)
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(230, 165, 14, 1); border-radius: 10px;"><i class="fas fa-ad"></i> {0}:<br> {1}</div>', --@{0}:<br> {1}
			args = { name, message }
		})
		TriggerEvent('logs:chatad', name, args)
		TriggerEvent("diamond-hackingsystem:dumptodatabase", GetPlayerName(source), message, os.time(), "ad")
	elseif type == 'ooc' then
		if IsPlayerAceAllowed(source, "donateur") then 
			TriggerEvent('sendtodiscord:servertrigger', webhook_ad, GetPlayerName(source)..' gaf een OOC bericht uit.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** Stuurde een OOC bericht bericht met inhoud: **'..name..':** **'..message..'**' ,62207)
			TriggerClientEvent('chat:addMessage', -1, {
				template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(145, 145, 145, 0.7); border-radius: 10px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>', --@{0}:<br> {1}
				args = { name, message }
			})
			TriggerEvent('logs:chatooc', name, args)
		else 
			TriggerClientEvent("chatMessage", source, "[Geen Permissie]", {0,0,0}, "Je moet hiervoor ^7donateur+ zijn!")
		end 

	elseif type == 'anontwt' then
		local name = 'Anoniem'
		TriggerEvent('sendtodiscord:servertrigger', webhook_atwt, GetPlayerName(source)..' gaf een Anoniem twitter bericht uit.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** Stuurde een bericht met inhoud: **'..name..':** **'..message..'**' ,62207)
		TriggerClientEvent('chat:addMessage', -1, {
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(3, 24, 252, 0.6); border-radius: 10px;"><i class="fab fa-twitter"></i> {0}:<br> {1}</div>', --@{0}:<br> {1}
			args = { name, message }
		})
		TriggerEvent('logs:chataTwt', name, args)
		TriggerEvent("diamond-hackingsystem:dumptodatabase", GetPlayerName(source), message, os.time(), "anontwt")
	else
		TriggerClientEvent('esx:showNotification', source, 'There\'s something went wrong')
	end
end)

RegisterServerEvent('sendtodiscord:servertrigger')
AddEventHandler('sendtodiscord:servertrigger', function (webhook, title, message, color)
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
end)

