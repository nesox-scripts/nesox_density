--[[
    Server-side Script for Population Density Management
    Author: Nesox (AI Generated)
    Description: Manages GlobalState for density and handles the /setdensity command with ACE permissions.
]]

-- Set default values on resource start
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    -- Initialize GlobalState if not already set
    if not GlobalState.Density then
        GlobalState.Density = { traffic = 1.0, peds = 1.0 }
        print('^2[Nesox Traffic] ^7Initialized default density values (1.0).')
    end
end)



--[[
    Event: nesox_trafic:updateDensity
    Description: Secure event to update density from UI. Checks permissions.
]]
RegisterNetEvent('nesox_trafic:updateDensity', function(traffic, peds)
    local src = source

    -- Security Check: ACE Permission
    if not IsPlayerAceAllowed(src, 'command.setdensity') then
        TriggerClientEvent('ox_lib:notify', src, { type = 'error', description = 'You do not have permission to use this.' })
        print(string.format('^1[Nesox Traffic] Unauthorized access attempt by ID %s', src))
        return
    end

    -- Validation
    if type(traffic) ~= 'number' or type(peds) ~= 'number' then return end

    -- Update GlobalState
    GlobalState.Density = { traffic = traffic, peds = peds }

    -- Log
    print(string.format('^2[Nesox Traffic] Density updated by ID %s. Traffic: %.2f, Peds: %.2f', src, traffic, peds))
    TriggerClientEvent('ox_lib:notify', src, { type = 'success', description = 'Population density updated successfully.' })
end)
