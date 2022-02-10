_menuPool = NativeUI.CreatePool()
local playerVeh = {}
local ownedVeh = {}
local regStatus

function openRegistrationMenu(location)
    ESX.TriggerServerCallback("np_vehRegistration:getPlayerVehicles", function(ownedVehicles)
        local nearVehicles = ESX.Game.GetVehiclesInArea(Config.position, 20)

        registerMenu = NativeUI.CreateMenu(_U('register_menu_title'), _U('register_menu_subtitle') .. #ownedVehicles)
        _menuPool:Add(registerMenu)

        for i = 1, #nearVehicles do
            for j = 1, #ownedVehicles do
                if string.match(GetVehicleNumberPlateText(nearVehicles[i]), ownedVehicles[j].plate) then
                    ownedVeh = ownedVehicles[j]
                    playerVeh = nearVehicles[i]
                    if string.starts(ownedVeh.plate, "LS ") or string.starts(ownedVeh.plate, "BC ") then
                        regStatus = true
                        local vehicleItem = NativeUI.CreateItem(GetVehicleNumberPlateText(nearVehicles[i]), "")
                        vehicleItem:RightLabel(tostring(regStatus))
                        registerMenu:AddItem(vehicleItem)
                    else 
                        regStatus = false
                        registerVehicle(registerMenu, ownedVeh, playerVeh, location)
                    end
                end
            end
        end

        registerMenu:Visible(true)
        _menuPool:RefreshIndex()
        _menuPool:MouseControlsEnabled(false)
        _menuPool:MouseEdgeEnabled(false)
        _menuPool:ControlDisablingEnabled(false)
    end)
end