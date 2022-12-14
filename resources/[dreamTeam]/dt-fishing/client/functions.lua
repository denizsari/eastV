QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()
local pedSpawned = false
local ShopPed = {}

TryToFish = function()
    QBCore.Functions.TriggerCallback('qb-fishing:GetItemData', function(count)
        if IsPedSwimming(cachedData["ped"]) then return QBCore.Functions.Notify("Yüzerken balık tutamazsın.", "error") end 
        if IsPedInAnyVehicle(cachedData["ped"]) then return QBCore.Functions.Notify("Araçtan inmen gerekli.", "error") end 
        if count ~= nil then
            if count == 0 then
                QBCore.Functions.Notify("Bir olta ve yeme ihtiyacın var.", "primary")
            else
                local waterValidated, castLocation = IsInWater()

                if waterValidated then
                    local fishingRod = GenerateFishingRod(cachedData["ped"])

                    CastBait(fishingRod, castLocation)
                else
                    QBCore.Functions.Notify("Oltayı suya çevirmelisin", "primary")
                end
            end
        end
    end, Config.FishingItems["rod"]["name"], Config.FishingItems["bait"]["name"])
end

local isFishing = false
CastBait = function(rodHandle, castLocation)
    if isFishing then return end
    isFishing = true

    local startedCasting = GetGameTimer()

    if not HasFishingBait() then
        QBCore.Functions.Notify('Yemin kalmadı!', 'error')

        isFishing = false
        return DeleteEntity(rodHandle)
    end

    while not IsControlJustPressed(0, 47) do
        Citizen.Wait(5)

        ShowHelpNotification("Balık Tutmaya Başla ~INPUT_DETONATE~")

        if GetGameTimer() - startedCasting > 5000 then
            QBCore.Functions.Notify("Yeme ihtiyacın var.", "primary")

            isFishing = false
            return DeleteEntity(rodHandle)
        end
    end

    PlayAnimation(cachedData["ped"], "mini@tennis", "forehand_ts_md_far", {
        ["flag"] = 48
    })

    while IsEntityPlayingAnim(cachedData["ped"], "mini@tennis", "forehand_ts_md_far", 3) do
        Citizen.Wait(0)
    end

    PlayAnimation(cachedData["ped"], "amb@world_human_stand_fishing@idle_a", "idle_c", {
        ["flag"] = 11
    })

    local startedBaiting = GetGameTimer()
    local randomBait = math.random(10000, 30000)

    -- DrawBusySpinner("Waiting for a fish that is biting..")
    QBCore.Functions.Notify("Balığın yemi yutmasını bekliyorsun...", "success", "10000")
    local interupted = false

    Citizen.Wait(1000)

    while GetGameTimer() - startedBaiting < randomBait do
        Citizen.Wait(5)

        if not IsEntityPlayingAnim(cachedData["ped"], "amb@world_human_stand_fishing@idle_a", "idle_c", 3) then
            interupted = true

            break
        end
    end

    RemoveLoadingPrompt()

    if interupted then
        ClearPedTasks(cachedData["ped"])

        isFishing = false
        CastBait(rodHandle, castLocation)
        return DeleteEntity(rodHandle)
    end
    
    local caughtFish = exports['qb-lock']:StartLockPickCircle(1, 50)

    ClearPedTasks(cachedData["ped"])

    if caughtFish then
        TriggerServerEvent("qb-fishing:receiveFish", castLocation, function(received) end)
        TriggerServerEvent('hud:server:RelieveStress', 1)
    else
        QBCore.Functions.Notify("Balık kaçtı.", "error")
    end
    
    isFishing = false
    CastBait(rodHandle, castLocation)
    return DeleteEntity(rodHandle)
end


IsInWater = function()
    local startedCheck = GetGameTimer()

    local ped = cachedData["ped"]
    local pedPos = GetEntityCoords(ped)

    local forwardVector = GetEntityForwardVector(ped)
    local forwardPos = vector3(pedPos["x"] + forwardVector["x"] * 10, pedPos["y"] + forwardVector["y"] * 10, pedPos["z"])

    local fishHash = `a_c_fish`

    WaitForModel(fishHash)

    local waterHeight = GetWaterHeight(forwardPos["x"], forwardPos["y"], forwardPos["z"])

    local fishHandle = CreatePed(1, fishHash, forwardPos, 0.0, false)
    
    SetEntityAlpha(fishHandle, 0, true) -- makes the fish invisible.

    -- DrawBusySpinner("Checking fishing location....")
    QBCore.Functions.Notify("Bölge kontrol ediliyor...", "success", "3000")

    while GetGameTimer() - startedCheck < 3000 do
        Citizen.Wait(0)
    end

    RemoveLoadingPrompt()

    local fishInWater = IsEntityInWater(fishHandle)

    DeleteEntity(fishHandle)

    SetModelAsNoLongerNeeded(fishHash)

    return fishInWater, fishInWater and vector3(forwardPos["x"], forwardPos["y"], waterHeight) or false
end

GenerateFishingRod = function(ped)
    local pedPos = GetEntityCoords(ped)
    
    local fishingRodHash = `prop_fishing_rod_01`

    WaitForModel(fishingRodHash)

    local rodHandle = CreateObject(fishingRodHash, pedPos, true)

    AttachEntityToEntity(rodHandle, ped, GetPedBoneIndex(ped, 18905), 0.1, 0.05, 0, 80.0, 120.0, 160.0, true, true, false, true, 1, true)

    SetModelAsNoLongerNeeded(fishingRodHash)

    return rodHandle
end

HandleStore = function()
    local storeData = Config.FishingRestaurant
    WaitForModel(storeData["ped"]["model"])
    local pedHandle = CreatePed(5, storeData["ped"]["model"], storeData["ped"]["position"], storeData["ped"]["heading"], false)
    SetEntityInvincible(pedHandle, true)
    SetEntityAsMissionEntity(pedHandle, true, true)
    FreezeEntityPosition(pedHandle, true)
    SetBlockingOfNonTemporaryEvents(pedHandle, true)
    cachedData["storeOwner"] = pedHandle
    SetModelAsNoLongerNeeded(storeData["ped"]["model"])
    
    if Config.UseTarget then
        exports['qb-target']:AddTargetEntity(pedHandle, {
            options = {
                {
                    label = "Balıkları Sat",
                    icon = 'fa-solid fa-dollar-sign',
                    action = function()
                        SellFish()
                    end
                }
            },
            distance = 2.0
        })
    end

end


SellFish = function()
    QBCore.Functions.TriggerCallback('qb-fishing:GetItemData', function(count)
        TaskTurnPedToFaceEntity(cachedData["storeOwner"], cachedData["ped"], 1000)
        TaskTurnPedToFaceEntity(cachedData["ped"], cachedData["storeOwner"], 1000)
        TriggerServerEvent("qb-fishing:sellFish", function(sold, fishesSold) end)
    end)
end


PlayAnimation = function(ped, dict, anim, settings)
	if dict then
        Citizen.CreateThread(function()
            RequestAnimDict(dict)

            while not HasAnimDictLoaded(dict) do
                Citizen.Wait(100)
            end

            if settings == nil then
                TaskPlayAnim(ped, dict, anim, 1.0, -1.0, 1.0, 0, 0, 0, 0, 0)
            else 
                local speed = 1.0
                local speedMultiplier = -1.0
                local duration = 1.0
                local flag = 0
                local playbackRate = 0

                if settings["speed"] then
                    speed = settings["speed"]
                end

                if settings["speedMultiplier"] then
                    speedMultiplier = settings["speedMultiplier"]
                end

                if settings["duration"] then
                    duration = settings["duration"]
                end

                if settings["flag"] then
                    flag = settings["flag"]
                end

                if settings["playbackRate"] then
                    playbackRate = settings["playbackRate"]
                end

                TaskPlayAnim(ped, dict, anim, speed, speedMultiplier, duration, flag, playbackRate, 0, 0, 0)
            end
      
            RemoveAnimDict(dict)
		end)
	else
		TaskStartScenarioInPlace(ped, anim, 0, true)
	end
end

FadeOut = function(duration)
    DoScreenFadeOut(duration)
    
    while not IsScreenFadedOut() do
        Citizen.Wait(0)
    end
end

FadeIn = function(duration)
    DoScreenFadeIn(500)

    while not IsScreenFadedIn() do
        Citizen.Wait(0)
    end
end

WaitForModel = function(model)
    if not IsModelValid(model) then
        return
    end

	if not HasModelLoaded(model) then
		RequestModel(model)
	end
	
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end
end

DrawBusySpinner = function(text)
    SetLoadingPromptTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    ShowLoadingPrompt(3)
end

ShowHelpNotification = function(msg, thisFrame, beep, duration)
	AddTextEntry('qbHelpNotification', msg)

	if thisFrame then
		DisplayHelpTextThisFrame('qbHelpNotification', false)
	else
		if beep == nil then beep = true end
		BeginTextCommandDisplayHelp('qbHelpNotification')
		EndTextCommandDisplayHelp(0, false, beep, duration or -1)
	end
end

function HasFishingBait()
    local rtval = false
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(amount)
        if amount then
            rtval = true
        end
    end, "fishingbait")
    Wait(1000)
    return rtval
end