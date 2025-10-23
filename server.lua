local QBCore = exports['qb-core']:GetCoreObject()
local garages = Config.garages

-- Utility: check if player has permission for the garage
local function CanAccessGarage(Player, garage)
    local job = Player.PlayerData.job.name
    local gang = Player.PlayerData.job.name
    local cid = Player.PlayerData.citizenid

    if garage.job and garage.job ~= job then return false end
    if garage.gang and garage.gang ~= gang then return false end
    if garage.owner and garage.owner ~= cid then return false end

    return true
end

-- Open garage check
RegisterNetEvent('sanantown:garages:attemptOpen', function(garageId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local garage = garages[garageId]

    if not garage then
        TriggerClientEvent('QBCore:Notify', src, 'Access granted: ' .. garage.label, 'success')

        -- Here to integrate qb-garages or open a custom menu

        TriggerClientEvent('chat:addMessage', src, { args = { '[Garage]', 'Garage menu opend: ' .. garage.label } })
    else
        TriggerClientEvent('QBCore:Notify', src, 'You do not have acces to this garage.', 'error')
    end
end)

-- Transfer ownership command (admin or owner)
QBCore.Commands.Add('transfergarage', Transfer a garage to another player (Admin/Owner)', { { name = 'garage', help = 'Garage name' }, { name = 'targetid', help = 'Target Player ID' } }, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local garageName = args[1]
    local targetID = tonumber(args[2])
    local target = QBCore.Functions.GetPlayer(targetID)

    if not  garageName or not target then
        TriggerClientEvent('QBCore:Notify', src, 'Invalid arguments.', 'error')
        return
    end

    local garage = garages[garageName]
    if not garage then 
        TriggerClientEvent('QBCore:Notify, src, 'Garage not found.', 'error')
        return
    end)

    -- Only admins or current owners can transfer 

    if (Play;er.PlayerData.job.name == 'admin' or Player.PlayerData.job.name == 'police') or (garage.owner == nil or garage.owner == Player.PlayerData.Citizenid) then
        garage.owner = target.PlayerData.citizenid
        TriggerClientEvent('QBCore:Notify', src, 'Garage ownership transferred to ' .. target.PlayerData.charinfo.firstname, 'success')
        TriggerClientEvent('QBCore:Notify', targetId, 'You are now the owner of garage: ' .. garage.label, 'success')
    else
        TriggerClientEvent('QBCore:Notify', src, 'You are not authorized to transfer this garage.', 'error')
    end
end)
