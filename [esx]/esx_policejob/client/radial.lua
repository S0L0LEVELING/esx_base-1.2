


Config.ArrestDistance				= 3.0 
local PlayerData                = {}
local PracaPolice 				= 'police', 'dsi', 'handhaving', 'kmar'	-- Job needed to arrest

local Aresztuje					= false		-- Zostaw na False innaczej bedzie aresztowac na start Skryptu
local Aresztowany				= false		-- Zostaw na False innaczej bedziesz Arresztowany na start Skryptu
 
local SekcjaAnimacji			= 'mp_arrest_paired'	-- Animatiecatalogus sectie
local AnimAresztuje 			= 'cop_p2_back_left'	-- Arresterende animatie
local AnimAresztowany			= 'crook_p2_back_left'	-- Animatie van gedetineerde
local OstatnioAresztowany		= 0						-- 

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx_ruski_areszt:aresztowany')
AddEventHandler('esx_ruski_areszt:aresztowany', function(target)
	Aresztowany = true

	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

	RequestAnimDict(SekcjaAnimacji)

	while not HasAnimDictLoaded(SekcjaAnimacji) do
		Citizen.Wait(10)
	end

	AttachEntityToEntity(GetPlayerPed(-1), targetPed, 11816, -0.1, 0.45, 0.0, 0.0, 0.0, 20.0, false, false, false, false, 20, false)
	TaskPlayAnim(playerPed, SekcjaAnimacji, AnimAresztowany, 8.0, -8.0, 5500, 33, 0, false, false, false)

	Citizen.Wait(950)
	DetachEntity(GetPlayerPed(-1), true, false)

	Aresztowany = false
end)

RegisterNetEvent('esx_ruski_areszt:aresztuj')
AddEventHandler('esx_ruski_areszt:aresztuj', function()
	local playerPed = GetPlayerPed(-1)

	RequestAnimDict(SekcjaAnimacji)

	while not HasAnimDictLoaded(SekcjaAnimacji) do
		Citizen.Wait(10)
	end

	TaskPlayAnim(playerPed, SekcjaAnimacji, AnimAresztuje, 8.0, -8.0, 5500, 33, 0, false, false, false)

	Citizen.Wait(3000)

	Aresztuje = false

end)

-- Glówna Funkcja Animacji
RegisterNetEvent('politie:cuffcrimineel')
AddEventHandler('politie:cuffcrimineel', function()	
		Wait(0)

		if not Aresztuje and GetGameTimer() - OstatnioAresztowany > 10 * 1000 and PlayerData.job.name == PracaPolice then	-- Mozesz tutaj zmienic przyciski
			Citizen.Wait(10)
			local closestPlayer, distance = ESX.Game.GetClosestPlayer()

			if distance ~= -1 and distance <= Config.ArrestDistance and not Aresztuje and not Aresztowany and not IsPedInAnyVehicle(GetPlayerPed(-1)) and not IsPedInAnyVehicle(GetPlayerPed(closestPlayer)) then
				Aresztuje = true
				OstatnioAresztowany = GetGameTimer()

				--ESX.ShowNotification("~b~Burger arresteren~r~ " .. GetPlayerServerId(closestPlayer) .. "")						-- Drukuje Notyfikacje
				TriggerServerEvent('esx_ruski_areszt:startAreszt', GetPlayerServerId(closestPlayer))									-- Rozpoczyna Funkcje na Animacje (Cala Funkcja jest Powyzej^^^)

				Citizen.Wait(2100)																									-- Czeka 2.1 Sekund
				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 2.0, 'cuffseffect', 0.7)									-- Daje Effekt zakuwania (Wgrywasz Plik .ogg do InteractSound'a i ustawiasz nazwe "cuffseffect.ogg")

				Citizen.Wait(3100)																									-- Czeka 3.1 Sekund
				--ESX.ShowNotification("~b~Burger gearresteerd ~r~ " .. GetPlayerServerId(closestPlayer) .. "")					-- Drukuje Notyfikacje
				TriggerServerEvent('esx_politie:handcuff', GetPlayerServerId(closestPlayer))
			end
		end
end)

RegisterNetEvent('politie:zetinvrtg')
AddEventHandler('politie:zetinvrtg', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		TriggerServerEvent('esx_politie:putInVehicle', GetPlayerServerId(closestPlayer))
	else
		ESX.ShowNotification(_U('no_players_nearby'))
	end
end)

RegisterNetEvent('politie:zetuitvrtg')
AddEventHandler('politie:zetuitvrtg', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		TriggerServerEvent('esx_politie:OutVehicle', GetPlayerServerId(closestPlayer))
	else
		ESX.ShowNotification(_U('no_players_nearby'))
	end
end)

RegisterNetEvent('politie:jail')
AddEventHandler('politie:jail', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		JailPlayer(GetPlayerServerId(closestPlayer))
	else
		ESX.ShowNotification(_U('no_players_nearby'))
	end
end)

RegisterNetEvent('politie:doorzoek')
AddEventHandler('politie:doorzoek', function()
local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		OpenBodySearchMenu(closestPlayer)
	else
		ESX.ShowNotification(_U('no_players_nearby'))
	end
end)

RegisterNetEvent('politie:revive')
AddEventHandler('politie:revive', function()
local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
if closestPlayer ~= -1 and closestDistance <= 3.0 then
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
				ESX.ShowNotification(_U('revive_complete'))
			else
				ESX.ShowNotification(_U('isdead'))
			end
	end)
	end
else
	ESX.ShowNotification(_U('no_players_nearby'))
end

end)

cuffed = false

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

RegisterNetEvent('esx_politie:getarrested')
AddEventHandler('esx_politie:getarrested', function(playerheading, playercoords, playerlocation)
	playerPed = GetPlayerPed(-1)
	SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(GetPlayerPed(-1), x, y, z)
	SetEntityHeading(GetPlayerPed(-1), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0)
	Citizen.Wait(3760)
	cuffed = true
	loadanimdict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
end)

RegisterNetEvent('esx_politie:doarrested')
AddEventHandler('esx_politie:doarrested', function()
	Citizen.Wait(250)
	loadanimdict('mp_arrest_paired')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0, 0, 0, 0)
	Citizen.Wait(3000)

end) 

RegisterNetEvent('esx_politie:douncuffing')
AddEventHandler('esx_politie:douncuffing', function()
local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	ClearPedTasks(GetPlayerPed(-1))
	TriggerServerEvent('esx_politie:handcuff', GetPlayerServerId(closestPlayer))
end)

RegisterNetEvent('esx_politie:getuncuffed')
AddEventHandler('esx_politie:getuncuffed', function(playerheading, playercoords, playerlocation)
	local x, y, z   = table.unpack(playercoords + playerlocation * 1.0)
	SetEntityCoords(GetPlayerPed(-1), x, y, z - 1)
	SetEntityHeading(GetPlayerPed(-1), playerheading)
	Citizen.Wait(250)
	loadanimdict('mp_arresting')
	TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
	Citizen.Wait(5500)
	cuffed = false
	ClearPedTasks(GetPlayerPed(-1))
end)


RegisterNetEvent('politie:cuff')
AddEventHandler('politie:cuff', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		TriggerServerEvent('esx_politie:handcuff', GetPlayerServerId(closestPlayer))
	else
		ESX.ShowNotification(_U('no_players_nearby'))
	end
end)


RegisterNetEvent('politie:uncuff')
AddEventHandler('politie:uncuff', function()
local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
	local target, distance = ESX.Game.GetClosestPlayer()
	playerheading = GetEntityHeading(GetPlayerPed(-1))
	playerlocation = GetEntityForwardVector(PlayerPedId())
	playerCoords = GetEntityCoords(GetPlayerPed(-1))
	local target_id = GetPlayerServerId(target)
	TriggerServerEvent('esx_politie:requestrelease', target_id, playerheading, playerCoords, playerlocation)
	else
		ESX.ShowNotification(_U('no_players_nearby'))
	end
end)

function loadanimdict(dictname)
	if not HasAnimDictLoaded(dictname) then
		RequestAnimDict(dictname) 
		while not HasAnimDictLoaded(dictname) do 
			Citizen.Wait(1)
		end
	end
end
