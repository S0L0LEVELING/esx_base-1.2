ESX = nil 

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function (obj) ESX = obj end)
        Wait(5)
    end
end)

Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(Config.checkTime)
        TriggerServerEvent("boomba-autoban:checkitems")
    end 
end)