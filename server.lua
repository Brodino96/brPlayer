RegisterNetEvent("brodoPlayer:playOnAll")
AddEventHandler("brodoPlayer:playOnAll", function (soundFile, soundVolume)
    TriggerClientEvent("brodoPlayer:playOnOne", -1, soundFile, soundVolume)
end)

RegisterNetEvent("brodoPlayer:playOnRange")
AddEventHandler("brodoPlayer:playOnRange", function (soundFile, soundVolume, coords, range)
    TriggerClientEvent("brodoPlayer:playOnRange", -1, soundFile, soundVolume, coords, range)
end)