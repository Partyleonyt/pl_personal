 --[[local menu7_einstelen = menu7:AddButton({ icon = '🕵️‍♂️', label = "Einstellen", description = "Stellt eine Person ein"})
    local menu7_feuern = menu7:AddButton({ icon = '🩸', label = "Feuern", description = "Feuert eine Person ein"})
    local menu7_ranghoch = menu7:AddButton({ icon = '📑', label = "Rang Höher", description = "Ändert den Rang einer Person nach Oben"})
    local menu7_rangrunter = menu7:AddButton({ icon = '📄', label = "Rang runter", description = "Änder den Rang einer Person nach Unten"})]]
    --[[local menu7_einstelen = menu7:AddButton({ icon = '🕵️‍♂️', label = "Einstellen", description = "Stellt eine Person ein"})
    local menu7_feuern = menu7:AddButton({ icon = '🩸', label = "Feuern", description = "Feuert eine Person ein"})
    local menu7_ranghoch = menu7:AddButton({ icon = '📑', label = "Rang Höher", description = "Ändert den Rang einer Person nach Oben"})
    local menu7_rangrunter = menu7:AddButton({ icon = '📄', label = "Rang runter", description = "Änder den Rang einer Person nach Unten"})
    menu7_einstelen:On('select', function(item)
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer == -1 or closestDistance > 3.0 then
            if Config.notify == 'qs' then
                exports['qs-notify']:Alert(_U('noplayer'), 3000, 'Info')
            elseif Config.notify == 'b-notify' then
                TriggerEvent('b-notify:notify', 'error', _U('personalheader'), _U('noplayer'))
            end
        else
            TriggerServerEvent('personalmenu:Boss_einstellen', GetPlayerServerId(closestPlayer))
        end
    end)
    menu7_feuern:On('select', function(item)
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer == -1 or closestDistance > 3.0 then
            if Config.notify == 'qs' then
                exports['qs-notify']:Alert(_U('noplayer'), 3000, 'Info')
            elseif Config.notify == 'b-notify' then
                TriggerEvent('b-notify:notify', 'error', _U('personalheader'), _U('noplayer'))
            end
        else
            TriggerServerEvent('personalmenu:Boss_feuern', GetPlayerServerId(closestPlayer))
        end
    end)
    menu7_ranghoch:On('select', function(item)
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer == -1 or closestDistance > 3.0 then
            if Config.notify == 'qs' then
                exports['qs-notify']:Alert(_U('noplayer'), 3000, 'Info')
            elseif Config.notify == 'b-notify' then
                TriggerEvent('b-notify:notify', 'error', _U('personalheader'), _U('noplayer'))
            end
        else
            TriggerServerEvent('personalmenu:Boss_ranghoch', GetPlayerServerId(closestPlayer))
        end
    end)
    menu7_rangrunter:On('select', function(item)
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if closestPlayer == -1 or closestDistance > 3.0 then
            if Config.notify == 'qs' then
                exports['qs-notify']:Alert(_U('noplayer'), 3000, 'Info')
            elseif Config.notify == 'b-notify' then
                TriggerEvent('b-notify:notify', 'error', _U('personalheader'), _U('noplayer'))
            end
        else
            TriggerServerEvent('personalmenu:Boss_rangrunter', GetPlayerServerId(closestPlayer))
        end
    end)]]