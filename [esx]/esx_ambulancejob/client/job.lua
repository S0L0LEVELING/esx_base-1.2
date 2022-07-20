local CurrentAction, CurrentActionMsg, CurrentActionData = nil, '', {}
local HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum
local isBusy, deadPlayers, deadPlayerBlips, isOnDuty = false, {}, {}, false
isInShopMenu = false

function OpenAmbulanceActionsMenu()
	local elements = {{label = _U('cloakroom'), value = 'cloakroom'}}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ambulance_actions', {
		title    = _U('ambulance'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'cloakroom' then
			OpenCloakroomMenu()
		end
	end, function(data, menu)
		menu.close()
	end)
end

--[[if data.current.value == 'ass_collega_interaction' then
	local elements = {
		{label = " ⚠️   <font color='red'> NOODKNOP </font> <small>(<font color='grey'> 🚨  P1</font>) </small>   ⚠️ ",       value = 'aanvraag_noodknop_p1'},
		{label = " <font color='red'>------------------------------------------------------------------------------------------</font>     "},
		{label = "  🚑 Aanvraag <font color='red'>Ass. Collega</font> <small>(<font color='grey'> 🚨  P1</font>) </small>   🚑 ",       value = 'aanvraag_ass_collega_p1'},  
		{label = "  🚑 Aanvraag <font color='#4287f5'>Ass. Collega</font> <small>(<font color='grey'>🚑 P2</font>) </small>  🚑  ",       value = 'aanvraag_ass_collega_p2'},
		{label = "  🚑 Aanvraag <font color='#4287f5'>Ass. Collega</font> <small>(<font color='grey'>🚑 P3</font>) </small>  🚑  ",       value = 'aanvraag_ass_collega_p3'},
		{label = " <font color='red'>------------------------------------------------------------------------------------------</font>     "},
		{label = "  🚑 Aanvraag <font color='#4287f5'> Micu</font> <small>(<font color='grey'>🚨 P1</font>) </small>  🚑  ",       value = 'aanvraag_ass_collega_k9_p1'},
		{label = "  🚑 Aanvraag <font color='#4287f5'> Micu</font> <small>(<font color='grey'>🚑 P2</font>) </small>  🚑  ",       value = 'aanvraag_ass_collega_k9_p2'},
		{label = " <font color='red'>------------------------------------------------------------------------------------------</font>     "},
		{label = "  🚑 Aanvraag <font color='#4287f5'> MMT</font> <small>(<font color='grey'>🚨 P1</font>) </small>   🚑 ",       value = 'aanvraag_ass_collega_arrv'},
		{label = "  🚑 Aanvraag <font color='#4287f5'> MMT vervoer</font> <small>(<font color='grey'>🚑 P2</font>) </small>   🚑 ",       value = 'aanvraag_ass_collega_arrv_p2'},
		{label = " <font color='red'>------------------------------------------------------------------------------------------</font>     "},
		{label = "  🚒 Aanvraag <font color='#4287f5'> Brandweer</font> <small>(<font color='grey'>🚨 P1</font>) </small>  🚒  ",       value = 'aanvraag_voa_fo_p1'},
		{label = "  🚒 Aanvraag <font color='#4287f5'> Brandweer</font> <small>(<font color='grey'>🚒 P2</font>) </small>   🚒 ",       value = 'aanvraag_voa_fo_p2'}
	}

		
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ass_collega_interaction', {
		title    = _U('ass_collega_interaction'),
		align    = 'top-right',
		elements = elements
	}, function(data2, menu2)
			local action = data2.current.value
			

	if     action == 'aanvraag_noodknop_p1' then
			   menu2.close() menu.close()
				SendambulanceDistressSignal()
	elseif action == 'aanvraag_ass_collega_p1' then
			   menu2.close() menu.close()
				aanvraag_ass_collega_p1()
	elseif action == 'aanvraag_ass_collega_p2' then
			   menu2.close() menu.close()
				aanvraag_ass_collega_p2()
	elseif action == 'aanvraag_ass_collega_p3' then
			   menu2.close() menu.close()
				aanvraag_ass_collega_p3()
	elseif action == 'aanvraag_ass_collega_arrv' then
			   menu2.close() menu.close()
				aanvraag_ass_collega_arrv()
	elseif action == 'aanvraag_ass_collega_arrv_p2' then
			   menu2.close() menu.close()
				aanvraag_ass_collega_arrv_p2()
	elseif action == 'aanvraag_ass_collega_k9_p1' then
			   menu2.close() menu.close()
				aanvraag_ass_collega_k9_p1()
	elseif action == 'aanvraag_ass_collega_k9_p2' then
			   menu2.close() menu.close()
				aanvraag_ass_collega_k9_p2()
	elseif action == 'aanvraag_voa_fo_p1' then
			   menu2.close() menu.close()
				aanvraag_voa_fo_p1()
	elseif action == 'aanvraag_voa_fo_p2' then
			   menu2.close() menu.close()
				aanvraag_voa_fo_p2()

			
		end
	end, function(data2, menu2)
		menu2.close()
	end)]]

function OpenMobileAmbulanceActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_ambulance_actions', {
		title    = _U('ambulance'),
		align    = 'bottom-right',
		elements = {
			{label = _U('ems_menu'), value = 'citizen_interaction'},
			{label = _U('ass_collega_interaction'), value = 'ass_collega_interaction'}
	}}, function(data, menu)
		if data.current.value == 'citizen_interaction' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('ems_menu_title'),
				align    = 'bottom-right',
				elements = {
					{label = _U('ems_menu_revive'), value = 'revive'},
					{label = _U('ems_menu_small'), value = 'small'},
					{label = _U('ems_menu_big'), value = 'big'},
					{label = _U('ems_menu_putincar'), value = 'put_in_vehicle'},
					{label = 'Zet persoon in narcose', value = 'narcose'},
					{label = 'Brandcard Menu',	  value = 'brancard'},
					{label = 'Verklaar persoon dood', value = 'doodverklaren'}
			}}, function(data, menu)
				if isBusy then return end

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if data.current.value == 'brancard' then
					BrandcardMenu()
				elseif closestPlayer == -1 or closestDistance > 1.0 then
					ESX.ShowNotification("~r~Er zijn geen spelers in de buurt")
				else
					if data.current.value == 'revive' then
						revivePlayer(closestPlayer)
					elseif data.current.value == 'small' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									isBusy = true
									ESX.ShowNotification(_U('heal_inprogress'))
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Citizen.Wait(10000)
									ClearPedTasks(playerPed)

									TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									isBusy = false
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end
							else
								ESX.ShowNotification(_U('not_enough_bandage'))
							end
						end, 'bandage')

					elseif data.current.value == 'doodverklaren' then
						local closestPlayerPed = GetPlayerPed(closestPlayer)
						local health = GetEntityHealth(closestPlayerPed)

						if health < 1 then
							TriggerServerEvent('3dme:shareDisplay', "* Verklaard persoon dood *")
							TriggerServerEvent('esx_ambulancejob:doodverklaard', GetPlayerServerId(closestPlayer))
						else
							ESX.ShowNotification("~r~De speler is niet dood!")
						end
					elseif data.current.value == 'big' then
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									isBusy = true
									ESX.ShowNotification(_U('heal_inprogress'))
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Citizen.Wait(10000)
									ClearPedTasks(playerPed)

									TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									isBusy = false
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end
							else
								ESX.ShowNotification(_U('not_enough_medikit'))
							end
						end, 'medikit')

					elseif data.current.value == 'put_in_vehicle' then
						TriggerServerEvent('esx_ambulancejob:putInVehicle', GetPlayerServerId(closestPlayer))
					elseif data.current.value == 'narcose' then
						local closestPlayerPed = GetPlayerPed(closestPlayer)
						local playerPed = PlayerPedId()

						IsBusy = true
						ESX.ShowNotification("~y~Patient~s~ wordt in ~g~narcose~s~ gelegd.")
						TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 0, true)
						Citizen.Wait(10000)
						ClearPedTasks(playerPed)

						TriggerServerEvent('esx_ambulancejob:narcose', GetPlayerServerId(closestPlayer))
						IsBusy = false
					end
				end
			end, function(data, menu)
				menu.close()
			end)
		end

	end, function(data, menu)
		menu.close()
	end)
end

function BrandcardMenu()

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'brancard',
	{
		title		= 'Brancard',
		align		= 'bottom-right',
		elements	= {
			{label = 'Pak Brancard', value = 'brancardpakken'},
			{label = 'Verwijder Brancard', value = 'brancarddelete'}
		}
	}, function(data, menu)
		if data.current.value == 'brancardpakken' then
			local coords = GetEntityCoords(PlayerPedId())
			LoadModel('prop_ld_binbag_01')
			CreateObject(GetHashKey('trump-stretcher'), coords.x + 1, coords.y, coords.z - 1, true)
		elseif data.current.value == 'brancarddelete' then
			local brancardtry = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 10.0, GetHashKey('trump-stretcher'))
			if DoesEntityExist(brancardtry) then 
				DeleteEntity(brancardtry)
				ESX.ShowNotification("De ~y~brancard~s~ is met ~g~succes~s~ verwijderd!")
			else
				ESX.ShowNotification("Er is ~r~geen ~y~brancard~s~ gevonden")
			end
		end
	end, function(data, menu)
		menu.close()
	end)
end

function revivePlayer(closestPlayer)
	isBusy = true

	ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
		if quantity > 0 then
			local closestPlayerPed = GetPlayerPed(closestPlayer)

			if IsPedDeadOrDying(closestPlayerPed, 1) then
				local playerPed = PlayerPedId()
				local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'
				ESX.ShowNotification(_U('revive_inprogress'))

				for i=1, 15 do
					Citizen.Wait(900)

					ESX.Streaming.RequestAnimDict(lib, function()
						TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
					end)
				end

				TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
				TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
			else
				ESX.ShowNotification(_U('player_not_unconscious'))
			end
		else
			ESX.ShowNotification(_U('not_enough_medikit'))
		end
		isBusy = false
	end, 'medikit')
end

function FastTravel(coords, heading)
	local playerPed = PlayerPedId()

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Citizen.Wait(500)
	end

	ESX.Game.Teleport(playerPed, coords, function()
		DoScreenFadeIn(800)

		if heading then
			SetEntityHeading(playerPed, heading)
		end
	end)
end

-- Draw markers & Marker logic
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
			local playerCoords = GetEntityCoords(PlayerPedId())
			local letSleep, isInMarker, hasExited = true, false, false
			local currentHospital, currentPart, currentPartNum

			for hospitalNum,hospital in pairs(Config.Hospitals) do
				-- Ambulance Actions
				for k,v in ipairs(hospital.AmbulanceActions) do
					local distance = #(playerCoords - v)

					if distance < Config.DrawDistance then
						DrawMarker(Config.Marker.type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, Config.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < Config.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'AmbulanceActions', k
						end
					end
				end

				-- Pharmacies
				for k,v in ipairs(hospital.Pharmacies) do
					local distance = #(playerCoords - v)

					if distance < Config.DrawDistance then
						DrawMarker(Config.Marker.type, v, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, Config.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < Config.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Pharmacy', k
						end
					end
				end

				-- Vehicle Spawners
				for k,v in ipairs(hospital.Vehicles) do
					local distance = #(playerCoords - v.Spawner)

					if distance < Config.DrawDistance then
						DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < v.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Vehicles', k
						end
					end
				end

				-- Helicopter Spawners
				for k,v in ipairs(hospital.Helicopters) do
					local distance = #(playerCoords - v.Spawner)

					if distance < Config.DrawDistance then
						DrawMarker(v.Marker.type, v.Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < v.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'Helicopters', k
						end
					end
				end

				-- Fast Travels (Prompt)
				for k,v in ipairs(hospital.FastTravelsPrompt) do
					local distance = #(playerCoords - v.From)

					if distance < Config.DrawDistance then
						DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
						letSleep = false

						if distance < v.Marker.x then
							isInMarker, currentHospital, currentPart, currentPartNum = true, hospitalNum, 'FastTravelsPrompt', k
						end
					end
				end
			end

			-- Logic for exiting & entering markers
			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
				if
					(LastHospital ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
					(LastHospital ~= currentHospital or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_ambulancejob:hasExitedMarker', LastHospital, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker, LastHospital, LastPart, LastPartNum = true, currentHospital, currentPart, currentPartNum

				TriggerEvent('esx_ambulancejob:hasEnteredMarker', currentHospital, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_ambulancejob:hasExitedMarker', LastHospital, LastPart, LastPartNum)
			end

			if letSleep then
				Citizen.Wait(500)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Fast travels
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords, letSleep = GetEntityCoords(PlayerPedId()), true

		for hospitalNum,hospital in pairs(Config.Hospitals) do
			-- Fast Travels
			for k,v in ipairs(hospital.FastTravels) do
				local distance = #(playerCoords - v.From)

				if distance < Config.DrawDistance then
					DrawMarker(v.Marker.type, v.From, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
					letSleep = false

					if distance < v.Marker.x then
						FastTravel(v.To.coords, v.To.heading)
					end
				end
			end
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)

AddEventHandler('esx_ambulancejob:hasEnteredMarker', function(hospital, part, partNum)
	if part == 'AmbulanceActions' then
		CurrentAction = part
		CurrentActionMsg = _U('actions_prompt')
		CurrentActionData = {}
	elseif part == 'Pharmacy' then
		CurrentAction = part
		CurrentActionMsg = _U('open_pharmacy')
		CurrentActionData = {}
	elseif part == 'Vehicles' then
		CurrentAction = part
		CurrentActionMsg = _U('garage_prompt')
		CurrentActionData = {hospital = hospital, partNum = partNum}
	elseif part == 'Helicopters' then
		CurrentAction = part
		CurrentActionMsg = _U('helicopter_prompt')
		CurrentActionData = {hospital = hospital, partNum = partNum}
	elseif part == 'FastTravelsPrompt' then
		local travelItem = Config.Hospitals[hospital][part][partNum]

		CurrentAction = part
		CurrentActionMsg = travelItem.Prompt
		CurrentActionData = {to = travelItem.To.coords, heading = travelItem.To.heading}
	end
end)

AddEventHandler('esx_ambulancejob:hasExitedMarker', function(hospital, part, partNum)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'AmbulanceActions' then
					OpenAmbulanceActionsMenu()
				elseif CurrentAction == 'Pharmacy' then
					OpenPharmacyMenu()
				elseif CurrentAction == 'Vehicles' then
					OpenVehicleSpawnerMenu('car', CurrentActionData.hospital, CurrentAction, CurrentActionData.partNum)
				elseif CurrentAction == 'Helicopters' then
					OpenVehicleSpawnerMenu('helicopter', CurrentActionData.hospital, CurrentAction, CurrentActionData.partNum)
				elseif CurrentAction == 'FastTravelsPrompt' then
					FastTravel(CurrentActionData.to, CurrentActionData.heading)
				end

				CurrentAction = nil
			end

		elseif ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' and not isDead then
			if IsControlJustReleased(0, 167) then
				OpenMobileAmbulanceActionsMenu()
			end
		else
			Citizen.Wait(500)
		end
		if IsControlJustReleased(0, 166) and ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
			SendAmbulanceDistressSignal()
	  end
	end
end)

RegisterNetEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if IsAnyVehicleNearPoint(coords, 5.0) then
		local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
			end
		end
	end
end)

function OpenCloakroomMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'bottom-right',
		elements = {
			{label = _U('ems_clothes_civil'), value = 'citizen_wear'},
			{label = _U('ems_clothes_ems'), value = 'ambulance_wear'},
	}}, function(data, menu)
		if data.current.value == 'citizen_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
				isOnDuty = false
				exports["rp-radio"]:RemovePlayerAccessToFrequencies(1, 2, 3, 4, 5, 7, 8, 9, 10)

				for playerId,v in pairs(deadPlayerBlips) do
					RemoveBlip(v)
					deadPlayerBlips[playerId] = nil
				end
			end)
		elseif data.current.value == 'ambulance_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
				end

				isOnDuty = true
				TriggerEvent('esx_ambulancejob:setDeadPlayers', deadPlayers)
			end)
		end

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

function OpenPharmacyMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy', {
		title    = _U('pharmacy_menu_title'),
		align    = 'bottom-right',
		elements = {
			{label = _U('pharmacy_take', _U('medikit')), item = 'medikit', type = 'slider', value = 1, min = 1, max = 100},
			{label = _U('pharmacy_take', _U('bandage')), item = 'bandage', type = 'slider', value = 1, min = 1, max = 100}
	}}, function(data, menu)
		TriggerServerEvent('esx_ambulancejob:giveItem', data.current.item, data.current.value)
	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(healType, quiet)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	end

	if not quiet then
		ESX.ShowNotification(_U('healed'))
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	if isOnDuty and job ~= 'ambulance' then
		for playerId,v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		isOnDuty = false
		exports["rp-radio"]:RemovePlayerAccessToFrequencies(1, 2, 3, 4, 5, 7, 8, 9, 10)
	end
end)

RegisterNetEvent('esx_ambulancejob:setDeadPlayers')
AddEventHandler('esx_ambulancejob:setDeadPlayers', function(_deadPlayers)
	deadPlayers = _deadPlayers

	if isOnDuty then
		for playerId,v in pairs(deadPlayerBlips) do
			RemoveBlip(v)
			deadPlayerBlips[playerId] = nil
		end

		for playerId,status in pairs(deadPlayers) do
			if status == 'distress' then
				local player = GetPlayerFromServerId(playerId)
				local playerPed = GetPlayerPed(player)
				local blip = AddBlipForEntity(playerPed)

				SetBlipSprite(blip, 303)
				SetBlipColour(blip, 1)
				SetBlipFlashes(blip, true)
				SetBlipCategory(blip, 7)

				BeginTextCommandSetBlipName('STRING')
				AddTextComponentSubstringPlayerName(_U('blip_dead'))
				EndTextCommandSetBlipName(blip)

				deadPlayerBlips[playerId] = blip
			end
		end
	end
end)


RegisterNetEvent('ambu:revive')
AddEventHandler('ambu:revive', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

		if closestPlayer == -1 or closestDistance > 2.0 then
			ESX.ShowNotification(_U('no_players'))
		else
				revivePlayer(closestPlayer)
		end
end)

RegisterNetEvent('ambu:small')
AddEventHandler('ambu:small', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer == -1 or closestDistance > 1.0 then
					ESX.ShowNotification(_U('no_players'))
				else
				ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity < 0 or quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									isBusy = true
									ESX.ShowNotification(_U('heal_inprogress'))
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Citizen.Wait(10000)
									ClearPedTasks(playerPed)

									TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									isBusy = false
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end
							else
								ESX.ShowNotification(_U('not_enough_bandage'))
							end
						end, 'bandage')
	end
end)

RegisterNetEvent('ambu:big')
AddEventHandler('ambu:big', function()
local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if closestPlayer == -1 or closestDistance > 1.0 then
					ESX.ShowNotification(_U('no_players'))
				else
				ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									isBusy = true
									ESX.ShowNotification(_U('heal_inprogress'))
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Citizen.Wait(10000)
									ClearPedTasks(playerPed)

									TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									isBusy = false
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end
							else
								ESX.ShowNotification(_U('not_enough_medikit'))
							end
						end, 'medikit')
				end
end)

function setUniform(job, playerPed)
  TriggerEvent('skinchanger:getSkin', function(skin)

    if skin.sex == 0 then
      if Config.Uniforms[job].male ~= nil then
        TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
      else
        ESX.ShowNotification(_U('no_outfit'))
      end
      if job == 'bullet_wear' then
        SetPedArmour(playerPed, 100)
      end
    else
      if Config.Uniforms[job].female ~= nil then
        TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
      else
        ESX.ShowNotification(_U('no_outfit'))
      end
      if job == 'bullet_wear' then
        SetPedArmour(playerPed, 100)
      end
    end

  end)
end

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

-- Rolstoel

Citizen.CreateThread(function()
	while true do
		local sleep = 500

		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)

		local closestObject = GetClosestObjectOfType(pedCoords, 3.0, GetHashKey("prop_wheelchair_01"), false)

		if DoesEntityExist(closestObject) then
			sleep = 5

			local wheelChairCoords = GetEntityCoords(closestObject)
			local wheelChairForward = GetEntityForwardVector(closestObject)
			
			local sitCoords = (wheelChairCoords + wheelChairForward * - 0.5)
			local pickupCoords = (wheelChairCoords + wheelChairForward * 0.3)

			if GetDistanceBetweenCoords(pedCoords, sitCoords, true) <= 1.0 then
				DrawText3Ds(sitCoords, "[E] Zitten", 0.4)

				if IsControlJustPressed(0, 38) then
					Sit(closestObject)
				end
			end

			if GetDistanceBetweenCoords(pedCoords, pickupCoords, true) <= 1.0 then
				DrawText3Ds(pickupCoords, "[E] Duwen", 0.4)

				if IsControlJustPressed(0, 38) then
					PickUp(closestObject)
				end
			end
		end

		Citizen.Wait(sleep)
	end
end)

Sit = function(wheelchairObject)
	local closestPlayer, closestPlayerDist = GetClosestPlayer()

	if closestPlayer ~= nil and closestPlayerDist <= 1.5 then
		if IsEntityPlayingAnim(GetPlayerPed(closestPlayer), 'missfinale_c2leadinoutfin_c_int', '_leadin_loop2_lester', 3) then
			ShowNotification("Iemand gebruikt deze rolstoel al!")
			return
		end
	end

	LoadAnim("missfinale_c2leadinoutfin_c_int")

	AttachEntityToEntity(PlayerPedId(), wheelchairObject, 0, 0, 0.0, 0.4, 0.0, 0.0, 180.0, 0.0, false, false, false, false, 2, true)

	local heading = GetEntityHeading(wheelchairObject)

	while IsEntityAttachedToEntity(PlayerPedId(), wheelchairObject) do
		Citizen.Wait(5)

		if IsPedDeadOrDying(PlayerPedId()) then
			DetachEntity(PlayerPedId(), true, true)
		end

		if not IsEntityPlayingAnim(PlayerPedId(), 'missfinale_c2leadinoutfin_c_int', '_leadin_loop2_lester', 3) then
			TaskPlayAnim(PlayerPedId(), 'missfinale_c2leadinoutfin_c_int', '_leadin_loop2_lester', 8.0, 8.0, -1, 69, 1, false, false, false)
		end

		if IsControlPressed(0, 32) then
			local x, y, z  = table.unpack(GetEntityCoords(wheelchairObject) + GetEntityForwardVector(wheelchairObject) * -0.02)
			SetEntityCoords(wheelchairObject, x,y,z)
			PlaceObjectOnGroundProperly(wheelchairObject)
		end

		if IsControlPressed(1,  34) then
			heading = heading + 0.4

			if heading > 360 then
				heading = 0
			end

			SetEntityHeading(wheelchairObject,  heading)
		end

		if IsControlPressed(1,  9) then
			heading = heading - 0.4

			if heading < 0 then
				heading = 360
			end

			SetEntityHeading(wheelchairObject,  heading)
		end

		if IsControlJustPressed(0, 73) then
			DetachEntity(PlayerPedId(), true, true)

			local x, y, z = table.unpack(GetEntityCoords(wheelchairObject) + GetEntityForwardVector(wheelchairObject) * - 0.7)

			SetEntityCoords(PlayerPedId(), x,y,z)
		end
	end
end

PickUp = function(wheelchairObject)
	local closestPlayer, closestPlayerDist = GetClosestPlayer()

	if closestPlayer ~= nil and closestPlayerDist <= 1.5 then
		if IsEntityPlayingAnim(GetPlayerPed(closestPlayer), 'anim@heists@box_carry@', 'idle', 3) then
			ShowNotification("Iemand zit al in de rolstoel!")
			return
		end
	end

	NetworkRequestControlOfEntity(wheelchairObject)

	LoadAnim("anim@heists@box_carry@")

	AttachEntityToEntity(wheelchairObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), -0.00, -0.3, -0.73, 195.0, 180.0, 180.0, 0.0, false, false, true, false, 2, true)

	while IsEntityAttachedToEntity(wheelchairObject, PlayerPedId()) do
		Citizen.Wait(5)

		if not IsEntityPlayingAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 3) then
			TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 8.0, 8.0, -1, 50, 0, false, false, false)
		end

		if IsPedDeadOrDying(PlayerPedId()) then
			DetachEntity(wheelchairObject, true, true)
		end

		if IsControlJustPressed(0, 73) then
			DetachEntity(wheelchairObject, true, true)
		end
	end
end

DrawText3Ds = function(coords, text, scale)
	local x,y,z = coords.x, coords.y, coords.z
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 215)

	AddTextComponentString(text)
	DrawText(_x, _y)

	local factor = (string.len(text)) / 370

	DrawRect(_x, _y + 0.0150, 0.030 + factor, 0.025, 41, 11, 41, 100)
end

GetPlayers = function()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

GetClosestPlayer = function()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance
end

LoadAnim = function(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		
		Citizen.Wait(1)
	end
end

LoadModel = function(model)
	while not HasModelLoaded(model) do
		RequestModel(model)
		
		Citizen.Wait(1)
	end
end

ShowNotification = function(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringWebsite(msg)
	DrawNotification(false, true)
end
--Noodknop 
function SendAmbulanceDistressSignal()
	local playerPed = PlayerPedId()
	PedPosition		= GetEntityCoords(playerPed)
	
	local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }

	exports['b1g_notify']:Notify('dispatch', _U('distress_sent'))

	TriggerServerEvent('esx_addons_gcphone:startCall', 'ambulance', _U('ambulance_distress_message'), PlayerCoords, {

		PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
	})
end

function aanvraag_ass_collega_p1()
	local playerPed = GetPlayerPed(-1)
	local coords	= GetEntityCoords(playerPed)

	ESX.ShowNotification(_U('distress_sent_p1'))
 --   exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
	Citizen.Wait(1000)
 --   exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
	exports['mythic_notify']:DoHudText('success', ' 📢 Oproep is succesvol verzonden.')

	TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
	TriggerServerEvent('esx_phone:send', 'ambulance', _U('p1nk_distress_message'), false, {
		x = coords.x,
		y = coords.y,
		z = coords.z
	})
end


function aanvraag_ass_collega_p2()
	local playerPed = GetPlayerPed(-1)
	local coords	= GetEntityCoords(playerPed)

	ESX.ShowNotification(_U('distress_sent_p2'))
--    exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
	Citizen.Wait(1000)
--    exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
	exports['mythic_notify']:DoHudText('success', ' 📢 Oproep is succesvol verzonden.')
	
	TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
	TriggerServerEvent('esx_phone:send', 'ambulance', _U('p2nk_distress_message'), false, {
		x = coords.x,
		y = coords.y,
		z = coords.z
	})
end


function aanvraag_ass_collega_p3()
	local playerPed = GetPlayerPed(-1)
	local coords	= GetEntityCoords(playerPed)

	ESX.ShowNotification(_U('distress_sent_p3'))
--    exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
	Citizen.Wait(1000)
 --   exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
	exports['mythic_notify']:DoHudText('success', ' 📢 Oproep is succesvol verzonden.')
   
	TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
	TriggerServerEvent('esx_phone:send', 'ambulance', _U('p3nk_distress_message'), false, {
		x = coords.x,
		y = coords.y,
		z = coords.z
	})
end


function aanvraag_ass_collega_arrv()
	local playerPed = GetPlayerPed(-1)
	local coords	= GetEntityCoords(playerPed)

	ESX.ShowNotification(_U('distress_sent_cpvervoer'))
 --   exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
	Citizen.Wait(1000)
--    exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
	exports['mythic_notify']:DoHudText('success', ' 📢 Oproep is succesvol verzonden.')
  
	TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
	TriggerServerEvent('esx_phone:send', 'ambulance', _U('cpvervoer_distress_message'), false, {
		x = coords.x,
		y = coords.y,
		z = coords.z
	})
end


function aanvraag_ass_collega_arrv_p2()
	local playerPed = GetPlayerPed(-1)
	local coords	= GetEntityCoords(playerPed)

	ESX.ShowNotification(_U('distress_sent_cpvervoer_p2'))
 --   exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
	Citizen.Wait(1000)
 --   exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
	exports['mythic_notify']:DoHudText('success', ' 📢 Oproep is succesvol verzonden.')
  
	TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
	TriggerServerEvent('esx_phone:send', 'ambulance', _U('cpvervoer_p2_distress_message'), false, {
		x = coords.x,
		y = coords.y,
		z = coords.z
	})
end

function aanvraag_ass_collega_k9_p1()
	local playerPed = GetPlayerPed(-1)
	local coords	= GetEntityCoords(playerPed)

	ESX.ShowNotification(_U('distress_sent_k9_p1'))
 --   exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
	Citizen.Wait(1000)
 --   exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
	exports['mythic_notify']:DoHudText('success', ' 📢 Oproep is succesvol verzonden.')

	TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
	TriggerServerEvent('esx_phone:send', 'ambulance', _U('k9_p1_distress_message'), false, {
		x = coords.x,
		y = coords.y,
		z = coords.z
	})
end

function aanvraag_ass_collega_k9_p2()
	local playerPed = GetPlayerPed(-1)
	local coords	= GetEntityCoords(playerPed)

	ESX.ShowNotification(_U('distress_sent_k9_p2'))
 --   exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
	Citizen.Wait(1000)
 --   exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
	exports['mythic_notify']:DoHudText('success', ' 📢 Oproep is succesvol verzonden.')
	
	TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
	TriggerServerEvent('esx_phone:send', 'ambulance', _U('k9_p2_distress_message'), false, {
		x = coords.x,
		y = coords.y,
		z = coords.z
	})
end



function aanvraag_voa_fo_p1()
	local playerPed = GetPlayerPed(-1)
	local coords	= GetEntityCoords(playerPed)

	ESX.ShowNotification(_U('distress_sent_voa_fo_p1'))
 --   exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
	Citizen.Wait(1000)
  --  exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
	exports['mythic_notify']:DoHudText('success', ' 📢 Oproep is succesvol verzonden.')
	
	TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
	TriggerServerEvent('esx_phone:send', 'ambulance', _U('voa_fo_p1_distress_message'), false, {
		x = coords.x,
		y = coords.y,
		z = coords.z
	})
end



function aanvraag_voa_fo_p2()
	local playerPed = GetPlayerPed(-1)
	local coords	= GetEntityCoords(playerPed)

	ESX.ShowNotification(_U('distress_sent_voa_fo_p2'))
  --  exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
	Citizen.Wait(1000)
  --  exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
	exports['mythic_notify']:DoHudText('success', ' 📢 Oproep is succesvol verzonden.')
	
	TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
	TriggerServerEvent('esx_phone:send', 'ambulance', _U('voa_fo_p1_distress_message'), false, {
		x = coords.x,
		y = coords.y,
		z = coords.z
	})
end

-- noodknop
function SendambulanceDistressSignal()
	local playerPed = GetPlayerPed(-1)
	local coords	= GetEntityCoords(playerPed)

	ESX.ShowNotification(_U('distress_sent'))
   -- exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
	Citizen.Wait(1000)
  --  exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
	exports['mythic_notify']:DoHudText('success', ' 📢 Oproep is succesvol verzonden.')
	
	TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
	TriggerServerEvent('esx_phone:send', 'ambulance', _U('ambulance_distress_message'), false, {
		x = coords.x,
		y = coords.y,
		z = coords.z
	})
	TriggerServerEvent('esx_phone:send', 'police', _U('ambulance_distress_message'), false, {
		x = coords.x,
		y = coords.y,
		z = coords.z
	})
	TriggerServerEvent('esx_phone:send', 'kmar', _U('ambulance_distress_message'), false, {
		x = coords.x,
		y = coords.y,
		z = coords.z
	})
end