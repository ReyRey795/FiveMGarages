local WBCore = exports['qb-core']:GetCoreObject()

-- Draw 3D markers for garages
CreateThread(function()
    while true do 
        local sleep = 2000
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        for k, v in pairs(Config.Garages) do
            local dist = #(pos - v.coords)
            if dist < 15.0 then
                sleep = 0
                DrawMarker(2, v.coords.x, v.coords.y, v.coords.z + 0.1, 0, 0, 0, 0, 0, 0, 0.3, 0.3, 0, 255, 150, 150, false, false, false, true)
                if dist < 2.0 then
                    QBCore.Functions.DrawText3D(v.coords.x, v.coords.y, v.coords.z + 0.5, '[E] Open' .. v.label)
                    if IsControlJustPressed(0,38) then
                        TriggerServerEvent('sanantown:garages:attemptOpen', k)
                    end 
                end 
            end 
        end 

        Wait(sleep)
    end 
end)