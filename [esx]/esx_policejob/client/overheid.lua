ESX = nil
local Hulpdienst = false

local PlayerData              = {}

Citizen.CreateThread(function ()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
 	PlayerData = ESX.GetPlayerData()
	if PlayerData.job.name == 'police' or PlayerData.job.name == 'offpolice' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'mechanic' or PlayerData.job.name == 'kmar' then
		Hulpdienst = true
	else
		Hulpdienst = false
	end
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
    if PlayerData.job.name == 'police' or PlayerData.job.name == 'offpolice' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'mechanic' or PlayerData.job.name == 'kmar' then
		Hulpdienst = true
	else
		Hulpdienst = false
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
  if PlayerData.job.name == 'police' or PlayerData.job.name == 'offpolice' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'mechanic' or PlayerData.job.name == 'kmar' then
		Hulpdienst = true
	else
		Hulpdienst = false
	end
end)



Citizen.CreateThread(function()
  while true do
    Citizen.Wait(500)
    local ped = GetPlayerPed(-1)
    if GetPedInVehicleSeat(GetVehiclePedIsIn(ped), -1) == PlayerPedId() and not Hulpdienst then
      if IsPedInAnyVehicle(ped) then
        if GetVehicleClass( GetVehiclePedIsIn(ped, false ) ) == 18 then
          SetVehicleUndriveable(GetVehiclePedIsUsing(ped), true)
		  SetVehicleMaxSpeed(GetVehiclePedIsUsing(ped), 1)
	    end
      end
	 else 
		SetVehicleMaxSpeed(GetVehiclePedIsUsing(ped), 0)
    end
  end
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		for i = 1, 12 do
			EnableDispatchService(i, false)
		end
		SetPlayerWantedLevel(PlayerId(), 0, false)
		SetPlayerWantedLevelNow(PlayerId(), false)
		SetPlayerWantedLevelNoDrop(PlayerId(), 0, false)
	end
end)
