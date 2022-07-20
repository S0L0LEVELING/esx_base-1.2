-- Init ESX ----------------------------------------------------------------
ESX = nil  
PlayerData = {}                                                               --
Citizen.CreateThread(function()                                           --
	while ESX == nil do                                                   --
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)  --
		Citizen.Wait(0)                                                   --
	end  
    while ESX.GetPlayerData().job == nil do -- Get players job 
        Citizen.Wait(1)
    end
    PlayerData = ESX.GetPlayerData() -- Get player data                                                                  --
end)                                                                      --
----------------------------------------------------------------------------

local CurrentAction = nil 
local lootcounterzone1 = 0 
local lootcounterzone2 = 0 
local lootcounterzone3 = 0 
local lootcounterzone4 = 0 
local exitcounter = 0 

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
      SetTextOutline()
  end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
  end
  
  RegisterNetEvent('boomba-ramkraak:startTimer')
  AddEventHandler('boomba-ramkraak:startTimer', function()
      local timer = Config.timer
  
      Citizen.CreateThread(function()
          while timer > 0 and running do
              Citizen.Wait(1000)
  
              if timer > 0 then
                  timer = timer - 1
              end
  
        if timer == 0 then
            -- Close doorlock
        end
          end
      end)
      Citizen.CreateThread(function()
          while running do
              Citizen.Wait(0)
              -- ESX.ShowNotification(_U('timer')..timer.._U('timer2'))
                drawTxt(0.66, 1.44, 1.0, 1.0, 0.4, _U('timer')..timer.._U('timer2'), 255, 255, 255, 255)
          end
      end)
  end)

RegisterNetEvent("boomba-ramkraak:hasEnteredMarker")
AddEventHandler('boomba-ramkraak:hasEnteredMarker', function(zone)
    if zone == 'Loot1' then
		if lootcounterzone1 == 1 then
			lootcounterzone1 = lootcounterzone1 + 1 
			CurrentAction = 'loot'
			if exitcounter == 1 then
				exitcounter = exitcounter + 1 
			end
		end
	elseif zone == 'Loot2' then
		if lootcounterzone2 == 1 then 
			lootcounterzone2 = lootcounterzone2 + 1 
			CurrentAction = 'loot'
			if exitcounter == 1 then
				exitcounter = exitcounter + 1 
			end
		end
	elseif zone == 'Loot3' then
		if lootcounterzone3 == 1 then 
			lootcounterzone3 = lootcounterzone3 + 1 
			CurrentAction = 'loot'
			if exitcounter == 1 then
				exitcounter = exitcounter + 1 
			end
		end
	elseif zone == 'Loot4' then
		if lootcounterzone4 == 1 then 
			lootcounterzone4 = lootcounterzone4 + 1 
			CurrentAction = 'loot'
			if exitcounter == 1 then
				exitcounter = exitcounter + 1 
			end
		end
	end
end)

RegisterNetEvent("boomba-ramkraak:hasExitedMarker")
AddEventHandler('boomba-ramkraak:hasExitedMarker', function(zone)
	CurrentAction = nil
end)

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.location) do
			if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 100.0) then
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		local coords      = GetEntityCoords(PlayerPedId())
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.location) do
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
				isInMarker  = true
				currentZone = k
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker = true
			LastZone                = currentZone
			TriggerEvent('boomba-ramkraak:hasEnteredMarker', currentZone)
		end

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('boomba-ramkraak:hasExitedMarker', LastZone)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if CurrentAction then
			ESX.ShowHelpNotification("Druk op E om te looten!")

			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'loot' then 
					FreezeEntityPosition(GetPlayerPed(PlayerId()), true)
                    exports['progressBars']:startUI(15000, "Looting...")
                    Citizen.Wait(15000)
                    TriggerServerEvent("boomba-ramkraak:pay", GetPlayerServerId(PlayerId()))
					FreezeEntityPosition(GetPlayerPed(PlayerId()), false)
                end
				CurrentAction = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)

local cooldowncounter = 0 
local opendoor = false 
local CurrentActiondoorlock = nil 

RegisterNetEvent('boomba-ramkraak:callcops')
AddEventHandler('boomba-ramkraak:callcops', function()
  SetNewWaypoint(112.8709, -1038.1420)
end)
-- Doorlocks 
RegisterNetEvent("boomba-ramkraak:doorlock:hasEnteredMarker")
AddEventHandler('boomba-ramkraak:doorlock:hasEnteredMarker', function(zonedoorlock)
	if zonedoorlock == 'Doorlock1' then
		if cooldowncounter == 0 then 
			ESX.TriggerServerCallback('boomba-ramkraak:isActive', function(isActive, cooldown)
				if cooldown <= 0 then
					CurrentActiondoorlock     = 'gevel'
					exitcounter = exitcounter + 1 
					cooldowncounter = cooldowncounter + 1 
				end 
			end)
		end
	end 
    if zonedoorlock == 'checkifexited' then 
		if exitcounter >= 2 then 
			Citizen.Wait(2000)
        	TriggerEvent("boomba-ramkraak:opendoor")
			exitcounter = 0 
			Citizen.Wait(Config.CooldownMinutes * 60000) 
			cooldowncounter = 0 
			lootcounterzone1 = 0 
			lootcounterzone2 = 0 		
			lootcounterzone3 = 0 
 			lootcounterzone4 = 0 
		end 
    end 
end)

RegisterNetEvent("boomba-ramkraak:doorlock:hasExitedMarker")
AddEventHandler('boomba-ramkraak:doorlock:hasExitedMarker', function(zone)
	CurrentActiondoorlock = nil
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.locationdoorlocks) do
			if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 100.0) then
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 0, false, true, 2, false, false, false, false)
			end
		end
    end 
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)

		local coords      = GetEntityCoords(PlayerPedId())
		local isInMarkerdoorlock  = false
		local currentZone = nil

		for k,v in pairs(Config.locationdoorlocks) do
			if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
				isInMarkerdoorlock  = true
				currentZone = k
			end
		end

		if (isInMarkerdoorlock and not HasAlreadyEnteredMarkerdoorlock) or (isInMarkerdoorlock and LastZone ~= currentZone) then
			HasAlreadyEnteredMarkerdoorlock = true
			LastZone                = currentZone
			TriggerEvent('boomba-ramkraak:doorlock:hasEnteredMarker', currentZone)
			-- TriggerServerEvent('boomba-ramkraak:checkcooldown')
		end

		if not isInMarkerdoorlock and HasAlreadyEnteredMarkerdoorlock then
			HasAlreadyEnteredMarkerdoorlock = false
		-- print("Entered Marker")
			TriggerEvent('boomba-ramkraak:doorlock:hasExitedMarker', LastZone)
		end
	end
end)

RegisterCommand("check", function()
	TriggerServerEvent('boomba-ramkraak:notifycops')
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		ESX.TriggerServerCallback('boomba-ramkraak:EnoughCops', function(cb)
			--print(cb)
		end) 
		if CurrentActiondoorlock then
			local speed = GetEntitySpeed(GetPlayerPed(PlayerId()))
			if GetVehiclePedIsIn(GetPlayerPed(PlayerId()) ,false) > 0 then 
				if speed > Config.minimumspeed then 
					ESX.TriggerServerCallback('boomba-ramkraak:EnoughCops', function(cb)
						--print(cb)
						if cb then
							if CurrentActiondoorlock == 'gevel' then
								TriggerServerEvent('boomba-ramkraak:notifycops')
								-- TriggerServerEvent("boomba-ramkraak:checkifcop")
								TriggerServerEvent('boomba-ramkraak:checkcooldown')
								TriggerEvent("boomba-ramkraak:opendoor")
								--cooldowncounter = 0
							lootcounterzone1 = 1 
							lootcounterzone2 = 1 		
							lootcounterzone3 = 1 
							lootcounterzone4 = 1 
							CurrentActiondoorlock = nil
							end 
						else
							cooldowncounter = 0 
							lootcounterzone1 = 0 
							lootcounterzone2 = 0 		
							lootcounterzone3 = 0 
							lootcounterzone4 = 0 
							ESX.ShowHelpNotification("Niet genoeg Politie in de stad!")
						end 
					end, Config.minimumcops) 
				else 
					cooldowncounter = 0 
					lootcounterzone1 = 0 
					lootcounterzone2 = 0 		
					lootcounterzone3 = 0 
					lootcounterzone4 = 0 
				end 
			else 
				cooldowncounter = 0 
				lootcounterzone1 = 0 
				lootcounterzone2 = 0 		
				lootcounterzone3 = 0 
				lootcounterzone4 = 0 
			end 
		else
			Citizen.Wait(20)
		end
	end
end)

function hackeoEvent(success)
	TriggerEvent('mhacking:hide')
	if success then	
        TriggerEvent('boomba-ramkraak:startTimer', GetPlayerName(PlayerId()))
        -- Open doorlock 
	end		
end


function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
  end

  RegisterNetEvent('boomba-ramkraak:notifyPolice')
  AddEventHandler('boomba-ramkraak:notifyPolice', function()	
      if PlayerData.job ~= nil and PlayerData.job.name == Config.policejob then
		local coords = vector3(112.8709, -1038.1420, 21)
      street = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
          street2 = GetStreetNameFromHashKey(street)
          ESX.ShowAdvancedNotification("Er is een ramkraak gaande!", "", "Er is een waypoint gezet!", "CHAR_CALL911", 1)
          blip = AddBlipForCoord(coords)
          SetNewWaypoint(coords)
          SetBlipSprite(blip,  403)
          SetBlipColour(blip,  1)
          SetBlipAlpha(blip, 250)
          SetBlipScale(blip, 1.2)
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString("Ramkraak gaande")
          EndTextCommandSetBlipName(blip)
          table.insert(blips, blip)
          Wait(50000)
          for i in pairs(blips) do
              RemoveBlip(blips[i])
              blips[i] = nil
          end
      end 
  end)


  