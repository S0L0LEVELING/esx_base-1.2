ESX               = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- Menu state
local showMenu = false
local VoertuigGeefSleutel = false

-- Keybind Lookup table
local keybindControls = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local MAX_MENU_ITEMS = 7



RegisterCommand('-radialmenu', function()
end, false)



RegisterCommand('+radialmenu', function()
    f1Pressed = true
	Citizen.Wait(1000)
	f1Pressed = false
end, false)

RegisterKeyMapping('+radialmenu', 'Persoonlijke menu', 'keyboard', 'F1')
-- Main thread

Citizen.CreateThread(function()
    local keyBind = "F1"
    while true do
        Citizen.Wait(0)
        if f1Pressed and showMenu then
			
            showMenu = false
            SetNuiFocus(false, false)
        end
        if f1Pressed then
			
            showMenu = true
            local enabledMenus = {}
            for _, menuConfig in ipairs(rootMenuConfig) do
                if menuConfig:enableMenu() then
                    local dataElements = {}
                    local hasSubMenus = false
                    if menuConfig.subMenus ~= nil and #menuConfig.subMenus > 0 then
                        hasSubMenus = true
                        local previousMenu = dataElements
                        local currentElement = {}
                        for i = 1, #menuConfig.subMenus do
                            -- if newSubMenus[menuConfig.subMenus[i]] ~= nil and newSubMenus[menuConfig.subMenus[i]].enableMenu ~= nil and not newSubMenus[menuConfig.subMenus[i]]:enableMenu() then
                            --     goto continue
                            -- end
                            currentElement[#currentElement+1] = newSubMenus[menuConfig.subMenus[i]]
                            currentElement[#currentElement].id = menuConfig.subMenus[i]
                            currentElement[#currentElement].enableMenu = nil

                            if i % MAX_MENU_ITEMS == 0 and i < (#menuConfig.subMenus - 1) then
                                previousMenu[MAX_MENU_ITEMS + 1] = {
                                    id = "_more",
                                    title = "Meer",
                                    icon = "#more",
                                    items = currentElement
                                }
                                previousMenu = currentElement
                                currentElement = {}
                            end
                            --::continue::
                        end
                        if #currentElement > 0 then
                            previousMenu[MAX_MENU_ITEMS + 1] = {
                                id = "_more",
                                title = "Meer",
                                icon = "#more",
                                items = currentElement
                            }
                        end
                        dataElements = dataElements[MAX_MENU_ITEMS + 1].items
                    end
                    enabledMenus[#enabledMenus+1] = {
                        id = menuConfig.id,
                        title = menuConfig.displayName,
                        functionName = menuConfig.functionName,
                        icon = menuConfig.icon,
                    }
                    if hasSubMenus then
                        enabledMenus[#enabledMenus].items = dataElements
                    end
                end
            end
            SendNUIMessage({
                state = "show",
                resourceName = GetCurrentResourceName(),
                data = enabledMenus,
                menuKeyBind = keyBind
            })
            SetCursorLocation(0.5, 0.5)
            SetNuiFocus(true, true)

            -- Play sound
            PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)
            while showMenu == true do Citizen.Wait(100) end
            Citizen.Wait(100)
			while f1Pressed do Citizen.Wait(100) end
        end
    end
end)
-- Callback function for closing menu
RegisterNUICallback('closemenu', function(data, cb)
    -- Clear focus and destroy UI
    showMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        state = 'destroy'
    })

    -- Play sound
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)

    -- Send ACK to callback function
    cb('ok')
end)

-- Callback function for when a slice is clicked, execute command
RegisterNUICallback('triggerAction', function(data, cb)
    -- Clear focus and destroy UI
    showMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        state = 'destroy'
    })

    -- Play sound
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)

    -- Run command
    --ExecuteCommand(data.action)
    TriggerEvent(data.action, data.parameters)

    -- Send ACK to callback function
    cb('ok')
end)

RegisterNetEvent("menu:menuexit")
AddEventHandler("menu:menuexit", function()
    showMenu = false
    SetNuiFocus(false, false)
end)

RegisterNetEvent('st:givekey');
AddEventHandler('st:givekey', function()
	giveCarKeys()
end)
--[[
function giveCarKeys()
	
	myself = source
	other = args[1]
	
	if(GetPlayerName(tonumber(args[1])))then
			
	else
			
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Foutief spelers ID!")
			return
	end
	
	
	local plate1 = args[2]
	local plate2 = args[3]
	local plate3 = args[4]
	local plate4 = args[5]
	
  
	if plate1 ~= nil then plate01 = plate1 else plate01 = "" end
	if plate2 ~= nil then plate02 = plate2 else plate02 = "" end
	if plate3 ~= nil then plate03 = plate3 else plate03 = "" end
	if plate4 ~= nil then plate04 = plate4 else plate04 = "" end
  
  
	local plate = (plate01 .. " " .. plate02 .. " " .. plate03 .. " " .. plate04)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayer2 = ESX.GetPlayerFromId(args[1])
	
	mySteamID = xPlayer.getIdentifier()
	mySteam = mySteamID
	myID = ESX.GetPlayerFromId(source).identifier
	myName = ESX.GetPlayerFromId(source).name

	targetSteamID = xPlayer2.getIdentifier()
	targetSteamName = ESX.GetPlayerFromId(args[1]).name
	targetSteam = targetSteamID
	
	MySQL.Async.fetchAll(
        'SELECT * FROM owned_vehicles WHERE plate = @plate',
        {
            ['@plate'] = plate
        },
        function(result)
            if result[1] ~= nil then
                local playerName = ESX.GetPlayerFromIdentifier(result[1].owner).identifier
				local pName = ESX.GetPlayerFromIdentifier(result[1].owner).name
				CarOwner = playerName
				print("Car Transfer ", myID, CarOwner)
				if myID == CarOwner then
					print("Transfered")
					
					data = {}
						TriggerClientEvent('chatMessage', other, "^4Voertuig met het kenteken: ^*^1" .. plate .. "^r^4is aan jou gegeven door: ^*^2" .. myName)
			 
						MySQL.Sync.execute("UPDATE owned_vehicles SET owner=@owner WHERE plate=@plate", {['@owner'] = targetSteam, ['@plate'] = plate})
						TriggerClientEvent('chatMessage', source, "^4Je hebt je ^*^3voertuig^0^4 met het kenteken ^*^1" .. plate .. "\" ^r^4gegeven aan ^*^2".. targetSteamName)
				else
					print("Did not transfer")
					TriggerClientEvent('chatMessage', source, "^*^1Dit voertuig is niet van jou!")
				end
			else
				TriggerClientEvent('chatMessage', source, "^1^*ERROR: ^r^0Dit kenteken bestaat niet of is verkeerd getypt.")
            end
		
		end
	end
end)--]]

local BewijzenBekijk = {
	"bewijzen:id",
	"bewijzen:rijbewijs",
	"bewijzen:vliegbrevet",
	"bewijzen:wapen"
	
}

for i, eventName in ipairs(BewijzenBekijk) do
  RegisterNetEvent(eventName)
  AddEventHandler(
    eventName,
    function()
	if eventName == "bewijzen:id" then
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
	elseif eventName == "bewijzen:rijbewijs" then
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
	elseif eventName == "bewijzen:vliegbrevet" then
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'aircraft')
	elseif eventName == "bewijzen:wapen" then
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
	end
    end
  )
end

local BewijzenGeef = {
	"bewijzen:geefid",
	"bewijzen:geefrijbewijs",
	"bewijzen:geefvliegbrevet",
	"bewijzen:geefwapen"
}

for i, eventName in ipairs(BewijzenGeef) do
  RegisterNetEvent(eventName)
  AddEventHandler(
    eventName,
    function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if eventName == "bewijzen:geefid" and closestDistance ~= -1 and closestDistance <= 3.0 then
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
	elseif eventName == "bewijzen:geefrijbewijs" and closestDistance ~= -1 and closestDistance <= 3.0 then
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver')
	elseif eventName == "bewijzen:geefvliegbrevet" and closestDistance ~= -1 and closestDistance <= 3.0 then
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'aircraft')
	elseif eventName == "bewijzen:geefwapen" and closestDistance ~= -1 and closestDistance <= 3.0 then
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon')
	else
		ESX.ShowNotification('Geen spelers in de buurt!')	
	end


    end
  )
end

local VoertuigExtras = {
	"voertuig:extra1",
	"voertuig:extra2",
	"voertuig:extra3",
	"voertuig:extra4",
	"voertuig:extra5",
	"voertuig:extra6",
	"voertuig:extra7",
	"voertuig:extra8",
	"voertuig:extra9",
	"voertuig:extra10",
	"voertuig:extra11",
	"voertuig:extra12",
	"voertuig:extra13",
	"voertuig:extra14"
	
	
}

for i, eventName in ipairs(VoertuigExtras) do
  RegisterNetEvent(eventName)
  AddEventHandler(
    eventName,
    function()
	Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if eventName then
		extraa = string.gsub(eventName, "voertuig:extra", "")
		extra = tonumber(extraa)
		vehbody = GetVehicleBodyHealth(Vehicle)
		vehengine = GetVehicleEngineHealth(Vehicle)
		
		if IsVehicleExtraTurnedOn(Vehicle, extra) and vehbody >= 1000 and vehengine >= 1000 then
			SetVehicleExtra(Vehicle, extra, 1)
		elseif vehbody >= 1000 and vehengine >= 1000 then
			SetVehicleExtra(Vehicle, extra, 0)
		else 
		ESX.ShowNotification("Uw voertuig is beschadigd. Extras aanpassen is niet mogelijk op een beschadigd voertuig!")
		end
	end
	end
  )
end

local Voertuig = {
	"voertuig:motor",
	"voertuig:deur1",
	"voertuig:deur2",
	"voertuig:deur3",
	"voertuig:deur4",
	"voertuig:deur5",
	"voertuig:deur6",
	"voertuig:raam1",
	"voertuig:raam2",
	"voertuig:raam3",
	"voertuig:raam4"
}

for i, eventName in ipairs(Voertuig) do
  RegisterNetEvent(eventName)
  AddEventHandler(
    eventName,
    function()
	local engineoff = false
	Vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if eventName == "voertuig:motor" then
		if GetIsVehicleEngineRunning(Vehicle) then
			SetVehicleEngineOn(Vehicle, false, false, true)
			SetVehicleUndriveable(Vehicle, true)
		elseif not GetIsVehicleEngineRunning(Vehicle) then
			SetVehicleEngineOn(Vehicle, true, false, true)
			SetVehicleUndriveable(Vehicle, false)
		end
	else
		if eventName == "voertuig:deur1" and not deuropen1 then
			deuropen1 = true
			SetVehicleDoorOpen(Vehicle, 0, false, false)
		elseif eventName == "voertuig:deur1" and deuropen1 then
			deuropen1 = false
			SetVehicleDoorShut(Vehicle, 0, false, false)
		end
		if eventName == "voertuig:deur2" and not deuropen2 then
			deuropen2 = true
			SetVehicleDoorOpen(Vehicle, 1, false, false)
		elseif eventName == "voertuig:deur2" and deuropen2 then
			deuropen2 = false
			SetVehicleDoorShut(Vehicle, 1, false, false)
		end
		if eventName == "voertuig:deur3" and not deuropen3 then
			deuropen3 = true
			SetVehicleDoorOpen(Vehicle, 2, false, false)
		elseif eventName == "voertuig:deur3" and deuropen3 then
			deuropen3 = false
			SetVehicleDoorShut(Vehicle, 2, false, false)
		end
		if eventName == "voertuig:deur4" and not deuropen4 then
			deuropen4 = true
			SetVehicleDoorOpen(Vehicle, 3, false, false)
		elseif eventName == "voertuig:deur4" and deuropen4 then
			deuropen4 = false
			SetVehicleDoorShut(Vehicle, 3, false, false)
		end
		if eventName == "voertuig:deur5" and not deuropen5 then
			deuropen5 = true
			SetVehicleDoorOpen(Vehicle, 4, false, false)
		elseif eventName == "voertuig:deur5" and deuropen5 then
			deuropen5 = false
			SetVehicleDoorShut(Vehicle, 4, false, false)
		end
		if eventName == "voertuig:deur6" and not deuropen6 then
			deuropen6 = true
			SetVehicleDoorOpen(Vehicle, 5, false, false)
		elseif eventName == "voertuig:deur6" and deuropen6 then
			deuropen6 = false
			SetVehicleDoorShut(Vehicle, 5, false, false)
		end
		if eventName == "voertuig:raam1" and not raamopen1 then
            raamopen1 = true
            RollDownWindow(Vehicle, 0, false, false)
        elseif eventName == "voertuig:raam1" and raamopen1 then
            raamopen1 = false
            RollUpWindow(Vehicle, 0, false, false)
        end
		if eventName == "voertuig:raam2" and not raamopen2 then
            raamopen2 = true
            RollDownWindow(Vehicle, 1, false, false)
        elseif eventName == "voertuig:raam2" and raamopen2 then
            raamopen2 = false
            RollUpWindow(Vehicle, 1, false, false)
        end
		if eventName == "voertuig:raam3" and not raamopen3 then
            raamopen3 = true
            RollDownWindow(Vehicle, 2, false, false)
        elseif eventName == "voertuig:raam3" and raamopen3 then
            raamopen3 = false
            RollUpWindow(Vehicle, 2, false, false)
        end
		if eventName == "voertuig:raam4" and not raamopen4 then
            raamopen4 = true
            RollDownWindow(Vehicle, 3, false, false)
        elseif eventName == "voertuig:raam4" and raamopen4 then
            raamopen4 = false
            RollUpWindow(Vehicle, 3, false, false)
        end

	end
	end
  )
end

-----  K9 honden
----------------

RegisterNetEvent("K9:menu")
AddEventHandler("K9:menu", function(pArgs)
if #pArgs ~= 1 then return end
    local action = pArgs[1]
    if action == 'spawn' then
       ExecuteCommand('k9 spawn shepherd')
    elseif action == 'follow' then
        ExecuteCommand('k9 follow')
	elseif action == 'stay' then
		ExecuteCommand('k9 stay')
	elseif action == 'sehveh' then
		ExecuteCommand('k9 search vehicle')
	elseif action == 'sehcit' then
		ExecuteCommand('k9 search player')
    elseif action == 'vehicle' then
		ExecuteCommand('k9 enter')
    elseif action == 'exitveh' then
        ExecuteCommand('k9 exit')
	elseif action == 'delete' then
       ExecuteCommand('k9 delete')
    end
end)

RegisterNetEvent("billing:rekeningmenu")
AddEventHandler("billing:rekeningmenu", function()
ExecuteCommand('showbills')
end)

RegisterNetEvent("general:shuff")
AddEventHandler("general:shuff", function()
TriggerEvent('SeatShuffle')
end)