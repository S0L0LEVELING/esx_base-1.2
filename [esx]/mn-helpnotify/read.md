[mn-hulpnotify]


icons zijn te vinden op: https://fontawesome.com/v5.15/icons?d=gallery&p=2

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

exports: 

Open: 
    exports["mn-helpnotify"]:OpenNotify({
        icon = "fas fa-university",
        text = "[E] Open Bank",
        color = "#B33F40"
    })
Close : 
    exports["mn-helpnotify"]:CloseNotify()




----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Code Voorbeeld Single marker:


Citizen.CreateThread(function()
    while true do 
        Wait(0)
        local coords, ped = GetEntityCoords(GetPlayerPed(-1)), GetPlayerPed(-1)
        local dist = GetDistanceBetweenCoords(coords, 414.6677, -989.6602, 29.41808, true)

        if dist < 10 then 
            DrawMarker(20,414.6677, -989.6602, 29.41808 - 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.3, 0.2, 147,112,219, 100, false, true, 2, true, nil, nil, false)
            if dist < 1.5 then 
                exports["mn-helpnotify"]:OpenNotify({
                    icon = "fas fa-university",
                    text = "[E] Open Bank",
                    color = "#B33F40"
                })
                if IsControlJustReleased(0, 38) then 
                    print("Je hebt op E gedrukt")
                end
            else
                exports["mn-helpnotify"]:CloseNotify()
            end
        end
    end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Code Meerdere markers (for loop) 

Citizen.CreateThread(function()
    local alreadyEnteredZone = false
    while true do
        wait = 5
        local ped = PlayerPedId()
        local inZone = false
        for k,v in pairs(JS.Parkeerplaatsen) do
            local dist = #(GetEntityCoords(ped)-vector3(v.x, v.y, v.z))
            if dist <= 2 then
                wait = 5
                inZone  = true

                if IsControlJustReleased(0, 38) then
                    
                end
                break
            else
                wait = 2000
            end
        end
        
        if inZone and not alreadyEnteredZone then
            alreadyEnteredZone = true
            exports["mn-helpnotify"]:OpenNotify({
                icon = "fas fa-car-alt",
                text = "[E] Parkeren",
                color = "#29292b"
            })
        end

        if not inZone and alreadyEnteredZone then
            alreadyEnteredZone = false
            exports["mn-helpnotify"]:CloseNotify()
        end
        Citizen.Wait(wait)
    end
end)

-- Code ^  @codeSign

made by mn#0810 Founder of MN SCRIPTS