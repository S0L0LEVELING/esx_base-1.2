ESX = nil

-- Logging to Discord 
local webhook_chatanwb = "https://discord.com/api/webhooks/893890139091238922/YSFwUI9Zz-lXw6THktbHDbIgNa7VzxrrPNGPHfpkMRv3g6K3QkeESdMSRLNulW-KeUO_"
local webhook_chatpolice = "https://discord.com/api/webhooks/893889994995945483/3Z8jwmVJXBajOWlSupxW-luVpUT35nBr_P9LCraxmRTh87Rc3tJKqpmxc8XWCTELJ9GF"
local webhook_chatmakelaar = "https://discord.com/api/webhooks/893891125516054588/qTQ2bN6IS6lUuOd3EViNt-VdlJcdFY0CJ1w97GxNNSYJx1J4hT6YA_931TVmEvTwal4J"
local webhook_chatambu = "https://discord.com/api/webhooks/893890304715948082/srTci0Aay8EFT5P70ttzVEPEo2fU6xAUOWGlKGD4hqKLq299HfpnSkhGfyr01FDv8qf4"
local webhook_chatcardealer = "https://discord.com/api/webhooks/893890725631131728/JPJ78uxG8KtRcpGffnZS9BPoE5NPyFAjJM6ho29LSm6Ne8NXrknWE4SOiiHWawN2nxjB"
local webhook_taxi = "https://discord.com/api/webhooks/893891288951324682/Q0wmDKFwtbW95VkP0DIhReTW4DWpnumavKyCCv5wLRo5-KaeM9w7idwQKQNenBbqZ7CJ" 
local webhook_chatkmar = "https://discord.com/api/webhooks/906255317740961833/f5cG1T2Rmmb4y9A9KCd6c7iI9cHXi4vjiVMUjKbsLsO832xHgkYB0Rb-KVkG993FVjUo"

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand('job', function(source, args, raw)

	local xPlayer = ESX.GetPlayerFromId(source)
	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetPlayerName(source) end

	if xPlayer["job"]["name"] == "mechanic" then
		TriggerEvent('sendtodiscord:servertrigger', webhook_chatanwb, GetPlayerName(source)..' gaf een jobbericht uit.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** Stuurde een ANWB jobbericht met inhoud: **'..name..':** **'..args..'**' ,62207)
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(209, 98, 0, 0.76); border-radius: 10px;"><i class="fas fa-address-card"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
			args = { _U('mec_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		})
	elseif xPlayer["job"]["name"] == "police" then
		TriggerEvent('sendtodiscord:servertrigger', webhook_chatpolice, GetPlayerName(source)..' gaf een jobbericht uit.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** Stuurde een Politie jobbericht met inhoud: **'..name..':** **'..args..'**' ,62207)
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(19, 109, 212, 0.76); border-radius: 10px;"><i class="fas fa-address-card"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
			args = { _U('pol_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		}) 
	elseif xPlayer["job"]["name"] == "ambulance" then
		TriggerEvent('sendtodiscord:servertrigger', webhook_chatambu, GetPlayerName(source)..' gaf een jobbericht uit.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** Stuurde een  ambulance jobbericht met inhoud: **'..name..':** **'..args..'**' ,62207)
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(217, 204, 22, 0.84); border-radius: 10px;"><i class="fas fa-address-card"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
			args = { _U('med_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		})
	elseif xPlayer["job"]["name"] == "taxi" then
		TriggerEvent('sendtodiscord:servertrigger', webhook_taxi, GetPlayerName(source)..' gaf een jobbericht uit.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** Stuurde een Taxi jobbericht met inhoud: **'..name..':** **'..args..'**' ,62207)
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(192, 186, 54, 1); border-radius: 10px;"><i class="fas fa-address-card"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
			args = { _U('tax_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		})
	elseif xPlayer["job"]["name"] == "cardealer" then
		TriggerEvent('sendtodiscord:servertrigger', webhook_chatcardealer, GetPlayerName(source)..' gaf een jobbericht uit.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** Stuurde een cardealer jobbericht met inhoud: **'..name..':** **'..args..'**' ,62207)
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(0, 255, 75, 0.6); border-radius: 10px;"><i class="fas fa-address-card"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
			args = { _U('dealer_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		})
	elseif xPlayer["job"]["name"] == "kmar" then
		TriggerEvent('sendtodiscord:servertrigger', webhook_chatkmar, GetPlayerName(source)..' gaf een jobbericht uit.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** Stuurde een Marrechaussee jobbericht met inhoud: **'..name..':** **'..args..'**' ,62207)
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(31, 90, 29, 1); border-radius: 10px;"><i class="fas fa-address-card"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
			args = { _U('kmar_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		})
	elseif xPlayer["job"]["name"] == "realestateagent" then
		TriggerEvent('sendtodiscord:servertrigger', webhook_chatmakelaar, GetPlayerName(source)..' gaf een jobbericht uit.', 'Speler **'..GetPlayerName(source)..'** **('..GetPlayerIdentifier(source)..')** Stuurde een Makelaar jobbericht met inhoud: **'..name..':** **'..args..'**' ,62207)
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.3vw; margin: 0.1vw; background-color: rgba(162, 168, 76, 1.0); border-radius: 10px;"><i class="fas fa-address-card"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
			args = { _U('mak_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		})
  end
end, false)

RegisterCommand('bedrijfsgeld', function(source)
	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.job.grade_name == 'boss' then
		local society = GetSociety(xPlayer.job.name)

		if society ~= nil then
			TriggerEvent('esx_addonaccount:getSharedAccount', society.account, function(account)
				money = account.money
			end)
		else
			money = 0
		end
		
          TriggerClientEvent('b1g_notify:client:Notify', source, { type = 'msg', text = 'Het berdijf heeft momenteel $' .. money .. ' in de pot' })

																	
	else

		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Geen toegang!'})
																			
	end
end, false)

TriggerEvent('esx_society:getSocieties', function(societies) 
	RegisteredSocieties = societies
end)

function GetSociety(name)
  for i=1, #RegisteredSocieties, 1 do
    if RegisteredSocieties[i].name == name then
      return RegisteredSocieties[i]
    end
  end
end
