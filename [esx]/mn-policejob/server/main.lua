ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 


--[[
    Made by mn#0810,
    Founder MN SCRIPTS,
    
]]

--------------- Inbeslagname ----------------------------


TriggerEvent('esx_phone:registerNumber', 'police', 'Melding Politie', true, true)

ESX.RegisterServerCallback("mn-policejob-server-getinbeslagname", function(source, cb)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src) 
    local storage = {}

    if xPlayer.job.name == MN.Policejob then 
        MySQL.Async.fetchAll("SELECT * FROM mn_policejob_opslag", {}, function(result)
            if result[1].opslag ~= nil then
                local x = json.decode(result[1].opslag) or {}
                cb(x)
            end
        end)
    end
end)

RegisterServerEvent("mn-policejob:server:dropinbeslagname")
AddEventHandler("mn-policejob:server:dropinbeslagname", function(data, amount)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    if data.type == "weapon" then 
        MySQL.Async.fetchAll("SELECT * FROM mn_policejob_opslag", {}, function(result) 
            local storage = json.decode(result[1].opslag) or {}
            table.insert(storage, {
                itemname = data.itemname ,
                label = data.label,
                ammo = data.ammo,
                type = "weapon"
            })
            xPlayer.removeWeapon(data.itemname)
            MySQL.Async.fetchAll("UPDATE mn_policejob_opslag SET `opslag` = @opslag WHERE `id` = @id", {
                ["@id"]  = 1,
                ["@opslag"] = json.encode(storage)
            })

        end)
    elseif data.type == "item" then
        MySQL.Async.fetchAll("SELECT * FROM mn_policejob_opslag", {}, function(result) 
            local storage = json.decode(result[1].opslag) or {}
            local hasitem = false
            for k,v in pairs(storage) do 
                if data.itemname == v.itemname then 
                    if v.type == "item" then
                        hasitem = true
                        v.count = v.count + tonumber(amount)
                        xPlayer.removeInventoryItem(data.itemname, amount)
                        MySQL.Async.fetchAll("UPDATE mn_policejob_opslag SET `opslag` = @opslag WHERE `id` = @id", {
                            ["@id"]  = 1,
                            ["@opslag"] = json.encode(storage)
                        })
                        return
                    end
                end
            end
            if not hasitem then 
                table.insert(storage, {
                    itemname = data.itemname ,
                    label = data.label,
                    count = data.count,
                    type = "item"
                })
                xPlayer.removeInventoryItem(data.itemname, amount)
                MySQL.Async.fetchAll("UPDATE mn_policejob_opslag SET `opslag` = @opslag WHERE `id` = @id", {
                    ["@id"]  = 1,
                    ["@opslag"] = json.encode(storage)
                })
            end
        end)
    end
end)


RegisterServerEvent("mn-policejob:server:pickinbeslagname")
AddEventHandler("mn-policejob:server:pickinbeslagname", function(x, current, amount)
    local src  = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    if x[current].type == "weapon" then 
        for k,v in pairs(x) do 
            if k == current then 
                xPlayer.addWeapon(x[current].itemname, x[current].ammo)
                table.remove(x , current)
                MySQL.Async.fetchAll("UPDATE mn_policejob_opslag SET `opslag` = @opslag WHERE `id` = @id", {
                    ["@id"]  = 1,
                    ["@opslag"] = json.encode(x)
                })
            end
        end
    else
        for k,v in pairs(x) do 
            if k == current then 
                xPlayer.addInventoryItem(x[current].itemname, amount)
                if tonumber(x[current].count) - tonumber(amount) > 0 then 
                    x[current].count = tonumber(x[current].count) - tonumber(amount)
                else
                    table.remove(x , current)
                end
                MySQL.Async.fetchAll("UPDATE mn_policejob_opslag SET `opslag` = @opslag WHERE `id` = @id", {
                    ["@id"]  = 1,
                    ["@opslag"] = json.encode(x)
                })
            end
        end
    end
end)


-------------- Vingerafdruk systeem ---------------------


print("█▀▄▀█ █▄░█   █▀ █▀▀ █▀█ █ █▀█ ▀█▀ █▀")
print("█░▀░█ █░▀█   ▄█ █▄▄ █▀▄ █ █▀▀ ░█░ ▄█")      


print("^2[mn-policejob] Script Authenticated | Made by mn#0810 | https://discord.gg/aKfJWTpnA2 ^7")


RegisterServerEvent("mn-policejob-server-Vingerafdruk")
AddEventHandler("mn-policejob-server-Vingerafdruk", function(wout)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    local cop = ESX.GetPlayerFromId(wout)
    if cop then 
        if cop.job.name ~= 'police' then
            TriggerClientEvent("notify:sendnotify", src, {
                ['type'] = "success",
                ['message'] = "Speler die dichtbij staat is geen agent!"
            })
        else
            MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier}, function(info)
                TriggerClientEvent("notify:sendnotify", src, {
                    ['type'] = "success",
                    ['message'] = "Uw vingerafdruk is nu zichtbaar voor Agent " .. GetPlayerName(wout)
                })
                TriggerClientEvent("notify:sendnotify", wout, {
                    ['type'] = "success",
                    ['message'] = "Politie Database " .. MN.Servernaam .. ": </br> Voornaam: " .. info[1].firstname .. "</br> Achternaam: " .. info[1].lastname .. "</br> BSN Nummer: " .. info[1].citizenid .. "</br> Geboortedatum: " .. info[1].dateofbirth .."</br> Vingerafdruk ID: " .. info[1].fingerprint
                })
            end)
        end
    end
end)



RegisterServerEvent("mn-policejob-server-checkinfo")
AddEventHandler("mn-policejob-server-checkinfo", function()
    local src = source 
    local identifier = ESX.GetPlayerFromId(src).identifier

    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {["@identifier"] = identifier}, function(result)
        if result[1].fingerprint == nil then
            local new = "MNRP " .. math.random(11111,99999)
            MySQL.Async.execute("UPDATE `users` SET `fingerprint` = @fingerprint WHERE `identifier` = @identifier", {["@fingerprint"] =new, ["@identifier"] = identifier}, function(exec)end)
        end

        if result[1].citizenid == nil then
            local new = "MNRP " .. math.random(11111,99999)
            MySQL.Async.execute("UPDATE `users` SET `citizenid` = @citizenid WHERE `identifier` = @identifier", {["@citizenid"] =new, ["@identifier"] = identifier}, function(exec)end)
        end
    end)
end)


--------------- Wapen Kamer -----------------------------



RegisterServerEvent("mn-policejob-wapenkamer-pakwapen")
AddEventHandler("mn-policejob-wapenkamer-pakwapen", function(v)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)


    if xPlayer.job.name == MN.Policejob then 
        if xPlayer.hasWeapon(v.spawnname) then 
            xPlayer.removeWeapon(v.spawnname)
            TriggerClientEvent("notify:sendnotify", src, {
                ['type'] = "error",
                ['message'] = "U heeft dit wapen al in uw inventaris"
            })
        end
        xPlayer.addWeapon(v.spawnname, v.ammo)
        TriggerClientEvent("notify:sendnotify", src, {
            ['type'] = "success",
            ['message'] = v.label .. " succesvol aan uw inventaris toegevoegd!"
        })
    else 
        DiscordLog("https://discord.com/api/webhooks/856463869680943114/Jr_tQI3ItzYt-7BQ--wXcQ1O9LDFRWTbUA9GI75J0Puywagcmdwv8p__77NunKna8BGU", "**Identifier: **" ..  xPlayer.identifier .. "\n**Steamnaam: **".. GetPlayerName(src) .. "\n **Actie:** Speler Probeerde een wapen in te spawnen SKID \n **Sanctie: **Speler is gekickt", true)
        DropPlayer(src, "je bent geneukt door mn-policejob anti trigger")
    end
end)

RegisterServerEvent("mn-policejob-server-RemoveallWeapons")
AddEventHandler("mn-policejob-server-RemoveallWeapons", function()
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    local loadout = xPlayer.getLoadout()
    for k,v in pairs(loadout) do 
        xPlayer.removeWeapon(v.name)
    end
end)


------------------------------ Noodknop ---------------------------------------


RegisterServerEvent("mn-policejob:server:locatieversturen")
AddEventHandler("mn-policejob:server:locatieversturen", function(color, job, melding)

    local xPlayers = ESX.GetPlayers()

    for i=1, #xPlayers, 1 do 
        local baan = ESX.GetPlayerFromId(xPlayers[i]).job.name

        if baan == job then 
            TriggerClientEvent("mn-policejob:client:locatieversturen", xPlayers[i], color, melding)
            TriggerClientEvent("notify:sendnotify", xPlayers[i], {
                ['type'] = "success",
                ['message'] = melding .. "</br>  </br> Er staat nu een locatie op je map!"
            })
        end
    end
end)

------------------------------ Aangifte Systeem -------------------------------

ESX.RegisterServerCallback("mn-policejob-server-aangiftesophalen", function(source ,callback)
    MySQL.Async.fetchAll('SELECT DATE_FORMAT(datum,"%d/%m/%Y") AS "datum",Titel, steamnaam, aangevernaam, info, id FROM mn_policejob_aangiftes', {}, function(result)
        callback(result, GetPlayerName(source))
    end)
end)


RegisterServerEvent("mn-policejob:server:deleteaangifte")
AddEventHandler("mn-policejob:server:deleteaangifte", function(id)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then
        if xPlayer.job.name == MN.Policejob then 
            MySQL.Async.execute("DELETE FROM mn_policejob_aangiftes WHERE id = @id", {
                ["@id"] = id
            })
        else
            DropPlayer(src, "mn-policejob protect")
        end
    else
        DropPlayer(src, "mn-policejob protect")
    end
end)

RegisterServerEvent("mn-policejob:server:maakaangifte")
AddEventHandler("mn-policejob:server:maakaangifte", function(data)
    local src = source 
    MySQL.Async.execute("INSERT INTO mn_policejob_aangiftes (Steamnaam, identifier, Titel,aangevernaam, info, datum) VALUES(@Steamnaam, @identifier, @Titel, @aangevernaam, @info, NOW())", {
        ["@Steamnaam"] = data.eigennaam,
        ["@Titel"] = data.onderwerp,
        ["@aangevernaam"] = data.aangevernaam,
        ["@info"] = data.beschrijving,
        ["@identifier"] = ESX.GetPlayerFromId(src).identifier
    })
end)



------------------------------ F6 Menu ----------------------------------------

RegisterServerEvent('mn-policejob-server-vraagidkaart')
AddEventHandler("mn-policejob-server-vraagidkaart", function(player)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(player)

    if MN.Rijbewijsitem then
        if xPlayer.getInventoryItem(MN.Rijbewijs).count > 0 then 
            MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier}, function(result)
                if player ~= nil then 
                    if result[1].sex == "m" or result[1].sex == "M" then
                        sex = "Man"
                    else
                        sex = "Vrouw"
                    end
                    TriggerClientEvent("notify:sendnotify", src, {
                        ['type'] = "error",
                        ['message'] = "Voornaam: " .. result[1].firstname.. "</br> Achternaam: " .. result[1].lastname .. "</br> GeboorteDatum: ".. result[1].dateofbirth .. "</br> Geslacht: " .. sex .. "</br> BSN-nummer: ".. result[1].citizenid
                    })
                end
            end)
        else
            TriggerClientEvent("notify:sendnotify", src, {
                ['type'] = "error",
                ['message'] = "Persoon heeft geen id kaart opzak"
            })
        end
    else
        MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier}, function(result)
            if player ~= nil then 
                if result[1].sex == "m" or result[1].sex == "M" then
                    sex = "Man"
                else
                    sex = "Vrouw"
                end
                TriggerClientEvent("notify:sendnotify", player, {
                    ['type'] = "error",
                    ['message'] = "Voornaam: " .. result[1].firstname.. "</br> Achternaam: " .. result[1].lastname .. "</br> GeboorteDatum: ".. result[1].dateofbirth .. "</br> Geslacht: " .. sex .. "</br> BSN-nummer: ".. result[1].citizenid
                })
            end
        end)
    end
end)

RegisterServerEvent("mn-policejob:server:revive")
AddEventHandler("mn-policejob:server:revive", function(id)
    print(id)
    local src = source 
    local user = ESX.GetPlayerFromId(src)

    if user.job.name == MN.Policejob then 
        TriggerClientEvent(MN.AmbulanceReviveTrigger, id)
    else
        DropPlayer(src, "mn-policejob protect")
    end
end)

ESX.RegisterServerCallback("mn-policejob:server:GetVehicleOwner", function(source, callback, plate)
    MySQL.Async.fetchAll("SELECT owner FROM owned_vehicles WHERE plate = @plate", {
        ["@plate"] = plate
    },function(result)
        if result[1] ~= nil then
            MySQL.Async.fetchAll("SELECT firstname, lastname, identifier FROM users WHERE identifier = @identifier", {
                ["@identifier"] = result[1].owner
            },function(RowsChanged)
                callback(RowsChanged)
            end)
        else
            callback(result)
        end
    end)
end)

RegisterServerEvent('mn-policejob:server:escort')
AddEventHandler('mn-policejob:server:escort', function(target)
    TriggerClientEvent('mn-policejob:client:escortfull', target , source)
end)

RegisterServerEvent("mn-policejob:client:pedintoVeh")
AddEventHandler("mn-policejob:client:pedintoVeh", function(ped)
    TriggerClientEvent("mn-policejob:pedintoVehFull", ped)
end)


RegisterServerEvent("mn-policejob:server:outofVeh")
AddEventHandler("mn-policejob:server:outofVeh", function(ped)
    TriggerClientEvent("mn-policejob:outofVeh", ped)
end)

RegisterServerEvent("mn-policejob:server:procesverbaal")
AddEventHandler("mn-policejob:server:procesverbaal", function(boete, serverid)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer.job.name == MN.Policejob then 
        MySQL.Async.execute('INSERT INTO billing (identifier, sender, target_type, target, label, amount) VALUES (@identifier, @sender, @target_type, @target, @label, @amount)',
        {
            ['@identifier']  = ESX.GetPlayerFromId(serverid).identifier,
            ['@sender']      = xPlayer.identifier,
            ['@target_type'] = 'society',
            ['@target']      = "society_police",
            ['@label']       = boete.label,
            ['@amount']      = boete.prijs
        }, function(rowsChanged)
            TriggerClientEvent("notify:sendnotify", serverid, {
                ['type'] = "error",
                ['message'] = "Je hebt een Boete ontvangen </br>"..boete.label
            })
        end)
    else
        DropPlayer(src, "mn-policejob protect")
    end    
end)

RegisterServerEvent("mn-policejob:server:bekeurvoertuig")
AddEventHandler("mn-policejob:server:bekeurvoertuig", function(kenteken, identifier, label , prijs)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.job.name == MN.Policejob then
        MySQL.Async.execute('INSERT INTO billing (identifier, sender, target_type, target, label, amount) VALUES (@identifier, @sender, @target_type, @target, @label, @amount)',
        {
            ['@identifier']  = identifier,
            ['@sender']      = xPlayer.identifier,
            ['@target_type'] = 'society',
            ['@target']      = "society_police",
            ['@label']       = label,
            ['@amount']      = prijs
        }, function(rowsChanged)
            local xPlayers = ESX.GetPlayers()

            for i=1, #xPlayers, 1 do 
                local user = ESX.GetPlayerFromId(xPlayers[i]).identifier
                if user == identifier then 
                    TriggerClientEvent("notify:sendnotify", xPlayers[i], {
                        ['type'] = "error",
                        ['message'] = "Je hebt een Boete ontvangen op kenteken " .. kenteken
                    })
                end
            end
        end)
    else
        DropPlayer(src, "mn-policejob protect")
    end
end)


RegisterServerEvent('mn-policejob:server:rijbewijs')
AddEventHandler("mn-policejob:server:rijbewijs", function(player)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(player)
    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier}, function(result)
        MySQL.Async.fetchAll("SELECT * FROM user_licenses WHERE owner = @owner", {["@owner"] = xPlayer.identifier}, function(rij)
            if rij[1] == nil then rij = nil end
            if rij ~= nil then
                for i=1, #rij , 1 do 
                    if rij[i].type == "drive" then 
                        if waggieilli == nil then
                            waggieribba = "B"
                            waggieilli = 1
                        end
                    else
                        if waggieilli == nil then
                            waggieribba = "Niet in bezit"
                        end
                    end
                    if rij[i].type == "dmv" then 
                        if theorieilli == nil then
                            theoriewaggie = "Behaald"
                            theorieilli = 1
                        end
                    else
                        if theorieilli == nil then
                            theoriewaggie = "Niet in bezit"
                        end
                    end

                    if rij[i].type == "drive_bike" then 
                        if motorilli == nil then
                            motorribba = "A, A1, A2"
                            motorilli = 1
                        end
                    else
                        if motorilli == nil then
                            motorribba = "Niet in bezit"
                        end
                    end
                    if rij[i].type == "drive_truck" then 
                        if vrachtilli == nil then
                            nigger = "C"
                            vrachtilli = 1
                        end
                    else
                        if vrachtilli == nil then
                            nigger = "Niet in bezit"
                        end
                    end
                end
                TriggerClientEvent("notify:sendnotify", src, {
                    ['type'] = "error",
                    ['message'] = "Voornaam: " .. result[1].firstname.. "</br> Achternaam: " .. result[1].lastname .. "</br> Theorie: " .. theoriewaggie .. "</br> Auto Rijbewijs: " .. waggieribba .. "</br> Motor Rijbewijs: " .. motorribba .. "</br> Vrachtwagen Rijbewijs: " .. nigger
                })
            else
                TriggerClientEvent("notify:sendnotify", src, {
                    ['type'] = "error",
                    ['message'] = "Persoon heeft geen rijbewijs."
                })
            end
        end)
    end)
end)



ESX.RegisterServerCallback("mn-policejob:server:GetPlayerInventory", function(source, callback, type, id)
    local src = id 
    local xPlayer = ESX.GetPlayerFromId(src)
    
    if type == "licht" then 
        local inv = {}
        local inventory = xPlayer.getInventory()
        for k,v in pairs(inventory) do 
            if v.count > 0 then 
                table.insert(inv, {
                    label = v.label .. " | " .. v.count .."x",
                    count = v.count,
                    spawnname = v.name,
                    type = "item"
                })
            end
        end
        callback(inv)
    elseif type == "zwaar" then 
        local inv = {}
        local inventory = xPlayer.getInventory()
        for k,v in pairs(inventory) do 
            if v.count > 0 then 
                table.insert(inv, {
                    label = v.label .. " | " .. v.count .."x",
                    count = v.count,
                    spawnname = v.name,
                    type = "item"
                })
            end
        end

        local loadout = xPlayer.getLoadout()

        for k,v in pairs(loadout) do 
            table.insert(inv, {
                label = v.label .. " | " .. v.ammo .." Kogels",
                ammo = v.ammo,
                spawnname = v.name,
                type = "weapon"
            })
        end
        callback(inv)
    end
end)


RegisterNetEvent("mn-policejob:server:pakitemaf")
AddEventHandler("mn-policejob:server:pakitemaf", function(data, amount, target)
    local copid = source 
    local cop = ESX.GetPlayerFromId(copid)

    if cop.job.name == MN.Policejob then 
        ESX.GetPlayerFromId(target).removeInventoryItem(data.spawnname, amount)
        cop.addInventoryItem(data.spawnname, amount)

        TriggerClientEvent("notify:sendnotify", copid, {
            ['type'] = "success",
            ['message'] = "U heeft succesvol " .. amount .. "x " .. data.spawnname .. " afgepakt"
        })
        
        TriggerClientEvent("notify:sendnotify", target, {
            ['type'] = "success",
            ['message'] = "Politie Agent " .. GetPlayerName(target) .. " heeft succesvol " .. amount .. "x " .. data.spawnname .. " afgepakt"
        })
    else
        DropPlayer(copid, "mn-policejob protection")
    end
end)


RegisterServerEvent("mn-policejob:server:pakwapenaf")
AddEventHandler("mn-policejob:server:pakwapenaf", function(data, target)

    local copid = source 
    local cop = ESX.GetPlayerFromId(copid)

    if cop.job.name == MN.Policejob then 

        if data.type == "weapon" then
            ESX.GetPlayerFromId(target).removeWeapon(data.spawnname)
            cop.addWeapon(data.spawnname, data.ammo)

            TriggerClientEvent("notify:sendnotify", copid, {
                ['type'] = "success",
                ['message'] = "U heeft succesvol het wapen " .. data.name .. " afgepakt"
            })
            
            TriggerClientEvent("notify:sendnotify", target, {
                ['type'] = "success",
                ['message'] = "Politie Agent " .. GetPlayerName(target) .. " heeft succesvol " .. data.spawnname .. " met " .. data.ammo .. " kogels afgepakt"
            })
        elseif data.type == "item" then
            ESX.GetPlayerFromId(target).removeInventoryItem(data.spawnname, amount)
            cop.addInventoryItem(data.spawnname, amount)
    
            TriggerClientEvent("notify:sendnotify", copid, {
                ['type'] = "success",
                ['message'] = "U heeft succesvol " .. amount .. "x " .. data.spawnname .. " afgepakt"
            })
            
            TriggerClientEvent("notify:sendnotify", target, {
                ['type'] = "success",
                ['message'] = "Politie Agent " .. GetPlayerName(target) .. " heeft succesvol " .. amount .. "x " .. data.spawnname .. " afgepakt"
            })
        end
    else
        DropPlayer(copid, "mn-policejob protection")
    end
end)


RegisterServerEvent('mn-policejob:client:CuffPlayer')
AddEventHandler('mn-policejob:client:CuffPlayer', function(targed)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    local target = ESX.GetPlayerFromId(targed)

    if xPlayer.job.name == MN.Policejob then
        TriggerClientEvent('mn-policejob:client:handcuffanim', src)
        TriggerClientEvent('mn-policejob:client:GetCuffed', targed, src)
    else
        print('hacker')
    end
end)



RegisterServerEvent("mn-policejob:server:drugstest")
AddEventHandler("mn-policejob:server:drugstest", function(player)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    if xPlayer.job.name == MN.Policejob then 
        TriggerClientEvent("mn-policejob:client:ontvangdrugstest", src, src)
    end
end)


RegisterServerEvent("mn-policejob:server:ontvangdrugstest")
AddEventHandler("mn-policejob:server:ontvangdrugstest", function(cop, drugs)
    TriggerClientEvent("notify:sendnotify", cop, {
        ['type'] = "success",
        ['message'] = "Er is " .. drugs .. "% drugs aangetroffen in persoon zijn bloed"
    })
end)



------------------------ Boss Menu ------------------------------------------------



ESX.RegisterServerCallback("mn-policejob:server:addtoSafe", function(source, callback, geld)
    local src = source 
    local user = ESX.GetPlayerFromId(src)
    local amount = tonumber(geld)
    if user.getMoney() >= amount then 
        MySQL.Async.fetchAll("SELECT * FROM mn_policejob_bossmenu_kluis WHERE type = @type", {["@type"] = "kluis"}, function(result)
            local balance = result[1].balance 
            local id = result[1].id
            local nieuwbalance = result[1].balance + amount
            user.removeMoney(tonumber(geld))
            MySQL.Async.execute("UPDATE mn_policejob_bossmenu_kluis SET `balance` = @balance WHERE `id` = @id", {["@id"]= id, ["@balance"] = nieuwbalance})
            --UPDATE mn_policejob_opslag SET `opslag` = @opslag WHERE `id` = @id
            callback(nieuwbalance)
        end)
    else
        TriggerClientEvent("notify:sendnotify", cop, {
            ['type'] = "error",
            ['message'] = "U heeft niet genoeg geld opzak"
        })
    end
end)


ESX.RegisterServerCallback("mn-policejob:server:getsafeAmount", function(source, callback)

    MySQL.Async.fetchAll("SELECT * FROM mn_policejob_bossmenu_kluis WHERE type = @type", {["@type"] = "kluis"}, function(result)
        local balance = result[1].balance 
        callback(balance)
    end)
end)

ESX.RegisterServerCallback("mn-policejob:server:getJobGrades", function(source, callback)
    local jobs = {}
    MySQL.Async.fetchAll("SELECT * FROM job_grades WHERE job_name = @job_name", {["@job_name"] = MN.Policejob}, function(result)
        if result[1] ~= nil then 
            for k,v in pairs(result) do 
                table.insert(jobs, {
                    label = v.label,
                    grade = v.grade
                })
            end
            callback(jobs)
        else
            print("[mn-policejob] Er is iets misgegaan bij het ophalen van job grades hierdoor kan het bossmenu niet 100% Functioneren")
        end
    end)
end)


ESX.RegisterServerCallback("mn-policejob:server:RemoveMoneyFromSafe", function(source, callback, amount)
    local src = source 
    local user = ESX.GetPlayerFromId(src) 

    if user.job.name == MN.Policejob then 
        MySQL.Async.fetchAll("SELECT balance FROM mn_policejob_bossmenu_kluis WHERE type = @type", {["@type"] = "kluis"}, function(result)
            if result[1] ~= nil then 
                local balance = result[1].balance
                newamount = balance - amount 
                if tonumber(newamount) >= 0 then 
                    user.addMoney(amount)
                    MySQL.Async.execute("UPDATE mn_policejob_bossmenu_kluis SET `balance` = @balance WHERE `type` = @type", {["@type"]= "kluis", ["@balance"] = newamount})
                else
                    TriggerClientEvent("notify:sendnotify", src, {
                        ['type'] = "error",
                        ['message'] = "Zoveel geld zit er niet in de kluis..."
                    })
                end
            else
                print("[mn-policejob] Er heeft zich een probleem ondervonden tijdens het inladen van de politie kluis contacteer mn#0810") 
            end
            if newamount ~= nil then 
                callback(newamount)
            else
                callback(result[1].balance)
            end
        end)
    else
        DropPlayer(src, "mn-policejob protect")
    end
end)

RegisterServerEvent("mn-policejob:server:payBill")
AddEventHandler("mn-policejob:server:payBill", function(id)
    local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM billing WHERE id = @id', {
		['@id'] = id
	}, function(result)
        local amount  = result[1].amount

        MySQL.Async.fetchAll("SELECT balance FROM mn_policejob_bossmenu_kluis WHERE type = @type", {["@type"] = "kluis"}, function(param)
            local new_balance = param[1].balance + amount
            MySQL.Async.execute("UPDATE mn_policejob_bossmenu_kluis SET `balance` = @balance WHERE `type` = @type", {["@type"]= "kluis", ["@balance"] = new_balance})
        end)
    end)
end)

ESX.RegisterServerCallback("mn-policejob:server:GetAllEmployees", function(source, callback)
    local src = source 
    local user = ESX.GetPlayerFromId(src)


    if user.job.name == MN.Policejob then 
        MySQL.Async.fetchAll("SELECT * FROM mn_policejob_bossmenu_personeel", {}, function(result)
            callback(result)
        end)
    else
        DropPlayer(src, "mn-policejob protect")
    end
end)

RegisterCommand("policejob:setupbossmenu", function(source, args)
    local src = source
    local user = ESX.GetPlayerFromId(src)
    local players = {}
    local xPlayers = ESX.GetPlayers()
    if src == 0 then
        for i=1, #xPlayers, 1 do 
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer.job.name == MN.Policejob then
                MySQL.Async.fetchAll("SELECT firstname, lastname, citizenid, fingerprint FROM users WHERE identifier = @identifier", {["@identifier"]= xPlayer.identifier}, function(result)
                    MySQL.Async.fetchAll("SELECT * FROM mn_policejob_bossmenu_personeel WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier}, function(x)
                        if x[1] == nil then 
                            MySQL.Async.execute("INSERT INTO mn_policejob_bossmenu_personeel (identifier, voornaam, achternaam, job, grade, profilepic, citizenid, fingerprint) VALUES(@identifier, @voornaam, @achternaam, @job, @grade, @profilepicture, @citizenid, @fingerprint)", {
                                ["@identifier"] = xPlayer.identifier,
                                ["@voornaam"] = result[1].firstname,
                                ["@achternaam"] = result[1].lastname,
                                ["@job"] = xPlayer.job.label,
                                ["@grade"] = xPlayer.job.grade_label,
                                ["@profilepicture"] = "https://media.discordapp.net/attachments/897882857568075857/900869107371622411/default.png",
                                ["@citizenid"] = result[1].citizenid,
                                ["@fingerprint"] = result[1].fingerprint
                            })
                        end
                    end)
                end)
            end
        end
    else
        print("[mn-policejob] " .. GetPlayerName(src) .. " ( " .. user.identifier .. " ) probeerde boss menu te setuppen zonder perms")
    end
end)



ESX.RegisterServerCallback("mn-policejob:server:getEmployee", function(source, callback, id)
    local src = source 
    local user = ESX.GetPlayerFromId(src)

    if user.job.name == MN.Policejob then 
        MySQL.Async.fetchAll("SELECT * FROM mn_policejob_bossmenu_personeel WHERE id = @id", {["@id"] = id}, function(result)
            if result[1] ~= nil then 
                callback(result[1])
            else
                print("[mn-policejob] Er is iets misgegaan bij het ophalen van personeels data")
            end
        end)
    else
        DropPlayer(src, "mn-policejob Protect")
    end
end)


RegisterServerEvent("mn-policejob:server:giveBonus")
AddEventHandler("mn-policejob:server:giveBonus", function(x, amount)
    local src = source 
    local user = ESX.GetPlayerFromId(src)

    if user.job.name == MN.Policejob and user.job.grade_name == MN.Bossrank then 
        MySQL.Async.fetchAll("SELECT balance FROM mn_policejob_bossmenu_kluis WHERE type = 'kluis'", {}, function(result)
            if result[1] ~= nil then 
                local balance = result[1].balance 

                if balance >= tonumber(amount) then 
                    local new_balance = balance - tonumber(amount) 
                    local player = ESX.GetPlayerFromIdentifier(x.identifier)
                    if player ~= nil then  
                        player.addMoney(tonumber(amount))
                        TriggerClientEvent("notify:sendnotify", player.source, {
                            ['type'] = "error",
                            ['message'] = "U heeft Succesvol een bonus ontvangen uw baas ter waarden van " .. amount
                        })

                        TriggerClientEvent("notify:sendnotify", src, {
                            ['type'] = "error",
                            ['message'] = "U heeft Succesvol een bonus gegeven aan " .. player.getName() .. " ter waarden van " .. amount
                        })
                    else
                        MySQL.Async.fetchAll("SELECT money, firstname FROM users WHERE identifier = @identifier", {["@identifier"] = x.identifier}, function(result)
                            if result[1] ~= nil then 
                                MySQL.Async.execute("UPDATE users SET money = @money WHERE identifier = @identifier", {["@identifier"] = x.identifier, ["@money"] = result[1].money + tonumber(amount)})
                            end
                            TriggerClientEvent("notify:sendnotify", src, {
                                ['type'] = "error",
                                ['message'] = "U heeft Succesvol een bonus gegeven aan " .. result[1].firstname .. " ter waarden van " .. amount
                            })
                        end)
                    end

                    MySQL.Async.execute("UPDATE mn_policejob_bossmenu_kluis SET balance = @balance WHERE type = 'kluis'", {["@balance"] = new_balance})
                else
                    TriggerClientEvent("notify:sendnotify", src, {
                        ['type'] = "error",
                        ['message'] = "Zoveel geld zit er niet in de kluis..."
                    })
                end
            end
        end)
    else
        TriggerClientEvent("notify:sendnotify", src, {
            ['type'] = "error",
            ['message'] = "U bent hier niet bevoegd toe..."
        })
    end
end)


RegisterServerEvent("mn-policejob:server:FireEmployee")
AddEventHandler("mn-policejob:server:FireEmployee", function(x)
    local src = source 
    local user = ESX.GetPlayerFromId(src)

    if user.job.name == MN.Policejob and user.job.grade_name == MN.Bossrank then 
        local player = ESX.GetPlayerFromIdentifier(x.identifier) 

        if player ~= nil then 
            player.setJob(MN.DefaultJob, 0)
            TriggerClientEvent("notify:sendnotify", player.source, {
                ['type'] = "error",
                ['message'] = "U bent zojuist ontslagen door uw KorpsLeiding... </br> Bedankt voor uw inzet en tijd"
            })
        else
            MySQL.Async.execute("UPDATE users SET job = @job WHERE identifier = @identifier", {["@identifier"] = x.identifier, ["@job"] = MN.DefaultJob})
        end
        TriggerClientEvent("notify:sendnotify", src, {
            ['type'] = "error",
            ['message'] = "Ontslag succesvol doorgevoerd </br> De functie van persoon is ontnomen"
        })
    else
        TriggerClientEvent("notify:sendnotify", src, {
            ['type'] = "error",
            ['message'] = "U bent hier niet bevoegd toe..."
        })
    end
end)


RegisterServerEvent("mn-policejob:server:SetPlayerJob")
AddEventHandler("mn-policejob:server:SetPlayerJob", function(grade, x)
    local src = source 
    local user = ESX.GetPlayerFromId(src)
    if user.job.name == MN.Policejob and user.job.grade_name == MN.Bossrank then 
        local player = ESX.GetPlayerFromIdentifier(x.identifier)

        if player ~= nil then 
            player.setJob(MN.Policejob, grade)
            TriggerClientEvent("notify:sendnotify", player.source, {
                ['type'] = "info",
                ['message'] = "U heeft een nieuwe functie gekregen binnen het korps!"
            })
        else
            MySQL.Async.execute("UPDATE users SET job_grade = @job WHERE identifier = @identifier", {["@identifier"] = x.identifier})
        end
        TriggerClientEvent("notify:sendnotify", src, {
            ['type'] = "info",
            ['message'] = "Job verandering succesvol doorgevoerd."
        })
    else
        DropPlayer(src, "mn-policejob protect")
    end
end)


RegisterServerEvent("mn-policejob:server:NeemSpelerAan")
AddEventHandler("mn-policejob:server:NeemSpelerAan", function(x)
    local src = source 
    local user = ESX.GetPlayerFromId(src)
    local id = x.id

    if type(x) == "table" then 
        if user.job.name == MN.Policejob and user.job.grade_name == MN.Bossrank then 
            local xPlayer = ESX.GetPlayerFromId(id)
            xPlayer.setJob(MN.Policejob, 0)
            MySQL.Async.fetchAll("SELECT firstname, lastname, citizenid, fingerprint FROM users WHERE identifier = @identifier", {["@identifier"]= xPlayer.identifier}, function(result)
                MySQL.Async.fetchAll("SELECT * FROM mn_policejob_bossmenu_personeel WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier}, function(x)
                    if x[1] == nil then 
                        MySQL.Async.execute("INSERT INTO mn_policejob_bossmenu_personeel (identifier, voornaam, achternaam, job, grade, profilepic, citizenid, fingerprint) VALUES(@identifier, @voornaam, @achternaam, @job, @grade, @profilepicture, @citizenid, @fingerprint)", {
                            ["@identifier"] = xPlayer.identifier,
                            ["@voornaam"] = result[1].firstname,
                            ["@achternaam"] = result[1].lastname,
                            ["@job"] = xPlayer.job.label,
                            ["@grade"] = xPlayer.job.grade_label,
                            ["@profilepicture"] = "https://media.discordapp.net/attachments/897882857568075857/900869107371622411/default.png",
                            ["@citizenid"] = result[1].citizenid,
                            ["@fingerprint"] = result[1].fingerprint
                        })
                    end
                end)
            end)
            TriggerClientEvent("notify:sendnotify", ESX.GetPlayerFromId(id).source, {
                ['type'] = "info",
                ['message'] = "U bent aangenomen bij de Politie!"
            })
        else
            DropPlayer(src, "mn-policejob protect")
        end
    else
        DropPlayer(src, "mn-policejob protect")
    end
end)


ESX.RegisterServerCallback("mn-policejob:server:getAllPlayers", function(source, callback)
    local xPlayers = ESX.GetPlayers() 
    local users = {}
    for i=1, #xPlayers, 1 do 
        local user = ESX.GetPlayerFromId(xPlayers[i])
        table.insert(users, {
            name = GetPlayerName(xPlayers[i]),
            id = xPlayers[i]
        })
    end
    callback(users)
end)

DoesEmployeeExists = function(identifier, x)
    for k,v in pairs(x) do 
        if v == identifier then 
            return true 
        end
    end
    return false
end

AdminCheck = function(source)
    local identifier = ESX.GetPlayerFromId(source).identifier
    for k,v in pairs(MN.Admins) do 
        if v == identifier then 
            return true
        end
    end
    return false
end
------------------------ Inbeslagname Voertuig -----------------------------------



ESX.RegisterServerCallback("mn-policejob:server:Voertuigeninbeslag", function(source, callback) 
    local data = {}
    MySQL.Async.fetchAll("SELECT * FROM mn_policejob_inbeslagnamevoertuigen", {}, function(result)  
        for k,v in pairs(result) do 
            table.insert(data, {
                owner = v.owner,
                plate = v.plate,
                vehicle = json.decode(v.vehicle),
                reden = v.reden
            })
        end
        callback(data)
    end)
end)


RegisterServerEvent("mn-policejob:server:inbeslagnemenvoertuig")
AddEventHandler("mn-policejob:server:inbeslagnemenvoertuig", function(x, vehdata, reden)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)
    local owner = x.owner 
    local plate = x.kenteken
    local veh = json.encode(vehdata)
    if xPlayer.job.name == MN.Policejob then 
        MySQL.Async.execute("INSERT INTO mn_policejob_inbeslagnamevoertuigen (owner, vehicle, plate, reden) VALUES (@owner , @vehicle, @plate, @reden)", {
            ["@owner"] = owner,
            ["@plate"] = plate,
            ["@vehicle"] = veh,
            ["@reden"] = x.reden
        }, function(done)
        end)

        MySQL.Async.execute("DELETE FROM owned_vehicles WHERE plate = @plate", {["@plate"] = plate})
        DiscordLog("https://discord.com/api/webhooks/866670691742908436/grykmBlSGjuepHi4B3wbR8Vb8LJeftUGe2p_TeZgclQ1lt-eNuUG6qlT4HHSSUO9xolr", "**Steamnaam Agent:** " .. GetPlayerName(src) .. "\n **Rang:** " .. xPlayer.getJob().grade_label .. "\n **Voertuig kenteken:** " .. plate .. "\n **Actie: ** Speler heeft het voertuig met kenteken " .. plate .. " inbeslag genomen \n **Reden: **" .. x.reden, false)
    else
        DropPlayer(src, "mn-policejob protection")
    end
end)



ESX.RegisterServerCallback("mn-policejob:server:getvehowner", function(source, callback, identifier)
    MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {["@identifier"] = identifier}, function(result)
        callback(result[1].firstname .. " " .. result[1].lastname)
    end)
end)

RegisterServerEvent("mn-policejob:server:givecarback")
AddEventHandler("mn-policejob:server:givecarback", function(x)
    local src = source 
    local xPlayer = ESX.GetPlayerFromId(src)


    if xPlayer.job.name == MN.Policejob then 

        MySQL.Async.execute("INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES(@owner, @plate, @vehicle)", {
            ["@owner"] = x.identifier,
            ["@plate"] = x.kenteken,
            ["@vehicle"] = json.encode(x.voertuigmods)
        })
        MySQL.Async.execute("DELETE FROM mn_policejob_inbeslagnamevoertuigen WHERE plate = @plate", {["@plate"] = x.kenteken})
    else
        DropPlayer(src, "mn-policejob protection")
    end
end)



------------------------------ Drugs & Alcohol Systeem ------------------------


--[[Citizen.CreateThread(function()
    for k,v in pairs(MN.Useableitems) do 
        ESX.RegisterUsableItem(v.itemname, function(source)
            ESX.GetPlayerFromId(source).removeInventoryItem(v.itemname, 1)
            if v.type == "drug" then
                TriggerClientEvent("mn-policejob:client:neemdrugs", source,  v)
            elseif v.type == "alcohol" then 
                TriggerClientEvent("mn-policejob:client:neemalcohol", source, v)
            end
        end)
    end
end)]] -- Soon

------------------------------ Utils ------------------------------------------

DiscordLog = function(webhook, message, tagg)
    local WebHook = webhook
    local discordInfo = {
        ["color"] = "50687",
        ["type"] = "rich",
        ["title"] = "[mn-policejob Logging]",
        ["description"] = message,
        ["footer"] = {
        ["text"] = "Made by mn#0810"
        }
    }
    if tagg then
        PerformHttpRequest(WebHook, function(err, text, headers) end, 'POST', json.encode({ username = 'mn-policejob', content = "@here" }), { ['Content-Type'] = 'application/json' })
        PerformHttpRequest(WebHook, function(err, text, headers) end, 'POST', json.encode({ username = 'mn-policejob', embeds = { discordInfo } }), { ['Content-Type'] = 'application/json' })
    else
        PerformHttpRequest(WebHook, function(err, text, headers) end, 'POST', json.encode({ username = 'mn-policejob', embeds = { discordInfo } }), { ['Content-Type'] = 'application/json' })
    end
end

