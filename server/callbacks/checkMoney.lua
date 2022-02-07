ESX.RegisterServerCallback("np_vehRegistration:checkMoney", function(source, cb, price)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getAccount('bank').money >= price then
        cb(true)
    else 
        cb(false)
    end
end)