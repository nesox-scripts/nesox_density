AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    if not GlobalState.Density then
        GlobalState.Density = Config.DefaultDensity
        print(_U('print_init'))
    end
end)

RegisterNetEvent('nesox_trafic:updateDensity', function(traffic, peds)
    local src = source

    if not IsPlayerAceAllowed(src, 'command.setdensity') then
        TriggerClientEvent('ox_lib:notify', src, { type = 'error', description = _U('notify_no_permission') })
        print(_U('print_unauthorized', src))
        return
    end

    if type(traffic) ~= 'number' or type(peds) ~= 'number' then return end

    GlobalState.Density = { traffic = traffic, peds = peds }

    print(_U('print_updated', src, traffic, peds))
    TriggerClientEvent('ox_lib:notify', src, { type = 'success', description = _U('notify_success') })
end)
