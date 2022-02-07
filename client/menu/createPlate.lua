function createPlate(location)
    local readyPlate
    local doBreak = false

    while true do
        Citizen.Wait(5)
        math.randomseed(GetGameTimer())
    
        readyPlate = string.upper(location .. ' ' .. randomNumber(5))

        ESX.TriggerServerCallback("np_vehRegistration:checkPlate", function(isPlateTaken)
            if not isPlateTaken then 
                doBreak = true
            end
        end, readyPlate)

        if doBreak then
            break
        end
    end
    return readyPlate
end