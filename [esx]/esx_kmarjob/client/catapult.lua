local isInValidPlane = false
local gebruikt = false

local customNames = true -- ingesteld op true om aangepaste modellen in te schakelen
local Vliegtuiglijst = {'BESRA', 'HYDRA', 'LAZER'} -- vliegtuigen die op de gebruikt mogen worden


RegisterCommand('Katapult1', function(source) -- hier hoeft niets meer te veranderen
    local MyPedVeh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
    local Height = GetEntityHeightAboveGround(MyPedVeh)
    local snelheid = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.24

    local MyPed = GetPlayerPed(-1)
    local PedPlane = IsPedInAnyPlane(MyPed)

    local v = vector3(3028.04, -4595.18, 16.25)
    local playercoords = GetEntityCoords(GetPlayerPed(-1))
    local distance = GetDistanceBetweenCoords(v.x, v.y, v.z, playercoords.x, playercoords.y, playercoords.z)

    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    local VehModel = GetEntityModel(vehicle)
    local VehModelName = GetDisplayNameFromVehicleModel(VehModel)

    if distance >= 250 then
        TriggerEvent('chat:addMessage', {
            color = {15, 184, 15},
            multiline = true,
            args = {"[Katapult]", "Je bent te ver om aan het Katapult te koppelen!"}
          })
        return
    end
    
    if MyPedVeh == 0 then
        TriggerEvent('chat:addMessage', {
            color = {15, 184, 15},
            multiline = true,
            args = {"[Katapult]", "Je zit niet in een voertuig!"}
          })
        return
    end
    
    if customNames then
        lookForValidPlane()
        Citizen.Wait(100)
        if isInValidPlane == false then
            TriggerEvent('chat:addMessage', {
                color = {15, 184, 15},
                multiline = true,
                args = {"[Katapult]", 'Je zit niet in een toegestaan voertuig!'}
              })
            return
        end
    end

    if(Height > 20) then 
        TriggerEvent('chat:addMessage', {
            color = {15, 184, 15},
            multiline = true,
            args = {"[Katapult]", 'Je moet op de grond staan om aan het Katapult te koppleen!'}
          })
        return
    end

    if(snelheid > 20) then

        TriggerEvent('chat:addMessage', {
            color = {15, 184, 15},
            multiline = true,
            args = {"[Katapult]", 'Je gaat te snel om je aan de Katapult te bevestigen!'}
          })
        return
    end

    if gebruikt then
        TriggerEvent('chat:addMessage', {
            color = {15, 184, 15},
            multiline = true,
            args = {"[Katapult]", 'Je gebruikt al een katapult!'}
          })
        return
    end

    gebruikt = true
    SetEntityCoordsNoOffset(vehicle, v.x, v.y, playercoords.z)
    SetEntityHeading(vehicle, 15.0)
    TriggerEvent('chat:addMessage', {
        color = {15, 184, 15},
        multiline = true,
        args = {"[Katapult]", 'Lancering in 3 seconden!'}
      })
    Citizen.Wait(3000)
    TriggerEvent('chat:addMessage', {
        color = {15, 184, 15},
        multiline = true,
        args = {"[Katapult]", 'Lancering ...'}
      })
    Citizen.Wait(100)
    SetVehicleForwardSpeed(vehicle, 120.0)
    Citizen.Wait(700)
    SetVehicleForwardSpeed(vehicle, 110.0)
    Citizen.Wait(900)
    gebruikt = false
end)

RegisterCommand('Katapult2', function(source) -- lol coppy paste bc im lazy
  local MyPedVeh = GetVehiclePedIsIn(GetPlayerPed(-1),false)
  local Height = GetEntityHeightAboveGround(MyPedVeh)
  local snelheid = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.24

  local MyPed = GetPlayerPed(-1)
  local PedPlane = IsPedInAnyPlane(MyPed)

  local v = vector3(3041.07, -4591.98, 16.25)
  local playercoords = GetEntityCoords(GetPlayerPed(-1))
  local distance = GetDistanceBetweenCoords(v.x, v.y, v.z, playercoords.x, playercoords.y, playercoords.z)

  local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
  local VehModel = GetEntityModel(vehicle)
  local VehModelName = GetDisplayNameFromVehicleModel(VehModel)
  if distance >= 250 then
    TriggerEvent('chat:addMessage', {
        color = {15, 184, 15},
        multiline = true,
        args = {"[Katapult]", "Je bent te ver om aan het Katapult te koppelen!"}
      })
    return
end

if MyPedVeh == 0 then
    TriggerEvent('chat:addMessage', {
        color = {15, 184, 15},
        multiline = true,
        args = {"[Katapult]", "Je zit niet in een voertuig!"}
      })
    return
end

if customNames then
    lookForValidPlane()
    Citizen.Wait(100)
    if isInValidPlane == false then
        TriggerEvent('chat:addMessage', {
            color = {15, 184, 15},
            multiline = true,
            args = {"[Katapult]", 'Je zit niet in een toegestaan voertuig!'}
          })
        return
    end
end

if(Height > 20) then 
    TriggerEvent('chat:addMessage', {
        color = {15, 184, 15},
        multiline = true,
        args = {"[Katapult]", 'Je moet op de grond staan om aan het Katapult te koppleen!'}
      })
    return
end

if(snelheid > 20) then

    TriggerEvent('chat:addMessage', {
        color = {15, 184, 15},
        multiline = true,
        args = {"[Katapult]", 'Je gaat te snel om je aan de Katapult te bevestigen!'}
      })
    return
end

if gebruikt then
    TriggerEvent('chat:addMessage', {
        color = {15, 184, 15},
        multiline = true,
        args = {"[Katapult]", 'Je gebruikt al een katapult!'}
      })
    return
end
gebruikt = true
SetEntityCoordsNoOffset(vehicle, v.x, v.y, playercoords.z)
SetEntityHeading(vehicle, 15.0)
TriggerEvent('chat:addMessage', {
    color = {15, 184, 15},
    multiline = true,
    args = {"[Katapult]", 'Lancering in 3 seconden!'}
  })
Citizen.Wait(3000)
TriggerEvent('chat:addMessage', {
    color = {15, 184, 15},
    multiline = true,
    args = {"[Katapult]", 'Lancering ...'}
  })
Citizen.Wait(100)
SetVehicleForwardSpeed(vehicle, 120.0)
Citizen.Wait(700)
SetVehicleForwardSpeed(vehicle, 110.0)
Citizen.Wait(900)
gebruikt = false
end)

function lookForValidPlane()
    Citizen.CreateThread(function()
    local i = 1
    local VliegtuiglijstNum = #Vliegtuiglijst
    isInValidPlane = false
        while VliegtuiglijstNum + 1 > i do
            Citizen.Wait(0)
            local currentPlane = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
            if Vliegtuiglijst[i] == currentPlane then
                isInValidPlane = true
                return
            else
                i = i + 1 
            end
        end
    end)
end