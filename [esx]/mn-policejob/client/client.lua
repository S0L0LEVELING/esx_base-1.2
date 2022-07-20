ESX = nil

Playerjob = nil

steamnaam = nil


isHandcuffed = false

drugs = 0

alcohol = 0

Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

Citizen.CreateThread(function()
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function (obj) ESX = obj end)
        Wait(5)
    end
    Playerjob = ESX.GetPlayerData().job
    ESX.TriggerServerCallback("mn-policejob:server:getJobGrades", function(grades)
        JobGrades = grades
    end)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    Playerjob = ESX.GetPlayerData().job
    TriggerServerEvent("mn-policejob-server-checkinfo")
    if JobGrades ~= nil then 
        ESX.TriggerServerCallback("mn-policejob:server:getJobGrades", function(grades)
            JobGrades = grades
        end)
    end
end)


RegisterNetEvent('esx:setJob') -- Job Update
AddEventHandler('esx:setJob', function(job)
    Playerjob = job
end)


--[[
    Founder MN SCRIPTS ,
    ©mn#0810
]]

--[[------------------------------------------------------------------------



	Radar/ALPR 

	Created by Brock =]

	Uses Numpad5 to turn on

    Uses Numpad8 to freeze	



------------------------------------------------------------------------]]--









local radar =

{

	shown = false,

	freeze = false,

	info = "~y~Geen ~w~voertuig ~y~gedetecteerd!",

	info2 = "~y~Geen ~w~voertuig ~y~gedetecteerd!",

	minSpeed = 5.0,

	maxSpeed = 75.0,

}

--local distanceToCheckFront = 50



function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)

    SetTextFont(font)

    SetTextProportional(0)

    SetTextScale(sc, sc)

	N_0x4e096588b13ffeca(jus)

    SetTextColour(r, g, b, a)

    SetTextDropShadow(0, 0, 0, 0,255)

    SetTextEdge(1, 0, 0, 0, 255)

    SetTextDropShadow()

    SetTextOutline()

    SetTextEntry("STRING")

    AddTextComponentString(text)

	DrawText(x - 0.3+w, y - 0.02+h)

end



-- ESX job checker (wel / of geen politie)

ESX = nil



Citizen.CreateThread(function()

	while ESX == nil do

		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

		Citizen.Wait(0)

	end



	while ESX.GetPlayerData().job == nil do

		Citizen.Wait(10)

	end



	PlayerData = ESX.GetPlayerData()

end)





RegisterNetEvent('esx:setJob')

AddEventHandler('esx:setJob', function(job)

	PlayerData.job = job

end)



function ispolitie() 

    if PlayerData ~= nil then

        local ispolitie = false

        if PlayerData.job.name == 'police' or PlayerData.job.name == 'kmar' then

            ispolitie = true

		end

		return ispolitie

	end

end

-- Einde job checker





Citizen.CreateThread(function()

	while true do

		Wait(0)

		if IsControlJustPressed(1, 128) and ispolitie() then

			

			if radar.shown then 

				radar.shown = false 

				radar.info = string.format("~y~Geen ~w~voertuig ~y~gedetecteerd!")

				radar.info2 = string.format("~y~Geen ~w~voertuig ~y~gedetecteerd!")

			else 

				radar.shown = true 

			end		

                Wait(75)

			

		end



		if IsControlJustPressed(1, 109) and ispolitie() then

			if radar.freeze then radar.freeze = false else radar.freeze = true end

			Wait(75)

		end









		if radar.shown  then

			if radar.freeze == false then

					local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)

					local coordA = GetOffsetFromEntityInWorldCoords(veh, 0.0, 1.0, 1.0)

					local coordB = GetOffsetFromEntityInWorldCoords(veh, 0.0, 105.0, 0.0)

					local frontcar = StartShapeTestCapsule(coordA, coordB, 3.0, 10, veh, 7)

					local a, b, c, d, e = GetShapeTestResult(frontcar)

					

					if IsEntityAVehicle(e) then

						

						local fmodel = GetDisplayNameFromVehicleModel(GetEntityModel(e))

						local fvspeed = GetEntitySpeed(e)*3.6

						local fplate = GetVehicleNumberPlateText(e)

						radar.info = string.format("~y~Kenteken: ~w~%s  ~y~Model: ~w~%s  ~y~Snelheid: ~w~%s kmh", fplate, fmodel, math.ceil(fvspeed))

					end

					

					local bcoordB = GetOffsetFromEntityInWorldCoords(veh, 0.0, -105.0, 0.0)

					local rearcar = StartShapeTestCapsule(coordA, bcoordB, 3.0, 10, veh, 7)

					local f, g, h, i, j = GetShapeTestResult(rearcar)

					

					if IsEntityAVehicle(j) then

					

						local bmodel = GetDisplayNameFromVehicleModel(GetEntityModel(j))

						local bvspeed = GetEntitySpeed(j)*3.6

						local bplate = GetVehicleNumberPlateText(j)

						radar.info2 = string.format("~y~Kenteken: ~w~%s  ~y~Model: ~w~%s  ~y~Snelheid: ~w~%s kmh", bplate, bmodel, math.ceil(bvspeed))

					

					

					end

					

			end

			

			DrawRect(0.300, 0.94, 0.200, 0.116, 0, 0, 0, 150)
			DrawAdvancedText(0.591, 0.903, 0.005, 0.0028, 0.4, "Radar voor", 0, 191, 255, 255, 6, 0)
			DrawAdvancedText(0.591, 0.953, 0.005, 0.0028, 0.4, "Radar achter", 0, 191, 255, 255, 6, 0)
			DrawAdvancedText(0.6, 0.928, 0.005, 0.0028, 0.4, radar.info, 255, 255, 255, 255, 6, 0)
			DrawAdvancedText(0.6, 0.979, 0.005, 0.0028, 0.4, radar.info2, 255, 255, 255, 255, 6, 0)
		end

		

		if(not IsPedInAnyVehicle(GetPlayerPed(-1))) then
			radar.shown = false
			radar.info = string.format("~y~Geen ~w~voertuig ~y~gedetecteerd!")
			radar.info2 = string.format("~y~Geen ~w~voertuig ~y~gedetecteerd!")
		end
	end
end)

------------- Blips --------------------------------

Citizen.CreateThread(function() -- Blips Thread
    for k,v in pairs(MN.Blips) do 
        if v.enabled then 
            local blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite (blip, v.sprite)
            SetBlipScale  (blip, v.scale)
            SetBlipColour (blip, v.color)
    
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(k)
            EndTextCommandSetBlipName(blip)
        end
    end
end)



----------------- Marker Thread ------------------------------

Citizen.CreateThread(function()
    while true do 
        while Playerjob == nil do Wait(500) end
        Wait(0)
        local ped = GetPlayerPed(-1)
        local coords = GetEntityCoords(ped)
        local sleep = true
        while Playerjob == nil do Wait(500) end
        for k,v in pairs(MN.Markers) do 
            local dist = GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true)
            if v.trigger ~= "mn-policejob-client-Vingerafdruk" then
                if Playerjob.name == MN.Policejob then 
                    if dist < 10 then 
                        slapen = false
                        DrawMarker(20,v.x, v.y, v.z - 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.3, 0.2, 65,105,225, 100, false, true, 2, true, nil, nil, false)

                        if dist < 2 then 
                            DrawScriptText(vector3(v.x, v.y, v.z), v.text) 

                            if IsControlJustReleased(0, v.key) then 
                                TriggerEvent(v.trigger)
                            end
                        end
                    end
                end
            else
                if dist < 10 then 
                    slapen = false
                    DrawMarker(20,v.x, v.y, v.z - 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.3, 0.2, 65,105,225, 100, false, true, 2, true, nil, nil, false)

                    if dist < 2 then 
                        DrawScriptText(vector3(v.x, v.y, v.z), v.text) 

                        if IsControlJustReleased(0, v.key) then 
                            TriggerEvent(v.trigger)
                        end
                    end
                end
            end
        end
        if slapen then 
            Wait(500)
        end
    end
end)



---------------------- WapenKamer -------------------------


RegisterNetEvent("mn-policejob-client-OpenWeaponVault")
AddEventHandler("mn-policejob-client-OpenWeaponVault", function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "Wapenkameropen",
        wapens = MN.WapenKamer
    })
end)



RegisterNUICallback("PakWapen", function(data)
    SetNuiFocus(false, false)
    openandDrop()
    GetWeapon(function(weaponData)
        TriggerServerEvent(data.serverevent, weaponData)
    end, data.id)
end)

GetWeapon = function(callback, id)
    for k,v in pairs(MN.WapenKamer) do 
        if k == id then 
            callback(v) 
        end
    end
end


RegisterNetEvent("mn-policejob-client-RemoveallWeapons")
AddEventHandler("mn-policejob-client-RemoveallWeapons", function()
    TriggerServerEvent("mn-policejob-server-RemoveallWeapons")
end)




----------------------- Inbeslagname ---------------------

RegisterNetEvent("mn-policejob-client-Inbeslagname")
AddEventHandler("mn-policejob-client-Inbeslagname", function()
    local elements = {}
    openandDrop()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mn-policejob', {
        title = "Inbeslagname",
        align = "top-left",
        elements = {
            {label = "Voorwerpen/Wapen Bekijken", type =  "bekijk"},
            {label = "Voorwerpen/Wapen Opbergen", type =  "opbergen"},
    }}, function(data, menu)
        if data.current.type == 'bekijk' then 
            BekijkInbeslagname()
            menu.close()
        elseif data.current.type == 'opbergen' then 
            Spullenopbergen()
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end)



BekijkInbeslagname = function()
    ESX.TriggerServerCallback("mn-policejob-server-getinbeslagname", function(data2)
        local i = {}
        if data2[1] == nil then 
            exports["skeexsNotify"]:TriggerNotification({
                ['type'] = "success",
                ['message'] = "Deze kast lijkt is leeg..."
            })
        else
            for k,v in pairs(data2) do
                if v.type == "weapon" then
                    table.insert(i, { 
                        type = v.type, 
                        label = v.itemname .. " | " .. v.ammo,
                        itemname = v.itemname,
                        ammo = v.ammo, 
                        current = k
                    })
                else
                    table.insert(i, { 
                        type = v.type, 
                        label = v.itemname .. " | " .. v.count,
                        itemname = v.itemname,
                        count = v.count, 
                        current = k
                    })
                end
            end
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mn-policejob-2', {
                title = "Inbeslagname",
                align = "top-left",
                elements = i
            }, function(data, menu)
                if Playerjob.grade_name == MN.Bossrank then 
                    if data.current.type == "item" then 
                        dialog(function(x)
                            TriggerServerEvent("mn-policejob:server:pickinbeslagname", data2, data.current.current, x)
                        end)
                        menu.close()
                    else
                        TriggerServerEvent("mn-policejob:server:pickinbeslagname", data2, data.current.current)
                        menu.close()
                    end
                else
                    exports["skeexsNotify"]:TriggerNotification({
                        ['type'] = "error",
                        ['message'] = "Jij bent niet bevoegd om spullen uit de opslag te halen"
                    })
                end
            end, function(data, menu)
                menu.close()
            end)
        end
    end)
end

Spullenopbergen = function()
    local ped = GetPlayerPed(-1)


    local Playerdata = ESX.GetPlayerData()
    local inv = {}
    for k,v in pairs(Playerdata.loadout) do 
        table.insert(inv, {
            itemname = v.name ,
            label = v.label .. " | " .. v.ammo,
            ammo = v.ammo,
            type = "weapon"
        })
    end

    for k,v in pairs(Playerdata.inventory) do 
        if v.count > 0 then 
            table.insert(inv, {
                itemname = v.name,
                count = v.count,
                label = v.label .. " | " .. v.count,
                type = "item"
            })
        end
    end
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mn-policejob-2', {
        title = "Inbeslagname",
        align = "top-left",
        elements = inv
    }, function(data, menu)

        if data.current.type == "item" then 
            dialog(function(x)
                TriggerServerEvent("mn-policejob:server:dropinbeslagname", data.current, x)
            end)
            menu.close()
        else
            TriggerServerEvent("mn-policejob:server:dropinbeslagname", data.current)
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end

----------------------- Objecten ------------------



Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
		if Playerjob ~= nil and Playerjob.name == MN.Policejob then
			if removeObject == true and not removingObject then
				ESX.ShowHelpNotification('Druk op ~INPUT_CONTEXT~ om dit object te verwijderen')
				if IsControlJustReleased(0, 38) then
					removingObject = true
					TriggerEvent('dp:startEmote', 'pickup')
					Wait(750) -- Wacht op animatie
					DeleteEntity(objectToRemove)
					TriggerEvent('dp:cancelEmote')
					removingObject = false
				end
			end
		else
			Citizen.Wait(1000)
		end
	end
end)

trackedObjects = {
    'prop_roadcone02a',
    'prop_mp_barrier_02b',
    'prop_gazebo_02'
}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if Playerjob ~= nil and Playerjob.name == MN.Policejob then
			local ped = PlayerPedId()
			local coords = GetEntityCoords(ped)
			removeObject = false
			if not removingObject then
                for i=1, #trackedObjects, 1 do
                    local object = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, GetHashKey(trackedObjects[i]), false, false, false)
					if DoesEntityExist(object) and not IsEntityDead(ped) and not IsPedInAnyVehicle(ped, true) then
						objectToRemove = object
						local objCoords = GetEntityCoords(object)
						local distance  = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, objCoords.x, objCoords.y, objCoords.z, true)
						if distance < 1.5 then
							removeObject = true
						end
					end
				end
			end
		else
			Citizen.Wait(1000)
		end
	end
end)


----------------------- Vingerafruk systeem -----------

RegisterNetEvent("mn-policejob-client-Vingerafdruk")
AddEventHandler("mn-policejob-client-Vingerafdruk", function()
    TriggerServerEvent("mn-policejob-server-Vingerafdruk", 1)
    local close , distance = ESX.Game.GetClosestPlayer()
    if close == -1 or distance > 3 then
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Zorg dat er een Politie agent in de buurt is!"
        })
    else 
        FreezeEntityPosition(GetPlayerPed(-1), true)
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "info",
            ['message'] = "Vinger afdruk afnemen.."
        })
        Citizen.Wait(5000)
        local cop = GetPlayerServerId(close)
        TriggerServerEvent("mn-policejob-server-Vingerafdruk", cop)
        FreezeEntityPosition(GetPlayerPed(-1), false)
    end
end)

---------------------- Aangifte Systeem ---------------

RegisterNetEvent("mn-policejob-client-openaangifte")
AddEventHandler("mn-policejob-client-openaangifte", function()
    ESX.TriggerServerCallback("mn-policejob-server-aangiftesophalen", function(data, sn)
        steamnaam = sn
        currentaangiftedata = data
        SetNuiFocus(true,true)
        SendNUIMessage({
            action = "Aangifteopen",
            aangiftes = data,
            steamnaam = sn
        })
    end)
end)

RegisterNetEvent("mn-policejob-client-maakaangifte")
AddEventHandler("mn-policejob-client-maakaangifte", function()
    SetNuiFocus(true,true)
    SendNUIMessage({
        action = "maakaangifte",
        steamnaam = sn
    })
end)

RegisterNUICallback("Bekijkaangifte", function(data)
    local id = data.id
    local info = GetAangifteinfo(id)
    if info ~= "niks" then 
        SendNUIMessage({
            action = "bekijkaangifte",
            data = info,
            steamnaam = steamnaam
        })
    end
end)

RegisterNUICallback("maakaangifte", function(data)
    SetNuiFocus(false,false)
    exports["skeexsNotify"]:TriggerNotification({
        ['type'] = "info",
        ['message'] = "Uw aangifte is succesvol opgenomen!"
    })
    TriggerServerEvent(data.serverevent, data)
end)

RegisterNUICallback("Deleteaangifte", function(data)
    local id = data.id
    SetNuiFocus(false,false)
    TriggerServerEvent(data.serverevent, id)
end)


GetAangifteinfo = function(id)
    for k,v in pairs(currentaangiftedata) do 
        if v.id == id then 
            return v
        end
    end
    return "niks"
end




----------------------- Inbeslagname Voertuig ------------------



RegisterNetEvent("mn-policejob-client-Bekijkinbeslagname")
AddEventHandler("mn-policejob-client-Bekijkinbeslagname", function()
    ESX.TriggerServerCallback("mn-policejob:server:Voertuigeninbeslag", function(data)
        local inv = {}
        for k,v in pairs(data) do 
            table.insert(inv, {
                label = GetDisplayNameFromVehicleModel(v.vehicle.model) .. " | " .. v.plate,
                kenteken = v.plate,
                identifier = v.owner,
                model = GetDisplayNameFromVehicleModel(v.vehicle.model),
                voertuigmods = v.vehicle,
                reden = v.reden
            })
        end
        ESX.UI.Menu.CloseAll()
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'warehouse_laptop', {
            title = "Inbeslagname",
            align = "top-right",
            elements = inv
        }, function(data, menu)
            ShowCarInfo(data.current)
        end, function(data, menu)
            menu.close()
        end)
    end)
end)


ShowCarInfo = function(x)
    ESX.TriggerServerCallback("mn-policejob:server:getvehowner", function(name)
        ESX.UI.Menu.CloseAll()
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'warehouse_laptop', {
            title = "Inbeslagname " .. x.model,
            align = "top-right",
            elements = {
                {label = "Model: " .. x.model, functie = "niks"},
                {label = "Eigenaar: " .. name, functie = "niks"},
                {label = "Kenteken: " .. x.kenteken, functie = "niks"},
                {label = "Reden: " .. x.reden, functie = "niks"},
                {label = "Voertuig Terug geven", functie = "mn-policejob:server:givecarback", info = x},
        }}, function(data, menu)
            if data.current.functie ~= "niks" then
                local v = MN.InbeslagnameVoertuigspawn
                if ESX.Game.IsSpawnPointClear(vector3(v.x,v.y,v.z), 5) then
                    TriggerServerEvent(data.current.functie, x)
                    ESX.Game.SpawnVehicle(x.model, vector3(v.x,v.y,v.z), v.h, function(veh)
                        ESX.Game.SetVehicleProperties(veh, x.voertuigmods)
                        TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                    end)
                    menu.close()
                else
                    exports["skeexsNotify"]:TriggerNotification({
                        ['type'] = "error",
                        ['message'] = "De Spawnlocatie is gehinderd!"
                    })
                end
            end
        end, function(data, menu)
            menu.close()
        end)
    end, x.identifier)
end

----------------------- F6 Menu -----------------------

isEscorting = false

local DragStatus              = {}
DragStatus.IsDragged          = false

Citizen.CreateThread(function()
    while true do 
        Wait(0)
        while Playerjob == nil do Wait(500) end 

        if Playerjob.name == MN.Policejob then 
            if IsControlJustReleased(0, 167) then 
                OpenF6Menu()
            end
            if IsControlJustReleased(0, 56) then 
                OpenNoodknop()
            end
        end
    end
end)


OpenF6Menu = function()
    local inhoud = {
        {label = "Burger interacties", actie = "burgerinteractie"},
        {label = "Voertuig interacties", actie = "voertuiginteractie"},
        {label = "Object Spawner", actie = "objectspawner"},
        {label = "APK/WOK", actie = "apkkeuring"},
    }

    local burgerinteracties = {
        {label = "ID Vragen", actie = "idkaart-vragen", trigger = "mn-policejob-client-vraagidkaart"},
        {label = "Rijbewijs Vragen", actie = "rijbewijs-vragen", trigger = "mn-policejob-client-vraagrijbewijs"},
        {label = "Licht fouilleren", actie = "lichte-fouilleren", trigger = "mn-policejob-client-fouilleren-licht"},
        {label = "Zwaar fouilleren", actie = "zwaar-fouilleren", trigger = "mn-policejob-client-fouilleren-zwaar"},
        {label = "Handboeien", actie = "handboeien", trigger = "mn-policejob:client:boeien"},
        --{label = "Drugs Test", actie = "drugs", trigger = "mn-policejob:client:drugstest"}, 
        --{label = "Alcohol Controle", actie = "alcohol"}, Soon
        {label = "Persoon dragen", actie = "spelermeenemen", trigger = "mn-policejob:client:dragplayer"},
        {label = "Persoon in voertuig zetten", actie = "invoertuig", trigger = "mn-policejob:client:pedintoVeh"},
        {label = "Haal persoon uit auto", actie = "uitauto", trigger = "mn-policejob:client:outofVeh"},
        {label = "Persoon omhoog helpen", actie = "uitauto", trigger = "mn-policejob:client:revive"},
        {label = "Proces verbaal opmaken", actie = "boetes", trigger = "mn-policejob:client:bekeurpersoon"},
        {label = "Gevangenis menu", actie = "gevangenis", trigger = "mn-policejob:client:jail"},
    }

    local apkkeuring = { 
        {label = "Check APK keuring",      trigger = 'CheckWokStatus'},
        {label = "Check WOK status",      trigger = 'CheckAPKKeuring'},
    }

    local voertuiginteracties = {
        {label = "Eigenaar opvragen", trigger = "mn-policejob-client-voertuigopvragen"},
        {label = "Voertuig openbreken", trigger = "mn-policejob-client-breakopenvehicle"},
        {label = "Voertuig bekeuren", trigger = "mn-policejob-client-finevehicle"},
        {label = "Voertuig In beslag nemen", trigger = "mn-policejob-client-inbeslagnemenvoertuig"},
    }

    local objectspawner = {
        {label = "Bekijk - Beschikbare Objecten", trigger = "mn-policejob:client:obj"},
    }
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'warehouse_laptop', {
        title = MN.Servernaam .. " Politie",
        align = "top-right",
        elements = inhoud
    }, function(data, menu)
        local actie = data.current.actie 

        if actie == "burgerinteractie" then 
            ESX.UI.Menu.CloseAll()
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'warehouse_laptop', {
                title = "Burger interacties",
                align = "top-right",
                elements = burgerinteracties
            }, function(data, menu)
                TriggerEvent(data.current.trigger)
            end, function(data, menu)
                menu.close()
            end)
        elseif actie == "voertuiginteractie" then 
            ESX.UI.Menu.CloseAll()
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'warehouse_laptop', {
                title = "Burger interacties",
                align = "top-right",
                elements = voertuiginteracties
            }, function(data, menu)
                TriggerEvent(data.current.trigger)
            end, function(data, menu)
                menu.close()
            end)
        elseif actie == "objectspawner" then 
            ESX.UI.Menu.CloseAll()
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'warehouse_laptop', {
                title = "Object - Menu",
                align = "top-right",
                elements = objectspawner
            }, function(data, menu)
                TriggerEvent(data.current.trigger)
            end, function(data, menu)
                menu.close()
            end) 
        elseif actie == "apkkeuring" then 
            ESX.UI.Menu.CloseAll()
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'warehouse_laptop', {
                title = "Object - Menu",
                align = "top-right",
                elements = apkkeuring
            }, function(data, menu)
                TriggerEvent(data.current.trigger)
            end, function(data, menu)
                menu.close()
            end)
        end
    end, function(data, menu)
        menu.close()
    end)
end


RegisterNetEvent('mn-policejob:client:obj')
AddEventHandler('mn-policejob:client:obj', function()
    local ped = PlayerPedId()
	ESX.UI.Menu.CloseAll()
    local elements = {}
    for k,v in pairs(MN.Objects) do 
        table.insert(elements, v)
    end
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'policejob', {
        title    = 'Objecten:',
        align    = 'top-right',
        elements = elements
    }, function(data2, menu2)
        local forward = GetEntityForwardVector(ped)
        local x, y, z = table.unpack(GetEntityCoords(ped)+forward*1.0)
        TriggerEvent('dp:startEmote', 'pickup')
        Wait(750)
        TriggerEvent('dp:cancelEmote')
        ESX.Game.SpawnObject(data2.current.value, {
            x = x, y = y, z = z
        }, function(obj)
            SetEntityHeading(obj, GetEntityHeading(ped))
            PlaceObjectOnGroundProperly(obj)
            if data2.current.value == 'prop_ld_case_01' then
                SetEntityRotation(obj, 270.0, 0.0, 270.0, true)
            end
        end)
    end, function(data2, menu2)
        menu2.close()
    end)
end)

RegisterNetEvent("mn-policejob:client:pedintoVeh")
AddEventHandler("mn-policejob:client:pedintoVeh", function()
    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()
    if closestPlayerDistance < 2.5 then
        TriggerServerEvent("mn-policejob:client:pedintoVeh", GetPlayerServerId(closestPlayer))
    else
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Er is niemand bij je in de buurt"
        })
    end
end)

RegisterNetEvent("mn-policejob:client:revive")
AddEventHandler("mn-policejob:client:revive", function()
    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()
    if closestPlayerDistance < 2.5 and closestPlayerDistance ~= -1 then
        TriggerServerEvent("mn-policejob:server:revive", GetPlayerServerId(closestPlayer))
    else
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Er is niemand bij je in de buurt"
        })
    end
end)

RegisterNetEvent("mn-policejob:client:outofVeh")
AddEventHandler("mn-policejob:client:outofVeh", function()
    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()
    if closestPlayerDistance < 2.5 then
        TriggerServerEvent("mn-policejob:server:outofVeh", GetPlayerServerId(closestPlayer))
    else
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Er is niemand bij je in de buurt"
        })
    end
end)

RegisterNetEvent("mn-policejob:outofVeh")
AddEventHandler("mn-policejob:outofVeh", function()
    local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)


RegisterNetEvent("mn-policejob:pedintoVehFull")
AddEventHandler("mn-policejob:pedintoVehFull", function()
    if not isHandcuffed then 
        return 
    end
    local vehicle = GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), 5.0, 0, 71)
    if DoesEntityExist(vehicle) then 
        local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

        for i=maxSeats - 1, 0, -1 do
            if IsVehicleSeatFree(vehicle, i) then
                freeSeat = i
                break
            end
        end

        if freeSeat then
            TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, freeSeat)
            DragStatus.IsDragged  = false
        end
    end
end)


RegisterNetEvent("mn-policejob:client:jail")
AddEventHandler("mn-policejob:client:jail", function()
    TriggerEvent("esx-qalle-jail:openJailMenu")
end)

RegisterNetEvent("mn-policejob:client:bekeurpersoon")
AddEventHandler("mn-policejob:client:bekeurpersoon", function()
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fine', {
            title    = _U('fine'),
            align    = 'bottom-right',
            elements = {
                {label = _U('traffic_offense'), value = 0},
                {label = _U('minor_offense'),   value = 1},
                {label = _U('average_offense'), value = 2},
                {label = _U('major_offense'),   value = 3},
                {label = _U('handhaving'),      value = 4}
        }}, function(data, menu)
            OpenFineCategoryMenu(player, data.current.value)
        end, function(data, menu)
            menu.close()
        end)
end)

RegisterNUICallback("MaakProcesVerbaal", function(data)
    local label, type = data.label, data.type
    SetNuiFocus(false, false)

    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()


    if closestPlayer == -1 or closestPlayerDistance > 3.0 then
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Er is niemand bij je in de buurt"
        })
    else
        GetBoete(function(boete)
            if boete ~= nil then
                TriggerServerEvent("mn-policejob:server:procesverbaal", boete, GetPlayerServerId(closestPlayer))
            end
        end, label,type)
    end
end)

GetBoete = function(callback, label, type)
    for k,v in pairs(MN.Boetes[type]) do 
        if v.label == label then 
            callback(v)
        end
    end
end

RegisterNetEvent("mn-policejob:client:dragplayer")
AddEventHandler("mn-policejob:client:dragplayer", function()
    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()


    if closestPlayer == -1 or closestPlayerDistance > 3.0 then
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Er is niemand bij je in de buurt"
        })
    else
        if not isHandcuffed then
            local ply = GetPlayerServerId(closestPlayer)
            TriggerServerEvent("mn-policejob:server:escort", ply)
            dragging()
        else
            exports["skeexsNotify"]:TriggerNotification({
                ['type'] = "error",
                ['message'] = "Je bent zelf geboeit..."
            })
        end
    end
end)

dragging = function()
    while true do
        Citizen.Wait(5)
        if isHandcuffed or IsEntityPlayingAnim(PlayerPedId(), "missfinale_c1@", "lying_dead_player0", 3) then
            playerPed = GetPlayerPed(-1)

            if DragStatus.IsDragged then
                targetPed = GetPlayerPed(GetPlayerFromServerId(DragStatus.CopId))

                if not IsPedSittingInAnyVehicle(targetPed) then
                    AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                else
                    AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                end

            else
                DetachEntity(playerPed, true, false)
                return
            end
        end
    end
end

RegisterNetEvent('mn-policejob:client:escortfull')
AddEventHandler('mn-policejob:client:escortfull', function(copID)
    ESX.TriggerServerCallback('esx_ambulancejob:getDeathStatus', function(IsDead) 
        if not isHandcuffed and not IsDead then
            return
        end

        DragStatus.IsDragged = not DragStatus.IsDragged
        DragStatus.CopId     = copID
        dragging()
    end)
end)


RegisterNetEvent("mn-policejob-client-inbeslagnemenvoertuig")
AddEventHandler("mn-policejob-client-inbeslagnemenvoertuig", function()
    local veh = ESX.Game.GetVehicleInDirection()
    if DoesEntityExist(veh) then 
        local vehdata = ESX.Game.GetVehicleProperties(veh)
        currentvehdata = vehdata
        local hash = GetEntityModel(veh)
        local model = GetDisplayNameFromVehicleModel(hash)
        ESX.TriggerServerCallback("mn-policejob:server:GetVehicleOwner", function(data) 
            if data[1] ~= nil then 
                SetNuiFocus(true,true)
                SendNUIMessage({
                    action = "inbeslagnamevoertuig",
                    model = model,
                    plate = vehdata.plate,
                    naam = data[1].firstname .. " " .. data[1].lastname,
                    owner = data[1].identifier
                })
            else
                SetNuiFocus(true,true)
                SendNUIMessage({
                    action = "inbeslagnamevoertuig",
                    model = model,
                    plate = vehdata.plate,
                    naam = "NIET GEVONDEN"
                })
            end
        end, vehdata.plate)
    else
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Zorg dat je voor een voertuig staat!"
        })
    end
end)


RegisterNUICallback("voertuiginbeslagname", function(data)
    SetNuiFocus(false,false)
    local veh = ESX.Game.GetVehicleInDirection()
    ESX.Game.DeleteVehicle(veh)
    if data.owner ~= nil then 
        TriggerServerEvent(data.event, data, currentvehdata)
    end
end)

RegisterNetEvent("mn-policejob-client-vraagidkaart")
AddEventHandler("mn-policejob-client-vraagidkaart", function()
    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()


    if closestPlayer == -1 or closestPlayerDistance > 3.0 then
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Zorg dat er een speler in de buurt staat!"
        })
    else
        local ply = GetPlayerServerId(closestPlayer)
        TriggerServerEvent('mn-policejob-server-vraagidkaart', ply)
    end
end)



RegisterNetEvent("mn-policejob-client-voertuigopvragen")
AddEventHandler("mn-policejob-client-voertuigopvragen", function()
    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
    local car = ESX.Game.GetVehicleInDirection()
    local hash = GetEntityModel(car)
    local model = GetDisplayNameFromVehicleModel(hash)

    if DoesEntityExist(car) then 
        local plate = ESX.Game.GetVehicleProperties(car).plate 
        ESX.TriggerServerCallback("mn-policejob:server:GetVehicleOwner", function(data)
            if data[1] ~= nil then 
                exports["skeexsNotify"]:TriggerNotification({
                    ['type'] = "error",
                    ['message'] = "Voertuig info: </br> Eigenaar: " .. data[1].firstname .. " "..  data[1].lastname .." </br> Model: " .. model .. "</br> Kenteken: " .. plate
                })
            else
                exports["skeexsNotify"]:TriggerNotification({
                    ['type'] = "error",
                    ['message'] = "Voertuig info: </br> Eigenaar: NIET GEVONDEN </br> Model: " .. model .. "</br> Kenteken: " .. plate
                })
            end
        end, plate)
    else
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Zorg dat er een voertuig in de buurt staat"
        })
    end
end)


RegisterNetEvent("mn-policejob-client-breakopenvehicle")
AddEventHandler("mn-policejob-client-breakopenvehicle", function()
    local car = ESX.Game.GetVehicleInDirection()

    if DoesEntityExist(car) then
        TaskStartScenarioInPlace(GetPlayerPed(-1), 'WORLD_HUMAN_WELDING', 0, true)
        Citizen.Wait(20000)
        ClearPedTasksImmediately(GetPlayerPed(-1))

        SetVehicleDoorsLocked(car, 1)
        SetVehicleDoorsLockedForAllPlayers(car, false)
    else
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Zorg dat er een voertuig in de buurt staat"
        })
    end
end)


RegisterNetEvent("mn-policejob-client-finevehicle")
AddEventHandler("mn-policejob-client-finevehicle", function()
    local car = ESX.Game.GetVehicleInDirection()
    local plate = ESX.Game.GetVehicleProperties(car).plate 
    if DoesEntityExist(car) then
        ESX.TriggerServerCallback("mn-policejob:server:GetVehicleOwner", function(data)
            if data[1] ~= nil then 
                menu(function(x)
                    TriggerServerEvent("mn-policejob:server:bekeurvoertuig", plate, data[1].identifier, x.label, x.prijs)
                end, MN.Verkeersboetes, "Voertuig bekeuren")
            else
                exports["skeexsNotify"]:TriggerNotification({
                    ['type'] = "error",
                    ['message'] = "Dit voertuig staat niet geregistreerd"
                })
            end
        end, plate)
    else
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Zorg dat er een voertuig in de buurt staat"
        })
    end
end)


RegisterNetEvent("mn-policejob-client-vraagrijbewijs")
AddEventHandler("mn-policejob-client-vraagrijbewijs", function()
    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()


    if closestPlayer == -1 or closestPlayerDistance > 3.0 then
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Er staat niemand bij je in de buurt"
        })
    else
        local ply = GetPlayerServerId(closestPlayer)
        TriggerServerEvent('mn-policejob:server:rijbewijs', ply)
    end
end)


RegisterNetEvent("mn-policejob-client-fouilleren-licht")
AddEventHandler("mn-policejob-client-fouilleren-licht", function()
    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()


    if closestPlayer == -1 or closestPlayerDistance > 3.0 then 
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Er staat niemand bij je in de buurt"
        })
    else
        ESX.TriggerServerCallback("mn-policejob:server:GetPlayerInventory", function(data)
            menu(function(x)
                if x ~= nil then
                    dialog(function(i)
                        TriggerServerEvent("mn-policejob:server:pakitemaf", x, i, GetPlayerServerId(closestPlayer))
                    end)
                end
            end, data, "Lichte Fouillering")
        end, "licht", GetPlayerServerId(closestPlayer))
    end
end)

RegisterNetEvent("mn-policejob-client-fouilleren-zwaar")
AddEventHandler("mn-policejob-client-fouilleren-zwaar", function()
    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()


    if closestPlayer == -1 or closestPlayerDistance > 3.0 then 
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Er staat niemand bij je in de buurt"
        })
    else
        ESX.TriggerServerCallback("mn-policejob:server:GetPlayerInventory", function(data)
            menu(function(x)
                if x ~= nil then
                    if x.type == "weapon" then
                        TriggerServerEvent("mn-policejob:server:pakwapenaf", x, GetPlayerServerId(closestPlayer))
                    else
                        dialog(function(i)
                            TriggerServerEvent("mn-policejob:server:pakitemaf", x, i, GetPlayerServerId(closestPlayer))
                        end)
                    end
                end
            end, data, "Zware Fouillering")
        end, "zwaar", GetPlayerServerId(closestPlayer))
    end
end)



RegisterNetEvent("mn-policejob:client:boeien")
AddEventHandler("mn-policejob:client:boeien", function()
    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()


    if closestPlayer == -1 or closestPlayerDistance > 3.0 then
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Er staat niemand bij je in de buurt"
        })
    else
        if not isHandcuffed then
            local ply = GetPlayerServerId(closestPlayer)
            TriggerServerEvent("mn-policejob:client:CuffPlayer", ply)
        else
            exports["skeexsNotify"]:TriggerNotification({
                ['type'] = "error",
                ['message'] = "Je bent zelf geboeit..."
            })
        end
    end
end)

RegisterNetEvent("mn-policejob:client:handcuffanim")
AddEventHandler("mn-policejob:client:handcuffanim", function()
    HandCuffAnimation()
end)

RegisterNetEvent('mn-policejob:client:GetCuffed')
AddEventHandler('mn-policejob:client:GetCuffed', function(playerId)
    if not isHandcuffed then
        isHandcuffed = true
        TriggerServerEvent("mn-policejob:server:SetHandcuffStatus", true)
        ClearPedTasksImmediately(GetPlayerPed(-1))
        cuffType = 16
        GetCuffedAnimation(playerId)
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Je bent geboeid..."
        })
        Cuffed()
    else
        isHandcuffed = false
        isEscorted = false
        TriggerEvent('hospital:client:isEscorted', isEscorted)
        DetachEntity(GetPlayerPed(-1), true, false)
        TriggerServerEvent("mn-policejob:server:SetHandcuffStatus", false)
        ClearPedTasksImmediately(GetPlayerPed(-1))
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Je bent ontboeid..."
        })
    end
end)


function HandCuffAnimation()
    RequestAnimDict("mp_arrest_paired")
	Citizen.Wait(100)
    TaskPlayAnim(GetPlayerPed(-1), "mp_arrest_paired", "cop_p2_back_right", 3.0, 3.0, -1, 48, 0, 0, 0, 0)
	Citizen.Wait(3500)
    TaskPlayAnim(GetPlayerPed(-1), "mp_arrest_paired", "exit", 3.0, 3.0, -1, 48, 0, 0, 0, 0)
end


function GetCuffedAnimation(playerId)
    local cuffer = GetPlayerPed(GetPlayerFromServerId(playerId))
    local heading = GetEntityHeading(cuffer)
    RequestAnimDict("mp_arrest_paired")
    SetEntityCoords(GetPlayerPed(-1), GetOffsetFromEntityInWorldCoords(cuffer, 0.0, 0.45, 0.0))
	Citizen.Wait(100)
	SetEntityHeading(GetPlayerPed(-1), heading)
	TaskPlayAnim(GetPlayerPed(-1), "mp_arrest_paired", "crook_p2_back_right", 3.0, 3.0, -1, 32, 0, 0, 0, 0)
	Citizen.Wait(2500)
end


--[[RegisterNetEvent("mn-policejob:client:drugstest")
AddEventHandler("mn-policejob:client:drugstest", function()
    local closestPlayer, closestPlayerDistance = ESX.Game.GetClosestPlayer()
    print("test")
    TriggerServerEvent("mn-policejob:server:drugstest", GetPlayerServerId(GetPlayerPed(-1)))
    if closestPlayer == -1 or closestPlayerDistance > 3.0 then
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Er staat niemand bij je in de buurt"
        })
    else
        TriggerServerEvent("mn-policejob:server:drugstest", GetPlayerServerId(closestPlayer))
    end
end)]]

--[[RegisterNetEvent("mn-policejob:client:ontvangdrugstest")
AddEventHandler("mn-policejob:client:ontvangdrugstest", function(cop)
    TriggerServerEvent("mn-policejob:server:ontvangdrugstest", cop, drugs)
end)]]

menu = function(callback, data, titel)
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'policejob', {
        title = titel,
        align = "top-right",
        elements = data
    }, function(data, menu)
        menu.close()
        callback(data.current)
    end, function(data, menu)
        menu.close()
        callback(nil)
    end)
end


----------------------- Noodknop -----------------------

noodknopdata = {
    {label = "Politie Locatie versturen", trigger = "mn-policejob:server:locatieversturen", job = "police", color = 26, melding = "Politie Locatie"},
    {label = "Politie Noodknop versturen", trigger = "mn-policejob:server:locatieversturen", job = "police", color = 1, melding = "Politie Noodknop"},
    {label = "Ambulance Locatie versturen", trigger = "mn-policejob:server:locatieversturen", job = "police" , color = 70, melding = "Ambulance versterking"},
    {label = "ANWB Locatie versturen", trigger = "mn-policejob:server:locatieversturen", job = "mechanic", color = 46, melding = "ANWB versterking"},
    {label = "Nood melding naar alle hulpdiensten", trigger = "mn-policejob:server:locatieversturen", job = "alles", color = 34, melding = "Noodknop alle hulpdiensten"},
}


OpenNoodknop = function()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'policejob', {
        title = "Nood / Locatie knop",
        align = "top-right",
        elements = noodknopdata
    }, function(data, menu)
        TriggerServerEvent(data.current.trigger, data.current.color, data.current.job, data.current.melding)
        menu.close()    
    end, function(data, menu)
        menu.close()
    end)
end


RegisterNetEvent("mn-policejob:client:locatieversturen")
AddEventHandler("mn-policejob:client:locatieversturen", function(color, melding)
    if DoesBlipExist(noodknop) then
        RemoveBlip(noodknop) 

        noodknop = AddBlipForCoord(GetEntityCoords(GetPlayerPed(-1)))
        SetBlipSprite(noodknop, 161)
        SetBlipScale(noodknop, 2.0)
        SetBlipColour(noodknop, color)
        PulseBlip(noodknop)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(melding)
        EndTextCommandSetBlipName(noodknop)
    
        Wait(60000)
        RemoveBlip(noodknop)
    else
        noodknop = AddBlipForCoord(GetEntityCoords(GetPlayerPed(-1)))
        SetBlipSprite(noodknop, 161)
        SetBlipScale(noodknop, 2.0)
        SetBlipColour(noodknop, color)
        PulseBlip(noodknop)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(melding)
        EndTextCommandSetBlipName(noodknop)
    
        Wait(60000)
        RemoveBlip(noodknop)
    end
end)


----------------------- Garage ------------------------


Citizen.CreateThread(function() -- Garage Thread
    while true do 
        Wait(0)
        local ped = GetPlayerPed(-1)
        local coords = GetEntityCoords(ped)
        while Playerjob == nil do Wait(500) end
        slapen = true
        for k,v in pairs(MN.Garages) do 
            if Playerjob.name == v.job then 
                local dist = GetDistanceBetweenCoords(coords, v.loc.x, v.loc.y , v.loc.z, true)
                if dist < 10 then 
                    slapen = false
                    DrawMarker(20,v.loc.x, v.loc.y, v.loc.z - 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.3, 0.2, 65,105,225, 100, false, true, 2, true, nil, nil, false)
                    if dist < 3 then 
                        if not IsPedInAnyVehicle(ped, true) then
                            current = k 
                            currentjob = v.job
                            DrawScriptText(vector3(v.loc.x, v.loc.y, v.loc.z), "~b~E ~w~· Garage Openen") 
                            if IsControlJustReleased(0, 38) then 
                                OpenMenu(v.type)
                            end
                        end
                    end
                end
                local deldist = GetDistanceBetweenCoords(coords, v.deleter.x, v.deleter.y , v.deleter.z, true)
                if deldist < 10 then 
                    slapen = false
                    DrawMarker(20,v.deleter.x, v.deleter.y , v.deleter.z - 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.3, 0.2, 65,105,225, 100, false, true, 2, true, nil, nil, false)
                    if deldist < 3 then 
                        if IsPedInAnyVehicle(ped, true) then
                            DrawScriptText(vector3(v.deleter.x, v.deleter.y , v.deleter.z), "~b~E ~w~· Voertuig Opbergen") 
                            if IsControlJustReleased(0, 38) then 
                                ESX.Game.DeleteVehicle(GetVehiclePedIsIn(ped, false))
                                exports["skeexsNotify"]:TriggerNotification({
                                    ['type'] = "success",
                                    ['message'] = "Voertuig succesvol weggezet"
                                })
                            end
                        end
                    end
                end
            end
        end
        if slapen then 
            Wait(500)
        end
    end
end)

OpenMenu = function(type) -- Garage Menu
    elements = {}
    for k,v in pairs(MN.Voertuigen[currentjob]) do 
        if type == v.type then 
            table.insert(elements, {
                label = v.label, 
                model = v.model
            })
        end
    end
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mn-garage', {
        title = MN.Garages[current].label,
        align = "top-left",
        elements = elements
    }, function(data, menu)
        local action = data.current.value
        local model = data.current.model
        if IsModelValid(model) then 
            if type == "boat" then 
                ESX.Game.SpawnVehicle(model, vector3(MN.Garages[current].deleter.x,MN.Garages[current].deleter.y, MN.Garages[current].deleter.z), MN.Garages[current].deleter.h, function(veh) 
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                end)
                menu.close()
                exports["skeexsNotify"]:TriggerNotification({
                    ['type'] = "success",
                    ['message'] = model .. " Succesvol gespawnd"
                })
            else
                ESX.Game.SpawnVehicle(model, vector3(MN.Garages[current].loc.x,MN.Garages[current].loc.y, MN.Garages[current].loc.z), MN.Garages[current].loc.h, function(veh) 
                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                end)
                menu.close()
                exports["skeexsNotify"]:TriggerNotification({
                    ['type'] = "success",
                    ['message'] = model .. " Succesvol gespawnd"
                })
            end
        else
            ESX.ShowNotification("~r~ Dit voertuig bestaat niet contacteer een Admin")
        end 
    end, function(data, menu)
        menu.close()
    end)
end

---------------------- Kleding kamer -----------------------------


RegisterNetEvent("mn-policejob-client-Kleedkamer")
AddEventHandler("mn-policejob-client-Kleedkamer", function()
    GetKledingOutfits(function(x)
        if x[1] ~= nil then 
            SendNUIMessage({
                action = "Kledingkamer",
                kleding = MN.Kledingkast
            })
            SetNuiFocus(true,true)
        end
    end)
end)


GetKledingOutfits = function(callback)
    local kleding = {}
    for k,v in pairs(MN.Kledingkast) do 
        table.insert(kleding, {
            titel = v.title,
            kleding = v
        })
    end
    callback(kleding)
end


RegisterNUICallback("TrekOutfitaan", function(x)
    SetNuiFocus(false,false)
    if x.id ~= "default_outje" then
        local outfit = GetChosenOutfit(x.id)
        TriggerEvent('skinchanger:getSkin', function(skin)
            if skin.sex == 0 then 
                TriggerEvent('skinchanger:loadClothes', skin, outfit.male)
            else
                TriggerEvent('skinchanger:loadClothes', skin, outfit.female)
            end
        end)
    else
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)
    end
end)


GetChosenOutfit = function(x)
    for k,v in pairs(MN.Kledingkast) do 
        if k == x then 
            return v
        end
    end
    return nil
end

---------------------- DrawScriptText ----------------------------

function DrawScriptText(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords["x"], coords["y"], coords["z"])

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)

    local factor = string.len(text) / 370

    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 65)
end



---------------------- Drugs Systeem -------------------------


RegisterNetEvent("mn-policejob:client:neemdrugs")
AddEventHandler("mn-policejob:client:neemdrugs", function(x)
    if (drugs + x.effectiveness > 100) then 
        drugs = 100 
    else
        drugs = drugs + x.effectiveness
    end
end)



RegisterNetEvent("mn-policejob:client:neemalcohol")
AddEventHandler("mn-policejob:client:neemalcohol", function(x)
    if (alcohol + x.effectiveness > 100) then 
        alcohol = 100 
    else
        alcohol = alcohol + x.effectiveness
    end
end)


Citizen.CreateThread(function()
    while true do 
        if drugs > 0 then 
            if drugs - MN.DrugsInterval <= 0 then 
                drugs = 0 
                AnimpostfxStopAll()
            else
                if drugs > 25 then
                    AnimpostfxPlay('Dont_tazeme_bro', 0, true)
                end
                if drugs > 50 then
                    AnimpostfxPlay('PeyoteEndOut', 0, true)
                end  
                drugs = drugs - MN.DrugsInterval
            end
        end
        if alcohol > 0 then 
            if alcohol - MN.alcoholInterval <= 0 then 
                alcohol = 0 
                AnimpostfxStopAll()
            else
                if alcohol > 25 then
                    AnimpostfxPlay('Dont_tazeme_bro', 0, true)
                end
                if alcohol > 50 then
                    AnimpostfxPlay('PeyoteEndOut', 0, true)
                end  
                alcohol = alcohol - MN.DrugsInterval
            end
        end
        Wait(5000)
    end
end)


---------------------- Boss Actions --------------------------



RegisterNetEvent("mn-policejob-client-bossmenu")
AddEventHandler("mn-policejob-client-bossmenu", function()
    if Playerjob.grade_name == MN.Bossrank then 
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "bossmenu"
        })
    else
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "U bent hiervoor niet bevoegd"
        })
    end
end)

RegisterNUICallback("GetSafeAmount", function(data, callback)
    ESX.TriggerServerCallback("mn-policejob:server:getsafeAmount", function(x)
        callback(x)
    end)
end)

RegisterNUICallback("RemoveMoneyToSafe", function(data, callback)
    ESX.TriggerServerCallback("mn-policejob:server:RemoveMoneyFromSafe", function(x)
        callback(x)
    end, data.amount)
end)

RegisterNUICallback("AddMoneyToSafe", function(param, callback)
    ESX.TriggerServerCallback(param.serverevent, function(geld)
        callback(geld)
    end, param.amount)
end)


RegisterNUICallback("GetAllEmployees", function(param, callback)
    ESX.TriggerServerCallback("mn-policejob:server:GetAllEmployees", function(x)
        callback(x)
    end)
end)


RegisterNUICallback("GetEmployee", function(param, callback)
    ESX.TriggerServerCallback("mn-policejob:server:getEmployee", function(x)

        currentemployee = {
            identifier = x.identifier,
            dbId = x.id
        }
        callback(x)
    end, param.id)
end)


RegisterNUICallback("geefBonus", function(param)
    SetNuiFocus(false, false)
    if currentemployee ~= nil then 
        TriggerServerEvent("mn-policejob:server:giveBonus", currentemployee, param.amount)
    else
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Er is iets misgegaan! Contacteer mn#0810"
        })
    end
end)


RegisterNUICallback("OntslaPersoneel" , function()
    SetNuiFocus(false, false)
    if currentemployee ~= nil then 
        TriggerServerEvent("mn-policejob:server:FireEmployee", currentemployee)
    else
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Er is iets misgegaan! Contacteer mn#0810"
        })
    end
end)


RegisterNUICallback("GetJobGrades", function(param, callback)
    if JobGrades ~= nil then 
        callback(JobGrades)
    end
end)

RegisterNUICallback("SetPlayerGrade", function(param, callback)
    SetNuiFocus(false, false)
    local grade = param.grade
    if currentemployee ~= nil then 
        TriggerServerEvent("mn-policejob:server:SetPlayerJob", grade, currentemployee)
    else
        exports["skeexsNotify"]:TriggerNotification({
            ['type'] = "error",
            ['message'] = "Er is iets misgegaan! Contacteer mn#0810"
        })
    end
end)


RegisterNUICallback("NeemPersoonAan", function(id)
    SetNuiFocus(false, false)
    TriggerServerEvent("mn-policejob:server:NeemSpelerAan", id)
end)


RegisterNUICallback("GetPlayers", function(param,callback)
    ESX.TriggerServerCallback("mn-policejob:server:getAllPlayers", function(playa)
        callback(playa)
    end)
end)

---------------------- Utils ---------------------------------

dialog = function(cb)
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'price', {
        title = 'Hoeveelheid?'
    }, function(data2, menu)

        local price = tonumber(data2.value)
        if price == nil then
            menu.close()
        else
            menu.close()
            cb(price)
        end
    end, function(data2,menu)
        menu.close()
    end)
end

AddEventHandler("playerSpawned", function(spawn)
	SetCanAttackFriendly(GetPlayerPed(-1), true, false)
	NetworkSetFriendlyFireOption(true)
end)


----------------------- NUI ------------------------------


RegisterNUICallback("close", function()
    SetNuiFocus(false, false)
end)



----------------------- Anim --------------------------


function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end 

function openandDrop()
    loadAnimDict("pickup_object")
    TaskPlayAnim(PlayerPedId(),'pickup_object', 'putdown_low',5.0, 1.5, 1.0, 48, 0.0, 0, 0, 0)
    Wait(1000)
    ClearPedSecondaryTask(PlayerPedId())
end

Cuffed = function()
    while true do 
        Citizen.Wait(0)
        if isHandcuffed then 
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 263, true) -- Melee Attack 1

            DisableControlAction(0, Keys['R'], true) -- Reload
            DisableControlAction(0, Keys['SPACE'], true) -- Jump
            DisableControlAction(0, Keys['Q'], true) -- Cover
            DisableControlAction(0, Keys['TAB'], true) -- Select Weapon
            DisableControlAction(0, Keys['F'], true) -- Also 'enter'?

            DisableControlAction(0, 157, true) -- 1
            DisableControlAction(0, 158, true) -- 2
            DisableControlAction(0, 160, true) -- 3
            DisableControlAction(0, 164, true) -- 4
            DisableControlAction(0, 165, true) -- 5

            DisableControlAction(0, Keys['F1'], true) -- Disable phone
            DisableControlAction(0, Keys['F2'], true) -- Inventory
            DisableControlAction(0, Keys['F3'], true) -- Animations
            DisableControlAction(0, Keys['F6'], true) -- Job

            DisableControlAction(0, Keys['C'], true) -- Disable looking behind
            DisableControlAction(0, Keys['X'], true) -- Disable clearing animation
            DisableControlAction(2, Keys['P'], true) -- Disable pause screen

            DisableControlAction(0, 59, true) -- Disable steering in vehicle
            DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
            DisableControlAction(0, 72, true) -- Disable reversing in vehicle

            DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth

            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee
            DisableControlAction(0, 75, true)  -- Disable exit vehicle
            DisableControlAction(27, 75, true) -- Disable exit vehicle
            if IsEntityPlayingAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 3) ~= 1 and IsEntityPlayingAnim(GetPlayerPed(-1), "mp_arrest_paired", "crook_p2_back_right", 3) ~= 1 then
                LoadAnimationDictionary("mp_arresting")
                TaskPlayAnim(GetPlayerPed(-1), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
            end
        else
            return
        end
    end
end


function LoadAnimationDictionary(animationD) -- Simple way to load animation dictionaries to save lines.
    while(not HasAnimDictLoaded(animationD)) do
        RequestAnimDict(animationD)
        Citizen.Wait(10)
    end
end

