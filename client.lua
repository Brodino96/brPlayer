-- Starts playing a sound locally on a single client.
RegisterNetEvent("brodoPlayer:PlayOnOne")
AddEventHandler("brodoPlayer:PlayOnOne", function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = "playSound",
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)


-- Starts playing a sound on all clients who are online in the server.
RegisterNetEvent("brodoPlayer:PlayOnAll")
AddEventHandler("brodoPlayer:PlayOnAll", function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = "playSound",
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)


-- Starts playing a sound on a client if the client is within the specificed maxDistance from the playOnEntity.
-- @TODO Change sound volume based on the distance the player is away from the playOnEntity.
RegisterNetEvent("brodoPlayer:PlayWithinDistance")
AddEventHandler("brodoPlayer:PlayWithinDistance", function(playerNetId, maxDistance, soundFile, soundVolume)
    local lCoords = GetEntityCoords(GetPlayerPed(-1))
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    if(distIs <= maxDistance) then
        SendNUIMessage({
            transactionType     = "playSound",
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
    end
end)
