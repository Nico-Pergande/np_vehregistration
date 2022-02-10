function registerVehicle(registerMenu, ownedVeh, playerVeh, location)
    local regMenu = _menuPool:AddSubMenu(registerMenu, ownedVeh.plate .. _U("register_vehicle_menu_item"), "")

    local registerVeh = NativeUI.CreateItem(_U("register_vehicle_menu_item_submit"), "")
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
                sendNotify("#F1C40F", Config.label, _U("register_vehicle_notify_success") .. newPlate)
            else
                sendNotify("#E74C3C", Config.label, _U("register_vehicle_notify_error") .. Config.price)
            end
        end, Config.price)
    end
end