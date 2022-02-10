function sendNotify(color, title, message)
    if Config.useESXNotify then
        TriggerEvent('esx:showNotification', "~b~" .. title .. "~s~ \n" .. message)
    else
        TriggerEvent(Config.notifyEvent, color, title, message)
    end
end