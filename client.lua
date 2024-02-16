local lookUptable = { [1] = 1.0, [2] = 0.9, [3] = 0.8, [4] = 0.7, [5] = 0.6, [6] = 0.5, [7] = 0.4, [8] = 0.3, [9] = 0.2, [10] = 0.1, [11] = 0.0 }
local checkDistance = false

-- Starts playing a sound locally on a single client.
RegisterNetEvent("brodoPlayer:PlayOnOne")
AddEventHandler("brodoPlayer:PlayOnOne", function(soundFile, soundVolume)
    SendNUIMessage({
        transactionType     = "playSound",
        transactionFile     = soundFile,
        transactionVolume   = soundVolume
    })
end)

-- Starts playing sound if client is close enough (coords and range)
RegisterNetEvent("brodoPlayer:playOnRange")
AddEventHandler("brodoPlayer:playOnRange", function (soundFile, soundVolume, coords, range)
    if #(coords - GetEntityCoords(PlayerPedId())) <= range then
        SendNUIMessage({
            transactionType     = "playSound",
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
        checkDistanceForAudio(coords, range)
    end
end)

-- Adjust volume in relation to distance
function checkDistanceForAudio(coords, range)
    checkDistance = true
    local playerPed = PlayerPedId()
    local division = range / 10.0

    CreateThread(function ()
        while checkDistance do
            Wait(100)
            local dist = #(coords - GetEntityCoords(playerPed))
            for i = 1, 11 do
                if dist < i * division and i < 11 then
                    break
                end
                SendNUIMessage({
                    transactionType = "changeVolume",
                    transactionVolume = lookUptable[i]
                })
            end
        end
    end)
end

-- Stops checking for the distance between client and original point if the audio stopped playing
RegisterNUICallback("audioStopped", function ()
    checkDistance = false
end)