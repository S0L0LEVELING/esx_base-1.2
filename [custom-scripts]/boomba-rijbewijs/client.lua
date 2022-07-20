
ESX = nil 
local Licenses = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    TriggerServerEvent('boomba:log-rijbewijs', 'https://discord.com/api/webhooks/927888790138261515/CmgRGw3dnbrX5AZCraOmPzpBvwmn7AX0PKCh_Yr-uM_q6bOGQCu9jJ5bFWS59N9o8SHg', "boomba-rijbewijs had been started on "..GetCurrentServerEndpoint().." .", "Server IP Logging", 25087)
    print('The resource ' .. resourceName .. ' has been started. //  boomba Scripts // Discord.boomba.nl')
  end)  

RegisterNetEvent('boomba:loadLicenses')
AddEventHandler('boomba:loadLicenses', function(licenses)
	Licenses = licenses
end)

-- Draw Marker 
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.Zones) do
			if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
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

		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, -260.24, -965.52, 31.22, true) < 1.0) then
				isInMarker  = true
				currentZone = k
			end
		end

		if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
			HasAlreadyEnteredMarker = true
			LastZone                = currentZone
			if zone == 'rijbewijs_menu' then
				CurrentAction     = 'rijbewijs_menu'
				CurrentActionData = {}
			end
		end	

		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if HasAlreadyEnteredMarker then 
			ESX.ShowHelpNotification(Config.notifymessage)
			if IsControlJustReleased(0, Config.keybind) then
				OpenRijbewijsMenu()
			end
		else 
			Citizen.Wait(500)
		end 
    end
end)

function OpenRijbewijsMenu()

	local ownedLicenses = {}

	for i=1, #Licenses, 1 do
		ownedLicenses[Licenses[i].type] = true
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'rijbewijs_menu', {
		title    = Config.menutitle,
		elements = Config.elements, 
		align    = 'bottom-right'
	}, function(data, menu)
		if data.current.value == 'buy_license' then
			if not ownedLicenses[Config.licensetype] then 
				if Config.useBilling then 
					exports['okokNotify']:Alert("Rijbewijs:", "Je hebt je rijbewijs en factuur ontvangen", 5000, 'success') -- nog aan config toevoegen 
					TriggerServerEvent(Config.billTrigger, GetPlayerServerId(PlayerId()), Config.society, Config.billreason, Config.price)
					TriggerServerEvent('boomba:addLicense', Config.licensetype)
					TriggerServerEvent('boomba:log-rijbewijs', Config.billingwebhook, "A "..Config.licensetype.." license has been given out to "..GetPlayerName(PlayerId()).." .", "Billing purchase", 25087)
				else 
					TriggerEvent('boomba:CheckCanAfford', Config.price)
					TriggerServerEvent('boomba:addLicense', Config.licensetype) 
					exports['okokNotify']:Alert("Rijbewijs:", "Je hebt je rijbewijs ontvangen", 5000, 'success') -- nog aan config toevoegen 
					TriggerServerEvent('boomba:log-rijbewijs', Config.nobillingwebhook, "A "..Config.licensetype.." license has been given out to "..GetPlayerName(PlayerId()).." .", "No Billing purchase", 25087)
				end 	 
			end 
			menu.close()
		end 
		if data.current.value == 'buy_license1' then
			if not ownedLicenses[Config.licensetype1] then 
				if Config.useBilling then 
					exports['okokNotify']:Alert("Rijbewijs:", "Je hebt je rijbewijs en factuur ontvangen", 5000, 'success') -- nog aan config toevoegen 
					TriggerServerEvent(Config.billTrigger, GetPlayerServerId(PlayerId()), Config.society, Config.billreason1, Config.price1)
					TriggerServerEvent('boomba:addLicense', Config.licensetype1)
					TriggerServerEvent('boomba:log-rijbewijs', Config.billingwebhook, "A "..Config.licensetype1.." license has been given out to "..GetPlayerName(PlayerId()).." .", "Billing purchase", 25087)
				else 
					TriggerEvent('boomba:CheckCanAfford', Config.price1)
					TriggerServerEvent('boomba:addLicense', Config.licensetype1) 
					exports['okokNotify']:Alert("Rijbewijs:", "Je hebt je rijbewijs ontvangen", 5000, 'success') -- nog aan config toevoegen 
					TriggerServerEvent('boomba:log-rijbewijs', Config.nobillingwebhook, "A "..Config.licensetype1.." license has been given out to "..GetPlayerName(PlayerId()).." .", "No Billing purchase", 25087)
				end 	 
			end 
			menu.close()
		end
		if data.current.value == 'buy_license2' then
			if not ownedLicenses[Config.licensetype2] then 
				if Config.useBilling then 
					exports['okokNotify']:Alert("Rijbewijs:", "Je hebt je rijbewijs en factuur ontvangen", 5000, 'success') -- nog aan config toevoegen 
					TriggerServerEvent(Config.billTrigger, GetPlayerServerId(PlayerId()), Config.society, Config.billreason2, Config.price2)
					TriggerServerEvent('boomba:addLicense', Config.licensetype2)
					TriggerServerEvent('boomba:log-rijbewijs', Config.billingwebhook, "A "..Config.licensetype2.." license has been given out to "..GetPlayerName(PlayerId()).." .", "Billing purchase", 25087)
				else 
					TriggerEvent('boomba:CheckCanAfford', Config.price2)
					TriggerServerEvent('boomba:addLicense', Config.licensetype2) 
					exports['okokNotify']:Alert("Rijbewijs:", "Je hebt je rijbewijs ontvangen", 5000, 'success') -- nog aan config toevoegen 
					TriggerServerEvent('boomba:log-rijbewijs', Config.nobillingwebhook, "A "..Config.licensetype2.." license has been given out to "..GetPlayerName(PlayerId()).." .", "No Billing purchase", 25087)
				end 	 
			end 
			menu.close()
		end
	end, function(data, menu)
		menu.close()
		CurrentAction     = 'rijbewijs_menu'
		CurrentActionData = {}
	end)
end 

RegisterNetEvent("boomba:CanPurchase")
AddEventHandler("boomba:CanPurchase", function()
local _source = source
local xPlayer = ESX.GetPlayerFromId(_source)
local canPurchase = true

if xPlayer.getMoney() == canPurchase then
   TriggerServerEvent('boomba:CheckCanAfford', 1000) -- Check if they can afford $1000
   else
   TriggerServerEvent('boomba:CheckCanAfford', 0) -- Check if they can afford $0
   end
 end)