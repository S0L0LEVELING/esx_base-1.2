ESX = nil

-- Logging to Discord 
local webhook_sb = "https://discord.com/api/webhooks/906250147908964443/WgRr7RS755DK_f4SxxYvMBiZUI1Lhqo-PiksiEnv0nkEpMsQ4wrvACa3UG9z5kPJ7L3s"
local webhook_reviveall = "https://discord.com/api/webhooks/904811015361921055/aoFIg4Z9_qxI7kpSNOTpINAKR3ttdjRCdkkpYZ2oClzZqBqrbL53X1E85Ll-Xb7XzNHl"
local webhook_unjailall = "https://discord.com/api/webhooks/904811108966219907/98p59ijFoeWwfgOx3op_ijGY77KpmaKS0lqZp-hLgWDmHCOxcEzds21XXvrHqitlGvp-"
local webhook_endcomservall = "https://discord.com/api/webhooks/904811282753007647/bx_NLKNgNpFGJwYDLMwRuWW9Q8TocQVcr1sNJEs7y5jT19Pr03hvnBi1P9W-AQg-_DYT"
local webhook_gt = "https://discord.com/api/webhooks/904812960306823268/JCX_l06oHy1HjjLUqVlDhQI8VGZpEBeiYLOgNDNUASjvxikl4qA8JkSHJ-jFZh8VvsUp"
local webhook_gb = "https://discord.com/api/webhooks/904812861220593706/rDQ1cLl-rSbQTWSDfu9gXjeOtlN-PqbdrOMk92AhOmOFoFlVCtqSiYXeRv8-dcIKHRwe"
local webhook_br = "https://discord.com/api/webhooks/904812769709285437/MdHkIM-2Q1pN4KBeFt1DwgtR2dKO0wwbsqhoIm00S_DRfmQxybi9D0daOdHf8pqKHpAB"
local webhook_bt = "https://discord.com/api/webhooks/904812062025326612/-BLeB3W8SqXotdBIrHpsELD4rRSqATo5GU9gFSrGRRnkr9vQtTDFSc3MnTP_fIR8_qkh"

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local savedCoords   = {}
local Owner = "command.bh"



--[[RegisterCommand('sb', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	
	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetPlayerName(source) end

    CancelEvent()
          if IsPlayerAceAllowed(source, Owner) then
			TriggerClientEvent('chat:addMessage', -1, { 
				template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(78, 196, 187, 0.6); border-radius: 10px;"><i class="fas fa-crown"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
				args = { _U('bh_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
			})
		
		end
		TriggerEvent('sendtodiscord:servertrigger', webhook_sb, GetPlayerName(source)..' gaf een staffbericht uit met /sb.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** Stuurde een staffbericht (/sb) met inhoud: **'..name..':** **'..args..'**' ,62207)
end)]] 

--Revive iedereen
RegisterCommand('reviveall', function(source, args, rawCommand)
	TriggerClientEvent('esx_ambulancejob:revive', -1)
	sendToDiscord(webhook_reviveall, GetPlayerName(source)..' revived all players.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** revived all players' ,62207)
end, true)

--Eindig iedereens celstraf
RegisterCommand('unjailall', function(source, args, rawCommand)
	TriggerClientEvent('esx-qalle-jail:unJailPlayer', -1)
	sendToDiscord(webhook_unjailall, GetPlayerName(source)..' unjailed all players.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** unjailed all players' ,62207)
end, true)

--Eindig iedereens taakstraf
RegisterCommand('endcomservall', function(source, args, rawCommand)
	TriggerClientEvent('esx_communityservice:finishCommunityService', -1)
	sendToDiscord(webhook_endcomservall, GetPlayerName(source)..' unjailed all players', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** unjailed all player' ,62207)
end, true)

--naar persoon
RegisterCommand("gt", function(source, args, rawCommand)	-- /goto [ID]
	if source ~= 0 then
  		local xPlayer = ESX.GetPlayerFromId(source)
    		if args[1] and tonumber(args[1]) then
      			local targetId = tonumber(args[1])
      			local xTarget = ESX.GetPlayerFromId(targetId)
      			if xTarget then
        			local targetCoords = xTarget.getCoords()
        			local playerCoords = xPlayer.getCoords()
        			savedCoords[source] = playerCoords
        			xPlayer.setCoords(targetCoords)
        			TriggerClientEvent("chatMessage", xPlayer.source, _U('goto_admin', args[1]))
					TriggerClientEvent("chatMessage", xTarget.source,  _U('goto_player'))
					sendToDiscord(webhook_gt, GetPlayerName(source)..' ging naar speler.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** ging naar speler **'..xTarget.name..'** **'..xTarget.identifier..'**',62207)
      			else
        			TriggerClientEvent("chatMessage", xPlayer.source, "Dit ID is niet online.")
      			end
    		else
      			TriggerClientEvent("chatMessage", xPlayer.source, "Verkeerd ID")
    		end
	end
end, true)

--Terug naar oude locatie
RegisterCommand("gb", function(source, args, rawCommand)	-- /goback will teleport you back where you was befor /goto
	if source ~= 0 then
	  	local xPlayer = ESX.GetPlayerFromId(source)
	    	local playerCoords = savedCoords[source]
	    	if playerCoords then
	      		xPlayer.setCoords(playerCoords)
				TriggerClientEvent("chatMessage", xPlayer.source, _U('goback'))
	      		savedCoords[source] = nil
	    	end
			sendToDiscord(webhook_gb, GetPlayerName(source)..' ging terug naar vorige locatie.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** ging terug naar vorige locatie' ,62207)
	end
end, true)

---------- Bring / Bringback ----------
RegisterCommand("br", function(source, args, rawCommand)	-- /bring [ID]
	if source ~= 0 then
	  	local xPlayer = ESX.GetPlayerFromId(source)
	    	if args[1] and tonumber(args[1]) then
	      		local targetId = tonumber(args[1])
	      		local xTarget = ESX.GetPlayerFromId(targetId)
	      		if xTarget then
	        		local targetCoords = xTarget.getCoords()
	        		local playerCoords = xPlayer.getCoords()
	        		savedCoords[targetId] = targetCoords
	        		xTarget.setCoords(playerCoords)
	        		TriggerClientEvent("chatMessage", xPlayer.source, "De speler is naar je toegebracht", args[1])
	        		TriggerClientEvent("chatMessage", xTarget.source, "Je bent naar een Admin gebracht")
					sendToDiscord(webhook_br, GetPlayerName(source)..' bracht speler.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** bracht speler **'..xTarget.name..'** **'..xTarget.identifier..'**',62207)
	      		else
	        		TriggerClientEvent("chatMessage", xPlayer.source, "Speler is niet online", 'BRING')
	      		end
	    	else
	      		TriggerClientEvent("chatMessage", xPlayer.source, "Geen geldige input", 'BRING')
	  	end
	end
end, true)

RegisterCommand("bt", function(source, args, rawCommand)	-- /bringback [ID] will teleport player back where he was before /bring
	if source ~= 0 then
  		local xPlayer = ESX.GetPlayerFromId(source)
    		if args[1] and tonumber(args[1]) then
      			local targetId = tonumber(args[1])
      			local xTarget = ESX.GetPlayerFromId(targetId)
      			if xTarget then
        			local playerCoords = savedCoords[targetId]
        			if playerCoords then
          			xTarget.setCoords(playerCoords)
          			TriggerClientEvent("chatMessage", xTarget.source,  "Je bent terug gebracht", 'BRINGBACK')
          			savedCoords[targetId] = nil
					  sendToDiscord(webhook_bt, GetPlayerName(source)..' bracht speler terug.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** bracht speler **'..xTarget.name..'** **'..xTarget.identifier..'** terug' ,62207)
        		else
          			TriggerClientEvent("chatMessage", xPlayer.source, "Geen locatie om je persoon terug te brengen")
        			end
      			else
        			TriggerClientEvent("chatMessage", xPlayer.source, 'test', 'BRINGBACK')
      			end
    		else
      			TriggerClientEvent("chatMessage", xPlayer.source, "Geen geldige input", 'BRINGBACK')
  		end
	end
end, true)




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
  
	PerformHttpRequest(L0G_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end