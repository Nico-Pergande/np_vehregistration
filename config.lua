Config = {}

Config.Locale = "en"
Config.positions = { 
    {
        name = "LS",
        x = 338.09,
        y = -1563.63,
        z = 30.3,
    },
    {
        name = "BC",
        x = 154.18,
        y = 6392.65,
        z = 31.29,
    }
}

Config.price = 5000

Config.useESXNotify = true -- if this is true, Config.notifyEvent have no usage
Config.notifyEvent = "sd_notify:receiveMessage" -- your default notify trigger (clientside)
Config.advancedParking = false