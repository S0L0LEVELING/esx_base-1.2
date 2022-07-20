AddEventHandler("EasyAdmin:BuildMainMenuOptions", function() 
	klavertDevMenu = _menuPool:AddSubMenu(mainMenu, "Dev Tools","",true)
    klavertTelMenu = _menuPool:AddSubMenu(mainMenu, "Teleport Hub","",true)
    klavertStaffMenu = _menuPool:AddSubMenu(mainMenu, "Staff Tools","",true)
	klavertDevMenu:SetMenuWidthOffset(menuWidth)
    klavertTelMenu:SetMenuWidthOffset(menuWidth)
    klavertStaffMenu:SetMenuWidthOffset(menuWidth)

    if permissions["player.kick"] then
        local thisItem = NativeUI.CreateItem(("Teleport To Waypoint"),("Teleport to waypoint a waypoint on your map"))
        klavertDevMenu:AddItem(thisItem)
        thisItem.Activated = function(ParentMenu,SelectedItem)
            local _waypoint = GetFirstBlipInfoId(8)
    
            if DoesBlipExist(_waypoint) then
                local waypointCoords = GetBlipInfoIdCoord(_waypoint)
        
                for height = 1, 1000 do
                    SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
        
                    local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)
        
                    if foundGround then
                        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
                        break
                    end
        
                    Citizen.Wait(5)
                end
            end
        end
    end
    if permissions["player.kick"] then
        local thisItem = NativeUI.CreateItem(("Coords"),("Toggle coords"))
        klavertDevMenu:AddItem(thisItem)
        thisItem.Activated = function(ParentMenu,SelectedItem)
            ToggleCoords()
        end
    end

    if permissions["player.kick"] then 
        local thisItem = NativeUI.CreateItem(("Object Gun"),("Toggle object gun"))
        klavertDevMenu:AddItem(thisItem)
        thisItem.Activated = function(ParentMenu,SelectedItem)
            ToggleInfos()
        end
    end

    if permissions["klavert.staff.blip"] then
        local thisItem = NativeUI.CreateItem(("Blips"), ("Blips"))
        klavertStaffMenu:AddItem(thisItem)
        thisItem.Activated = function(ParentMenu,SelectedItem)
            TriggerEvent('KLAVERT:blipstoggle')
        end
    end

    if permissions["klavert.staff.playernames"] then
        local thisItem = NativeUI.CreateItem(("Playernames"), ("Playernames"))
        klavertStaffMenu:AddItem(thisItem)
        thisItem.Activated = function(ParentMenu,SelectedItem)
            TriggerEvent('KLAVERT:namestoggle')
        end
    end

    --[[if permissions["player.kick"] then
        local thisItem = NativeUI.CreateItem(("No-Clip"), ("Toggle No-Clip"))
        klavertStaffMenu:AddItem(thisItem)                                                     --SOON
        thisItem.Activated = function(ParentMenu,SelectedItem)
            TriggerEvent('admin:toggleNoClip')
        end
    end--]]

    if permissions["player.kick"] then
        local thisItem = NativeUI.CreateItem(("tp to Staffhub"), ("Teleport to staffhub"))
        klavertTelMenu:AddItem(thisItem)
        thisItem.Activated = function(ParentMenu,SelectedItem)
            TriggerEvent('KLAVERT:Teleportshb', source)
        end
    end

    if permissions["player.kick"] then
        local thisItem = NativeUI.CreateItem(("tp to uwv"), ("Teleport to UWV"))
        klavertTelMenu:AddItem(thisItem)
        thisItem.Activated = function(ParentMenu,SelectedItem)
            TriggerEvent('KLAVERT:TeleportUWV', source)
        end
    end
    
    if permissions["player.kick"] then
        local thisItem = NativeUI.CreateItem(("tp to blokkenpark"), ("Teleport to blokkenpark"))
        klavertTelMenu:AddItem(thisItem)
        thisItem.Activated = function(ParentMenu,SelectedItem)
            TriggerEvent('KLAVERT:TeleportBP', source)
        end
    end

    if permissions["player.kick"] then
        RegisterNetEvent('showNotification')
        AddEventHandler('showNotification', function(text)
            ShowNotification(text)
        end)
        function ShowNotification(text)
            SetNotificationTextEntry("STRING")
            AddTextComponentString(text)
            DrawNotification(0,1)
        end
    end
    if permissions["player.kick"] then
        Citizen.CreateThread(function()
            alreadyDead = false
            while true do
                Citizen.Wait(50)
                local playerPed = GetPlayerPed(-1)
                if IsEntityDead(playerPed) and not alreadyDead then
                    killer = GetPedKiller(playerPed)
                    killername = false
                    for id = 0, 64 do
                        if killer == GetPlayerPed(id) then
                            killername = GetPlayerName(id)
                        end
                    end
                    if killer == playerPed then
                        TriggerServerEvent('playerDied',0,0)
                    elseif killername then
                        TriggerServerEvent('playerDied',killername,1)
                    else
                        TriggerServerEvent('playerDied',0,2)
                    end
                    alreadyDead = true
                end
                if not IsEntityDead(playerPed) then
                    alreadyDead = false
                end
            end
        end)
    end
end)

RegisterNetEvent('showNotification')
AddEventHandler('showNotification', function(text)
    ShowNotification(text)
end)
function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(0,1)
end

local coordsVisible = false

function DrawGenericText(text)
	SetTextColour(186, 186, 186, 255)
	SetTextFont(4)
	SetTextScale(0.500, 0.500)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(false)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.45, 0.017)
end

Citizen.CreateThread(function()
    while true do
		local sleepThread = 250
		
		if coordsVisible then
			sleepThread = 5

			local playerPed = PlayerPedId()
			local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
			local playerH = GetEntityHeading(playerPed)

			DrawGenericText(("~r~X~w~:        %s \n~r~Y~w~:        %s \n~r~Z~w~:        %s \n~r~H~w~:        %s"):format(FormatCoord(playerX), FormatCoord(playerY), FormatCoord(playerZ), FormatCoord(playerH)))
		end

		Citizen.Wait(sleepThread)
	end
end)

FormatCoord = function(coord)
	if coord == nil then
		return "unknown"
	end

	return tonumber(string.format("%.2f", coord))
end

ToggleCoords = function()
	coordsVisible = not coordsVisible
end

-------------------------------
-------Teleport naar UWV-------
-------------------------------

RegisterNetEvent('KLAVERT:TeleportUWV')
AddEventHandler('KLAVERT:TeleportUWV', function(source, tPID)
	FreezeEntityPosition(PlayerPedId(), true)
    Citizen.CreateThread(function()
		
		SetEntityCoords(PlayerPedId(), -319.28,-936.26,31.08, false, false, false, true)
		FreezeEntityPosition(PlayerPedId(), false)
		exports['mythic_notify']:DoHudText('inform', 'Je bent naar UWV gebracht door staff.')
	end)
end)

-------------------------------
-------Teleport naar SHB-------
-------------------------------

RegisterNetEvent('KLAVERT:Teleportshb')
AddEventHandler('KLAVERT:Teleportshb', function(source, tPID)
	FreezeEntityPosition(PlayerPedId(), true)
    Citizen.CreateThread(function()

		
		SetEntityCoords(PlayerPedId(), -269.9, -940.98 ,92.51, 63.05, false, false, false, false)
		FreezeEntityPosition(PlayerPedId(), false)
	end)
end)

-------------------------------
-------Teleport naar BPH-------
-------------------------------

RegisterNetEvent('KLAVERT:TeleportBP')
AddEventHandler('KLAVERT:TeleportBP', function(source, tPID)
	FreezeEntityPosition(PlayerPedId(), true)
    Citizen.CreateThread(function()
		
		SetEntityCoords(PlayerPedId(), 170.43,-990.7,30.09, false, false, false, true)
		FreezeEntityPosition(PlayerPedId(), false)
		exports['mythic_notify']:DoHudText('inform', 'Je bent naar BP gebracht door staff.')
	end)
end)

local Ontvangen = false
local BlipsAan = false
local NamenAan = false
local BlipsUit = true
local NamenUit = true
TriggerEvent("KLAVERT:toggle", false)

local defaultDormantNameFormat = "Dormant Player #%i"

local playerBlipHandles = {}
local latestBlipsUpdate = {}
local evaluationPlayers = {}

exports("GetDormantBlipHandles", function()
    return playerBlipHandles
end)

exports("GetLatestBlipsUpdate", function()
    return latestBlipsUpdate
end)

local function has_value(tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function table.filter(table, it)
    local ret = {}
    for key, value in pairs(table) do
        if it(value, key, table) then
            ret[key] = value
        end
    end

    return ret
end

local function GetServerPlayerIds()
    local rawPlayers = GetActivePlayers()
    local playerIDs = {}

    for index, player in ipairs(rawPlayers) do
        table.insert(playerIDs, GetPlayerServerId(player))
    end

    return playerIDs
end

local function Evaluate()

    for _, player in ipairs(evaluationPlayers) do

        for player, blip in pairs(playerBlipHandles) do

            local results = table.filter(latestBlipsUpdate, function(blip, key, blips)
                return blip[1] == player
            end)

            if(#results == 0 and playerBlipHandles[player] ~= nil) then

                if(DoesBlipExist(playerBlipHandles[player])) then
                    RemoveBlip(playerBlipHandles[player])
                end

                playerBlipHandles[player] = nil
            end
        end
    end

    evaluationPlayers = {}
end

RegisterNetEvent("KLAVERT:blipstoggle")
AddEventHandler("KLAVERT:blipstoggle", function(source , args , rawCommand)
    if not BlipsAan then
		BlipsUit = false
		BlipsAan = true
        exports['mythic_notify']:DoHudText('success', 'Blips aangezet')
	elseif BlipsAan then
		BlipsAan = false
		exports['mythic_notify']:DoHudText('error', 'Blips uitgezet')
    end
end)

RegisterNetEvent("KLAVERT:toggle")
AddEventHandler("KLAVERT:toggle", function(toggle)
    if toggle then
		BlipsUit = false
		BlipsAan = true
	elseif not toggle then
		BlipsAan = false
    end
end)

RegisterNetEvent("KLAVERT:namestoggle")
AddEventHandler("KLAVERT:namestoggle", function(source , args , rawCommand)
    if not NamenAan then
		NamenUit = false
		NamenAan = true
        exports['mythic_notify']:DoHudText('success', 'Nametags aangezet')
	elseif NamenAan then
		NamenAan = false
		exports['mythic_notify']:DoHudText('error', 'Nametags uitgezet')
    end
end)

RegisterNetEvent("KLAVERT:togglenames")
AddEventHandler("KLAVERT:togglenames", function(toggle)
    if toggle then
		NamenUit = false
		NamenAan = true
	elseif not toggle then
		NamenAan = false
    end
end)

function Blipstatus()
    if BlipsAan then
        return true
    elseif not BlipsAan then
        return false
    end
end

function Namestatus()
    if NamenAan then
        return true
    elseif not NamenAan then
        return false
    end
end

RegisterNetEvent("_bigmode:evaluateBlips")
AddEventHandler("_bigmode:evaluateBlips", function(player)
    table.insert(evaluationPlayers, player)
end)

RegisterNetEvent("_bigmode:updateBlips")
AddEventHandler("_bigmode:updateBlips", function(blips)
	if BlipsAan then
		latestBlipsUpdate = blips
	else
		blips = {}
		latestBlipsUpdate = {}
	end
	

    if(#evaluationPlayers >= 1) then
        Evaluate()
    end
	
    Citizen.CreateThread(function()
        (function()
            for index, blip in pairs(blips) do
                local player = blip[1]
                local playerPed = NetworkDoesEntityExistWithNetworkId(blip[2]) and NetworkGetEntityFromNetworkId(blip[2]) or nil

                if((not DoesEntityExist(playerPed)) and player ~= GetPlayerServerId(PlayerId())) then

                    local playerName = blip[3]
                    local coords = blip[4]

                    if(coords == nil) then
                        coords = playerName
                        playerName = nil
                    end

                    local blip = 0
                    if(playerBlipHandles[player] ~= nil and DoesBlipExist(playerBlipHandles[player])) then
                        blip = playerBlipHandles[player]

                        SetBlipCoords(blip, coords[1], coords[2], coords[3])
                    else
                        blip = AddBlipForCoord(coords[1], coords[2], coords[3])

                        SetBlipAlpha(blip, 180)
                        SetBlipSprite(blip, 1)
                        SetBlipScale(blip, 0.8)
                        SetBlipShrink(blip, 1)
                        SetBlipCategory(blip, 7)
                        SetBlipDisplay(blip, 6)

                        playerBlipHandles[player] = blip
                    end

                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString(playerName ~= nil and playerName or string.format(defaultDormantNameFormat, player))
                    EndTextCommandSetBlipName(blip)
                end
            end
        end)()
    end)
end)
Citizen.CreateThread( function()
        while true do
            Wait(500)
            if not NamenUit then
                for id = 0, 255 do
                    if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= GetPlayerPed(-1) then
                        ped = GetPlayerPed(id)
                        blip = GetBlipFromEntity(ped)
						headId = Citizen.InvokeNative( 0xBFEFE3321A3F5015, ped, "[" .. GetPlayerServerId(id) .. "]" .. GetPlayerName(id), false, false, "", false )
							if NamenAan then

							if NetworkIsPlayerTalking(id) then
								Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 9, true)
							else
								Citizen.InvokeNative(0x63BB75ABEDC1F6A0, headId, 9, false)
							end
							
							else
								RemoveMpGamerTag(headId)
								NamenUit = true
							end
					end
				end
			end
	end
end)


Citizen.CreateThread( function()
        while true do
            Wait(1000)
            if not BlipsUit then
                for id = 0, 255 do
                    if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= GetPlayerPed(-1) then
                        ped = GetPlayerPed(id)
                        blip = GetBlipFromEntity(ped)
					if BlipsAan then
                        if not DoesBlipExist(blip) then
                            blip = AddBlipForEntity(ped)
                            SetBlipSprite(blip, 1)
                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                        else
                            veh = GetVehiclePedIsIn(ped, false)
                            blipSprite = GetBlipSprite(blip)

                            if not GetEntityHealth(ped) then
                                if blipSprite ~= 274 then
                                    SetBlipSprite(blip, 274)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                end
                            elseif veh then
                                vehClass = GetVehicleClass(veh)
                                vehModel = GetEntityModel(veh)

                                if vehClass == 15 then
                                    if blipSprite ~= 422 then
                                        SetBlipSprite(blip, 422)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif vehClass == 16 then
                                    if
                                        vehModel == GetHashKey("besra") or vehModel == GetHashKey("hydra") or
                                            vehModel == GetHashKey("lazer")
                                     then
                                        if blipSprite ~= 424 then
                                            SetBlipSprite(blip, 424)
                                            Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                        end
                                    elseif blipSprite ~= 423 then
                                        SetBlipSprite(blip, 423)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif vehClass == 14 then
                                    if blipSprite ~= 427 then
                                        SetBlipSprite(blip, 427)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif
                                    vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2") or
                                        vehModel == GetHashKey("limo2")
                                 then
                                    if blipSprite ~= 426 then
                                        SetBlipSprite(blip, 426)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif vehModel == GetHashKey("rhino") then
                                    if blipSprite ~= 421 then
                                        SetBlipSprite(blip, 421)
                                        Citizen.InvokeNative(0x5FBCA48327B914DF, blip, false)
                                    end
                                elseif blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                                end

                                passengers = GetVehicleNumberOfPassengers(veh)

                                if passengers then
                                    if not IsVehicleSeatFree(veh, -1) then
                                        passengers = passengers + 1
                                    end

                                    ShowNumberOnBlip(blip, passengers)
                                else
                                    HideNumberOnBlip(blip)
                                end
                            else
                                HideNumberOnBlip(blip)

                                if blipSprite ~= 1 then
                                    SetBlipSprite(blip, 1)
                                    Citizen.InvokeNative(0x5FBCA48327B914DF, blip, true)
                                end
                            end

                            SetBlipRotation(blip, math.ceil(GetEntityHeading(veh)))
							BeginTextCommandSetBlipName("STRING")
							AddTextComponentString("["..id.."]"..GetPlayerName(id))
							EndTextCommandSetBlipName(blip)
                            SetBlipScale(blip, 0.85)

                            if IsPauseMenuActive() then
                                SetBlipAlpha(blip, 255)
                            else
                                x1, y1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                                x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
                                distance =
                                    (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) +
                                    900

                                if distance < 0 then
                                    distance = 0
                                elseif distance > 255 then
                                    distance = 255
                                end

                                SetBlipAlpha(blip, distance)
                            end
                        end
					else
						RemoveBlip(blip)
						BlipsUit = true
					end
                    end
                end
            end
        end
    end)



--- Object gun ---
local infoOn = false
local coordsText = ""
local headingText = ""
local modelText = ""



Citizen.CreateThread(function()
    while true do
        local pause = 250
        if infoOn then
            pause = 5
            local player = GetPlayerPed(-1)
            if IsPlayerFreeAiming(PlayerId()) then
                local entity = getEntity(PlayerId())
                local coords = GetEntityCoords(entity)
                local heading = GetEntityHeading(entity)
                local model = GetEntityModel(entity)
                coordsText = coords
                headingText = heading
                modelText = model
            end
            DrawInfos("Coordinates: " .. coordsText .. "\nHeading: " .. headingText .. "\nHash: " .. modelText)
        end
        Citizen.Wait(pause)
    end
end)



function getEntity(player)
    local result, entity = GetEntityPlayerIsFreeAimingAt(player)
    return entity
end

function DrawInfos(text)
    SetTextColour(255, 255, 255, 255)
    SetTextFont(1)
    SetTextScale(0.4, 0.4)
    SetTextWrap(0.0, 1.0)
    SetTextCentre(false)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(50, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.015, 0.71)
end

ToggleInfos = function()
    infoOn = not infoOn
end

--Join /leave log
RegisterNetEvent('showNotification')
AddEventHandler('showNotification', function(text)
	ShowNotification(text)
end)
function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(0,1)
end

-- Start Noclip

local noclip = false
local noclip_speed = 1.0

function no_clip()
    noclip = not noclip
    local ped = GetPlayerPed(-1)
    if noclip then
    FreezeEntityPosition(ped, true);
    SetEntityCollision(ped, false, false);

    SetEntityVisible(ped, false, false);
    SetLocalPlayerVisibleLocally(true);
    SetEntityAlpha(ped, 51, false)
      ESX.ShowNotification('~g~NOCLIP AAN')
    else
        FreezeEntityPosition(ped, false);
        SetEntityCollision(ped, true, true);

        SetEntityVisible(ped, true, false);
        SetLocalPlayerVisibleLocally(true);
        ResetEntityAlpha(ped);
      ESX.ShowNotification('~r~NOCLIP UIT')
    end
end

function isNoclip()
    return noclip
end

function getPosition()
    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
    return x,y,z
end

function getCamDirection()
    local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
    local pitch = GetGameplayCamRelativePitch()
  
    local x = -math.sin(heading*math.pi/180.0)
    local y = math.cos(heading*math.pi/180.0)
    local z = math.sin(pitch*math.pi/180.0)
  
    local len = math.sqrt(x*x+y*y+z*z)
    if len ~= 0 then
      x = x/len
      y = y/len
      z = z/len
    end
  
    return x,y,z
end

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if noclip then
        local ped = GetPlayerPed(-1)
        local x,y,z = getPosition()
        local dx,dy,dz = getCamDirection()
        local speed = noclip_speed
  
        SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)
  
        if IsControlPressed(0,32) then 
          x = x+speed*dx
          y = y+speed*dy
          z = z+speed*dz
        end
  
  
        if IsControlPressed(0,269) then 
          x = x-speed*dx
          y = y-speed*dy
          z = z-speed*dz
        end
  
        SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
      end
    end
end)
-- end no clip

local NoClipStatus = false
local NoClipEntity = false
local FollowCamMode = true
local index = 1
local CurrentSpeed = Config.Speeds[index].speed

Citizen.CreateThread(function()
    while true do
        while NoClipStatus do
            DisableAllControlActions()
            EnableControlAction(0, 1, true)
            EnableControlAction(0, 2, true)

            local yoff = 0.0
            local zoff = 0.0

			if IsDisabledControlPressed(0, Config.Controls.goForward) then
                yoff = Config.Offsets.y
			end
			
            if IsDisabledControlPressed(0, Config.Controls.goBackward) then
                yoff = -Config.Offsets.y
			end

            if IsDisabledControlPressed(0, Config.Controls.goUp) then
                zoff = Config.Offsets.z
			end
			
            if IsDisabledControlPressed(0, Config.Controls.goDown) then
                zoff = -Config.Offsets.z
			end

            if not FollowCamMode and IsDisabledControlPressed(0, Config.Controls.turnLeft) then
                SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId())+Config.Offsets.h)
			end
			
            if not FollowCamMode and IsDisabledControlPressed(0, Config.Controls.turnRight) then
                SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId())-Config.Offsets.h)
			end
			
            local newPos = GetOffsetFromEntityInWorldCoords(NoClipEntity, 0.0, yoff * (CurrentSpeed + 0.3), zoff * (CurrentSpeed + 0.3))
            local heading = GetEntityHeading(NoClipEntity)
            
            SetEntityVelocity(NoClipEntity, 0.0, 0.0, 0.0)
            SetEntityRotation(NoClipEntity, 0.0, 0.0, 0.0, 0, false)
            if(FollowCamMode) then
                SetEntityHeading(NoClipEntity, GetGameplayCamRelativeHeading());
            else
                SetEntityHeading(NoClipEntity, heading);
            end
            SetEntityCoordsNoOffset(NoClipEntity, newPos.x, newPos.y, newPos.z, true, true, true)

            SetLocalPlayerVisibleLocally(true);
            Citizen.Wait(0)
        end
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('admin:toggleNoClip')
AddEventHandler('admin:toggleNoClip', function()
    if not NoClipStatus then
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            NoClipEntity = GetVehiclePedIsIn(PlayerPedId(), false)
        else
            NoClipEntity = PlayerPedId()
        end

        SetEntityAlpha(NoClipEntity, 51, 0)
        if(NoClipEntity ~= PlayerPedId()) then
            FreezeEntityPosition(PlayerPedId(), true);
            SetEntityCollision(PlayerPedId(), false, false);
        
            SetEntityVisible(PlayerPedId(), false, false);
            SetLocalPlayerVisibleLocally(true);
            SetEntityAlpha(PlayerPedId(), 51, false)
              ESX.ShowNotification('~g~NOCLIP AAN')
        end
    else
        ResetEntityAlpha(NoClipEntity)
        if(NoClipEntity ~= PlayerPedId()) then
            FreezeEntityPosition(PlayerPedId(), false);
            SetEntityCollision(PlayerPedId(), true, true);
    
            SetEntityVisible(PlayerPedId(), true, false);
            SetLocalPlayerVisibleLocally(true);
            ResetEntityAlpha(PlayerPedId());
          ESX.ShowNotification('~r~NOCLIP UIT')
        end
    end

    SetEntityCollision(NoClipEntity, NoClipStatus, NoClipStatus)
    FreezeEntityPosition(NoClipEntity, not NoClipStatus)
    SetEntityInvincible(NoClipEntity, not NoClipStatus)
    SetEntityVisible(NoClipEntity, NoClipStatus, not NoClipStatus);
    SetEveryoneIgnorePlayer(PlayerPedId(), not NoClipStatus);
    SetPoliceIgnorePlayer(PlayerPedId(), not NoClipStatus);

    NoClipStatus = not NoClipStatus
end)

RegisterCommand('noclip_cam', function()
    FollowCamMode = not FollowCamMode
end, false)

RegisterCommand('noclip_speed', function()
    if index ~= #Config.Speeds then
        index = index+1
        CurrentSpeed = Config.Speeds[index].speed
    else
        CurrentSpeed = Config.Speeds[1].speed
        index = 1
    end
end, false)

RegisterKeyMapping('noclip', 'Toggle NoClip', 'keyboard', Config.Controls.toggle)
RegisterKeyMapping('noclip_cam', 'NoClip Camera', 'keyboard', Config.Controls.camMode)
RegisterKeyMapping('noclip_speed', 'NoClip Speed', 'keyboard', Config.Controls.changeSpeed)