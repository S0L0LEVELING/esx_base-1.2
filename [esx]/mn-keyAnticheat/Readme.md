READ ME 
**STANDAARD BOVEN AAN EEN HET SERVER SIDED SCRIPT: 
TriggerEvent("mn-keyAnticheat:server:registerScript", GetCurrentResourceName(), function(key) SecretKey = key end)

---------------------------------------------------------------------------------------------------------------------

CLIENT SIDED: 

    ESX.TriggerServerCallback("mn-keyAnticheat:server:requestKey", function(key)
        SecretKey = key
    end, GetCurrentResourceName())


Zet dit gelijk op het begin van je script ^ 

Voorbeeld hiervan: 
Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(0)
    end

    ESX.TriggerServerCallback("mn-keyAnticheat:server:requestKey", function(key)
        SecretKey = key
    end, GetCurrentResourceName())
end)

De Secret key die je hierboven binnen krijgt van de Server Callback moet je ook weer meesturen met de event die je wilt protecten

Voorbeeld: 

    ESX.TriggerServerCallback("mn-cardealer:hasEnoughMoney", function(IsAllowed, plate)
        if IsAllowed then 
            self.functions.leaveCardealer(x)
            self.functions.cutScene(x, veh, plate)
        else
            ESX.ShowNotification("~r~ U heeft niet genoeg geld")
            self.functions.leaveCardealer(x)
        end
    end, veh, i, SecretKey) <= hier word de key meegestuurd 

Server sided: 

server sided moet je bij de event die je wilt protecten de 2 keys vergelijken (deze moeten identiek zijn anders ban!)

Voorbeeld: 
ESX.RegisterServerCallback("mn-cardealer:hasEnoughMoney", function(source, callback, data, props, key) 
    local src = source 
    local user = ESX.GetPlayerFromId(src)
    local money = user.getMoney()
    local new_plate = self.functions.genaratePlate()
    props.plate = new_plate
    if SecretKey == key then 
        if money >= data.price then 
            user.removeMoney(data.price)
            MySQL.Async.execute("INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)", {
                ["@owner"] = user.identifier,
                ["@plate"] = new_plate,
                ["@vehicle"] = json.encode(props)
            })

            callback(true, props)
        else
            callback(false)
        end
    else
        TriggerEvent("mn-keyAnticheat:server:banPlayer")
        DropPlayer(src, "BANNED")
    end
end)