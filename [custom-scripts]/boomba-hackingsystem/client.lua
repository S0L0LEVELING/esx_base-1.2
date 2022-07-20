-- [ Vars ] -- 
ESX = nil 
local display = false
local sendping = false 
local counter = 1 
local blackout = false 
-- [ Vars ] -- 

-- [ ESX Init ] -- 
Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function (obj) ESX = obj end)
        Citizen.Wait(5)
    end
end)

AddEventHandler('onResourceStart', function()
    TriggerServerEvent("boomba-hackingsystem:getdata", GetCurrentServerEndpoint())
end)  
-- [ ESX Init ] -- 

-- [ Core NUI Functions ] -- 
RegisterNetEvent("terminal")
AddEventHandler("terminal", function()
    SetDisplay(not display)
end)

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("main", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("error", function(data)
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)
-- [ Core NUI Functions ] -- 

