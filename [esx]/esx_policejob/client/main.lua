local CurrentActionData, handcuffTimer, dragStatus, blipsCops, currentTask = {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker, isDead, isHandcuffed, hasAlreadyJoined, playerInService = false, false, false, false, false
local LastStation, LastPart, LastPartNum, LastEntity, CurrentAction, CurrentActionMsg
dragStatus.isDragged, isInShopMenu = false, false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function setUniform(uniform, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		local uniformObject

		if skin.sex == 0 then
			uniformObject = Config.Uniforms[uniform].male
		else
			uniformObject = Config.Uniforms[uniform].female
		end

		if uniformObject then
			TriggerEvent('skinchanger:loadClothes', skin, uniformObject)

			if uniform == 'bullet_wear' then
				SetPedArmour(playerPed, 100)
			end
		else
			ESX.ShowNotification(_U('no_outfit'))
		end
	end)
end

function OpenCloakroomMenu()
	local playerPed = PlayerPedId()
	local grade = ESX.PlayerData.job.grade_name

	local elements = {
		{label = _U('citizen_wear'), value = 'citizen_wear'}--,
--		{label = _U('police_wear'), uniform = grade}
	}

	if Config.EnableCustomPeds then
		for k,v in ipairs(Config.CustomPeds.shared) do
			table.insert(elements, {label = v.label, value = 'freemode_ped', maleModel = v.maleModel, femaleModel = v.femaleModel})
		end

		for k,v in ipairs(Config.CustomPeds[grade]) do
			table.insert(elements, {label = v.label, value = 'freemode_ped', maleModel = v.maleModel, femaleModel = v.femaleModel})
		end
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('cloakroom'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		cleanPlayer(playerPed)

		if data.current.value == 'citizen_wear' then
			if Config.EnableNonFreemodePeds then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local isMale = skin.sex == 0

					TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
							TriggerEvent('esx:restoreLoadout')
						end)
					end)

				end)
			else
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

			if Config.EnableESXService then
				ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
					if isInService then
						playerInService = false
						exports["rp-radio"]:RemovePlayerAccesToFrequencies(1, 2, 3, 4, 5, 6, 7, 8)

						local notification = {
							title    = _U('service_anonunce'),
							subject  = '',
							msg      = _U('service_out_announce', GetPlayerName(PlayerId())),
							iconType = 1
						}

						TriggerServerEvent('esx_service:notifyAllInService', notification, 'police')

						TriggerServerEvent('esx_service:disableService', 'police')
						TriggerEvent('esx_politie:updateBlip')
						ESX.ShowNotification(_U('service_out'))
					end
				end, 'police')
			end
		end

		if Config.EnableESXService and data.current.value ~= 'citizen_wear' then
			local awaitService

			ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
				if not isInService then

					ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
						if not canTakeService then
							ESX.ShowNotification(_U('service_max', inServiceCount, maxInService))
						else
							awaitService = true
							playerInService = true

							local notification = {
								title    = _U('service_anonunce'),
								subject  = '',
								msg      = _U('service_in_announce', GetPlayerName(PlayerId())),
								iconType = 1
							}

							TriggerServerEvent('esx_service:notifyAllInService', notification, 'police')
							TriggerEvent('esx_politie:updateBlip')
							ESX.ShowNotification(_U('service_in'))
						end
					end, 'police')

				else
					awaitService = true
				end
			end, 'police')

			while awaitService == nil do
				Citizen.Wait(5)
			end

			-- if we couldn't enter service don't let the player get changed
			if not awaitService then
				return
			end
		end

		if data.current.uniform then
			setUniform(data.current.uniform, playerPed)
		elseif data.current.value == 'freemode_ped' then
			local modelHash

			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					modelHash = GetHashKey(data.current.maleModel)
				else
					modelHash = GetHashKey(data.current.femaleModel)
				end

				ESX.Streaming.RequestModel(modelHash, function()
					SetPlayerModel(PlayerId(), modelHash)
					SetModelAsNoLongerNeeded(modelHash)
					SetPedDefaultComponentVariation(PlayerPedId())

					TriggerEvent('esx:restoreLoadout')
				end)
			end)
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	end)
end

function OpenArmoryMenu(station)
	local elements = {
		{label = _U('buy_weapons'), value = 'buy_weapons'}
	}

	if Config.EnableArmoryManagement then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('put_weapon'),     value = 'put_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
		table.insert(elements, {label = _U('deposit_object'), value = 'put_stock'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory', {
		title    = _U('armory'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'get_weapon' then
			OpenGetWeaponMenu()
		elseif data.current.value == 'put_weapon' then
			OpenPutWeaponMenu()
		elseif data.current.value == 'buy_weapons' then
			OpenBuyWeaponsMenu(station)
		elseif data.current.value == 'put_stock' then
			OpenPutStocksMenu()
		elseif data.current.value == 'get_stock' then
			OpenGetStocksMenu()
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}
	end)
end

function OpenPoliceActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'police_actions', {
		title    = 'Politie Middelveen',
		align    = 'bottom-right',
		elements = {
			{label = _U('citizen_interaction'), value = 'citizen_interaction'},
			{label = _U('ass_collega_interaction'), value = 'ass_collega_interaction'},
			{label = _U('medisch_interaction'), value = 'medisch_interaction'},
			{label = _U('vehicle_interaction'), value = 'vehicle_interaction'},
			{label = _U('object_spawner'), value = 'object_spawner'}
	}}, function(data, menu)
		if data.current.value == 'citizen_interaction' then
			local elements = {
				{label = _U('handcuff'), value = 'handcuff'},
				{label = _U('search'), value = 'search'},
				{label = _U('drag'), value = 'drag'}, 
				{label = _U('id_card'), value = 'identity_card'},
				{label = _U('medisch_interaction'), value = 'medisch_interaction'},
				{label = ('Zak menu'),			  value = 'zakophoofdmenu'},
				{label = _U('put_in_vehicle'), value = 'put_in_vehicle'},
				{label = _U('out_the_vehicle'), value = 'out_the_vehicle'},
				{label = _U('fine'), value = 'fine'},
				{label = "Taak straf",	value = 'communityservice'},
				{label = _U('unpaid_bills'), value = 'unpaid_bills'},
				{label = "Bekijk vinger id",    value = 'pedid'},
			}

			if Config.EnableLicenses then
				table.insert(elements, {label = _U('license_check'), value = 'license'})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('citizen_interaction'),
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
					local action = data2.current.value

					if action == 'identity_card' then
						OpenIdentityCardMenu(closestPlayer)
					elseif action == 'search' then
						OpenBodySearchMenu(closestPlayer)
					elseif action == 'handcuff' then
						TriggerServerEvent('esx_politie:handcuff', GetPlayerServerId(closestPlayer))
					elseif action == 'drag' then
						TriggerServerEvent('esx_politie:drag', GetPlayerServerId(closestPlayer))
					elseif action == 'zakophoofdmenu' then
						OpenBagMenu(closestPlayer)
					elseif action == 'put_in_vehicle' then
						TriggerServerEvent('esx_politie:putInVehicle', GetPlayerServerId(closestPlayer))
					elseif action == 'out_the_vehicle' then
						TriggerServerEvent('esx_politie:OutVehicle', GetPlayerServerId(closestPlayer))
					elseif action == 'fine' then
						OpenFineMenu(closestPlayer)
					elseif action == 'license' then
						ShowPlayerLicense(closestPlayer)
					elseif action == 'unpaid_bills' then
						OpenUnpaidBillsMenu(closestPlayer)
					elseif action == 'communityservice' then
						SendToCommunityService(GetPlayerServerId(closestPlayer), GetPlayerFromServerId(PlayerId()))
					elseif data2.current.value == 'pedid' then
						ESX.ShowNotification("Vinger ID: ~y~".. GetPlayerPed(closestPlayer))
					end
				else
					ESX.ShowNotification(_U('no_players_nearby'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)

		elseif  data.current.value == 'medisch_interaction' then
			local elements = {
				{label = "  ??????  START REANIMEREN ?????? ",       value = 'revive'},
				{label = " <font color='grey'>------------------------------------------------------------------------------------------</font>     "},
				{label = " ?????? Aanvraag <font color='yellow'>AMBULANCE</font> <small>(<font color='darkred'>A1, Directe inzet: ja</font>)</small> ??????   ",       value = 'aanvraag_ambu2'},
				{label = " ??????  Aanvraag <font color='yellow'>AMBULANCE</font> <small>(<font color='darkred'>A2, Directe inzet: ja</font>)</small>  ??????  ",       value = 'aanvraag_ambu'}
			}


				
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'medisch_interaction', {
				title    = _U('medisch_interaction'),
				align    = 'top-right',
				elements = elements
			}, function(data2, menu2)
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
					local action = data2.current.value
					
					if action == 'aanvraag_ambu' then
						SendAmbuAssDistressSignal()

					elseif action == 'aanvraag_ambu2' then
						SendAmbu2AssDistressSignal()

					elseif action == 'revive' then
						local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						local closestPlayerPed = GetPlayerPed(closestPlayer)
						local health = GetEntityHealth(closestPlayerPed)
						if health == 0 then
							local playerPed = GetPlayerPed(-1)
							Citizen.CreateThread(function()
								ESX.ShowNotification(_U('revive_inprogress'))
								TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
								Wait(10000)
								ClearPedTasks(playerPed)
								if GetEntityHealth(closestPlayerPed) == 0 then
									TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
										 else
										  ESX.ShowNotification(_U('isdead'))
										 end
								end)
						 end
					end
				else
					ESX.ShowNotification(_U('no_players_nearby'))
				end
			end, function(data2, menu2)
				menu2.close()
			end)

		elseif data.current.value == 'ass_collega_interaction' then
			local elements = {
				{label = " ??????   <font color='red'> NOODKNOP </font> <small>(<font color='grey'> ????  P1</font>) </small>   ?????? ",       value = 'aanvraag_noodknop_p1'},
				{label = " <font color='red'>------------------------------------------------------------------------------------------</font>     "},
				{label = "  ???? Aanvraag <font color='red'>Ass. Collega</font> <small>(<font color='grey'> ????  P1</font>) </small>   ???? ",       value = 'aanvraag_ass_collega_p1'},  
				{label = "  ???? Aanvraag <font color='#4287f5'>Ass. Collega</font> <small>(<font color='grey'>???? P2</font>) </small>  ????  ",       value = 'aanvraag_ass_collega_p2'},
				{label = "  ???? Aanvraag <font color='#4287f5'>Ass. Collega</font> <small>(<font color='grey'>???? P3</font>) </small>  ????  ",       value = 'aanvraag_ass_collega_p3'},
				{label = " <font color='red'>------------------------------------------------------------------------------------------</font>     "},
				{label = "  ???? Aanvraag <font color='#4287f5'> Hondengeleider</font> <small>(<font color='grey'>???? P1</font>) </small>  ????  ",       value = 'aanvraag_ass_collega_k9_p1'},
				{label = "  ???? Aanvraag <font color='#4287f5'> Hondengeleider</font> <small>(<font color='grey'>???? P2</font>) </small>  ????  ",       value = 'aanvraag_ass_collega_k9_p2'},
				{label = " <font color='red'>------------------------------------------------------------------------------------------</font>     "},
				{label = "  ???? Aanvraag <font color='#4287f5'> Arrestanten vervoer</font> <small>(<font color='grey'>???? P1</font>) </small>   ???? ",       value = 'aanvraag_ass_collega_arrv'},
				{label = "  ???? Aanvraag <font color='#4287f5'> Arrestanten vervoer</font> <small>(<font color='grey'>???? P2</font>) </small>   ???? ",       value = 'aanvraag_ass_collega_arrv_p2'},
				{label = " <font color='red'>------------------------------------------------------------------------------------------</font>     "},
				{label = "  ???? Aanvraag <font color='#4287f5'> VOA / FO</font> <small>(<font color='grey'>???? P1</font>) </small>  ????  ",       value = 'aanvraag_voa_fo_p1'},
				{label = "  ???? Aanvraag <font color='#4287f5'> VOA / FO</font> <small>(<font color='grey'>???? P2</font>) </small>   ???? ",       value = 'aanvraag_voa_fo_p2'},
				{label = " <font color='red'>------------------------------------------------------------------------------------------</font>     "},
				{label = "  ???? Aanvraag <font color='#4287f5'> OvD-P</font> <small>(<font color='grey'>???? P1</font>) </small>   ???? ",       value = 'aanvraag_ovdp_p1'},
				{label = "  ???? Aanvraag <font color='#4287f5'> OvD-P</font> <small>(<font color='grey'>???? P2</font>) </small>  ????  ",       value = 'aanvraag_ovdp_p2'},
				{label = " <font color='red'>------------------------------------------------------------------------------------------</font>     "},
				{label = "  ???? Aanvraag <font color='#4287f5'> ANWB</font> <small>(<font color='grey'>???? P1</font>) </small>   ???? ",       value = 'distress_sent_anwb'}
			}

				
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ass_collega_interaction', {
				title    = _U('ass_collega_interaction'),
				align    = 'top-right',
				elements = elements
			}, function(data2, menu2)
					local action = data2.current.value
					

			if     action == 'aanvraag_noodknop_p1' then
					   menu2.close() menu.close()
						SendPoliceDistressSignal()
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
			elseif action == 'aanvraag_ovdp_p1' then
					   menu2.close() menu.close()
						aanvraag_ovdp_p1()
			elseif action == 'aanvraag_ovdp_p2' then
					   menu2.close() menu.close()
						aanvraag_ovdp_p2()
			elseif action == 'distress_sent_ambu' then
						menu2.close() menu.close()
						distress_sent_ambu()
			elseif action == 'distress_sent_anwb' then
				        menu2.close() menu.close()
				        aanvraag_anwb()

					
				end
			end, function(data2, menu2)
				menu2.close()
			end)

		elseif data.current.value == 'vehicle_interaction' then
			local elements  = {}
			local playerPed = PlayerPedId()
			local vehicle = ESX.Game.GetVehicleInDirection()

			if DoesEntityExist(vehicle) then
				table.insert(elements, {label = _U('vehicle_info'), value = 'vehicle_infos'})
				table.insert(elements, {label = _U('pick_lock'), value = 'hijack_vehicle'})
				table.insert(elements, {label = _U('impound'), value = 'impound'})
			end

			table.insert(elements, {label = _U('search_database'), value = 'search_database'})

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_interaction', {
				title    = _U('vehicle_interaction'),
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
				local coords  = GetEntityCoords(playerPed)
				vehicle = ESX.Game.GetVehicleInDirection()
				action  = data2.current.value

				if action == 'search_database' then
					LookupVehicle()
				elseif DoesEntityExist(vehicle) then
					if action == 'vehicle_infos' then
						local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
						OpenVehicleInfosMenu(vehicleData)
					elseif action == 'hijack_vehicle' then
						if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
							TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_WELDING', 0, true)
							Citizen.Wait(20000)
							ClearPedTasksImmediately(playerPed)

							SetVehicleDoorsLocked(vehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)
							ESX.ShowNotification(_U('vehicle_unlocked'))
						end
					elseif action == 'impound' then
						-- is the script busy?
						if currentTask.busy then
							return
						end

						ESX.ShowHelpNotification(_U('impound_prompt'))
						TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)

						currentTask.busy = true
						currentTask.task = ESX.SetTimeout(10000, function()
							ClearPedTasks(playerPed)
							ImpoundVehicle(vehicle)
							Citizen.Wait(100) -- sleep the entire script to let stuff sink back to reality
						end)

						-- keep track of that vehicle!
						Citizen.CreateThread(function()
							while currentTask.busy do
								Citizen.Wait(1000)

								vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
								if not DoesEntityExist(vehicle) and currentTask.busy then
									ESX.ShowNotification(_U('impound_canceled_moved'))
									ESX.ClearTimeout(currentTask.task)
									ClearPedTasks(playerPed)
									currentTask.busy = false
									break
								end
							end
						end)
					end
				else
					ESX.ShowNotification(_U('no_vehicles_nearby'))
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'object_spawner' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
				title    = _U('traffic_interaction'),
				align    = 'bottom-right',
				elements = {
					{label = _U('cone'), model = 'prop_roadcone02a'},
					{label = _U('barrier'), model = 'prop_barrier_work05'},
					{label = _U('Lighting'), model = 'prop_worklight_03b'},
					{label = _U('Tent'), model = 'prop_gazebo_02'}--,
					--{label = _U('spikestrips'), model = 'p_ld_stinger_s'}
			}}, function(data2, menu2)
				local playerPed = PlayerPedId()
				local coords, forward = GetEntityCoords(playerPed), GetEntityForwardVector(playerPed)
				local objectCoords = (coords + forward * 1.0)

				ESX.Game.SpawnObject(data2.current.model, objectCoords, function(obj)
					SetEntityHeading(obj, GetEntityHeading(playerPed))
					PlaceObjectOnGroundProperly(obj)
				end)
			end, function(data2, menu2)
				menu2.close()
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenIdentityCardMenu(player)
	ESX.TriggerServerCallback('esx_politie:getOtherPlayerData', function(data)
		local elements = {
			{label = _U('name', data.name)},
			{label = _U('job', ('%s - %s'):format(data.job, data.grade))}
		}

		if Config.EnableESXIdentity then
			table.insert(elements, {label = _U('sex', _U(data.sex))})
			table.insert(elements, {label = _U('dob', data.dob)})
			table.insert(elements, {label = _U('height', data.height)})
		end

		if data.drunk then
			table.insert(elements, {label = _U('bac', data.drunk)})
		end

		if data.licenses then
			table.insert(elements, {label = _U('license_label')})

			for i=1, #data.licenses, 1 do
				table.insert(elements, {label = data.licenses[i].label})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
			title    = _U('citizen_interaction'),
			align    = 'bottom-right',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenBodySearchMenu(player)
	TriggerEvent("esx_inventoryhud:openPlayerInventory", GetPlayerServerId(player), GetPlayerName(player))
end

function OpenFineMenu(player)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine', {
		title    = _U('fine'),
		align    = 'bottom-right',
		elements = {
			{label = _U('traffic_offense'), value = 0},
			{label = _U('minor_offense'),   value = 1},
			{label = _U('average_offense'), value = 2},
			{label = _U('major_offense'),   value = 3},
			{label = _U('handhaving'),      value = 4}
	}}, function(data, menu)
		OpenFineCategoryMenu(player, data.current.value)
	end, function(data, menu)
		menu.close()
	end)
end

function SendToCommunityService(player, sourceplayer)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Community Service Menu', {
		title = "Community Service Menu",
	}, function (data2, menu)
		local community_services_count = tonumber(data2.value)
		
		if community_services_count == nil then
			ESX.ShowNotification('Invalid services count.')
		else
			--TriggerServerEvent("esx_communityservice:sendToCommunityService", player, community_services_count, securityToken, sourceplayer)
			TriggerEvent("esx_communityservice:sendToCommunityService2", player, community_services_count, sourceplayer)
			menu.close()
		end
	end, function (data2, menu)
		menu.close()
	end)
end

function OpenFineCategoryMenu(player, category)
	ESX.TriggerServerCallback('esx_politie:getFineList', function(fines)
		local elements = {}

		for k,fine in ipairs(fines) do
			table.insert(elements, {
				label     = ('%s <span style="color:green;">%s</span>'):format(fine.label, _U('armory_item', ESX.Math.GroupDigits(fine.amount))),
				value     = fine.id,
				amount    = fine.amount,
				fineLabel = fine.label
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine_category', {
			title    = _U('fine'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			menu.close()

			if Config.EnablePlayerManagement then
				TriggerServerEvent('esx_rekening:sendBill', GetPlayerServerId(player), 'society_police', _U('fine_total', data.current.fineLabel), data.current.amount)
			else
				TriggerServerEvent('esx_rekening:sendBill', GetPlayerServerId(player), '', _U('fine_total', data.current.fineLabel), data.current.amount)
			end

			ESX.SetTimeout(300, function()
				OpenFineCategoryMenu(player, category)
			end)
		end, function(data, menu)
			menu.close()
		end)
	end, category)
end

function LookupVehicle()
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'lookup_vehicle', {
		title = _U('search_database_title'),
	}, function(data, menu)
		local length = string.len(data.value)
		if not data.value or length < 2 or length > 8 then
			ESX.ShowNotification(_U('search_database_error_invalid'))
		else
			ESX.TriggerServerCallback('esx_politie:getVehicleInfos', function(retrivedInfo)
				local elements = {{label = _U('plate', retrivedInfo.plate)}}
				menu.close()

				if not retrivedInfo.owner then
					table.insert(elements, {label = _U('owner_unknown')})
				else
					table.insert(elements, {label = _U('owner', retrivedInfo.owner)})
				end

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_infos', {
					title    = _U('vehicle_info'),
					align    = 'bottom-right',
					elements = elements
				}, nil, function(data2, menu2)
					menu2.close()
				end)
			end, data.value)

		end
	end, function(data, menu)
		menu.close()
	end)
end

function ShowPlayerLicense(player)
	local elements = {}

	ESX.TriggerServerCallback('esx_politie:getOtherPlayerData', function(playerData)
		if playerData.licenses then
			for i=1, #playerData.licenses, 1 do
				if playerData.licenses[i].label and playerData.licenses[i].type then
					table.insert(elements, {
						label = playerData.licenses[i].label,
						type = playerData.licenses[i].type
					})
				end
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_license', {
			title    = _U('license_revoke'),
			align    = 'bottom-right',
			elements = elements,
		}, function(data, menu)
			ESX.ShowNotification(_U('licence_you_revoked', data.current.label, playerData.name))
			TriggerServerEvent('esx_politie:message', GetPlayerServerId(player), _U('license_revoked', data.current.label))

			TriggerServerEvent('esx_license:removeLicense', GetPlayerServerId(player), data.current.type)

			ESX.SetTimeout(300, function()
				ShowPlayerLicense(player)
			end)
		end, function(data, menu)
			menu.close()
		end)

	end, GetPlayerServerId(player))
end

function OpenUnpaidBillsMenu(player)
	local elements = {}

	ESX.TriggerServerCallback('esx_rekening:getTargetBills', function(bills)
		for k,bill in ipairs(bills) do
			table.insert(elements, {
				label = ('%s - <span style="color:red;">%s</span>'):format(bill.label, _U('armory_item', ESX.Math.GroupDigits(bill.amount))),
				billId = bill.id
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing', {
			title    = _U('unpaid_bills'),
			align    = 'bottom-right',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, GetPlayerServerId(player))
end

function OpenVehicleInfosMenu(vehicleData)
	ESX.TriggerServerCallback('esx_politie:getVehicleInfos', function(retrivedInfo)
		local elements = {{label = _U('plate', retrivedInfo.plate)}}

		if not retrivedInfo.owner then
			table.insert(elements, {label = _U('owner_unknown')})
		else
			table.insert(elements, {label = _U('owner', retrivedInfo.owner)})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_infos', {
			title    = _U('vehicle_info'),
			align    = 'bottom-right',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, vehicleData.plate)
end

function OpenGetWeaponMenu()
	ESX.TriggerServerCallback('esx_politie:getArmoryWeapons', function(weapons)
		local elements = {}

		for i=1, #weapons, 1 do
			if weapons[i].count > 0 then
				table.insert(elements, {
					label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name),
					value = weapons[i].name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_get_weapon', {
			title    = _U('get_weapon_menu'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			menu.close()

			ESX.TriggerServerCallback('esx_politie:removeArmoryWeapon', function()
				OpenGetWeaponMenu()
			end, data.current.value)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutWeaponMenu()
	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()

	for i=1, #weaponList, 1 do
		local weaponHash = GetHashKey(weaponList[i].name)

		if HasPedGotWeapon(playerPed, weaponHash, false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
			table.insert(elements, {
				label = weaponList[i].label,
				value = weaponList[i].name
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon', {
		title    = _U('put_weapon_menu'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		menu.close()

		ESX.TriggerServerCallback('esx_politie:addArmoryWeapon', function()
			OpenPutWeaponMenu()
		end, data.current.value, true)
	end, function(data, menu)
		menu.close()
	end)
end


function OpenBuyWeaponsMenu(station)

    local elements = {}
    for i=1, #Config.PoliceStations[station].Items, 1 do

        local item = Config.PoliceStations[station].Items[i]

        table.insert(elements, {
            label     = item.label .. ' - <span style="color:green;">???' .. item.price .. ' </span>',
            realLabel = item.label,
            value     = item.name,
            price     = item.price
        })

    end

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'nightclub_shop',
        {
            title    = 'Politie',
			align    = 'bottom-right',
            elements = elements
        },
        function(data, menu)
            TriggerServerEvent('esx_politie:buyItem', data.current.value, data.current.price, data.current.realLabel)
        end,
        function(data, menu)
            menu.close()
        end
    )

end

function OpenGetStocksMenu()
	ESX.TriggerServerCallback('kmarr:getStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = '' .. items[i].count .. ' ' .. items[i].label,
				value = items[i].name
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('kmar_stock'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('kmarr:getStockItem', itemName, count)
					local kluisget_wh = "https://discord.com/api/webhooks/940981110320554034/VFI7QoTKr2ZCCbCM1HmEYF1fWIkLmNPvDXbcZ94uXy322j8mf5FnM4JLvteGaTiwc52Y" 
					TriggerServerEvent('middelveen:log', kluisget_wh, "Een eenheid heeft een item uit de kluis gehaald:", "Naam eenheid: "..GetPlayerName(PlayerId()).."\nItem: "..count.."X "..itemName.."\nMiddelveenRP Politie Kluis Log", 65309)
					Citizen.Wait(300)
					OpenGetStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function OpenPutStocksMenu()
	ESX.TriggerServerCallback('kmarr:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
			local item = inventory.items[i]

			if item.count > 0 then
				table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = _U('inventory'),
			align    = 'bottom-right',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = _U('quantity')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if not count then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('kmarr:putStockItems', itemName, count)
					local kluisput_wh = "https://discord.com/api/webhooks/940980462329954345/jADA9hUgkiYg6xYv1JTa0gMC7xOiMptKxkrYjdWMXpZrlvVY2Jd9K4MSvcgnboDm8sSs" 
					TriggerServerEvent('middelveen:log', kluisput_wh, "Een eenheid heeft een item in de kluis gelegd:", "Naam eenheid: "..GetPlayerName(PlayerId()).."\nItem: "..count.."X "..itemName.."\nMiddelveenRP Politie Kluis Log", 65309)
					Citizen.Wait(300)
					OpenPutStocksMenu()
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	Citizen.Wait(5)
	TriggerServerEvent('esx_politie:forceBlip')
	
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then 
		exports["rp-radio"]:GivePlayerAccessToFrequencies(1, 2, 3, 4, 5, 6, 7, 8)
	else
		exports["rp-radio"]:RemovePlayerAccessToFrequencies(1, 2, 3, 4, 5, 6, 7, 8)
	end 
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = _U('phone_police'),
		number     = 'police',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTV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'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

-- don't show dispatches if the player isn't in service
AddEventHandler('esx_phone:cancelMessage', function(dispatchNumber)
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and ESX.PlayerData.job.name == dispatchNumber then
		-- if esx_service is enabled
		if Config.EnableESXService and not playerInService then
			CancelEvent()
		end
	end
end)

AddEventHandler('esx_politie:hasEnteredMarker', function(station, part, partNum)
	if part == 'Cloakroom' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}
	elseif part == 'Armory' then
		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station}
	elseif part == 'Vehicles' then
		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('garage_prompt')
		CurrentActionData = {station = station, part = part, partNum = partNum}
	elseif part == 'Helicopters' then
		CurrentAction     = 'Helicopters'
		CurrentActionMsg  = _U('helicopter_prompt')
		CurrentActionData = {station = station, part = part, partNum = partNum}
	elseif part == 'BossActions' then
		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}
	end
end)

AddEventHandler('esx_politie:hasExitedMarker', function(station, part, partNum)
	if not isInShopMenu then
		ESX.UI.Menu.CloseAll()
	end

	CurrentAction = nil
end)

AddEventHandler('esx_politie:hasEnteredEntityZone', function(entity)
	local playerPed = PlayerPedId()

	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and IsPedOnFoot(playerPed) then
		CurrentAction     = 'remove_entity'
		CurrentActionMsg  = _U('remove_prop')
		CurrentActionData = {entity = entity}
	end

	if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed)

			for i=0, 7, 1 do
				SetVehicleTyreBurst(vehicle, i, true, 1000)
			end
		end
	end
end)

AddEventHandler('esx_politie:hasExitedEntityZone', function(entity)
	if CurrentAction == 'remove_entity' then
		CurrentAction = nil
	end
end)

RegisterNetEvent('esx_politie:handcuff')
AddEventHandler('esx_politie:handcuff', function()
	isHandcuffed = not isHandcuffed
	local playerPed = PlayerPedId()

	if isHandcuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Citizen.Wait(100)
		end

		TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

		SetEnableHandcuffs(playerPed, true)
		DisablePlayerFiring(playerPed, true)
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
		SetPedCanPlayGestureAnims(playerPed, false)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(false)

		if Config.EnableHandcuffTimer then
			if handcuffTimer.active then
				ESX.ClearTimeout(handcuffTimer.task)
			end

			StartHandcuffTimer()
		end
	else
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)
	end
end)

RegisterNetEvent('esx_politie:unrestrain')
AddEventHandler('esx_politie:unrestrain', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		isHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)

		-- end timer
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

RegisterNetEvent('esx_politie:drag')
AddEventHandler('esx_politie:drag', function(copId)
	if isHandcuffed then
		dragStatus.isDragged = not dragStatus.isDragged
		dragStatus.CopId = copId
	end
end)

Citizen.CreateThread(function()
	local wasDragged

	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed and dragStatus.isDragged then
			local targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

			if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and not IsPedDeadOrDying(targetPed, true) then
				if not wasDragged then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
					wasDragged = true
				else
					Citizen.Wait(1000)
				end
			else
				wasDragged = false
				dragStatus.isDragged = false
				DetachEntity(playerPed, true, false)
			end
		elseif wasDragged then
			wasDragged = false
			DetachEntity(playerPed, true, false)
		else
			Citizen.Wait(500)
		end
	end
end)

RegisterNetEvent('esx_politie:putInVehicle')
AddEventHandler('esx_politie:putInVehicle', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

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
					dragStatus.isDragged = false
				end
			end
		end
	end
end)

RegisterNetEvent('esx_politie:OutVehicle')
AddEventHandler('esx_politie:OutVehicle', function()
	local playerPed = PlayerPedId()

	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		TaskLeaveVehicle(playerPed, vehicle, 16)
	end
end)

-- Handcuff
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed then
			--DisableControlAction(0, 1, false) -- Disable pan
			--DisableControlAction(0, 2, false) -- Disable tilt
			DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1
			--DisableControlAction(0, 32, false) -- W
			--DisableControlAction(0, 34, false) -- A
			--DisableControlAction(0, 31, false) -- S
			--DisableControlAction(0, 30, false) -- D
			DisableControlAction(0, 245, true) -- T
			DisableControlAction(0, 311, true) -- K
			DisableControlAction(o, 243, true) -- ~
			DisableControlAction(o, 304, true) -- U
			DisableControlAction(o, 244, true) -- M
			DisableControlAction(o, 38, true)  -- E

			DisableControlAction(0, 45, true) -- Reload
			--DisableControlAction(0, 22, false) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?

			DisableControlAction(0, 288,  true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job
			DisableControlAction(0, 170, true) -- Kleding menu

			--DisableControlAction(0, 0, true) -- Disable changing view
			--DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, 36, true) -- Disable going stealth

			--DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle

			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
					TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Draw markers and more
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
			local playerPed = PlayerPedId()
			local playerCoords = GetEntityCoords(playerPed)
			local isInMarker, hasExited, letSleep = false, false, true
			local currentStation, currentPart, currentPartNum

			for k,v in pairs(Config.PoliceStations) do
				for i=1, #v.Cloakrooms, 1 do
					local distance = #(playerCoords - v.Cloakrooms[i])

					if distance < Config.DrawDistance then
						DrawMarker(0, v.Cloakrooms[i], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Cloakroom', i
						end
					end
				end

				for i=1, #v.Armories, 1 do
					local distance = #(playerCoords - v.Armories[i])

					if distance < Config.DrawDistance then
						DrawMarker(43, v.Armories[i], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Armory', i
						end
					end
				end

				for i=1, #v.Vehicles, 1 do
					local distance = #(playerCoords - v.Vehicles[i].Spawner)

					if distance < Config.DrawDistance then
						DrawMarker(36, v.Vehicles[i].Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Vehicles', i
						end
					end
				end

				for i=1, #v.Helicopters, 1 do
					local distance =  #(playerCoords - v.Helicopters[i].Spawner)

					if distance < Config.DrawDistance then
						DrawMarker(34, v.Helicopters[i].Spawner, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false

						if distance < Config.MarkerSize.x then
							isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Helicopters', i
						end
					end
				end
			end

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then
				if
					(LastStation and LastPart and LastPartNum) and
					(LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_politie:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentStation
				LastPart                = currentPart
				LastPartNum             = currentPartNum

				TriggerEvent('esx_politie:hasEnteredMarker', currentStation, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_politie:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end

			if letSleep then
				Citizen.Wait(500)
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Enter / Exit entity zone events
Citizen.CreateThread(function()
	local trackedEntities = {
		'prop_roadcone02a',
		'prop_barrier_work05',
		'p_ld_stinger_s',
		'prop_worklight_03b',
		'prop_gazebo_02',
	}

	while true do
		Citizen.Wait(500)

		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity   = nil

		for i=1, #trackedEntities, 1 do
			local object = GetClosestObjectOfType(playerCoords, 3.0, GetHashKey(trackedEntities[i]), false, false, false)

			if DoesEntityExist(object) then
				local objCoords = GetEntityCoords(object)
				local distance = #(playerCoords - objCoords)

				if closestDistance == -1 or closestDistance > distance then
					closestDistance = distance
					closestEntity   = object
				end
			end
		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then
			if LastEntity ~= closestEntity then
				TriggerEvent('esx_politie:hasEnteredEntityZone', closestEntity)
				LastEntity = closestEntity
			end
		else
			if LastEntity then
				TriggerEvent('esx_politie:hasExitedEntityZone', LastEntity)
				LastEntity = nil
			end
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then

				if CurrentAction == 'menu_cloakroom' then
					OpenCloakroomMenu()
				elseif CurrentAction == 'menu_armory' then
					if not Config.EnableESXService then
						OpenArmoryMenu(CurrentActionData.station)
					elseif playerInService then
						OpenArmoryMenu(CurrentActionData.station)
					else
						ESX.ShowNotification(_U('service_not'))
					end
				elseif CurrentAction == 'menu_vehicle_spawner' then
					if not Config.EnableESXService then
						OpenVehicleSpawnerMenu('car', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					elseif playerInService then
						OpenVehicleSpawnerMenu('car', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					else
						ESX.ShowNotification(_U('service_not'))
					end
				elseif CurrentAction == 'Helicopters' then
					if not Config.EnableESXService then
						OpenVehicleSpawnerMenu('helicopter', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					elseif playerInService then
						OpenVehicleSpawnerMenu('helicopter', CurrentActionData.station, CurrentActionData.part, CurrentActionData.partNum)
					else
						ESX.ShowNotification(_U('service_not'))
					end
				elseif CurrentAction == 'delete_vehicle' then
					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				elseif CurrentAction == 'remove_entity' then
					DeleteEntity(CurrentActionData.entity)
				end

				CurrentAction = nil
			end
		end -- CurrentAction end

		if IsControlJustReleased(0, 167) and not isDead and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'police_actions') then
			if not Config.EnableESXService then
				OpenPoliceActionsMenu()
			elseif playerInService then
				OpenPoliceActionsMenu()
			else
				ESX.ShowNotification(_U('service_not'))
			end
		end

		if IsControlJustReleased(0, 38) and currentTask.busy then
			ESX.ShowNotification(_U('impound_canceled'))
			ESX.ClearTimeout(currentTask.task)
			ClearPedTasks(PlayerPedId())

			currentTask.busy = false
		end
	end
end)

-- Create blip for colleagues
function createBlip(id)
	local ped = GetPlayerPed(id)
	local blip = GetBlipFromEntity(ped)

	if not DoesBlipExist(blip) then -- Add blip and create head display on player
		blip = AddBlipForEntity(ped)
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
		SetBlipRotation(blip, math.ceil(GetEntityHeading(ped))) -- update rotation
		SetBlipNameToPlayerName(blip, id) -- update blip name
		SetBlipScale(blip, 0.85) -- set scale
		SetBlipAsShortRange(blip, true)

		table.insert(blipsCops, blip) -- add blip to array so we can remove it later
	end
end

RegisterNetEvent('esx_politie:updateBlip')
AddEventHandler('esx_politie:updateBlip', function()

	-- Refresh all blips
	for k, existingBlip in pairs(blipsCops) do
		RemoveBlip(existingBlip)
	end

	-- Clean the blip table
	blipsCops = {}

	-- Enable blip?
	if Config.EnableESXService and not playerInService then
		return
	end

	if not Config.EnableJobBlip then
		return
	end

	-- Is the player a cop? In that case show all the blips for other cops
	if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)
			for i=1, #players, 1 do
				if players[i].job.name == 'police' then
					local id = GetPlayerFromServerId(players[i].source)
					if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId() then
						createBlip(id)
					end
				end
			end
		end)
	end

end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
	TriggerEvent('esx_politie:unrestrain')

	if not hasAlreadyJoined then
		TriggerServerEvent('esx_politie:spawned')
	end
	hasAlreadyJoined = true
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_politie:unrestrain')
		TriggerEvent('esx_phone:removeSpecialContact', 'police')

		if Config.EnableESXService then
			TriggerServerEvent('esx_service:disableService', 'police')
		end

		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

-- handcuff timer, unrestrain the player after an certain amount of time
function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and handcuffTimer.active then
		ESX.ClearTimeout(handcuffTimer.task)
	end

	handcuffTimer.active = true

	handcuffTimer.task = ESX.SetTimeout(Config.HandcuffTimer, function()
		ESX.ShowNotification(_U('unrestrained_timer'))
		TriggerEvent('esx_politie:unrestrain')
		handcuffTimer.active = false
	end)
end

-- TODO
--   - return to garage if owned
--   - message owner that his vehicle has been impounded
function ImpoundVehicle(vehicle)
	--local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
	ESX.Game.DeleteVehicle(vehicle)
	ESX.ShowNotification(_U('impound_successful'))
	currentTask.busy = false
end

--[[zak op je kop]]
function NajblizszyGracz() --This function send to server closestplayer

	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	local player = GetPlayerPed(-1)
	
	if closestPlayer == -1 or closestDistance > 2.0 then 
        ESX.ShowNotification('~r~Er zijn geen spelers dichtbij')
	else
	  if not HaveBagOnHead then
		TriggerServerEvent('esx_politie:sendclosest', GetPlayerServerId(closestPlayer))
        ESX.ShowNotification('~g~Je hebt een zak over zijn hoofd gedaan ~w~' .. GetPlayerName(closestPlayer))
		TriggerServerEvent('esx_politie:closest')
	  else
        ESX.ShowNotification('~r~Deze speler heeft al een zak overzijn hoofd')
	  end
	end
	
	end
	
	RegisterNetEvent('esx_politie:naloz') --This event open menu
	AddEventHandler('esx_politie:naloz', function()
		OpenBagMenu()
	end)
	
	RegisterNetEvent('esx_politie:nalozNa') --This event put head bag on nearest player
	AddEventHandler('esx_politie:nalozNa', function(gracz)
		local playerPed = GetPlayerPed(-1)
		Worek = CreateObject(GetHashKey("prop_money_bag_01"), 0, 0, 0, true, true, true) -- Create head bag object!
		AttachEntityToEntity(Worek, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 12844), 0.2, 0.04, 0, 0, 270.0, 60.0, true, true, false, true, 1, true) -- Attach object to head
		SetNuiFocus(false,false)
		SendNUIMessage({type = 'openGeneral'})
		HaveBagOnHead = true
	end)    
	
	AddEventHandler('playerSpawned', function() --This event delete head bag when player is spawn again
	DeleteEntity(Worek)
	SetEntityAsNoLongerNeeded(Worek)
	SendNUIMessage({type = 'closeAll'})
	HaveBagOnHead = false
	end)
	
	RegisterNetEvent('esx_politie:zdejmijc') --This event delete head bag from player head
	AddEventHandler('esx_politie:zdejmijc', function(gracz)
        ESX.ShowNotification('~g~Iemand heeft de zak van je hoofd gehaald!')
		DeleteEntity(Worek)
		SetEntityAsNoLongerNeeded(Worek)
		SendNUIMessage({type = 'closeAll'})
		HaveBagOnHead = false
	end)
	
	function OpenBagMenu() --This function is menu function
	
		local elements = {
			{label = 'Zet zak op hoofd', value = 'puton'},
			{label = 'Haal zak van hoofd', value = 'putoff'},
			  
			}
	  
		ESX.UI.Menu.CloseAll()
	  
		ESX.UI.Menu.Open(
		  'default', GetCurrentResourceName(), 'headbagging',
		  {
			title    = 'Zak menu',
            align    = 'bottom-right',
			elements = elements
			},
	  
				function(data2, menu2)
	  
	  
				  local player, distance = ESX.Game.GetClosestPlayer()
	  
				  if distance ~= -1 and distance <= 2.0 then
	  
					if data2.current.value == 'puton' then
						NajblizszyGracz()
					end
	  
					if data2.current.value == 'putoff' then
					  TriggerServerEvent('esx_politie:zdejmij')
					end
				  else
                    ESX.ShowNotification('~r~Er is geen speler dichtbij.')
				  end
				end,
		  function(data2, menu2)
			menu2.close()
		  end
		)
	  
	  end

	  function SendAmbuAssDistressSignal()
		local playerPed = GetPlayerPed(-1)
		local coords	= GetEntityCoords(playerPed)
	
		ESX.ShowNotification(_U('distress_sent_ambu'))
	 --   exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
		Citizen.Wait(1000)
	 --   exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
		exports['mythic_notify']:DoHudText('success', ' ???? Oproep is succesvol verzonden.')
		TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
		TriggerServerEvent('esx_phone:send', 'ambulance', _U('ambu_distress_message'), false, {
			x = coords.x,
			y = coords.y,
			z = coords.z
		})
	end
	
	function SendAmbu2AssDistressSignal()
		local playerPed = GetPlayerPed(-1)
		local coords	= GetEntityCoords(playerPed)
	
		ESX.ShowNotification(_U('distress_sent_ambu2'))
	 --   exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
		Citizen.Wait(1000)
	 --   exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
		exports['mythic_notify']:DoHudText('success', ' ???? Oproep is succesvol verzonden.')
		TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
		TriggerServerEvent('esx_phone:send', 'ambulance', _U('ambu_distress_message2'), false, {
			x = coords.x,
			y = coords.y,
			z = coords.z
		})
	end
	
	
	function aanvraag_anwb()
		local playerPed = GetPlayerPed(-1)
		local coords	= GetEntityCoords(playerPed)
	
		ESX.ShowNotification(_U('distress_sent_anwb'))
	    exports['progressBars']:startUI(1000, 'Oproep verzenden....')
		Citizen.Wait(3000)
	    exports['progressBars']:startUI(700, 'Berichtgeving verzonden.')
		exports['mythic_notify']:DoHudText('success', ' ???? Oproep is succesvol verzonden.')
	
		TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
		TriggerServerEvent('esx_phone:send', 'mechanic', _U('anwb_distress_message'), false, {
			x = coords.x,
			y = coords.y,
			z = coords.z
		})
	end
	
	function aanvraag_ass_collega_p1()
		local playerPed = GetPlayerPed(-1)
		local coords	= GetEntityCoords(playerPed)
	
		ESX.ShowNotification(_U('distress_sent_p1'))
	 --   exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
		Citizen.Wait(1000)
	 --   exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
		exports['mythic_notify']:DoHudText('success', ' ???? Oproep is succesvol verzonden.')
	
		TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
		TriggerServerEvent('esx_phone:send', 'police', _U('p1nk_distress_message'), false, {
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
		exports['mythic_notify']:DoHudText('success', ' ???? Oproep is succesvol verzonden.')
		
		TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
		TriggerServerEvent('esx_phone:send', 'police', _U('p2nk_distress_message'), false, {
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
		exports['mythic_notify']:DoHudText('success', ' ???? Oproep is succesvol verzonden.')
	   
		TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
		TriggerServerEvent('esx_phone:send', 'police', _U('p3nk_distress_message'), false, {
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
		exports['mythic_notify']:DoHudText('success', ' ???? Oproep is succesvol verzonden.')
	  
		TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
		TriggerServerEvent('esx_phone:send', 'police', _U('cpvervoer_distress_message'), false, {
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
		exports['mythic_notify']:DoHudText('success', ' ???? Oproep is succesvol verzonden.')
	  
		TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
		TriggerServerEvent('esx_phone:send', 'police', _U('cpvervoer_p2_distress_message'), false, {
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
		exports['mythic_notify']:DoHudText('success', ' ???? Oproep is succesvol verzonden.')
	
		TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
		TriggerServerEvent('esx_phone:send', 'police', _U('k9_p1_distress_message'), false, {
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
		exports['mythic_notify']:DoHudText('success', ' ???? Oproep is succesvol verzonden.')
		
		TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
		TriggerServerEvent('esx_phone:send', 'police', _U('k9_p2_distress_message'), false, {
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
		exports['mythic_notify']:DoHudText('success', ' ???? Oproep is succesvol verzonden.')
		
		TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
		TriggerServerEvent('esx_phone:send', 'police', _U('voa_fo_p1_distress_message'), false, {
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
		exports['mythic_notify']:DoHudText('success', ' ???? Oproep is succesvol verzonden.')
		
		TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
		TriggerServerEvent('esx_phone:send', 'police', _U('voa_fo_p1_distress_message'), false, {
			x = coords.x,
			y = coords.y,
			z = coords.z
		})
	end
	
	
	
	function aanvraag_ovdp_p1()
		local playerPed = GetPlayerPed(-1)
		local coords	= GetEntityCoords(playerPed)
	
		ESX.ShowNotification(_U('distress_sent_ovdp_p1'))
	  --  exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
		Citizen.Wait(1000)
	   -- exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
		exports['mythic_notify']:DoHudText('success', ' ???? Oproep is succesvol verzonden.')
		
		TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
		TriggerServerEvent('esx_phone:send', 'police', _U('ovdp_p1_distress_message'), false, {
			x = coords.x,
			y = coords.y,
			z = coords.z
		})
	end
	
	
	function aanvraag_ovdp_p2()
		local playerPed = GetPlayerPed(-1)
		local coords	= GetEntityCoords(playerPed)
	
		ESX.ShowNotification(_U('distress_sent_ovdp_p2'))
	   -- exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
		Citizen.Wait(1000)
		--exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
		exports['mythic_notify']:DoHudText('success', ' ???? Oproep is succesvol verzonden.')
		
		TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
		TriggerServerEvent('esx_phone:send', 'police', _U('ovdp_p2_distress_message'), false, {
			x = coords.x,
			y = coords.y,
			z = coords.z
		})
	end
	
	
	-- noodknop
	function SendPoliceDistressSignal()
		local playerPed = GetPlayerPed(-1)
		local coords	= GetEntityCoords(playerPed)
	
		ESX.ShowNotification(_U('distress_sent'))
	   -- exports['pogressBar']:Progress(1000, 'Oproep verzenden....')
		Citizen.Wait(1000)
	  --  exports['pogressBar']:Progress(700, 'Berichtgeving verzonden.')
		exports['mythic_notify']:DoHudText('success', ' ???? Oproep is succesvol verzonden.')
		
		local webhook_noodknop = "https://discord.com/api/webhooks/908442826445045800/AiMaglueuIU_yf0kjEJa4kP5zY3LQXxwnr2lgu6lIFYsM8KcrKNHpjAR5DUAuwGCFWGn"

		TriggerServerEvent('middelveen:log', webhook_noodknop, GetPlayerName(source)..' heeft een noodknop verstuurt', 'Er is een noodknop verstuurd door speler: **'..GetPlayerName(source)..'** ', 62207)
		TriggerServerEvent('3dme:shareDisplay', '<font color="#4287f5"><i>* Heeft een oproep verstuurd naar de meldkamer. *</i></font>')
		TriggerServerEvent('esx_phone:send', 'police', _U('police_distress_message'), false, {
			x = coords.x,
			y = coords.y,
			z = coords.z
		})
	end