local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}
local started = false
local displayed = false
local progress = 0
local CurrentVehicle 
local pause = false
local selection = 0
local quality = 0
ESX = nil

local LastCar

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_opiumcar:stop')
AddEventHandler('esx_opiumcar:stop', function()
	started = false
	DisplayHelpText("~r~Productie gestopt...")
	FreezeEntityPosition(LastCar, false)
end)
RegisterNetEvent('esx_opiumcar:stopfreeze')
AddEventHandler('esx_opiumcar:stopfreeze', function(id)
	FreezeEntityPosition(id, false)
end)
RegisterNetEvent('esx_opiumcar:notify')
AddEventHandler('esx_opiumcar:notify', function(message)
	ESX.ShowNotification(message)
end)

RegisterNetEvent('esx_opiumcar:startprod')
AddEventHandler('esx_opiumcar:startprod', function()
	DisplayHelpText("~g~Productie starten")
	started = true
	FreezeEntityPosition(CurrentVehicle,true)
	displayed = false
	print('Opium productie gestart')
	ESX.ShowNotification("~r~Opium productie is gestart")	
	SetPedIntoVehicle(GetPlayerPed(-1), CurrentVehicle, 3)
	SetVehicleDoorOpen(CurrentVehicle, 2)
end)

RegisterNetEvent('esx_opiumcar:blowup')
AddEventHandler('esx_opiumcar:blowup', function(posx, posy, posz)
	AddExplosion(posx, posy, posz + 2,23, 20.0, true, false, 1.0, true)
	if not HasNamedPtfxAssetLoaded("core") then
		RequestNamedPtfxAsset("core")
		while not HasNamedPtfxAssetLoaded("core") do
			Citizen.Wait(1)
		end
	end
	SetPtfxAssetNextCall("core")
	local fire = StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_l_fire", posx, posy, posz-0.8 , 0.0, 0.0, 0.0, 0.8, false, false, false, false)
	Citizen.Wait(6000)
	StopParticleFxLooped(fire, 0)
	
end)


RegisterNetEvent('esx_opiumcar:smoke')
AddEventHandler('esx_opiumcar:smoke', function(posx, posy, posz, bool)

	if bool == 'a' then

		if not HasNamedPtfxAssetLoaded("core") then
			RequestNamedPtfxAsset("core")
			while not HasNamedPtfxAssetLoaded("core") do
				Citizen.Wait(1)
			end
		end
		SetPtfxAssetNextCall("core")
		local smoke = StartParticleFxLoopedAtCoord("exp_grd_flare", posx, posy, posz + 1.7, 0.0, 0.0, 0.0, 2.0, false, false, false, false)
		SetParticleFxLoopedAlpha(smoke, 0.8)
		SetParticleFxLoopedColour(smoke, 0.0, 0.0, 0.0, 0)
		Citizen.Wait(22000)
		StopParticleFxLooped(smoke, 0)
	else
		StopParticleFxLooped(smoke, 0)
	end

end)
RegisterNetEvent('esx_opiumcar:drugged')
AddEventHandler('esx_opiumcar:drugged', function()
	SetTimecycleModifier("drug_drive_blend01")
	SetPedMotionBlur(GetPlayerPed(-1), true)
	SetPedMovementClipset(GetPlayerPed(-1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	SetPedIsDrunk(GetPlayerPed(-1), true)

	Citizen.Wait(300000)
	ClearTimecycleModifier()
end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		
		playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(GetPlayerPed(-1))
		if IsPedInAnyVehicle(playerPed) then
			
			
			CurrentVehicle = GetVehiclePedIsUsing(PlayerPedId())

			car = GetVehiclePedIsIn(playerPed, false)
			LastCar = GetVehiclePedIsUsing(playerPed)
	
			local model = GetEntityModel(CurrentVehicle)
			local modelName = GetDisplayNameFromVehicleModel(model)
			
			if modelName == 'JOURNEY2' and car then
				
					if GetPedInVehicleSeat(car, -1) == playerPed then
						if started == false then
							if displayed == false then
								DisplayHelpText("Druk op ~INPUT_CELLPHONE_CAMERA_FOCUS_LOCK~ om te starten met drugs produceren")
								displayed = true
							end
						end
						if IsControlJustReleased(0, Keys['L']) then
							if pos.y >= 3500 then
								if IsVehicleSeatFree(CurrentVehicle, 3) then
									TriggerServerEvent('esx_opiumcar:start')	
									progress = 0
									pause = false
									selection = 0
									quality = 0
									
								else
									DisplayHelpText('~r~Dit voertuig is al bezet')
								end
							else
								ESX.ShowNotification('~r~Je zit te dicht bij de stad, ga verder naar het Noorden om Opium te produceren')
							end
							
							
							
							
		
						end
					end
					
				
				
			
			end
			
		else

				
				if started then
					started = false
					displayed = false
					TriggerEvent('esx_opiumcar:stop')
					print('gestopt making drugs')
					FreezeEntityPosition(LastCar,false)
				end
		end
		
		if started == true then
			
			if progress < 96 then
				Citizen.Wait(6000)
				if not pause and IsPedInAnyVehicle(playerPed) then
					progress = progress +  1
					ESX.ShowNotification('~r~Opium Productie: ~g~~h~' .. progress .. '%')
					Citizen.Wait(6000) 
				end

				--
				--   EVENT 1
				--
				if progress > 22 and progress < 24 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~De propaan leiding lekt, wat ga je doen?')	
						ESX.ShowNotification('~o~1. Fixen met tape')
						ESX.ShowNotification('~o~2. Zo laten ')
						ESX.ShowNotification('~o~3. Vervangen')
						ESX.ShowNotification('~c~Druk op het nummer van de optie die je wilt uitvoeren')
					end
					if selection == 1 then
						print("Slected 1")
						ESX.ShowNotification('~r~De tape heeft de lekkage soort van gestopt')
						quality = quality - 3
						pause = false
					end
					if selection == 2 then
						print("Slected 2")
						ESX.ShowNotification('~r~De propaan tank is geexoplodeerd, je hebt het verpest...')
						TriggerServerEvent('esx_opiumcar:blow', pos.x, pos.y, pos.z)
						SetVehicleEngineHealth(CurrentVehicle, 0.0)
						quality = 0
						started = false
						displayed = false
						ApplyDamageToPed(GetPlayerPed(-1), 10, false)
						print('gestopt making drugs')
					end
					if selection == 3 then
						print("Slected 3")
						ESX.ShowNotification('~r~Goed gedaan, de leiding is in topconditie')
						pause = false
						quality = quality + 5
					end
				end
				--
				--   EVENT 5
				--
				if progress > 30 and progress < 32 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Je hebt een fles morfine op de grond laten vallen, wat doe je nu?')	
						ESX.ShowNotification('~o~1. Ramen openen om van de geur af te komen')
						ESX.ShowNotification('~o~2. Zo laten')
						ESX.ShowNotification('~o~3. Een masker opzetten met een luchtfilter')
						ESX.ShowNotification('~c~Druk op het nummer van de optie die je wilt uitvoeren')
					end
					if selection == 1 then
						print("Slected 1")
						ESX.ShowNotification('~r~Je hebt de ramen geopend om van de geur af te komen')
						quality = quality - 1
						pause = false
					end
					if selection == 2 then
						print("Slected 2")
						ESX.ShowNotification('~r~Je bent high geworden door teveel morfine in te ademen')
						pause = false
						TriggerEvent('esx_opiumcar:drugged')
					end
					if selection == 3 then
						print("Slected 3")
						ESX.ShowNotification('~r~Dat is ook een manier om het probleem op te lossen... denk ik')
						SetPedPropIndex(playerPed, 1, 26, 7, true)
						pause = false
					end
				end
				--
				--   EVENT 2
				--
				if progress > 38 and progress < 40 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Opium word te snel hard, wat doe je nu? ')	
						ESX.ShowNotification('~o~1. Verhoog de druk')
						ESX.ShowNotification('~o~2. Temperatuur verhogen')
						ESX.ShowNotification('~o~3. Druk verlagen')
						ESX.ShowNotification('~c~Druk op het nummer van de optie die je wilt uitvoeren')
					end
					if selection == 1 then
						print("Slected 1")
						ESX.ShowNotification('~r~Je hebt de druk verhoogd en de propaan is aan het weglekken, je hebt het verlaagd en het is oké voor nu')
						pause = false
					end
					if selection == 2 then
						print("Slected 2")
						ESX.ShowNotification('~r~Temperatuur verhogen heeft geholpen...')
						quality = quality + 5
						pause = false
					end
					if selection == 3 then
						print("Slected 3")
						ESX.ShowNotification('~r~Druk verlagen heeft het erger gemaakt...')
						pause = false
						quality = quality -4
					end
				end
				--
				--   EVENT 8 - 3
				--
				if progress > 41 and progress < 43 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Je hebt perongeluk teveel morfine toegevoegd, wat doe je nu?')	
						ESX.ShowNotification('~o~1. Niks doen')
						ESX.ShowNotification('~o~2. Proberen het eruit te zuigen met een rietje')
						ESX.ShowNotification('~o~3. Meer papaverine toevoegen om het te balanceren')
						ESX.ShowNotification('~c~Druk op het nummer van de optie die je wilt uitvoeren')
					end
					if selection == 1 then
						print("Slected 1")
						ESX.ShowNotification('~r~Het Opium ruikt niet zoals morfine')
						quality = quality - 3
						pause = false
					end
					if selection == 2 then
						print("Slected 2")
						ESX.ShowNotification('~r~Het werkte soort van maar het is Neeg steeds teveel')
						pause = false
						quality = quality - 1
					end
					if selection == 3 then
						print("Slected 3")
						ESX.ShowNotification('~r~Je hebt alle Chemicaliën gebalanceerd en het is weer goed!')
						pause = false
						quality = quality + 3
					end
				end
				--
				--   EVENT 3
				--
				if progress > 46 and progress < 49 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Je hebt wat kleurstof gevonden, wat ga je ermee doen?')	
						ESX.ShowNotification('~o~1. Toevoegen')
						ESX.ShowNotification('~o~2. Wegzetten')
						ESX.ShowNotification('~o~3. Opdrinken')
						ESX.ShowNotification('~c~Druk op het nummer van de optie die je wilt uitvoeren')
					end
					if selection == 1 then
						print("Slected 1")
						ESX.ShowNotification('~r~Goed idee, mensen houden van kleuren')
						quality = quality + 4
						pause = false
					end
					if selection == 2 then
						print("Slected 2")
						ESX.ShowNotification('~r~Het verpest mogelijk de smaak van de Opium')
						pause = false
					end
					if selection == 3 then
						print("Slected 3")
						ESX.ShowNotification('~r~Je voelt je een beetje raar en duizelig maar het is allemaal goed')
						pause = false
					end
				end
				--
				--   EVENT 4
				--
				if progress > 55 and progress < 58 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Het filter is verstopt, wat doe je nu?')	
						ESX.ShowNotification('~o~1. Schoonmaken met perslucht')
						ESX.ShowNotification('~o~2. Het filter vervangen')
						ESX.ShowNotification('~o~3. Schoonmaken met een tandenborstel')
						ESX.ShowNotification('~c~Druk op het nummer van de optie die je wilt uitvoeren')
					end
					if selection == 1 then
						print("Slected 1")
						ESX.ShowNotification('~r~Door de perslucht zit je nu onder het vloeibare Opium')
						quality = quality - 2
						pause = false
					end
					if selection == 2 then
						print("Slected 2")
						ESX.ShowNotification('~r~Vervangen was de beste optie')
						pause = false
						quality = quality + 3
					end
					if selection == 3 then
						print("Slected 3")
						ESX.ShowNotification('~r~Dit werkte best wel goed, maar het is Neeg steeds een beetje vies')
						pause = false
						quality = quality - 1
					end
				end
				--
				--   EVENT 5
				--
				if progress > 58 and progress < 60 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Je hebt een fles morfine laten vallen op de grond, wat doe je nu?')	
						ESX.ShowNotification('~o~1. Ramen openen om van de geur af te komen')
						ESX.ShowNotification('~o~2. Zo laten')
						ESX.ShowNotification('~o~3. Een masker opzetten met een luchtfilter')
						ESX.ShowNotification('~c~Druk op het nummer van de optie die je wilt uitvoeren')
					end
					if selection == 1 then
						print("Slected 1")
						ESX.ShowNotification('~r~Je hebt de ramen geopend om van de geur af te komen')
						quality = quality - 1
						pause = false
					end
					if selection == 2 then
						print("Slected 2")
						ESX.ShowNotification('~r~Je bent high geworden door teveel actetone in te ademen')
						pause = false
						TriggerEvent('esx_opiumcar:drugged')
					end
					if selection == 3 then
						print("Slected 3")
						ESX.ShowNotification('~r~Dat is ook een manier om het probleem op te lossen... denk ik')
						SetPedPropIndex(playerPed, 1, 26, 7, true)
						pause = false
					end
				end
				--
				--   EVENT 1 - 6
				--
				if progress > 63 and progress < 65 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~De propaan leiding lekt, wat doe je nu?')	
						ESX.ShowNotification('~o~1. Fixen met tape')
						ESX.ShowNotification('~o~2. Zo laten ')
						ESX.ShowNotification('~o~3. Vervangen')
						ESX.ShowNotification('~c~Druk op het nummer van de optie die je wilt uitvoeren')
					end
					if selection == 1 then
						print("Slected 1")
						ESX.ShowNotification('~r~De tape heeft het een soort van gefixed')
						quality = quality - 3
						pause = false
					end
					if selection == 2 then
						print("Slected 2")
						ESX.ShowNotification('~r~De propaantank is gexplodeerd, je hebt het verpest...')
						TriggerServerEvent('esx_opiumcar:blow', pos.x, pos.y, pos.z)
						SetVehicleEngineHealth(CurrentVehicle, 0.0)
						quality = 0
						started = false
						displayed = false
						ApplyDamageToPed(GetPlayerPed(-1), 10, false)
						print('gestopt making drugs')
					end
					if selection == 3 then
						print("Slected 3")
						ESX.ShowNotification('~r~Goed idee, de leiding zag er niet al te best uit')
						pause = false
						quality = quality + 5
					end
				end
				--
				--   EVENT 4 - 7
				--
				if progress > 71 and progress < 73 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Het filter is verstopt, wat doe je nu?')	
						ESX.ShowNotification('~o~1. Schoonmaken met perslucht')
						ESX.ShowNotification('~o~2. Het filter vervangen')
						ESX.ShowNotification('~o~3. Schoonmaken met een tandenborstel')
						ESX.ShowNotification('~c~Druk op het nummer van de optie die je wilt uitvoeren')
					end
					if selection == 1 then
						print("Slected 1")
						ESX.ShowNotification('~r~Door de perslucht zit je nu onder het vloeibare Opium')
						quality = quality - 2
						pause = false
					end
					if selection == 2 then
						print("Slected 2")
						ESX.ShowNotification('~r~Vervangen was de beste optie')
						pause = false
						quality = quality + 3
					end
					if selection == 3 then
						print("Slected 3")
						ESX.ShowNotification('~r~Dit werkte best wel goed, maar het is Neeg steeds een beetje vies')
						pause = false
						quality = quality - 1
					end
				end
				--
				--   EVENT 8
				--
				if progress > 76 and progress < 78 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Je hebt perongeluk teveel morfine toegevoegd, wat doe je nu?')	
						ESX.ShowNotification('~o~1. Niks doen')
						ESX.ShowNotification('~o~2. Proberen het eruit te zuigen met een rietje')
						ESX.ShowNotification('~o~3. Meer papaverine toevoegen om het te balanceren')
						ESX.ShowNotification('~c~Druk op het nummer van de optie die je wilt uitvoeren')
					end
					if selection == 1 then
						print("Slected 1")
						ESX.ShowNotification('~r~Het Opium ruikt niet zoals morfine')
						quality = quality - 3
						pause = false
					end
					if selection == 2 then
						print("Slected 2")
						ESX.ShowNotification('~r~Het werkte soort van maar het is Neeg steeds teveel')
						pause = false
						quality = quality - 1
					end
					if selection == 3 then
						print("Slected 3")
						ESX.ShowNotification('~r~Je hebt alle Chemicaliën gebalanceerd en het is weer goed!')
						pause = false
						quality = quality + 3
					end
				end
				--
				--   EVENT 9
				--
				if progress > 82 and progress < 84 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Je moet schijten, wat ga je doen?')	
						ESX.ShowNotification('~o~1. Proberen op te houden')
						ESX.ShowNotification('~o~2. Naar buiten gaan en schijten')
						ESX.ShowNotification('~o~3. Binnen schijten')
						ESX.ShowNotification('~c~Druk op het nummer van de optie die je wilt uitvoeren')
					end
					if selection == 1 then
						print("Slected 1")
						ESX.ShowNotification('~r~Goed idee, werken gaat voor daarna schijten')
						quality = quality + 1
						pause = false
					end
					if selection == 2 then
						print("Slected 2")
						ESX.ShowNotification('~r~Wanneer je buiten was is het glas gevallen van de tafel en zit alles eronder...')
						pause = false
						quality = quality - 2
					end
					if selection == 3 then
						print("Slected 3")
						ESX.ShowNotification('~r~De lucht ruikt naar schijt nu, de Opium ruikt nu naar schijt')
						pause = false
						quality = quality - 1
					end
				end
				--
				--   EVENT 10
				--
				if progress > 88 and progress < 90 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Wil je meer glasscherven toevoegen aan de Opium zodat het lijkt dat je er meer van hebt?')	
						ESX.ShowNotification('~o~1. Ja!')
						ESX.ShowNotification('~o~2. Nee')
						ESX.ShowNotification('~o~3. Wat nou als ik Opium toevoeg aan het glas?')
						ESX.ShowNotification('~c~Druk op het nummer van de optie die je wilt uitvoeren')
					end
					if selection == 1 then
						print("Slected 1")
						ESX.ShowNotification('~r~Nice je hebt er meer zakken uit gekregen')
						quality = quality + 1
						pause = false
					end
					if selection == 2 then
						print("Slected 2")
						ESX.ShowNotification('~r~Je hebt een goede drug producent, je product is hoge kwaliteit')
						pause = false
						quality = quality + 1
					end
					if selection == 3 then
						print("Slected 3")
						ESX.ShowNotification('~r~Dat is iets teveel, het is meer glas dan Opium maar ok...')
						pause = false
						quality = quality - 1
					end
				end
				
				
				
				
				
				
				
				if IsPedInAnyVehicle(playerPed) then
					TriggerServerEvent('esx_opiumcar:make', pos.x,pos.y,pos.z)
					if pause == false then
						selection = 0
						quality = quality + 1
						progress = progress +  math.random(1, 2)
						ESX.ShowNotification('~r~Opium Productie: ~g~~h~' .. progress .. '%')
					end
				else
					TriggerEvent('esx_opiumcar:stop')
				end

			else
				TriggerEvent('esx_opiumcar:stop')
				progress = 100
				ESX.ShowNotification('~r~Opium Productie: ~g~~h~' .. progress .. '%')
				ESX.ShowNotification('~g~~h~Productie klaar!')
				TriggerServerEvent('esx_opiumcar:finish', quality)
				FreezeEntityPosition(LastCar, false)
			end	
			
		end
		
	end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
			if IsPedInAnyVehicle(GetPlayerPed(-1)) then
			else
				if started then
					started = false
					displayed = false
					TriggerEvent('esx_opiumcar:stop')
					print('Gestopt met het maken van Opium')
					FreezeEntityPosition(LastCar,false)
				end		
			end
	end

end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)		
		if pause == true then
			if IsControlJustReleased(0, Keys['1']) then
				selection = 1
				ESX.ShowNotification('~g~Nummer 1 geselecteerd')
			end
			if IsControlJustReleased(0, Keys['2']) then
				selection = 2
				ESX.ShowNotification('~g~Nummer 2 geselecteerd')
			end
			if IsControlJustReleased(0, Keys['3']) then
				selection = 3
				ESX.ShowNotification('~g~Nummer 3 geselecteerd')
			end
		end

	end
end)




