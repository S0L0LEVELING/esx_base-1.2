

AddEventHandler("EasyAdmin:BuildPlayerOptions", function(playerId) 
	
	if permissions["trainer.noclip.player"] then
		local thisItem = NativeUI.CreateItem("Toggle Noclip for Player","")
		thisPlayer:AddItem(thisItem)
		thisItem.Activated = function(ParentMenu,SelectedItem)
			TriggerServerEvent("EasyAdmin:simpletrainer:toggleNoclip", playerId)
		end
	end
	
end)


AddEventHandler("EasyAdmin:BuildCachedOptions", function(playerId) -- Options for Cached Players, do note that these do not not support Player natives! They're cached BY EASYADMIN
end)

AddEventHandler("EasyAdmin:BuildServerManagementOptions", function() -- Options for the Server Management Submenu, passes nothing.
end)

AddEventHandler("EasyAdmin:BuildSettingsOptions", function() -- Options for the Settings Page, once again, passes nothing
end)


Citizen.CreateThread(function() -- trainer stuff fast thread
	while true do
		Wait(1)
		local playerPed = PlayerPedId()
		local veh = GetVehiclePedIsIn(playerPed, false)
		if veh == 0 then veh = false end
		
		if infiniteStamina then
			RestorePlayerStamina(-1, 1.0)
		end
		
		if noRagdoll then
			SetPedCanRagdoll(playerPed, false)
		end
		if neverWanted then
			SetPlayerWantedLevel(PlayerId(), 0, false)
			SetPlayerWantedLevelNow(PlayerId(), false)
		end
		
		
		if veh then
			if vehicleInvincible then
				SetEntityInvincible(veh, vehicleInvincible)
				SetEntityCanBeDamaged(veh, not vehicleInvincible)
				SetVehicleCanBreak(veh, not vehicleInvincible)
				SetVehicleCanBeVisiblyDamaged(veh, not vehicleInvincible)
				SetVehicleCanDeformWheels(veh, not vehicleInvincible)
				SetVehicleTyresCanBurst(veh, not vehicleInvincible)
			end
			
			if keepVehicleClean then
				SetVehicleDirtLevel(veh, 0)
				RemoveDecalsFromVehicle(veh)
			end
		end
		
		if NoclipActive then
			local pPed = playerPed
			local pCoords = GetEntityCoords(pPed)
			local veh = veh
			local vehDriver = GetPedInVehicleSeat(veh, -1)
			local speedLevels = {0.5,1.5,4.0, 10.0, 20.0}
			speedLevel = speedLevel or 1
			speed = speedLevels[speedLevel]
			local zoff,yoff = zoff or 0,yoff or 0 -- yiff?
			local entity = pPed
			if (veh and veh > 0 and vehDriver == pPed) then
				entity = veh
				FreezeEntityPosition(veh, true)
			else
				FreezeEntityPosition(pPed, true)
			end
			
			local heading = GetEntityHeading(entity)
			
			
			if not scaleform or not HasScaleformMovieLoaded(scaleform) then
				scaleform = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")
				repeat
					Wait(0)
				until HasScaleformMovieLoaded(scaleform)
			end
			
			BeginScaleformMovieMethod(scaleform, "CLEAR_ALL")
			EndScaleformMovieMethod()
			
			BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
			ScaleformMovieMethodAddParamInt(0)
			PushScaleformMovieMethodParameterString("~INPUT_SPRINT~")
			PushScaleformMovieMethodParameterString(string.format("Change Speed (%s)", speed))
			EndScaleformMovieMethod()
			
			BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
			ScaleformMovieMethodAddParamInt(1)
			PushScaleformMovieMethodParameterString("~INPUT_MOVE_LR~")
			PushScaleformMovieMethodParameterString("Turn Left/Right")
			EndScaleformMovieMethod()
			
			BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
			ScaleformMovieMethodAddParamInt(2)
			PushScaleformMovieMethodParameterString("~INPUT_MOVE_UD~")
			PushScaleformMovieMethodParameterString("Move")
			EndScaleformMovieMethod()
			
			BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
			ScaleformMovieMethodAddParamInt(3)
			PushScaleformMovieMethodParameterString("~INPUT_MULTIPLAYER_INFO~")
			PushScaleformMovieMethodParameterString("Down")
			EndScaleformMovieMethod()
			
			BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
			ScaleformMovieMethodAddParamInt(4)
			PushScaleformMovieMethodParameterString("~INPUT_COVER~")
			PushScaleformMovieMethodParameterString("Up")
			EndScaleformMovieMethod()
			
			
			BeginScaleformMovieMethod(scaleform, "SET_DATA_SLOT")
			ScaleformMovieMethodAddParamInt(5)
			PushScaleformMovieMethodParameterString(GetControlInstructionalButton(0, 206, 1))
			PushScaleformMovieMethodParameterString("Disable Noclip")
			EndScaleformMovieMethod()
			
			BeginScaleformMovieMethod(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
			ScaleformMovieMethodAddParamInt(0)
			EndScaleformMovieMethod()
			
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
			
			
			if IsControlPressed(0, 34) then
				heading = heading+2
			end
			if IsControlPressed(0, 35) then
				heading = heading-2
			end
			if IsControlPressed(0, 32) then
				yoff = 0.5
			end
			if IsControlPressed(0, 33) then
				yoff = -0.5
			end
			if IsControlPressed(0, 44) then
				zoff = 0.21+(speedLevel/100)
			end
			if IsControlPressed(0, 20) then
				zoff = -0.21-(speedLevel/100)
			end
			if IsControlJustPressed(0, 21) then
				if speedLevel < #speedLevels then
					speedLevel=speedLevel+1
				else
					speedLevel=1
				end
			end
			
			
			
			DisableControlAction(1, 75, true) -- exit vehicle
			--for i=30, 31,1 do
			--	DisableControlAction(1, i, true) -- walking/driving
			--end
			for i=266, 278,1 do
				DisableControlAction(1, i, true) -- walking/driving
			end
			
			local currentSpeed = speed
			currentSpeed = currentSpeed / (1 / GetFrameTime()) * 60
			newPos = GetOffsetFromEntityInWorldCoords(entity, 0, yoff * (currentSpeed + 0.3), zoff * (currentSpeed + 0.3))
			
			SetEntityVelocity(entity, 0, 0, 0)
			SetEntityRotation(entity, 0, 0, 0, 0, false)
			SetEntityHeading(entity, heading)
			SetEntityCollision(entity, false, false)
			SetEntityCoordsNoOffset(entity, newPos.x, newPos.y, newPos.z, true, true, true)
			SetEveryoneIgnorePlayer(pPed, true)
			SetPoliceIgnorePlayer(pPed, true)
			SetEntityInvincible(pPed, false)
			
			if IsControlPressed(0, 206) then
				NoclipActive = false
				FreezeEntityPosition(entity, false)
				SetEntityVelocity(entity, 0, 0, 0)
				SetEntityRotation(entity, 0, 0, 0, 0, false)
				SetEntityHeading(entity, heading)
				SetEntityCollision(entity, true, true)
				SetEveryoneIgnorePlayer(pPed, false)
				SetPoliceIgnorePlayer(pPed, false)
				SetEntityInvincible(pPed, false)
				SetEntityVisible(PlayerPedId(), true, 0)
			end
		end
		
		
	end
	
end)




AddEventHandler("EasyAdmin:BuildMainMenuOptions", function() 
	trainerMenu = _menuPool:AddSubMenu(mainMenu, "Trainer","",true)
	trainerMenu:SetMenuWidthOffset(menuWidth)	
	
	playerTrainerOptions = _menuPool:AddSubMenu(trainerMenu, "Player Options","",true)
	playerTrainerOptions:SetMenuWidthOffset(menuWidth)	
	
	
	if permissions["trainer.player.heal"] then
		local thisItem = NativeUI.CreateItem("Heal","") -- create our new item
		playerTrainerOptions:AddItem(thisItem) -- thisPlayer is global.
		thisItem.Activated = function(ParentMenu,SelectedItem)
			SetEntityHealth(PlayerPedId(), GetEntityMaxHealth(PlayerPedId()))
		end
	end
	
	
	if permissions["trainer.player.ragdoll"] then
		local thisItem = NativeUI.CreateCheckboxItem("No Ragdoll", noRagdoll or false,"") -- create our new item
		playerTrainerOptions:AddItem(thisItem) -- thisPlayer is global.
		thisItem.CheckboxEvent = function(sender, item, checked_)
			if item == thisItem then
				noRagdoll = checked_
				if checked_ then
					ShowNotification("No Ragdoll On!")
				else
					ShowNotification("No Ragdoll Off!")
					SetPedCanRagdoll(PlayerPedId(), true)
				end
			end
		end
	end
	
	
	if permissions["trainer.player.stamina"] then 
		local thisItem = NativeUI.CreateCheckboxItem("Infinite Stamina", infiniteStamina or false,"") -- create our new item
		playerTrainerOptions:AddItem(thisItem) -- thisPlayer is global.
		thisItem.CheckboxEvent = function(sender, item, checked_)
			if item == thisItem then
				infiniteStamina = checked_
				if checked_ then
					ShowNotification("Infinite Stamina On!")
				else
					ShowNotification("Infinite Stamina Off!")
				end
			end
		end
	end 
	
	if permissions["trainer.player.god"] then
		local thisItem = NativeUI.CreateCheckboxItem("Godmode", GetPlayerInvincible(PlayerId()) or false,"") -- create our new item
		playerTrainerOptions:AddItem(thisItem) -- thisPlayer is global.
		thisItem.CheckboxEvent = function(sender, item, checked_)
			if item == thisItem then
				SetPlayerInvincible(PlayerId(), checked_)
				if checked_ then
					ShowNotification("Invincibility On!")
				else
					ShowNotification("Invincibility Off!")
				end
				TriggerServerEvent("EasyAdmin:simpletrainer:toggleGod", checked_)
			end
		end
	end
	
	if permissions["trainer.player.wanted"] then
		local thisItem = NativeUI.CreateListItem("Set Wanted Level", {0,1,2,3,4,5}, GetPlayerWantedLevel(PlayerId())+1, "")
		playerTrainerOptions:AddItem(thisItem)
		thisItem.OnListSelected = function(sender, item, index)
			if item == thisItem then
				i = item:IndexToItem(index)
				SetPlayerWantedLevel(PlayerId(), index-1, false)
				SetPlayerWantedLevelNow(PlayerId(), false)
			end
		end
		
		local thisItem = NativeUI.CreateCheckboxItem("Never Wanted", neverWanted or false,"") 
		playerTrainerOptions:AddItem(thisItem)
		thisItem.CheckboxEvent = function(sender, item, checked_)
			if item == thisItem then
				neverWanted = checked_
				if checked_ then
					ShowNotification("Never Wanted On!")
				else
					ShowNotification("Never Wanted Off!")
				end
				TriggerServerEvent("EasyAdmin:simpletrainer:toggleNeverWanted", checked_)
			end
		end
	end
	
	if permissions["trainer.player.teleport"] then
		local thisItem = NativeUI.CreateItem("Teleport to Waypoint","") -- create our new item
		playerTrainerOptions:AddItem(thisItem) -- thisPlayer is global.
		thisItem.Activated = function(ParentMenu,SelectedItem)
			local waypoint = GetFirstBlipInfoId(8)
			if DoesBlipExist(waypoint) then
				local coords = GetBlipInfoIdCoord(waypoint)
				RequestCollisionAtCoord(coords.x, coords.y, coords.z)
				StartPlayerTeleport(PlayerId(), coords.x, coords.y, coords.z, GetEntityHeading(PlayerPedId()), true, true, true)

				local groundZ = 0.0
				repeat
					valid, groundZ = GetGroundZFor_3dCoord(coords.x, coords.y, 999.0, true)
					Wait(0)
				until (groundZ ~= 0.0)
				repeat
					Wait(0)
				until UpdatePlayerTeleport(PlayerId())
				StopPlayerTeleport()
				StartPlayerTeleport(PlayerId(), coords.x, coords.y, groundZ, GetEntityHeading(PlayerPedId()), true, true, true)
				repeat
					Wait(0)
				until UpdatePlayerTeleport(PlayerId())
				StopPlayerTeleport()
			end
		end
	end
	
	
	if permissions["trainer.player.weapons"] then
		local weapons = {
			{ "weapon_advancedrifle", GetLabelText("WT_RIFLE_ADV") },
			{ "weapon_appistol", GetLabelText("WT_PIST_AP") },
			{ "weapon_assaultrifle", GetLabelText("WT_RIFLE_ASL") },
			{ "weapon_assaultrifle_mk2", GetLabelText("WT_RIFLE_ASL2") },
			{ "weapon_assaultshotgun", GetLabelText("WT_SG_ASL") },
			{ "weapon_assaultsmg", GetLabelText("WT_SMG_ASL") },
			{ "weapon_autoshotgun", GetLabelText("WT_AUTOSHGN") },
			{ "weapon_bat", GetLabelText("WT_BAT") },
			{ "weapon_ball", GetLabelText("WT_BALL") },
			{ "weapon_battleaxe", GetLabelText("WT_BATTLEAXE") },
			{ "weapon_bottle", GetLabelText("WT_BOTTLE") },
			{ "weapon_bullpuprifle", GetLabelText("WT_BULLRIFLE") },
			{ "weapon_bullpuprifle_mk2", GetLabelText("WT_BULLRIFLE2") },
			{ "weapon_bullpupshotgun", GetLabelText("WT_SG_BLP") },
			{ "weapon_bzgas", GetLabelText("WT_BZGAS") },
			{ "weapon_carbinerifle", GetLabelText("WT_RIFLE_CBN") },
			{ "weapon_carbinerifle_mk2", GetLabelText("WT_RIFLE_CBN2") },
			{ "weapon_combatmg", GetLabelText("WT_MG_CBT") },
			{ "weapon_combatmg_mk2", GetLabelText("WT_MG_CBT2") },
			{ "weapon_combatpdw", GetLabelText("WT_COMBATPDW") },
			{ "weapon_combatpistol", GetLabelText("WT_PIST_CBT") },
			{ "weapon_compactlauncher", GetLabelText("WT_CMPGL") },
			{ "weapon_compactrifle", GetLabelText("WT_CMPRIFLE")},
			{ "weapon_crowbar", GetLabelText("WT_CROWBAR") },
			{ "weapon_dagger", GetLabelText("WT_DAGGER") },
			{ "weapon_dbshotgun", GetLabelText("WT_DBSHGN") },
			{ "weapon_doubleaction", GetLabelText("WT_REV_DA") },
			{ "weapon_fireextinguisher", GetLabelText("WT_FIRE") },
			{ "weapon_firework", GetLabelText("WT_FWRKLNCHR") },
			{ "weapon_flare", GetLabelText("WT_FLARE") },
			{ "weapon_flaregun", GetLabelText("WT_FLAREGUN") },
			{ "weapon_flashlight", GetLabelText("WT_FLASHLIGHT") },
			{ "weapon_golfclub", GetLabelText("WT_GOLFCLUB") },
			{ "weapon_grenade", GetLabelText("WT_GNADE") },
			{ "weapon_grenadelauncher", GetLabelText("WT_GL") },
			{ "weapon_gusenberg", GetLabelText("WT_GUSENBERG") },
			{ "weapon_hammer", GetLabelText("WT_HAMMER") },
			{ "weapon_hatchet", GetLabelText("WT_HATCHET") },
			{ "weapon_heavypistol", GetLabelText("WT_HEAVYPSTL") },
			{ "weapon_heavyshotgun", GetLabelText("WT_HVYSHOT") },
			{ "weapon_heavysniper", GetLabelText("WT_SNIP_HVY") },
			{ "weapon_heavysniper_mk2", GetLabelText("WT_SNIP_HVY2") },
			{ "weapon_hominglauncher", GetLabelText("WT_HOMLNCH") },
			{ "weapon_knife", GetLabelText("WT_KNIFE") },
			{ "weapon_knuckle", GetLabelText("WT_KNUCKLE") },
			{ "weapon_machete", GetLabelText("WT_MACHETE") },
			{ "weapon_machinepistol", GetLabelText("WT_MCHPIST") },
			{ "weapon_marksmanpistol", GetLabelText("WT_MKPISTOL") },
			{ "weapon_marksmanrifle", GetLabelText("WT_MKRIFLE") },
			{ "weapon_marksmanrifle_mk2", GetLabelText("WT_MKRIFLE2") },
			{ "weapon_mg", GetLabelText("WT_MG") },
			{ "weapon_microsmg", GetLabelText("WT_SMG_MCR") },
			{ "weapon_minigun", GetLabelText("WT_MINIGUN") },
			{ "weapon_minismg", GetLabelText("WT_MINISMG") },
			{ "weapon_molotov", GetLabelText("WT_MOLOTOV") },
			{ "weapon_musket", GetLabelText("WT_MUSKET") },
			{ "weapon_nightstick", GetLabelText("WT_NGTSTK") },
			{ "weapon_petrolcan", GetLabelText("WT_PETROL") },
			{ "weapon_pipebomb", GetLabelText("WT_PIPEBOMB") },
			{ "weapon_pistol", GetLabelText("WT_PIST") },
			{ "weapon_pistol50", GetLabelText("WT_PIST_50") },
			{ "weapon_pistol_mk2", GetLabelText("WT_PIST2") },
			{ "weapon_poolcue", GetLabelText("WT_POOLCUE") },
			{ "weapon_proxmine", GetLabelText("WT_PRXMINE") },
			{ "weapon_pumpshotgun", GetLabelText("WT_SG_PMP") },
			{ "weapon_pumpshotgun_mk2", GetLabelText("WT_SG_PMP2") },
			{ "weapon_railgun", GetLabelText("WT_RAILGUN") },
			{ "weapon_revolver", GetLabelText("WT_REVOLVER") },
			{ "weapon_revolver_mk2", GetLabelText("WT_REVOLVER2") },
			{ "weapon_rpg", GetLabelText("WT_RPG") },
			{ "weapon_sawnoffshotgun", GetLabelText("WT_SG_SOF") },
			{ "weapon_smg", GetLabelText("WT_SMG") },
			{ "weapon_smg_mk2", GetLabelText("WT_SMG2") },
			{ "weapon_smokegrenade", GetLabelText("WT_GNADE_SMK") },
			{ "weapon_sniperrifle", GetLabelText("WT_SNIP_RIF") },
			{ "weapon_snowball", GetLabelText("WT_SNWBALL") },
			{ "weapon_snspistol", GetLabelText("WT_SNSPISTOL") },
			{ "weapon_snspistol_mk2", GetLabelText("WT_SNSPISTOL2") },
			{ "weapon_specialcarbine", GetLabelText("WT_RIFLE_SCBN") },
			{ "weapon_specialcarbine_mk2", GetLabelText("WT_SPCARBINE2") },
			{ "weapon_stickybomb", GetLabelText("WT_GNADE_STK") },
			{ "weapon_stungun", GetLabelText("WT_STUN") },
			{ "weapon_switchblade", GetLabelText("WT_SWBLADE") },
			{ "weapon_vintagepistol", GetLabelText("WT_VPISTOL") },
			{ "weapon_wrench", GetLabelText("WT_WRENCH") },
			-- 1604
			{ "weapon_raypistol", GetLabelText("WT_RAYPISTOL") },
			{ "weapon_raycarbine", GetLabelText("WT_RAYCARBINE") },
			{ "weapon_rayminigun", GetLabelText("WT_RAYMINIGUN") },
			{ "weapon_stone_hatchet", GetLabelText("WT_SHATCHET") },
			-- 1868
			{ "weapon_ceramicpistol", GetLabelText("WT_CERPST") },
			{ "weapon_navyrevolver", GetLabelText("WT_REV_NV") },
			-- 2189
			{ "weapon_gadgetpistol", GetLabelText("WT_GDGTPST") },
			{ "weapon_militaryrifle", GetLabelText("WT_MLTRYRFL") },
			{ "weapon_combatshotgun", GetLabelText("WT_CMBSHGN") }
		}
		
		weaponsTrainerMenu = _menuPool:AddSubMenu(playerTrainerOptions, "Weapons","",true)
		weaponsTrainerMenu:SetMenuWidthOffset(menuWidth)	
		
		local thisItem = NativeUI.CreateItem("Give all Weapons","") 
		weaponsTrainerMenu:AddItem(thisItem)
		thisItem.Activated = function(ParentMenu,SelectedItem)
			local playerPed = PlayerPedId()
			for i, weapon in pairs(weapons) do
				GiveWeaponToPed(playerPed, weapon[1], -1, false, false)
			end
			_menuPool:CloseAllMenus()
			repeat
				Wait(100)
			until weaponsTrainerMenu
			GenerateMenu()
			weaponsTrainerMenu:Visible(true)
		end
		
		local thisItem = NativeUI.CreateItem("Remove all Weapons","") 
		weaponsTrainerMenu:AddItem(thisItem)
		thisItem.Activated = function(ParentMenu,SelectedItem)
			local playerPed = PlayerPedId()
			for i, weapon in pairs(weapons) do
				RemoveAllPedWeapons(playerPed, true)
			end
			_menuPool:CloseAllMenus()
			repeat
				Wait(100)
			until weaponsTrainerMenu
			GenerateMenu()
			weaponsTrainerMenu:Visible(true)
		end
		
		for i, weaponInfo in pairs(weapons) do
			local group = GetWeapontypeGroup(GetHashKey(weaponInfo[1]))
			
			local thisItem = NativeUI.CreateCheckboxItem(weaponInfo[2], HasPedGotWeapon(PlayerPedId(), weaponInfo[1], false), "")
			weaponsTrainerMenu:AddItem(thisItem)
			thisItem.CheckboxEvent = function(sender, item, checked_)
				if HasPedGotWeapon(PlayerPedId(), weaponInfo[1], false) then
					RemoveWeaponFromPed(PlayerPedId(), weaponInfo[1])
				else
					GiveWeaponToPed(PlayerPedId(), weaponInfo[1], -1, false, true)
				end
			end
			
			
		end
		
		
		
		
	end
	
	
	vehicleTrainerMenu = _menuPool:AddSubMenu(trainerMenu, "Vehicle Options","",true)
	vehicleTrainerMenu:SetMenuWidthOffset(menuWidth)	
	
	
	if permissions["trainer.vehicle.spawn"] then
		local thisItem = NativeUI.CreateItem("Spawn Car","") -- create our new item
		vehicleTrainerMenu:AddItem(thisItem) -- thisPlayer is global.
		thisItem.Activated = function(ParentMenu,SelectedItem)
			AddTextEntry("CARNAME", "Car Model Name")
			DisplayOnscreenKeyboard(1, "CARNAME", "", "", "", "", "", 64)
			
			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait( 0 )
			end
			
			local result = GetOnscreenKeyboardResult()
			
			if result and result ~= "" then
				if result == "yiff" then
					ShowNotification("OwO")
				elseif not IsModelInCdimage(result) or not IsModelValid(result) then
					ShowNotification("~r~Model not found!")
				else
					
					RequestModel(result)
					repeat
						Wait(10)
					until HasModelLoaded(result)
					TriggerServerEvent("EasyAdmin:simpletrainer:spawnedCar", result)
					Wait(500)
					_menuPool:CloseAllMenus()
					repeat
						Wait(100)
					until vehicleTrainerMenu
					GenerateMenu()
					vehicleTrainerMenu:Visible(true)
				end
			end
		end
	end
	
	
	if permissions["trainer.vehicle.fix"] then
		local thisItem = NativeUI.CreateItem("Fix Car","") -- create our new item
		vehicleTrainerMenu:AddItem(thisItem) -- thisPlayer is global.
		thisItem.Activated = function(ParentMenu,SelectedItem)
			SetVehicleFixed(GetVehiclePedIsIn(PlayerPedId(), false))
			TriggerServerEvent("EasyAdmin:simpletrainer:fixedCar")
		end
	end
	
	
	
	if permissions["trainer.vehicle.god"] then
		local thisItem = NativeUI.CreateCheckboxItem("Vehicle Godmode",vehicleInvincible or false,"") -- create our new item
		vehicleTrainerMenu:AddItem(thisItem) -- thisPlayer is global.
		thisItem.CheckboxEvent = function(sender, item, checked_)
			if item == thisItem then
				vehicleInvincible = checked_
				local veh = GetVehiclePedIsIn(PlayerPedId(), false)
				if veh and veh ~= 0 then
					if vehicleInvincible then 
						ShowNotification("Invincibility On!")
					else 
						ShowNotification("Invincibility Off!")
					end
					TriggerServerEvent("EasyAdmin:simpletrainer:toggleCarGod", vehicleInvincible)
					SetEntityInvincible(veh, vehicleInvincible)
					SetEntityCanBeDamaged(veh, not vehicleInvincible)
					SetVehicleCanBreak(veh, not vehicleInvincible)
					SetVehicleCanBeVisiblyDamaged(veh, not vehicleInvincible)
					SetVehicleCanDeformWheels(veh, not vehicleInvincible)
					SetVehicleTyresCanBurst(veh, not vehicleInvincible)
				end
			end
		end
	end
	
	if permissions["trainer.vehicle.clean"] then
		local thisItem = NativeUI.CreateCheckboxItem("Keep Vehicle Clean",keepVehicleClean or false,"") -- create our new item
		vehicleTrainerMenu:AddItem(thisItem) -- thisPlayer is global.
		thisItem.CheckboxEvent = function(sender, item, checked_)
			if item == thisItem then
				keepVehicleClean = checked_
			end
		end
		
		local thisItem = NativeUI.CreateItem("Clean Vehicle","") -- create our new item
		vehicleTrainerMenu:AddItem(thisItem) -- thisPlayer is global.
		thisItem.Activated = function(ParentMenu,SelectedItem)
			local veh = GetVehiclePedIsIn(PlayerPedId(), false)
			SetVehicleDirtLevel(veh, 0)
			RemoveDecalsFromVehicle(veh)
		end
	end
	
	
	if permissions["trainer.vehicle.plate"] then
		local thisItem = NativeUI.CreateItem("Change License Plate Text","")
		vehicleTrainerMenu:AddItem(thisItem) 
		thisItem.Activated = function(ParentMenu,SelectedItem)
			AddTextEntry("CARNAME", "Plate Text")
			DisplayOnscreenKeyboard(1, "CARNAME", "", "", "", "", "", 8)
			
			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait( 0 )
			end
			
			local result = GetOnscreenKeyboardResult()
			
			if result then
				SetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId(), false), result)
			end
		end
	end
	
	if permissions["trainer.vehicle.mod"] then
		
		thisVehicleModTrainerMenu = _menuPool:AddSubMenu(vehicleTrainerMenu, "Vehicle Mods","",true)
		thisVehicleModTrainerMenu:SetMenuWidthOffset(menuWidth)	
		
		
		local veh = GetVehiclePedIsIn(PlayerPedId())
		
		if DoesEntityExist(veh) then
			SetVehicleModKit(veh, 0)
			local knownMods = {
				[11] = "Engine",
				[12] = "Brakes",
				[13] = "Transmission",
				[14] = "Horns",
				[15] = "Suspension",
				[16] = "Armor",
				[23] = "Front Wheels",
				[24] = "Rear Wheels",
				[25] = "License Plate",
				[28] = "Bobbleheads",
				[29] = "Interior",
				[30] = "Gauges",
				[31] = "Door Panels",
				[32] = "Seats",
				[33] = "Steering Wheel",
				[39] = "Engine Cover",
				[40] = "Air Intake",
				[41] = "Strut Bracing",
				[42] = "Headlights",
				[43] = "Fog Lights",
				[46] = "Windows",
				[44] = "Roof",
				[45] = "Fenders",
				[47] = "Strut Bracing",
				[48] = "Livery"
			}
			for i=0, 55 do
				if GetNumVehicleMods(veh,i) >= 1 then
					local modSlotName = tostring(GetModSlotName(veh, i))
					local modLabel = (GetLabelText(modSlotName) ~= "NULL" ) and GetLabelText(modSlotName) or modSlotName -- resolve name of mod
					if knownMods[i] then
						modLabel = knownMods[i]
					end
					
					if modLabel ~= "nil" then -- if we have no idea what that mod is, skip it
						
						
						if i==23 then
							
							local thisItem = NativeUI.CreateCheckboxItem("Bulletproof Tyres", not GetVehicleTyresCanBurst(veh), "")
							thisVehicleModTrainerMenu:AddItem(thisItem)
							thisItem.CheckboxEvent = function(sender, item, checked_)
								SetVehicleTyresCanBurst(veh, not checked_)
							end
							
							local wheeltypes = {
								"Sports",       -- 0
								"Muscle",       -- 1
								"Lowrider",     -- 2
								"SUV",          -- 3
								"Offroad",      -- 4
								"Tuner",        -- 5
								"Bike Wheels",  -- 6
								"High End",     -- 7
								"Benny's (1)",  -- 8
								"Benny's (2)",  -- 9
								"Open Wheel",   -- 10
								"Street",       -- 11
								"Track"         -- 12
							}
							
							local thisItem = NativeUI.CreateListItem("Wheel Type", wheeltypes, (GetVehicleWheelType(veh)+1) or 1, "")
							thisVehicleModTrainerMenu:AddItem(thisItem)
							thisItem.OnListSelected = function(sender, item, index)
								if item == thisItem then
									i = item:IndexToItem(index)
									SetVehicleWheelType(veh, index-1)
									_menuPool:CloseAllMenus()
									repeat
										Wait(100)
									until thisVehicleModTrainerMenu
									GenerateMenu()
									thisVehicleModTrainerMenu:Visible(true)
								end
							end
						elseif i == 11 then
							turboInstalled = IsToggleModOn(veh, 18)
							local thisItem = NativeUI.CreateCheckboxItem("Turbo", turboInstalled, "")
							thisVehicleModTrainerMenu:AddItem(thisItem)
							thisItem.CheckboxEvent = function(sender, item, checked_)
								turboInstalled = checked_
								ToggleVehicleMod(veh, 18, turboInstalled)
							end
						end
						
						
						local thisModMenu = _menuPool:AddSubMenu(thisVehicleModTrainerMenu, "["..i.."] "..tostring(modLabel),"",true)
						thisModMenu:SetMenuWidthOffset(menuWidth)
						
						local thisActiveItem = false
						
						
						local thisStockItem = NativeUI.CreateItem("Stock", "")
						thisModMenu:AddItem(thisStockItem) 
						if GetVehicleMod(veh, i) == -1 then
							thisStockItem:SetRightBadge(22)
							thisActiveItem = thisStockItem
						end
						
						thisStockItem.Activated = function(ParentMenu,SelectedItem)
							SetVehicleMod(veh, i, -1, false)
							if thisActiveItem then thisActiveItem:SetRightBadge(0) end
							thisActiveItem = thisStockItem
							thisStockItem:SetRightBadge(22)
						end
						
						local ModCount = (GetNumVehicleMods(veh, i)-1 ~= -1 ) and GetNumVehicleMods(veh, i)-1 or GetNumVehicleMods(veh, i)
						for o=0, ModCount do
							local modText = GetModTextLabel(veh, i, o)
							local modTextLabel = (GetLabelText(modText) ~= "NULL" ) and GetLabelText(modText) or modText -- resolve name of mod
							local thisItem = NativeUI.CreateItem(modTextLabel or "Level "..o+1,"")
							if GetVehicleMod(veh, i) == o then
								thisItem:SetRightBadge(22)
								thisActiveItem = thisItem
							end
							thisModMenu:AddItem(thisItem) 
							
							thisItem.Activated = function(ParentMenu,SelectedItem)
								SetVehicleMod(veh, i, o, false)
								if thisActiveItem then thisActiveItem:SetRightBadge(0) end
								thisActiveItem = thisItem
								thisItem:SetRightBadge(22)
							end
						end
					end
				end
			end
		end
		local thisItem = NativeUI.CreateItem("Refresh Page", "No Vehicle Detected, press enter to reload page.")
		thisVehicleModTrainerMenu:AddItem(thisItem)
		thisItem.Activated = function(ParentMenu,SelectedItem)
			SetVehicleModKit(veh, 0)
			_menuPool:CloseAllMenus()
			repeat
				Wait(100)
			until thisVehicleModTrainerMenu
			GenerateMenu()
			thisVehicleModTrainerMenu:Visible(true)
		end
		
	end
	
	if permissions["trainer.vehicle.delete"] then
		local thisItem = NativeUI.CreateItem("~r~Delete Vehicle~s~","") -- create our new item
		vehicleTrainerMenu:AddItem(thisItem) -- thisPlayer is global.
		thisItem.Activated = function(ParentMenu,SelectedItem)
			local playerPed = PlayerPedId()
			if IsPedInAnyVehicle(playerPed) then
				SetEntityAsMissionEntity(GetVehiclePedIsIn(playerPed, false), true)
				DeleteEntity(GetVehiclePedIsIn(playerPed, false))
			end
		end
	end
	
	if permissions["trainer.noclip.self"] then
		Citizen.CreateThread(function()
			while true do
			  Citizen.Wait(1)
			   if IsControlJustReleased(0, 56) then
				  TriggerEvent('EasyAdmin:simpletrainer:toggleNoclip')
			   end
			end
		  end)		
	end
	
end)

RegisterNetEvent("EasyAdmin:simpletrainer:spawnedCar")
AddEventHandler("EasyAdmin:simpletrainer:spawnedCar", function(result)
	RequestModel(result)
	repeat
		Wait(10)
	until HasModelLoaded(result)
	local playerPed = PlayerPedId()
	if IsPedInAnyVehicle(playerPed) then
		SetEntityAsMissionEntity(GetVehiclePedIsIn(playerPed, false), true)
		DeleteEntity(GetVehiclePedIsIn(playerPed, false))
	end
	local pcoords = GetEntityCoords(playerPed)
	local heading = GetEntityHeading(playerPed)
	local veh = CreateVehicle(result, pcoords, heading, true, false)
	if math.random(0,1000) == 999 then
		SetVehicleNumberPlateText(veh, "blumlaut")
	else
		SetVehicleNumberPlateText(veh, "ezadmin")
	end
	SetPedIntoVehicle(playerPed, veh, -1)
end)

RegisterNetEvent("EasyAdmin:simpletrainer:toggleNoclip")
AddEventHandler("EasyAdmin:simpletrainer:toggleNoclip", function(toggle)
	if toggle == nil then toggle = not NoclipActive end
	if toggle == true then
		NoclipActive = true
		SetEntityVisible(PlayerPedId(), false, 0)
	elseif toggle == false then
		NoclipActive = false
		local pPed = PlayerPedId()
		local veh = GetVehiclePedIsIn(pPed, false)
		local vehDriver = GetPedInVehicleSeat(veh, -1)
		local entity = pPed
		if (veh and veh > 0 and vehDriver == pPed) then
			entity = veh
		end
		FreezeEntityPosition(pPed, false)
		SetEntityVelocity(entity, 0, 0, 0)
		SetEntityRotation(entity, 0, 0, 0, 0, false)
		SetEntityHeading(entity, heading)
		SetEntityCollision(entity, true, true)
		SetEveryoneIgnorePlayer(pPed, false)
		SetPoliceIgnorePlayer(pPed, false)
		SetEntityVisible(pPed, true, 0)
		SetPlayerInvincible(pPed, false)
	end
end)



