function registerVehicle(registerMenu, ownedVeh, playerVeh, location)
    local regMenu = _menuPool:AddSubMenu(registerMenu, ownedVeh.plate .. " jetzt anmelden", "")

    local registerVeh = NativeUI.CreateItem("~g~Fahrzeug registrieren", "")
    registerVeh:RightLabel("$" .. Config.price)
    regMenu:AddItem(registerVeh)

    registerVeh.Activated = function(sender, index)
        ESX.TriggerServerCallback("np_vehRegistration:checkMoney", function(enoughMoney)
            if enoughMoney then
                local newPlate = createPlate(location)
                SetVehicleNumberPlateText(playerVeh, newPlate)
                local vehicleProps = ESX.Game.GetVehicleProperties(playerVeh)
                TriggerServerEvent("np_vehregistration:updatePlate", ownedVeh.plate, newPlate, Config.price)
                _menuPool:CloseAllMenus()
                TriggerEvent("city_notification:push", "#F1C40F", Config.label, "Du hast dein Fahrzeug für $" .. Config.price .. " angemeldet. <br>neues Kennzeichen: " .. newPlate)
            else
                TriggerEvent("city_notification:push", "#E74C3C", Config.label, "Du hast keine $" .. Config.price .. " auf deinem Konto.")
            end
        end, Config.price)
    end
end