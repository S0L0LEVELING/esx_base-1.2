Cache, ESX = {}, nil

CreateThread(function()
    while not Config or not Config.ESX or not Config.ESX.Client do
        Wait(250)
    end

    while not ESX do
        Wait(500)
        TriggerEvent(Config.ESX.Client, function(esx)
            ESX = esx
        end)
    end

    while not ESX.GetPlayerData() or not ESX.GetPlayerData().job or not ESX.GetPlayerData().job.name do
        Wait(500)
    end

    if Config.Blip then
        local blip = AddBlipForCoord(Config.Interior.Entrance.xyz)
        SetBlipSprite(blip, 421)
        SetBlipColour(blip, 13)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.75)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Strings.Blip)
        EndTextCommandSetBlipName(blip)
    end

    CreateMarker(Config.Interior.Entrance)
    CreateMarker(Config.Interior.Exit)

    Cache.job = ESX.GetPlayerData().job
    if type(Cache.job.grade) == "string" then
        Cache.job.grade = tonumber(Cache.job.grade)
    end

    if Cache.job.name == Config.Job.Name and Cache.job.grade >= Config.Job.Boss then
        Cache.boss_marker = CreateMarker(Config.Interior.BossActions)
    end

    Cache.loaded = true

    -- Update cache stuff
    while true do
        Cache.ped = PlayerPedId()
        Cache.coords = GetEntityCoords(Cache.ped)
        Wait(250)
    end
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
	Cache.job = job
    if type(Cache.job.grade) == "string" then
        Cache.job.grade = tonumber(Cache.job.grade)
    end

    if Cache.job.name == Config.Job.Name and Cache.job.grade >= Config.Job.Boss and not Cache.boss_marker then
        Cache.boss_marker = CreateMarker(Config.Interior.BossActions)
    elseif (Cache.job.name ~= Config.Job.Name or Cache.job.grade < Config.Job.Boss) and Cache.boss_marker then
        DeleteCheckpoint(Cache.boss_marker)
        Cache.boss_marker = nil
    end
end)

Teleport = function(coords)
    DoScreenFadeOut(750)
    while not IsScreenFadedOut() do 
        Wait(50) 
    end

    for i = 1, 25 do
        SetEntityCoordsNoOffset(Cache.ped, coords.xyz)
        Wait(50)
    end
    while IsEntityWaitingForWorldCollision(Cache.ped) do
        SetEntityCoordsNoOffset(Cache.ped, coords.xyz)
        Wait(50)
    end
    if coords.w then
        SetEntityHeading(Cache.ped, coords.w)
    end
    DoScreenFadeIn(1500)
    Wait(500)
end

DrawTxt3D = function(coords, text, sound)
    coords = coords.xyz
    if Config.HelpStyle == "default" then
        AddTextEntry(GetCurrentResourceName(), text)
        BeginTextCommandDisplayHelp(GetCurrentResourceName())
        EndTextCommandDisplayHelp(0, 0, (sound == true or sound == nil), -1)
    elseif Config.HelpStyle == "default-3d" then
        local str = text

        local start, stop = string.find(text, "~([^~]+)~")

        if start and start > 1 then
            start = start - 2
            stop = stop + 2
            str = ""
            str = str .. string.sub(text, 0, start) .. "   " .. string.sub(text, start+2, stop-2) .. string.sub(text, stop, #text)
        end

        AddTextEntry(GetCurrentResourceName(), str)
        BeginTextCommandDisplayHelp(GetCurrentResourceName())
        EndTextCommandDisplayHelp(2, false, false, -1)

        SetFloatingHelpTextWorldPosition(1, coords)
        SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    elseif Config.HelpStyle == "3d" then
        SetDrawOrigin(coords)
        text = text:gsub("~INPUT_CONTEXT~", "~g~[~s~E~g~]~s~")
        local height = 0.03
        local _, count = string.gsub(text, "\n", "")
        height = height + 0.02 * count

        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextEntry('STRING')
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(0.0, 0.0 - 0.01 * count)

        DrawRect(0.0, 0.0125, 0.015 + text:gsub("~.-~", ""):len() / 350, height, 45, 45, 45, 150)

        ClearDrawOrigin()
    end
end

CreateMarker = function(coords, rgba)
    coords = coords.xyz - vector3(0.0, 0.0, 1.0)
    if not rgba then rgba = {r = 255, g = 240, b = 0, a = 200} end
    local checkPoint = CreateCheckpoint(45, coords, coords, 0.3, rgba.r, rgba.g, rgba.b, rgba.a, 0)
    SetCheckpointCylinderHeight(checkPoint, 0.3, 0.3, 0.3)
    
    return checkPoint
end