--[[
    Client-side Script for Population Density Management
    Author: Nesox (AI Generated)
    Description: Applies density multipliers based on GlobalState. Optimized for 0.00ms idle.
]]

-- Function to get current density or default
local function getDensity()
    return GlobalState.Density or { traffic = 1.0, peds = 1.0 }
end

local currentDensity = getDensity()

-- Listen for changes in GlobalState
AddStateBagChangeHandler('Density', 'global', function(bagName, key, value, _unused, replicated)
    if value then
        currentDensity = value
        -- Optional: Debug print
        -- print(string.format('New Density Received: Traffic: %.2f, Peds: %.2f', currentDensity.traffic, currentDensity.peds))
    end
end)

-- Main Thread
CreateThread(function()
    while true do
        local sleep = 1000 -- Default to 1 second wait (Idle optimization)

        local traffic = currentDensity.traffic
        local peds = currentDensity.peds

        -- Implementation of the requirement: 
        -- "La boucle... ne doit s'exécuter que si les valeurs sont différentes de celles par défaut (1.0)."
        if traffic ~= 1.0 or peds ~= 1.0 then
            sleep = 0 -- Run every frame when non-default

            -- Apply Traffic Multipliers
            if traffic ~= 1.0 then
                SetVehicleDensityMultiplierThisFrame(traffic)
                SetRandomVehicleDensityMultiplierThisFrame(traffic)
                SetParkedVehicleDensityMultiplierThisFrame(traffic)
            end

            -- Apply Pedestrian Multipliers
            if peds ~= 1.0 then
                SetPedDensityMultiplierThisFrame(peds)
                SetScenarioPedDensityMultiplierThisFrame(peds)
            end
        end

        Wait(sleep)
    end
end)

--[[
    ox_lib Menu Integration
]]

-- Register the Context Menu
lib.registerContext({
    id = 'density_menu',
    title = 'Gestion Densité Population',
    options = {
        {
            title = 'Modifier la Densité',
            description = 'Ajuster le trafic et les piétons',
            icon = 'users',
            onSelect = function()
                local input = lib.inputDialog('Ajuster la Densité (0.0 - 1.0)', {
                    {
                        type = 'slider',
                        label = 'Trafic (Véhicules)',
                        default = currentDensity.traffic,
                        min = 0.0,
                        max = 1.0,
                        step = 0.1,
                    },
                    {
                        type = 'slider',
                        label = 'Piétons (PNJ)',
                        default = currentDensity.peds,
                        min = 0.0,
                        max = 1.0,
                        step = 0.1,
                    },
                })
        
                if input then
                    local newTraffic = input[1]
                    local newPeds = input[2]
        
                    TriggerServerEvent('nesox_trafic:updateDensity', newTraffic, newPeds)
                end
            end,
        },
        {
            title = 'Réinitialiser (1.0)',
            description = 'Remettre les valeurs par défaut',
            icon = 'rotate-right',
            onSelect = function()
               TriggerServerEvent('nesox_trafic:updateDensity', 1.0, 1.0)
            end,
        }
    }
})

-- Command to open the menu or set density directly
RegisterCommand('setdensity', function(source, args)
    local traffic = tonumber(args[1])
    local peds = tonumber(args[2])

    -- If args provided, try to update
    if traffic and peds then
        TriggerServerEvent('nesox_trafic:updateDensity', traffic, peds)
    else
        -- No args, open menu
        lib.showContext('density_menu')
    end
end, false)
