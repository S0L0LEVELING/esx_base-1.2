ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('es:invalidCommandHandler', function(source, command_args, user)
	CancelEvent()
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', _U('unknown_command', command_args[1]) } })
end)


--
RegisterCommand('intentar', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end
	local result = math.random(1, 2)
	local resultMessages = {"^*^2Éxito", "^*^1Fallido"}
	local resultMessage = resultMessages[result]

	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('try_prefix', name), '^*'..args, { 255, 255, 255 }, true, 'try', { 255, 128, 0 }) -- { 255, 128, 0 }
	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, '^* Resultado', ' '..resultMessage, { 255, 255, 255 }, true, 'res', { 255, 128, 0 })
	--print(('%s: %s'):format(name, args))
end, false)
--


--
RegisterCommand('ooc', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', name), args, { 255, 0, 0 })
	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('ooc_prefix', name), args, { 128, 128, 128 })
	TriggerClientEvent('chat:addMessage', -1, { 
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}: {1}</div>', --{0}:<br> {1}</div>
		args = { _U('ooc_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
	})
	--print(('%s: %s'):format(name, args))
end, false)
--

RegisterCommand('twt', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('chat:addMessage', -1, {
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(28, 160, 242, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> {0}: {1}</div>', --{0}:<br> {1}
		args = { _U('twt_prefix', name), '^*'..args }, color = { 255, 255, 255 } --{ 0, 153, 204 }
	})

	--TriggerClientEvent('chat:addMessage', -1, { args = { _U('twt_prefix', name), '^*  '..args }, color = { 0, 153, 204 } }) --{0, 153, 204}  '^*^4'
	-- print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('anontwt', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('chat:addMessage', -1, {
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(2, 69, 202, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> {0}: {1}</div>', --@{0}:<br> {1}
		args = { _U('anontwt_prefix', name), '^*'..args }, color = { 255, 255, 255 } --{ 0, 153, 204 }
	})

	--TriggerClientEvent('chat:addMessage', -1, { args = { _U('twt_prefix', name), '^*  '..args }, color = { 0, 153, 204 } }) --{0, 153, 204}  '^*^4'
	-- print(('%s: %s'):format(name, args))
end, false)

-- Twitter -> Anoniem twitter --


-- Junior Moderator -> Hoofd Moderator --


	RegisterCommand('jmod', function(source, args, rawCommand)
		
		if source == 0 then
			print('esx_rpchat: you can\'t use this command from rcon!')
			return
		end
	
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end
	
		--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', name), args, { 255, 0, 0 })
		--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('ooc_prefix', name), args, { 128, 128, 128 })
		
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(66, 255, 0, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}: {1}</div>', --{0}:<br> {1}</div>
			args = { _U('jmod_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		})
		--print(('%s: %s'):format(name, args))
	end, false)

	RegisterCommand('mod', function(source, args, rawCommand)
		
		if source == 0 then
			print('esx_rpchat: you can\'t use this command from rcon!')
			return
		end
	
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end
	
		--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', name), args, { 255, 0, 0 })
		--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('ooc_prefix', name), args, { 128, 128, 128 })
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(66, 255, 0, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}: {1}</div>', --{0}:<br> {1}</div>
			args = { _U('mod_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		})
		--print(('%s: %s'):format(name, args))
	end, false)




	RegisterCommand('smod', function(source, args, rawCommand)

		if source == 0 then
			print('esx_rpchat: you can\'t use this command from rcon!')
			return
		end
	
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end
	
		--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', name), args, { 255, 0, 0 })
		--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('ooc_prefix', name), args, { 128, 128, 128 })
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 124, 34, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}: {1}</div>', --{0}:<br> {1}</div>
			args = { _U('smod_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
		})
		--print(('%s: %s'):format(name, args))

end, false) 

RegisterCommand('hmod', function(source, args, rawCommand)

	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', name), args, { 255, 0, 0 })
	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('ooc_prefix', name), args, { 128, 128, 128 })
	TriggerClientEvent('chat:addMessage', -1, { 
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 124, 34, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}: {1}</div>', --{0}:<br> {1}</div>
		args = { _U('hmod_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
	})
	--print(('%s: %s'):format(name, args))

end, false) 

-- Junior Moderator -> Hoofd Moderator --

---------------------------------------------------------------------------------------------------------------------------

-- Junior Mangement -> Senior Mangement chat --

RegisterCommand('jman', function(source, args, rawCommand)

	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', name), args, { 255, 0, 0 })
	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('ooc_prefix', name), args, { 128, 128, 128 })
	TriggerClientEvent('chat:addMessage', -1, { 
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(143, 47, 218, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}: {1}</div>', --{0}:<br> {1}</div>
		args = { _U('jman_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
	})
	--print(('%s: %s'):format(name, args))
end, false) 

RegisterCommand('man', function(source, args, rawCommand)

	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', name), args, { 255, 0, 0 })
	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('ooc_prefix', name), args, { 128, 128, 128 })
	TriggerClientEvent('chat:addMessage', -1, { 
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(143, 47, 218, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}: {1}</div>', --{0}:<br> {1}</div>
		args = { _U('man_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
	})
	--print(('%s: %s'):format(name, args))
end, false) 

RegisterCommand('sman', function(source, args, rawCommand)

	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', name), args, { 255, 0, 0 })
	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('ooc_prefix', name), args, { 128, 128, 128 })
	TriggerClientEvent('chat:addMessage', -1, { 
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(146, 24, 255, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}: {1}</div>', --{0}:<br> {1}</div>
		args = { _U('sman_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
	})
	--print(('%s: %s'):format(name, args))
end, false)

-- Junior Mangement -> Senior Mangement chat --

-------------------------------------------------------------------------------------------------------------

-- Developer -> Hoofd Developer --

RegisterCommand('dev', function(source, args, rawCommand)
	
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', name), args, { 255, 0, 0 })
	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('ooc_prefix', name), args, { 128, 128, 128 })
	TriggerClientEvent('chat:addMessage', -1, { 
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 204, 230, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}: {1}</div>', --{0}:<br> {1}</div>
		args = { _U('dev_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
	})
	--print(('%s: %s'):format(name, args))
end, false) 

RegisterCommand('hdev', function(source, args, rawCommand)

	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', name), args, { 255, 0, 0 })
	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('ooc_prefix', name), args, { 128, 128, 128 })
	TriggerClientEvent('chat:addMessage', -1, { 
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 225, 255, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}: {1}</div>', --{0}:<br> {1}</div>
		args = { _U('hdev_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
	})
	--print(('%s: %s'):format(name, args))
end, false) 

-- Developer -> Hoofd Developer --

-----------------------------------------------------------------------------------------------------------------------

-- Asst. Hoofd Mangement -> Beheer --

RegisterCommand('ahman', function(source, args, rawCommand)
	
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', name), args, { 255, 0, 0 })
	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('ooc_prefix', name), args, { 128, 128, 128 })
	TriggerClientEvent('chat:addMessage', -1, { 
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 139, 240, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}: {1}</div>', --{0}:<br> {1}</div>
		args = { _U('ahman_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
	})
	print(('%s: %s'):format(name, args))
end, false) 






RegisterCommand('hman', function(source, args, rawCommand)

	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', name), args, { 255, 0, 0 })
	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('ooc_prefix', name), args, { 128, 128, 128 })
	TriggerClientEvent('chat:addMessage', -1, { 
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 0, 250, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}: {1}</div>', --{0}:<br> {1}</div>
		args = { _U('hman_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
	})
	-- print(('%s: %s'):format(name, args))
end, false) 

RegisterCommand('beh', function(source, args, rawCommand)

	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', name), args, { 255, 0, 0 })
	--TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('ooc_prefix', name), args, { 128, 128, 128 }) 
	TriggerClientEvent('chat:addMessage', -1, { 
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 30, 0, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}: {1}</div>', --{0}:<br> {1}</div>
		args = { _U('beh_prefix', name), '^*'..args }, color = { 255, 255, 255 } -- 128, 128, 128
	})
	--print(('%s: %s'):format(name, args))
end, false) 

-- Asst. Hoofd Mangement -> Beheer --

--------------------------------------------------------------------------------------------------------------


RegisterCommand('ad', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local xPlayer = ESX.GetPlayerFromId(source)
	local costo = 500000
	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	if xPlayer.getAccount('bank').money >= costo then
		xPlayer.removeAccountMoney('bank', costo)
		TriggerClientEvent('chat:clear', -1)
		TriggerClientEvent('chat:addMessage', -1, { 
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 255, 255, 1.0); border-radius: 3px; text-align: center;"><i class="fas fa-ad"></i> {0}<br><br> {1}</div>',
			args = { _U('ad_prefix'), '^*^11'..args }, color = {0, 0, 0} 
		})
		xPlayer.showNotification('U heeft een advertentie geplaatst voor €'..costo..'')
	else
		xPlayer.showNotification('U heeft niet genoeg geld om een ​​advertentie te plaatsen')
	end
end, false)

RegisterCommand('me', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('me_prefix', name), '^*'..args, { 255, 255, 255 }, true, 'me', { 170, 102, 204 }) --{255, 0 , 0} ^*^6 --{ 170, 102, 204 }
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('do', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, _U('do_prefix', name), '^*'..args, { 255, 255, 255 }, true, 'do', { 255, 187, 51 }) --{0, 0, 255} ^*^3 --{ 255, 187, 51 }
	--print(('%s: %s'):format(name, args))
end, false)

function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		if Config.OnlyFirstname then
			return result[1].firstname
		else
			return ('%s %s'):format(result[1].firstname, result[1].lastname)
		end
	else
		return GetPlayerName(source)
	end
end
