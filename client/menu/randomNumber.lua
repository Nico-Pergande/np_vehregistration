local NumberCharset = {}

for i = 48, 57 do table.insert(NumberCharset, string.char(i)) end

function randomNumber(amount)
    Citizen.Wait(0)
    math.randomseed(GetGameTimer())
    if amount > 0 then
        return randomNumber(amount - 1) .. NumberCharset[math.random(1, #NumberCharset)]
    else 
        return ''
    end
end