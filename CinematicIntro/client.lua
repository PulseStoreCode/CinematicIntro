local currentCam = nil
local isSpawned = false
local camIndex = 1
local spawnPos = nil
local npcDensityActive = false
local currentSpotName = nil
local showUI = false
local weatherActive = false

-- Boucle météo / heure cinématique
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if weatherActive then
            SetWeatherTypePersist("EXTRASUNNY")
            SetWeatherTypeNow("EXTRASUNNY")
            SetWeatherTypeNowPersist("EXTRASUNNY")
            NetworkOverrideClockTime(12, 0, 0)
        end
    end
end)

local function SetCinematicWeather(active)
    weatherActive = active
    if not active then
        -- Relâche le contrôle : le jeu reprend sa météo/heure normales
        ClearWeatherTypePersist()
        NetworkClearClockTimeOverride()
    end
end

-- Boucle densité NPC
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if npcDensityActive then
            SetPedDensityMultiplierThisFrame(Config.PedDensity)
            SetVehicleDensityMultiplierThisFrame(Config.VehicleDensity)
            SetRandomVehicleDensityMultiplierThisFrame(Config.VehicleDensity)
            SetParkedVehicleDensityMultiplierThisFrame(Config.VehicleDensity)
            SetScenarioPedDensityMultiplierThisFrame(Config.PedDensity, Config.PedDensity)
        end
    end
end)

-- Boucle UI native (DrawRect + DrawText)
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if not showUI then goto continue end

        -- Bandes cinématiques haut/bas (opaques)
        DrawRect(0.5, 0.045, 1.0, 0.09, 0, 0, 0, 255)
        DrawRect(0.5, 0.955, 1.0, 0.09, 0, 0, 0, 255)

        if currentSpotName then
            -- Location name (left, vertically centered in the bar)
            local locale = Config.Locales[Config.Locale] or Config.Locales["en"]

            SetTextFont(4)
            SetTextScale(0.0, 0.6)
            SetTextColour(255, 255, 255, 255)
            SetTextDropShadow()
            SetTextEntry("STRING")
            AddTextComponentSubstringPlayerName(currentSpotName)
            DrawText(0.03, 0.928)

            -- Subtitle below
            SetTextFont(0)
            SetTextScale(0.0, 0.3)
            SetTextColour(180, 180, 180, 255)
            SetTextEntry("STRING")
            AddTextComponentSubstringPlayerName(locale.subtitle)
            DrawText(0.03, 0.958)

            -- ENTER hint centered
            SetTextFont(0)
            SetTextScale(0.0, 0.38)
            SetTextCentre(true)
            SetTextWrap(0.0, 1.0)
            SetTextEntry("STRING")
            AddTextComponentSubstringPlayerName(locale.spawnHint)
            DrawText(0.5, 0.943)
        end

        ::continue::
    end
end)

local function SetNpcDensity(active)
    npcDensityActive = active
end

local function StopMusic()
    SendNUIMessage({ type = "stopMusic" })
end

local function PlayMusic()
    SetNuiFocus(true, true)  -- enable mouse cursor on NUI
    local locale = Config.Locales[Config.Locale] or Config.Locales["en"]
    SendNUIMessage({
        type      = "playMusic",
        volume    = Config.MusicVolume,
        menu      = Config.BlipsMenu,
        locations = Config.BlipsLocations,
        locale    = locale,
    })
end

local function PreloadSpot(spot)
    local ped = PlayerPedId()
    local c = spot.camStart.coords
    SetEntityCoords(ped, c.x, c.y, c.z, false, false, false, false)
    Wait(0)
    SetFocusPosAndVel(c.x, c.y, c.z, 0.0, 0.0, 0.0)
    RequestCollisionAtCoord(c.x, c.y, c.z)
    local t = GetGameTimer()
    repeat Wait(100) until HasCollisionLoadedAroundEntity(ped) or (GetGameTimer() - t) > 6000
    Wait(2000)
    local c2 = spot.camEnd.coords
    RequestCollisionAtCoord(c2.x, c2.y, c2.z)
    SetFocusPosAndVel(c2.x, c2.y, c2.z, 0.0, 0.0, 0.0)
    Wait(1000)
end

local function DoTraveling(spot, skipFade)
    if not skipFade then
        DoScreenFadeOut(400)
        showUI = false
        Wait(500)
        if currentCam then DestroyCam(currentCam, false) currentCam = nil end
        PreloadSpot(spot)
    end

    local camA = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(camA, spot.camStart.coords.x, spot.camStart.coords.y, spot.camStart.coords.z)
    if spot.camStart.rot then
        SetCamRot(camA, spot.camStart.rot.x, spot.camStart.rot.y, spot.camStart.rot.z, 2)
    else
        PointCamAtCoord(camA, spot.camStart.look.x, spot.camStart.look.y, spot.camStart.look.z)
    end
    SetCamFov(camA, spot.fov)

    local camB = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamCoord(camB, spot.camEnd.coords.x, spot.camEnd.coords.y, spot.camEnd.coords.z)
    if spot.camEnd.rot then
        SetCamRot(camB, spot.camEnd.rot.x, spot.camEnd.rot.y, spot.camEnd.rot.z, 2)
    else
        PointCamAtCoord(camB, spot.camEnd.look.x, spot.camEnd.look.y, spot.camEnd.look.z)
    end
    SetCamFov(camB, spot.fov - 3.0)

    SetCamActive(camA, true)
    RenderScriptCams(true, false, 0, true, false)

    -- Préparer le texte AVANT le fade in pour qu'il apparaisse instantanément
    currentSpotName = spot.name
    showUI = true

    DoScreenFadeIn(600)

    SetCamActiveWithInterp(camB, camA, Config.TravelingDuration, 1, 1)
    currentCam = camB

    local startTime = GetGameTimer()
    while (GetGameTimer() - startTime) < Config.SpotDuration and not isSpawned do
        Wait(0)
    end

    DestroyCam(camA, false)
    return false
end

local function SpawnPlayer()
    isSpawned = true
    StopMusic()
    SetNuiFocus(false, false)  -- relâche le curseur souris
    SetNpcDensity(false)
    SetCinematicWeather(false)
    showUI = false
    currentSpotName = nil

    -- Son de transition
    local snd = GetSoundId()
    PlaySoundFrontend(snd, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    Citizen.SetTimeout(3000, function() ReleaseSoundId(snd) end)

    DoScreenFadeOut(500)
    Wait(600)

    local ped = PlayerPedId()
    SetEntityCoords(ped, spawnPos.x, spawnPos.y, spawnPos.z, false, false, false, true)
    SetEntityVisible(ped, true, false)
    FreezeEntityPosition(ped, false)
    ClearFocus()

    RenderScriptCams(false, true, 800, true, false)
    Wait(900)

    if currentCam then DestroyCam(currentCam, false) currentCam = nil end

    DoScreenFadeIn(800)
    DisplayRadar(true)
end

local function StartSkycam(startIndex)
    local ped = PlayerPedId()
    spawnPos = GetEntityCoords(ped)

    SetEntityVisible(ped, false, false)
    FreezeEntityPosition(ped, true)
    DoScreenFadeOut(0)
    showUI = false
    Wait(300)

    DisplayRadar(false)
    musicHandle = nil
    PlayMusic()
    SetNpcDensity(true)
    SetCinematicWeather(true)

    isSpawned = false
    camIndex = startIndex or 1
    currentCam = nil

    Citizen.CreateThread(function()
        PreloadSpot(Config.Spots[camIndex])

        -- Créer la première cam AVANT le fade in pour éviter le flash gameplay
        local firstSpot = Config.Spots[camIndex]
        local firstCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamCoord(firstCam, firstSpot.camStart.coords.x, firstSpot.camStart.coords.y, firstSpot.camStart.coords.z)
        if firstSpot.camStart.rot then
            SetCamRot(firstCam, firstSpot.camStart.rot.x, firstSpot.camStart.rot.y, firstSpot.camStart.rot.z, 2)
        else
            PointCamAtCoord(firstCam, firstSpot.camStart.look.x, firstSpot.camStart.look.y, firstSpot.camStart.look.z)
        end
        SetCamFov(firstCam, firstSpot.fov)
        SetCamActive(firstCam, true)
        RenderScriptCams(true, false, 0, true, false)
        currentCam = firstCam

        DoScreenFadeIn(1000)
        Wait(200)

        local firstCall = true
        while not isSpawned do
            local spot = Config.Spots[camIndex]
            DoTraveling(spot, firstCall)
            firstCall = false

            if isSpawned then break end

            camIndex = (camIndex % #Config.Spots) + 1
        end
    end)
end

-- Auto-launch on player spawn
AddEventHandler("playerSpawned", function()
    if isSpawned then return end
    StartSkycam(1)
end)

-- Callback NUI : ENTER pressed from HTML interface
RegisterNUICallback("enterPressed", function(_, cb)
    cb({})
    if not isSpawned then
        isSpawned = true
        Citizen.CreateThread(function() SpawnPlayer() end)
    end
end)

-- Callback NUI : click in blips menu
RegisterNUICallback("menuClick", function(_, cb)
    cb({})
    local snd = GetSoundId()
    PlaySoundFrontend(snd, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
    Citizen.SetTimeout(500, function() ReleaseSoundId(snd) end)
end)
