local QBCore = exports['qb-core']:GetCoreObject()
local blips = {}
local kazmaProp = `prop_tool_pickaxe`

local miner = CircleZone:Create(vector3(-593.13, 2074.56, 131.34), 15.0, {
    name="miner",
    useZ=false,
    --debugPoly=false
})

local function createBlips()
    for k, v in pairs(Config.MadenLocations) do
        blips[k] = AddBlipForCoord(tonumber(v.x), tonumber(v.y), tonumber(v.z))
        SetBlipSprite(blips[k], Config.Blip.blipType)
        SetBlipDisplay(blips[k], 4)
        SetBlipScale  (blips[k], Config.Blip.blipScale)
        SetBlipColour (blips[k], Config.Blip.blipColor)
        SetBlipAsShortRange(blips[k], true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Maden")
        EndTextCommandSetBlipName(blips[k])
    end
end


RegisterNetEvent('kaz:maden')
AddEventHandler('kaz:maden', function()
local playerCoords = GetEntityCoords(PlayerPedId())
local coords = GetEntityCoords(PlayerPedId())
erkanagotten = miner:isPointInside(coords)
    if erkanagotten then 
        QBCore.Functions.Progressbar('kaz', 'Kazıyorsun', 3000, false, true, { -- Name | Label | Time | useWhileDead | canCancel
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'melee@large_wpn@streamed_core',
            anim = 'ground_attack_on_spot',
            flags = 16,
        }, {}, {}, function()
            TriggerServerEvent('item:ver')
        end, function()
        end)
    else
        QBCore.Functions.Notify('Madende değilsin', 'error', 7500)
    end
end)