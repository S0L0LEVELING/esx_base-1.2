-- Variables 
ESX = nil
PlayerData = {}
blips = {}
 
local LoggedIn = true
local CurrentRun = nil
local DeliverLoc = nil
local running = false

-- Esx init 
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(31) -- ESX init 
  end

  while ESX.GetPlayerData().job == nil do -- Get players job 
	Citizen.Wait(1)
  end

	PlayerData = ESX.GetPlayerData() -- Get player data 
end)

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

RegisterNetEvent('boomba:startTimer')
AddEventHandler('boomba:startTimer', function()
	local timer = Config.timer

	Citizen.CreateThread(function()
		while timer > 0 and running do
			Citizen.Wait(1000)

			if timer > 0 then
				timer = timer - 1
			end

      if timer == 0 then
        TriggerEvent('boomba:drugruns:endrunontimer')
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

-- generate menu and text and register keypress 
Citizen.CreateThread(function()
	while true do
    Citizen.Wait(1)
		if LoggedIn then
			for k, v in pairs(Config.Location) do
				local Distance = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), v["Door"]["X"], v["Door"]["Y"], v["Door"]["Z"], true) 
				if Distance < 1.5 then
					NearDoor = true
          if not running then
					DrawText3D(v["Door"]["X"], v["Door"]["Y"], v["Door"]["Z"] + 0.15, _U('door_title'))
					if IsControlJustPressed(0, 38) then
            exports['progressBars']:startUI(5000, _U('progressbar_title'))
            Citizen.Wait(5000)
              exports['br-menu']:SetTitle(_U('menu_title'))
              exports['br-menu']:AddButton(_U('Weed') , "Price: "..Config.MoneyWeed ,'boomba:drugsrun:wiet' ,'example button 1' , 'me')
              exports['br-menu']:AddButton(_U('Meth') ,  "Price: "..Config.MoneyMeth ,'boomba:drugsrun:meth' ,'example button 2' , "menuone" )
              exports['br-menu']:AddButton(_U('Coke1') ,  "Price: "..Config.MoneyCoke ,'boomba:drugsrun:coke' ,'example button 3' , "me" )
					end
        end
			end
    end
          -- End drugsrun , Givemoney and remove item  
          if DeliverLoc ~= nil then 
          local Distance2 = #(GetEntityCoords(GetPlayerPed(-1)) - DeliverLoc['Coords']) 
          if Distance2 < 1.5 then
            local names = Config.Names['Deliver'][math.random(1, #Config.Names['Deliver'])]
            NearDoor = true
            if running then
            DrawText3D(DeliverLoc['Coords']['x'], DeliverLoc['Coords']['y'], DeliverLoc['Coords']['z'] + 0.15, "~g~E~w~ - Deliver")
            if IsControlJustPressed(0, 38) then
              exports['progressBars']:startUI(5000, _U('progressbar_title'))
              Citizen.Wait(5000)

              ESX.TriggerServerCallback('boomba:EnoughCops', function(cb)
                if cb then 
                  if CurrentRun == 'wiet' then
                    TriggerServerEvent('boomba:drugrun:removeitem:weed', GetPlayerServerId(PlayerId()))
                  end 
                  if CurrentRun == 'meth' then  
                    TriggerServerEvent('boomba:drugrun:removeitem:meth', GetPlayerServerId(PlayerId()))
                  end
                  if CurrentRun == 'coke' then 
                    TriggerServerEvent('boomba:drugrun:removeitem:coke', GetPlayerServerId(PlayerId()))
                  end
                else 
                  if CurrentRun == 'wiet' then
                    TriggerServerEvent('boomba:drugrun:removeitem:weed:nocops', GetPlayerServerId(PlayerId()))
                  end 
                  if CurrentRun == 'meth' then  
                    TriggerServerEvent('boomba:drugrun:removeitem:meth:nocops', GetPlayerServerId(PlayerId()))
                  end
                  if CurrentRun == 'coke' then 
                    TriggerServerEvent('boomba:drugrun:removeitem:coke:nocops', GetPlayerServerId(PlayerId()))
                  end
                end 
              end, Config.Cops)

        TriggerServerEvent('boomba:log-drugruns', Config.wh_endrun, "💎boomba Drugruns: ", "💎 Player: "..GetPlayerName(PlayerId()).." ["..GetPlayerServerId(PlayerId()).."] \n 💎 Status: Ended \n 💎 Run: "..CurrentRun.." \n 💎 Police Alert: ✅", "boomba-Drugruns",  62207)
			  TriggerServerEvent('boomba:notifycops', GetEntityCoords(PlayerPedId()), _U('police_alert_message'), _U('blip_name'))
              exports['b1g_notify']:Notify('true', _U('end_run'))
              running = false
            end
          end
        end
      end
    end
	end
end)

RegisterNetEvent('boomba:drugruns:endrunontimer')
AddEventHandler('boomba:drugruns:endrunontimer', function()
  SetNewWaypoint(GetEntityCoords(PlayerPedId()))
  running = false 
end)

-- Get a random location 
function GetRandomLocation()
  local RndLocation = Config.Locations[math.random(1, #Config.Locations)]
  SetNewWaypoint(RndLocation['Coords'].x, RndLocation['Coords'].y)
  return RndLocation
end

function GetRandomAlert()
  local RndAlert = math.random(1, 3)
  if RndAlert == 2 then
    MakeRandomAlert = true 
    return MakeRandomAlert
  else 
    MakeRandomAlert = false 
    return MakeRandomAlert 
  end  
  return RndAlert
end

-- Start drugsrun 
RegisterNetEvent('boomba:startrun')
AddEventHandler('boomba:startrun', function()
  ESX.TriggerServerCallback('boomba:isActive', function(isActive, cooldown)
		if cooldown <= 0 then
      if Config.RequireCopsOnline then
        -- ESX.TriggerServerCallback('boomba:EnoughCops', function(cb)
         --  if cb then
            if not running then 
              DeliverLoc = GetRandomLocation()
              TriggerEvent('chat:addMessage', { 
                template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(31, 120, 6, 0.6); border-radius: 5px;"><i class="fas fa-cannabis"></i> {0}: {1} </div>',
                args = { "Franklin", Config.RandomText['Greeting'][math.random(1, #Config.RandomText['Greeting'])].. '' ..Config.RandomText['GoTo'][math.random(1, #Config.RandomText['GoTo'])] }, color = {31, 120, 6}	
              })
              
              running = true
              print(json.encode(DeliverLoc))
              TriggerServerEvent('boomba:checkcooldown')
              TriggerEvent('boomba:startTimer', GetPlayerName(PlayerId()))
              TriggerServerEvent('boomba:log-drugruns', Config.wh_startrun, "💎boomba Drugruns: ", "💎 Player: "..GetPlayerName(PlayerId()).." ["..GetPlayerServerId(PlayerId()).."] \n 💎 Status: Started \n 💎 Run: "..CurrentRun, "boomba-Drugruns",  62207)
              Citizen.Wait(50000)
              GetRandomAlert()
              if MakeRandomAlert then
                TriggerServerEvent('boomba:notifycops', GetEntityCoords(PlayerPedId()), _U('police_alert_message_move'), _U('blip_name_move'))
              end
            else
              exports['b1g_notify']:Notify('true', _U('busy'))
            end
          --[[else
            TriggerServerEvent('boomba:log-drugruns', Config.wh_startrun, "💎boomba Drugruns: ", "💎 Player: "..GetPlayerName(PlayerId()).." ["..GetPlayerServerId(PlayerId()).."] \n 💎 Status: Not enough police \n 💎 Run: "..CurrentRun, "boomba-Drugruns",  62207)
            ESX.ShowNotification(_U('not_enough_police'))
          end
        end, Config.Cops)]] 
      else
        if not running then 
          DeliverLoc = GetRandomLocation()
      
          TriggerEvent('chat:addMessage', { 
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(31, 120, 6, 0.6); border-radius: 5px;"><i class="fas fa-cannabis"></i> {0}: {1} </div>',
            args = { "Franklin", Config.RandomText['Greeting'][math.random(1, #Config.RandomText['Greeting'])].. '' ..Config.RandomText['GoTo'][math.random(1, #Config.RandomText['GoTo'])] }, color = {31, 120, 6}	
          })
      
          running = true
          TriggerServerEvent('boomba:checkcooldown')
          TriggerEvent('boomba:startTimer', GetPlayerName(PlayerId()))
          TriggerServerEvent('boomba:log-drugruns', Config.wh_startrun, "💎boomba Drugruns: ", "💎 Player: "..GetPlayerName(PlayerId()).." ["..GetPlayerServerId(PlayerId()).."] \n 💎 Status: Not enough police \n 💎 Run: "..CurrentRun, "boomba-Drugruns",  62207)
          print(json.encode(DeliverLoc))
        else
          exports['b1g_notify']:Notify('true', _U('busy'))
        end
      end
    else 
      cooldown2 = cooldown/60000 
      ESX.ShowNotification(_U('cooldown')..cooldown2..(_U('cooldown2')))
    end 
    end)
end)

RegisterNetEvent('boomba:drugsrun:wiet')
AddEventHandler('boomba:drugsrun:wiet', function()
  CurrentRun = "wiet"
  TriggerEvent('boomba:startrun')
end)

RegisterNetEvent('boomba:drugsrun:coke')
AddEventHandler('boomba:drugsrun:coke', function()
  CurrentRun = "coke"
  TriggerEvent('boomba:startrun')
end)

RegisterNetEvent('boomba:drugsrun:meth')
AddEventHandler('boomba:drugsrun:meth', function()
  CurrentRun = "meth"
  TriggerEvent('boomba:startrun')
end)

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

RegisterNetEvent('boomba:notifyPolice')
AddEventHandler('boomba:notifyPolice', function(coords, policealertmessage2, blipname2)	
	if PlayerData.job ~= nil and PlayerData.job.name == Config.policejob then
    street = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
		street2 = GetStreetNameFromHashKey(street)
		ESX.ShowAdvancedNotification(_U('police_alert_title'), policealertmessage2, street2, "CHAR_CALL911", 1)
		blip = AddBlipForCoord(coords)
		SetBlipSprite(blip,  403)
		SetBlipColour(blip,  1)
		SetBlipAlpha(blip, 250)
		SetBlipScale(blip, 1.2)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(blipname2)
		EndTextCommandSetBlipName(blip)
		table.insert(blips, blip)
		Wait(50000)
		for i in pairs(blips) do
			RemoveBlip(blips[i])
			blips[i] = nil
		end
	end 
end)
