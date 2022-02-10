Config = {}

Config.Locale = "de"
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

Config.label = "Fahrzeugregistrierung"
Config.price = 5000

Config.useESXNotify = true -- if this is true, Config.notifyEvent have no usage
Config.notifyEvent = "city_notification:push" -- your default notify trigger (clientside)