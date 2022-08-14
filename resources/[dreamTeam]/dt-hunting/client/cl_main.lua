-- ============================
--    CLIENT CONFIGS
-- ============================
local CoreName = exports['qb-core']:GetCoreObject()

local inzone = false 
local Zones = {} 

local baitCooldown = Config.BaitCooldown
local deployedBaitCooldown = 0

local spawningTime = Config.SpawningTimer
local startSpawningTimer = 0

local spawnedAnimalsBlips = Config.spawnedAnimalsBlips
local spawnedAnimalsBlipsConfig = Config.AnimalBlip

function AddCircleZone(name, llegal, center, radius, options)
    Zones[name] = CircleZone:Create(center, radius, options)
    table.insert(Zones[name], {
        llegal = llegal
    })
end

function initBlips()
    initSellspotsQbTargets(Config.SellSpots)
    createCustomBlips(Config.SellSpots)
    createCustomBlips(Config.HuntingArea)
end

Citizen.CreateThread(function()
    Wait(7)
    initBlips()
    if Config.SlughterEveryAnimal == true then
        putQbTargetAllOnAnimals()
    end
end)

AddEventHandler('dt-hunting:client:slaughterAnimal', function(entity)
    local model = GetEntityModel(entity)
    local animal = getAnimalMatch(model)

    if (model and animal) then
        CoreName.Functions.TriggerCallback("QBCore:HasItem", function(hasitem)
            if hasitem then
                ClearPedTasks(PlayerPedId())
                ToggleSlaughterAnimation(true, entity)
                CoreName.Functions.Progressbar("harv_anim", "Hayvan kesiliyor..", Config.SlaughteringSpeed, false,
                    false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = true,
                        disableCombat = true
                    }, {}, {}, {}, function()
                    ToggleSlaughterAnimation(false, 0)
                    if AnimalLootMultiplier:read(entity) ~= nil and AnimalLootMultiplier:read(entity) ~= false then
                        TriggerServerEvent('dt-hunting:server:AddItem', animal, entity, AnimalLootMultiplier:read(entity))
                    else
                        -- defalut values for multipiler
                        TriggerServerEvent('dt-hunting:server:AddItem', animal, entity, 'defalut')
                    end
                    Citizen.Wait(100)
                end)
            else
                CoreName.Functions.Notify("Bıçağın yok.")
            end
        end, "weapon_knife")
    end
end)

AddEventHandler('dt-hunting:client:sellREQ', function()
    TriggerServerEvent('dt-hunting:server:sellmeat')
end)

RegisterNetEvent('dt-hunting:client:ForceRemoveAnimalEntity')
AddEventHandler('dt-hunting:client:ForceRemoveAnimalEntity', function(entity)
    DeleteEntity(entity)
    AnimalLootMultiplier[entity] = nil
end)

function isPedInHuntingZone(type)
    local plyPed = PlayerPedId()
    local coord = GetEntityCoords(plyPed)
    local legl

    for _, zone in pairs(Zones) do
        if zone:isPointInside(coord) then
            return {
                inzone = true,
                llegal = zone[1].llegal
            }
        else
            legl = zone[1].llegal
        end
    end
    return {
        inzone = false,
        llegal = legl
    }
end

RegisterNetEvent('dt-hunting:client:useBait')
AddEventHandler('dt-hunting:client:useBait', function()
    local plyPed = PlayerPedId()
    local coord = GetEntityCoords(plyPed)
    local inHuntingZone = isPedInHuntingZone()
    if inHuntingZone.inzone then
        if deployedBaitCooldown <= 0 then
            if Config.HuntingHours.active == true then
                local hunting_hour = check_hunting_hour()
                if hunting_hour ~= nil and hunting_hour == false then
                    CoreName.Functions.Notify("Bu saatte avlanamazsın")
                    return
                end
            end

            ClearPedTasks(plyPed)
            TaskStartScenarioInPlace(plyPed, "WORLD_HUMAN_GARDENER_PLANT", 0, true)
            CoreName.Functions.Progressbar("harv_anim", "Yem yerleştiriliyor", Config.BaitPlacementSpeed, false, false, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true
            }, {}, {}, {}, function()
                ClearPedTasks(plyPed)
                local indicator = nil
                if Config.BaitIndicator.active == true then
                    indicator = spawnBaitObject(Config.BaitIndicator.model, coord)
                end
                createThreadAnimalSpawningTimer(coord, inHuntingZone.llegal, indicator)
            end)
        else
            CoreName.Functions.Notify("Yem bekleme süresinde! Geriye kalan: " .. (deployedBaitCooldown / 1000) .. "sec")
        end
    else
        CoreName.Functions.Notify("Yeminizi yerleştirmek için avlanma alanında olmalısınız!")
    end
end)

function check_hunting_hour()
    local start = Config.HuntingHours.range.start
    local ends = Config.HuntingHours.range.ends
    local hour = exports['qb-weathersync'].getHour()
    local huntingHour = false
    if start > ends then
        if hour == start then
            huntingHour = true
        elseif hour == 0 then
            huntingHour = true
        elseif hour <= ends then
            huntingHour = true
        else
            huntingHour = false
        end
    else
        if start <= hour and ends >= hour then
            huntingHour = true
        else
            huntingHour = false
        end
    end
    return huntingHour
end

function createThreadAnimalSpawningTimer(coord, was_llegal, indicator)
    local outPosition = getSpawnLocation(coord)

    if outPosition.x ~= 0 and outPosition.y ~= 0 and outPosition.z ~= 0 then
        Citizen.CreateThread(function()
            startSpawningTimer = spawningTime
            while startSpawningTimer > 0 do
                startSpawningTimer = startSpawningTimer - 1000
                Wait(1000)
            end
            if startSpawningTimer == 0 then
                createThreadBaitCooldown()
                TriggerServerEvent('dt-hunting:server:choiceWhichAnimalToSpawn', coord, outPosition, was_llegal, indicator)
            else
                CoreName.Functions.Notify("Yem tetiklenemedi!")
            end
        end)
    else
        CoreName.Functions.Notify("Yeminizi yerleştirmek için daha iyi bir yer bulun!")
    end
end

function spawnBaitObject(model, coord)
    local entity = CreateObject(model, coord.x, coord.y, coord.z, 0, 0, 0)
    while not DoesEntityExist(entity) do
        Wait(10)
    end
    PlaceObjectOnGroundProperly(entity)
    FreezeEntityPosition(
        entity,
        true
    )
    return entity
end

RegisterNetEvent('dt-hunting:client:spawnAnimal')
AddEventHandler('dt-hunting:client:spawnAnimal', function(coord, outPosition, C_animal, was_llegal, indicator)
    if not HasModelLoaded(C_animal.hash) then
        RequestModel(C_animal.hash)
        Wait(10)
    end
    while not HasModelLoaded(C_animal.hash) do
        Wait(10)
    end
    local baitAnimal = CreatePed(28, C_animal.hash, outPosition.x, outPosition.y, outPosition.z, outPosition.w, true,
        true)
    SetEntityAsMissionEntity(baitAnimal, true, true)

    if spawnedAnimalsBlips == true then
        local blip = AddBlipForEntity(baitAnimal)
        LeastSpawnedAnimal = baitAnimal
        SetBlipSprite(blip, spawnedAnimalsBlipsConfig.sprite)
        SetBlipColour(blip, spawnedAnimalsBlipsConfig.color)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Baited animal")
        EndTextCommandSetBlipName(blip)
    end

    if DoesEntityExist(baitAnimal) then
        TriggerServerEvent('dt-hunting:server:removeBaitFromPlayerInventory')
        createThreadAnimalTraveledDistanceToBaitTracker(coord, baitAnimal, indicator)
        createDespawnThread(baitAnimal, was_llegal, coord, indicator)
        putQbTargetOnEntity(baitAnimal)
    else
        print("debug: spawn hatalı")
    end
end)


RegisterNetEvent('dt-hunting:client:spawnanim')
AddEventHandler('dt-hunting:client:spawnanim', function(model, was_llegal)
    model = (tonumber(model) ~= nil and tonumber(model) or GetHashKey(model))
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local forward = GetEntityForwardVector(playerPed)
    local x, y, z = table.unpack(coords + forward * 1.0)

    Citizen.CreateThread(function()
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(1)
        end
        baitAnimal = CreatePed(5, model, x, y, z, 0.0, true, false)
        createDespawnThread(baitAnimal, was_llegal)
    end)
end)

RegisterNetEvent('dt-hunting:client:clearTask')
AddEventHandler('dt-hunting:client:clearTask', function()
    local playerPed = PlayerPedId()
    ClearPedTasks(playerPed)
end)


function createThreadBaitCooldown()
    Citizen.CreateThread(function()
        deployedBaitCooldown = baitCooldown
        while deployedBaitCooldown > 0 do
            deployedBaitCooldown = deployedBaitCooldown - 1000
            Wait(1000)
        end
    end)
end


local hasMusket = false

function disablePlayerFiring()
    DisableControlAction(0, 24) -- INPUT_ATTACK
    DisableControlAction(0, 69) -- INPUT_VEH_ATTACK
    DisableControlAction(0, 70) -- INPUT_VEH_ATTACK2
    DisableControlAction(0, 92) -- INPUT_VEH_PASSENGER_ATTACK
    DisableControlAction(0, 114) -- INPUT_VEH_FLY_ATTACK
    DisableControlAction(0, 257) -- INPUT_ATTACK2
    DisableControlAction(0, 331) -- INPUT_VEH_FLY_ATTACK2

    DisableControlAction(0, 282) -- INPUT_VEH_FLY_ATTACK2
    DisableControlAction(0, 24, true)
    DisableControlAction(0, 47, true)
    DisableControlAction(0, 58, true)
    DisablePlayerFiring(ped, true)
end

local function blockShooting()
    local playerId = PlayerId()
    local PlyPedId = PlayerPedId()
    Citizen.CreateThread(function()
        while hasMusket do
            Citizen.Wait(1)
            local aiming, targetPed = GetEntityPlayerIsFreeAimingAt(playerId)
            local PedType = GetPedType(targetPed)

            if aiming then
                if DoesEntityExist(targetPed) and IsEntityAPed(targetPed) and (PedType == 4 or PedType == 5 or PedType == 2 or PedType == 1) then
                    DisablePlayerFiring(playerId, true)
                    disablePlayerFiring()
                end
            else
                if IsPedShooting(PlyPedId) then
                    SetCurrentPedWeapon(PlyPedId, "weapon_unarmed", true)
                else
                    hasMusket = false
                end
            end
        end
    end)
end

if Config.ShootingProtection then
    local hashTable = {}
    for key, weapon in pairs(Config.ProtectedWeapons) do
        table.insert(hashTable, GetHashKey(weapon))
    end
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5)
            for key, weaponHash in pairs(hashTable) do
                if hasMusket == false then
                    if GetSelectedPedWeapon(PlayerPedId()) == weaponHash then
                        hasMusket = true
                        blockShooting()
                    else
                        hasMusket = false
                    end
                end
            end
        end
    end)
end
