local function getDensity()
    return GlobalState.Density or Config.DefaultDensity
end

local currentDensity = getDensity()

AddStateBagChangeHandler('Density', 'global', function(bagName, key, value, _unused, replicated)
    if value then
        currentDensity = value
    end
end)

CreateThread(function()
    while true do
        local sleep = 1000

        local traffic = currentDensity.traffic
        local peds = currentDensity.peds

        if traffic ~= Config.DefaultDensity.traffic or peds ~= Config.DefaultDensity.peds then
            sleep = 0

            if traffic ~= Config.DefaultDensity.traffic then
                SetVehicleDensityMultiplierThisFrame(traffic)
                SetRandomVehicleDensityMultiplierThisFrame(traffic)
                SetParkedVehicleDensityMultiplierThisFrame(traffic)
            end

            if peds ~= Config.DefaultDensity.peds then
                SetPedDensityMultiplierThisFrame(peds)
                SetScenarioPedDensityMultiplierThisFrame(peds)
            end
        end

        Wait(sleep)
    end
end)

lib.registerContext({
    id = 'density_menu',
    title = _U('menu_title'),
    options = {
        {
            title = _U('menu_modify'),
            description = _U('menu_modify_desc'),
            icon = 'users',
            onSelect = function()
                local input = lib.inputDialog(_U('menu_adjust_dialog'), {
                    {
                        type = 'slider',
                        label = _U('menu_traffic'),
                        default = currentDensity.traffic,
                        min = 0.0,
                        max = 1.0,
                        step = 0.1,
                    },
                    {
                        type = 'slider',
                        label = _U('menu_peds'),
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
            title = _U('menu_reset'),
            description = _U('menu_reset_desc'),
            icon = 'rotate-right',
            onSelect = function()
               TriggerServerEvent('nesox_trafic:updateDensity', Config.DefaultDensity.traffic, Config.DefaultDensity.peds)
            end,
        }
    }
})

RegisterCommand('setdensity', function(source, args)
    local traffic = tonumber(args[1])
    local peds = tonumber(args[2])

    if traffic and peds then
        TriggerServerEvent('nesox_trafic:updateDensity', traffic, peds)
    else
        lib.showContext('density_menu')
    end
end, false)
