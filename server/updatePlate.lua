RegisterNetEvent("np_vehregistration:updatePlate")
AddEventHandler("np_vehregistration:updatePlate", function(oldPlate, newPlate, price)
    MySQL.Async.fetchAll('SELECT vehicle FROM owned_vehicles WHERE plate=@plate LIMIT 1', {
        ['@plate'] = oldPlate
    }, function(result)
        local vehMods = json.decode(result[1].vehicle)

        vehMods.plate = newPlate

        MySQL.Async.execute('UPDATE owned_vehicles SET plate=@newPlate, vehicle=@vehicle WHERE plate=@oldPlate', {
            ['@newPlate'] = tostring(newPlate),
            ['@vehicle'] = json.encode(vehMods),
            ['@oldPlate'] = tostring(oldPlate)
        })
    end)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeAccountMoney('bank', price)
end)