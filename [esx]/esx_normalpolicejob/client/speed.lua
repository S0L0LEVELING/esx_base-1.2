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