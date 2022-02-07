RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    getBlips()
end)

AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        getBlips()
    end
end)

function getBlips()
    for k, v in pairs(Config.positions) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)

        SetBlipSprite(blip, 793)
        SetBlipScale(blip, 0.7)
        SetBlipColour(blip, 47)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.label)
        EndTextCommandSetBlipName(blip)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local playerPos = GetEntityCoords(playerPed)
        _menuPool:ProcessMenus()
        for k,v in pairs(Config.positions) do
            local distance = Vdist(playerPos,  v.x,  v.y,  v.z)
            if distance <= 7.5 then
                DrawMarker(27, v.x, v.y, v.z -0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.9*0.9, 0.9*0.9, 1.0, 136, 0, 136, 75, false, false, 2, false, false, false, false)
            end
            
            if distance <= 1.0 then
                ESX.ShowHelpNotification("[~y~E~s~] " .. Config.label .. " - " .. v.name)
                if IsControlJustPressed(0, 38) then
                    openRegistrationMenu(v.name)
                end
            end
        end
    end
end)
