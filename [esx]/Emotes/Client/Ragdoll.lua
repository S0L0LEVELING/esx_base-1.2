local isInRagdoll = false

Citizen.CreateThread(function()
 while true do
    Citizen.Wait(10)
    if isInRagdoll then
      SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
    end
  end
end)

local CoolDownActive = false

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
    --if IsControlJustPressed(2, Config.RagdollKeybind) and Config.RagdollEnabled and IsPedOnFoot(PlayerPedId()) then
	RegisterCommand('ragdoll', function()
		if not CoolDownActive then
			if isInRagdoll then
				isInRagdoll = false
			else
				isInRagdoll = true
				CoolDownActive = true
				Wait(500)
			end
		else
			TriggerEvent('esx:showNotification', '~r~Ragdoll spammen is niet toegestaan!')
		end
    end)
  end
end)

RegisterKeyMapping('ragdoll', 'Ragdoll Keybind', 'keyboard', '')

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if CoolDownActive then
			Citizen.Wait(Config.CoolDownTime)
			CoolDownActive = false
		end
	end
end)

-- Wijzen handen omhoog crouch
crouched, handsup, pointing = false, false, false


local function startPointing()
    local ped = GetPlayerPed(-1)
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do
        Wait(0)
    end
    SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
    SetPedConfigFlag(ped, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, ped, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end

local function stopPointing()
    local ped = GetPlayerPed(-1)
    Citizen.InvokeNative(0xD01015C7316AE176, ped, "Stop")
    if not IsPedInjured(ped) then
        ClearPedSecondaryTask(ped)
    end
    if not IsPedInAnyVehicle(ped, 1) then
        SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
    end
    SetPedConfigFlag(ped, 36, 0)
    ClearPedSecondaryTask(PlayerPedId())
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		DisableControlAction(1, Config.CrouchKeybind, true)

		if IsDisabledControlJustReleased(1, Config.CrouchKeybind) and GetLastInputMethod(2) then
			local plyPed = PlayerPedId()
			if (DoesEntityExist(plyPed)) and (not IsEntityDead(plyPed)) and (IsPedOnFoot(plyPed)) then
				crouched = not crouched
				if crouched then 
					RequestAnimSet('move_ped_crouched')
		
					while not HasAnimSetLoaded('move_ped_crouched') do
						Citizen.Wait(10)
					end
		
					SetPedMovementClipset(plyPed, 'move_ped_crouched', 0.25)
				else
					ResetPedMovementClipset(plyPed, 0)
				end
			end
		end

		if IsControlJustReleased(1, Config.HandenomhoogKeybind) and GetLastInputMethod(2) then
			local plyPed = PlayerPedId()
			if (DoesEntityExist(plyPed)) and not (IsEntityDead(plyPed)) and (IsPedOnFoot(plyPed)) then
				if pointing then
					pointing = false
				end

				handsup = not handsup
				if handsup then
					RequestAnimDict('random@mugging3')

					while not HasAnimDictLoaded('random@mugging3') do
						Citizen.Wait(10)
					end

					TaskPlayAnim(plyPed, 'random@mugging3', 'handsup_standing_base', 8.0, -8, -1, 49, 0, 0, 0, 0)
				else
					ClearPedSecondaryTask(plyPed)
				end
			end
		end

		if IsControlJustReleased(1, Config.WijzenKeybind) and GetLastInputMethod(2) then
			local plyPed = PlayerPedId()
			if (DoesEntityExist(plyPed)) and (not IsEntityDead(plyPed)) and (IsPedOnFoot(plyPed)) then
				if handsup then
					handsup = false
				end

				pointing = not pointing
				if pointing then
					startPointing(plyPed)
				else
					stopPointing(plyPed)
				end
			end
		end

		if crouched or handsup or pointing then
			if not IsPedOnFoot(PlayerPedId()) then
				ResetPedMovementClipset(plyPed, 0)
				stopPointing()
				crouched, handsup, pointing = false, false, false
			elseif pointing then
				local ped = PlayerPedId()
				local camPitch = GetGameplayCamRelativePitch()

				if camPitch < -70.0 then
					camPitch = -70.0
				elseif camPitch > 42.0 then
					camPitch = 42.0
				end

				camPitch = (camPitch + 70.0) / 112.0

				local camHeading = GetGameplayCamRelativeHeading()
				local cosCamHeading = Cos(camHeading)
				local sinCamHeading = Sin(camHeading)

				if camHeading < -180.0 then
					camHeading = -180.0
				elseif camHeading > 180.0 then
					camHeading = 180.0
				end

				camHeading = (camHeading + 180.0) / 360.0
				local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
				local rayHandle, blocked = GetShapeTestResult(StartShapeTestCapsule(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7))

				SetTaskPropertyFloat(ped, 'Pitch', camPitch)
				SetTaskPropertyFloat(ped, 'Heading', (camHeading * -1.0) + 1.0)
				SetTaskPropertyBool(ped, 'isBlocked', blocked)
				SetTaskPropertyBool(ped, 'isFirstPerson', N_0xee778f8c7e1142e2(N_0x19cafa3c87f7c2ff()) == 4)
			end
		end
	end
end)