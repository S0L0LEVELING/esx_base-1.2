CurrentWeather = 'EXTRASUNNY'
local lastWeather = ''
local serverTime = 0
local clientTime = 0
local freezeTime = false
local blackout = false

SetBlackout(blackout)

RegisterNetEvent('es_wsync:updateWeather')
AddEventHandler('es_wsync:updateWeather', function(NewWeather, newblackout)
	if newblackout ~= blackout then
		SetBlackout(newblackout)
		blackout = newblackout
	end

	CurrentWeather = NewWeather
end)

function changeWeather(weather)
	if lastWeather == weather then
		return
	end

	SetWeatherTypeOverTime(weather, 15.0)
	local timer1 = GetGameTimer()

	-- strange, but 5 secs works best
	while (GetGameTimer()-timer1) < 4950 and (GetGameTimer() >= timer1) do
		Citizen.Wait(0)
	end

	SetOverrideWeather(weather)

	if CurrentWeather == 'XMAS' then
		SetForceVehicleTrails(true)
		SetForcePedFootstepsTracks(true)
	else
		SetForceVehicleTrails(false)
		SetForcePedFootstepsTracks(false)
	end

	lastWeather = weather
end

Citizen.CreateThread(function()
	while true do
		changeWeather(CurrentWeather)
		Citizen.Wait(100)
	end
end)

RegisterNetEvent('es_wsync:updateTime')
AddEventHandler('es_wsync:updateTime', function(base, offset, freeze)
	freezeTime = freeze
	serverTime = base+offset
end)

Citizen.CreateThread(function()
	local hour = 0
	local minute = 0
	local second = 0
	local timer = GetGameTimer()

	while true do
		Citizen.Wait(0)
		local newClientTime = clientTime
		local deltaTime = 0

		if GetGameTimer() > timer and not freezeTime then
			deltaTime = (GetGameTimer() - timer)/1000.0
			timer = GetGameTimer()
		end

		serverTime = serverTime + deltaTime

		-- instant change for large amounts of time
		if math.abs(serverTime - clientTime) > 10.0 then
			clientTime = serverTime
		end

		-- time adjust for small changes
		if clientTime > serverTime then
			clientTime = clientTime + deltaTime*0.5
		else
			clientTime = clientTime + deltaTime
		end

		-- x2 speedup for medium range changes
		if (clientTime < serverTime-1) then
			clientTime = clientTime + deltaTime
		end

		hour, minute, second = timeToHMS(clientTime)

		NetworkOverrideClockTime(hour, minute, second)
	end
end)

AddEventHandler('playerSpawned', function()
	TriggerServerEvent('es_wsync:requestSync')
end)
