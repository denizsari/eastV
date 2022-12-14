local QBCore = exports['qb-core']:GetCoreObject()

--CHAIR CONTROLLER
attachedProp = 0
function attachAChair(chairModelSent,boneNumberSent,x,y,z,xR,yR,zR)
	removeattachedChair()
	chairModel = GetHashKey(chairModelSent)
	--loadModel(chairModelSent)
	boneNumber = boneNumberSent 
	local bone = GetPedBoneIndex(PlayerPedId(), boneNumberSent)
	RequestModel(chairModel)
	while not HasModelLoaded(chairModel) do
		Citizen.Wait(100)
	end
	attachedChair = CreateObject(chairModel, 1.0, 1.0, 1.0, 1, 1, 0)
	AttachEntityToEntity(attachedChair, PlayerPedId(), bone, x, y, z, xR, yR, zR, 1, 1, 0, 0, 2, 1)
	SetModelAsNoLongerNeeded(chairModel)
end
function removeattachedChair()
	DeleteEntity(attachedChair)
	attachedChair = 0
end
function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end


RegisterNetEvent("jim-chairs:Use")
AddEventHandler("jim-chairs:Use", function(item)
	if not haschairalready then
		haschairalready = true
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local animDict = "timetable@ron@ig_3_couch"
	local animation = "base"
	FreezeEntityPosition(PlayerPedId(),true)

	if item == "chair1" then attachAChair("prop_skid_chair_01", 0, 0, -0.2, -0.22, 8.4, -0.2, 190.0)
	end
	loadAnimDict(animDict)
	local animLength = GetAnimDuration(animDict, animation)
	TaskPlayAnim(PlayerPedId(), animDict, animation, 1.0, 4.0, animLength, 1, 0, 0, 0, 0)
	else
		haschairalready = false
		FreezeEntityPosition(PlayerPedId(),false)
		removeattachedChair()
		StopEntityAnim(PlayerPedId(), "base", "timetable@ron@ig_3_couch", 3)
	end
end)

Citizen.CreateThread(function()
	while true do
		if haschairalready and not IsEntityPlayingAnim(PlayerPedId(), "timetable@ron@ig_3_couch", "base", 3) then
			FreezeEntityPosition(PlayerPedId(),false)
			removeattachedChair()
			--ClearPedTasks(PlayerPedId())
			haschairalready = false
		end
		Wait(500)
	end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
		FreezeEntityPosition(PlayerPedId(),false)
		removeattachedChair()
		ClearPedTasks(PlayerPedId())
		haschairalready = false
    end
end)
