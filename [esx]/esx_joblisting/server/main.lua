ESX = nil
local availableJobs = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT name, label FROM jobs WHERE whitelisted = @whitelisted', {
		['@whitelisted'] = false
	}, function(result)
		for i=1, #result, 1 do
			table.insert(availableJobs, {
				job = result[i].name,
				label = result[i].label
			})
		end
	end)
end)

ESX.RegisterServerCallback('esx_joblisting:getJobsList', function(source, cb)
	cb(availableJobs)
end)

RegisterServerEvent('esx_joblisting:setJob')
AddEventHandler('esx_joblisting:setJob', function(job)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		for k,v in ipairs(availableJobs) do
			if v.job == job then
				xPlayer.setJob(job, 0)
				 sendToDiscord("https://discord.com/api/webhooks/904804714506502165/TCadAaXx-GSw2_5STo_myEMVpM-28qGxaK5jcbGiSdppCZIATO2yZOj715p0Zh9LPuLE", xPlayer.name..' Zette zichzelf op een job bij UWV.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** heeft zichzelf op de volgende job gezet: **'..job..'**',762640)
				break
			end
		end
	end
end)



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