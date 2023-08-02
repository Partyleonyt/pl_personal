--Locals
    ESX = exports["es_extended"]:getSharedObject()
    local isnoclipping = false
    local noclipspeed = Config.defaultnoclipspeed
    local NRPadmin = true
    local group = nil
    local adutymode = false
    isusingfuncs = false
    Player = {
    	showCoords = false,
        invis = false,
    	showName = false,
    	group = 'user',
    }
    societymoney = 0
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(xPlayer)
    	ESX.PlayerData = xPlayer
        ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
            Config.group = group
        end)
    end)
    RegisterNetEvent('esx:setJob')
    AddEventHandler('esx:setJob', function(job)
    	ESX.PlayerData.job = job
    end)
    RegisterNetEvent('esx_addonaccount:setMoney')
    AddEventHandler('esx_addonaccount:setMoney', function(society, money)
    	if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' and 'society_' .. ESX.PlayerData.job.name == society then
    		societymoney = ESX.Math.GroupDigits(money)
    	end
    end)

--Job Menu
    local menu7 = MenuV:CreateMenu(false, _U('jobmanagetitle'), Config.position, Config.color.r, Config.color.g, Config.color.b, 'size-'..Config.size, Config.headerpngnormal, 'menuv')
        menu7:On('Open', function()
            menu7:ClearItems()
            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
        		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
        			societymoney = ESX.Math.GroupDigits(money)
        		end, ESX.PlayerData.job.name)
        	end
            local menu7_money = menu7:AddButton({ icon = '💰', label = _U('societymoney')..' '.._U('loading'), description = "Lädt"})
        
            Wait(1000)
            menu7:ClearItems()
            Wait(1)
            if societymoney ~= nil then
                local menu7_money = menu7:AddButton({ icon = '💰', label = _U('societymoney')..': '..societymoney.."$", description = societymoney.."$"})
                else
                local menu7_money = menu7:AddButton({ icon = '💰', label = _U('societymoney')..' '.._U('error'), description = "ERROR$"})
            end
    end)
--Persionalien
    local menu2 = MenuV:CreateMenu(false, _U('personalheader'), Config.position, Config.color.r, Config.color.g, Config.color.b, 'size-'..Config.size, Config.headerpngnormal, 'menuv')
        menu2:On('open', function()
            menu2:ClearItems()
            local menu2_job = menu2:AddButton({icon = '👮🏻‍♂️', label = _U('job')..': '..ESX.PlayerData.job.label..'\n '.._U('rank')..': '..ESX.PlayerData.job.grade_label, description = _U('youjob')})
            if Config.useonebutton then
                local ausweisstate = true
                local fuhrerscheinstate = true
                local waffenscheinstate = true
                local ausweis = menu2:AddSlider({ icon = '🎫', label = _U('id'), description = _U('id'), value = 'auswa', values = {
                    { label = _U('watch'), value = 'true', description = _U('watch2')..' '.._U('id') },
                    { label = _U('show'), value = 'false', description = _U('show2')..' '.._U('id') }
                }})
                local fuhrerschein = menu2:AddSlider({ icon = '🚗', label = _U('drive'), description = _U('drive'), value = 'fuhra', values = {
                    { label = _U('watch'), value = 'fuhra', description =  _U('watch2')..' '.._U('drive') },
                    { label = _U('show'), value = 'fuhrz', description =  _U('show2')..' '.._U('drive') }
                }})
                local waffenschein = menu2:AddSlider({ icon = '🪓', label = _U('weapon'), description = _U('weapon'), value = 'demo', values = {
                    { label = _U('watch'), value = 'wepa', description = _U('watch2')..' '.._U('weapon') },
                    { label = _U('show'), value = 'wepz', description = _U('show2')..' '.._U('weapon') }
                }})
                ausweis:On('change', function(item, newValue, oldValue)
                    ausweisstate = not ausweisstate
                end)
                fuhrerschein:On('change', function(item, newValue, oldValue)
                    fuhrerscheinstate = not fuhrerscheinstate
                end)
                waffenschein:On('change', function(item, newValue, oldValue)
                    waffenscheinstate = not waffenscheinstate
                end)
                ausweis:On('select', function(item, value) 
                    --print(('YOU SELECTED'..value))

                    if ausweisstate then
                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                        MenuV:CloseAll()
                    elseif not ausweisstate then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestDistance ~= -1 and closestDistance <= 3.0 then
                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
                            MenuV:CloseAll()
                        else
                            if Config.notify == 'qs' then
                                exports['qs-notify']:Alert(_U('noplayer'), 3000, Config.infotype)
                            elseif Config.notify == 'b-notify' then
                                TriggerEvent('b-notify:notify', Config.errortype, _U('personalheader'), _U('noplayer'))
                            elseif Config.notify == 'cs-hud' then
                                exports['cs_hud']:showNotification(_U('personalheader'), _U('noplayer'), Config.errortype, 3000)
                            else
                                notify(_U('personalheader'),_U('noplayer'), Config.errortype, 3000)
                            end
                        end
                    end
                end)
                fuhrerschein:On('select', function(item, value) 
                    if fuhrerscheinstate then
                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
                        MenuV:CloseAll()
                    elseif not fuhrerscheinstate then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestDistance ~= -1 and closestDistance <= 3.0 then
                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver')
                            MenuV:CloseAll()
                        else
                            if Config.notify == 'qs' then
                                exports['qs-notify']:Alert(_U('noplayer'), 3000, Config.infotype)
                            elseif Config.notify == 'b-notify' then
                                TriggerEvent('b-notify:notify', Config.errortype, _U('personalheader'), _U('noplayer'))
                            elseif Config.notify == 'cs-hud' then
                                exports['cs_hud']:showNotification(_U('personalheader'), _U('noplayer'), Config.errortype, 3000)
                            else
                                notify(_U('personalheader'),_U('noplayer'), Config.errortype, 3000)
                            end
                        end
                    end
                end)
                waffenschein:On('select', function(item, value) 
                    if waffenscheinstate then
                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
                        MenuV:CloseAll()
                    elseif not waffenscheinstate then
                        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                        if closestDistance ~= -1 and closestDistance <= 3.0 then
                            TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon')
                            MenuV:CloseAll()
                        else
                            if Config.notify == 'qs' then
                                exports['qs-notify']:Alert(_U('noplayer'), 3000, Config.infotype)
                            elseif Config.notify == 'b-notify' then
                                TriggerEvent('b-notify:notify', Config.errortype, _U('personalheader'), _U('noplayer'))
                            elseif Config.notify == 'cs-hud' then
                                exports['cs_hud']:showNotification(_U('personalheader'), _U('noplayer'), Config.errortype, 3000)
                            else
                                notify(_U('personalheader'),_U('noplayer'), Config.errortype, 3000)
                            end
                    end
                    end
                end)
            else
                local menu2_auswa = menu2:AddButton({ icon = '🎫', label = _U('id')..' '.._U('watch'), description = 'Zeigt Dir Deinen Ausweis'})
                local menu2_auswz = menu2:AddButton({ icon = '🎫', label = _U('id')..' '.._U('show'), description = 'Zeigt Einer Person Deinen Ausweis'})
                local menu2_fuhra = menu2:AddButton({ icon = '🚗', label = _U('drive')..' '.._U('watch'), description = 'Zeigt dir Deinen Führerschein'})
                local menu2_fuhrz = menu2:AddButton({ icon = '🚗', label = _U('drive')..' '.._U('show'), description = 'Zeigt Einer Person Deinen Führerschein'})
                local menu2_wepa = menu2:AddButton({ icon = '🪓', label = _U('weapon')..' '.._U('show'), description = 'Zeigt dir Deinen Waffenschein'})
                local menu2_wepz = menu2:AddButton({ icon = '🪓', label = _U('weapon')..' '.._U('show'), description = 'Zeigt Einer Person Deinen Waffenschein'})
                menu2_auswa:On('select', function(item)
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                    MenuV:CloseAll()
                end)
                menu2_auswz:On('select', function(item)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance ~= -1 and closestDistance <= 3.0 then
                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
                        MenuV:CloseAll()
                    else
                        if Config.notify == 'qs' then
                            exports['qs-notify']:Alert(_U('noplayer'), 3000, Config.infotype)
                        elseif Config.notify == 'b-notify' then
                            TriggerEvent('b-notify:notify', Config.errortype, _U('personalheader'), _U('noplayer'))
                        elseif Config.notify == 'cs-hud' then
                            exports['cs_hud']:showNotification(_U('personalheader'), _U('noplayer'), Config.errortype, 3000)
                        else
                            notify(_U('personalheader'),_U('noplayer'), Config.errortype, 3000)
                        end
                    end
                end)
                menu2_fuhra:On('select', function(item)
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
                    MenuV:CloseAll()
                end)
                menu2_fuhrz:On('select', function(item)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance ~= -1 and closestDistance <= 3.0 then
                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'driver')
                        MenuV:CloseAll()
                    else
                        if Config.notify == 'qs' then
                            exports['qs-notify']:Alert(_U('noplayer'), 3000, Config.infotype)
                        elseif Config.notify == 'b-notify' then
                            TriggerEvent('b-notify:notify', Config.errortype, _U('personalheader'), _U('noplayer'))
                        elseif Config.notify == 'cs-hud' then
                            exports['cs_hud']:showNotification(_U('personalheader'), _U('noplayer'), Config.errortype, 3000)
                        else
                            notify(_U('personalheader'),_U('noplayer'), Config.errortype, 3000)
                        end
                    end
                end)
                menu2_wepa:On('select', function(item)
                    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
                    MenuV:CloseAll()
                end)
                menu2_wepz:On('select', function(item)
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
                    if closestDistance ~= -1 and closestDistance <= 3.0 then
                        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon')
                        MenuV:CloseAll()
                    else
                        if Config.notify == 'qs' then
                            exports['qs-notify']:Alert(_U('noplayer'), 3000, Config.infotype)
                        elseif Config.notify == 'b-notify' then
                            TriggerEvent('b-notify:notify', Config.errortype, _U('personalheader'), _U('noplayer'))
                        elseif Config.notify == 'cs-hud' then
                            exports['cs_hud']:showNotification(_U('personalheader'), _U('noplayer'), Config.errortype, 3000)
                        else
                            notify(_U('personalheader'),_U('noplayer'), Config.errortype, 3000)
                        end
                    end
                end)
            end
            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
        		local menu2_jobmenu = menu2:AddButton({ icon = '👮🏻‍♂️', label = _U('job')..' '.._U('menu'), description = _U('managefromjob'), value = menu7})
        	end
    end)
--Kleidungs Menu
    local menu3 = MenuV:CreateMenu(false, _U('clothing'), Config.position, Config.color.r, Config.color.g, Config.color.b, 'size-'..Config.size, Config.headerpngnormal, 'menuv', 'NRP: Kleidung')
        local menu3_hut = menu3:AddButton({ icon = '🧢', label = _U('hat'), description = _U('draws')..' '.._U('hat')..' '.._U('onoff')})
        menu3_hut:On('select', function(item)
            ExecuteCommand(Config.hutcmd)
        end)
        local menu3_brille = menu3:AddButton({ icon = '👓', label = _U('glasses'), description = _U('draws')..' '.._U('glasses')..' '.._U('onoff')})
        menu3_brille:On('select', function(item)
            ExecuteCommand(Config.brillecmd)
        end)
        local menu3_maske = menu3:AddButton({ icon = '🤿', label = _U('mask'), description = _U('draws')..' '.._U('mask')..' '.._U('onoff')})
        menu3_maske:On('select', function(item)
            ExecuteCommand(Config.maskecmd)
        end)
        local menu3_hemd = menu3:AddButton({ icon = '👕', label = _U('shirt'), description = _U('draws')..' '.._U('shirt')..' '.._U('onoff')})
        menu3_hemd:On('select', function(item)
            ExecuteCommand(Config.hemdcmd)
        end)
        local menu3_weste = menu3:AddButton({ icon = '🧥', label = _U('vest'), description = _U('draws')..' '.._U('vest')..' '.._U('onoff')})
        menu3_weste:On('select', function(item)
            ExecuteCommand(Config.westecmd)
        end)
        local menu3_rucksack = menu3:AddButton({ icon = '💣', label = _U('backpack'), description = _U('draws')..' '.._U('backpack')..' '.._U('onoff')})
        menu3_rucksack:On('select', function(item)
            ExecuteCommand(Config.backpackcmd)
        end)
        local menu3_hose = menu3:AddButton({ icon = '👖', label = _U('pants'), description = _U('draws')..' '.._U('pants')..' '.._U('onoff')})
        menu3_hose:On('select', function(item)
            ExecuteCommand(Config.hosecmd)
        end)
        local menu3_schuhe = menu3:AddButton({ icon = '👟', label = _U('shoes'), description = _U('draws')..' '.._U('shoes')..' '.._U('onoff')})
        menu3_schuhe:On('select', function(item)
            ExecuteCommand(Config.schuhecmd)
        end)
        local menu3_ohr = menu3:AddButton({ icon = '🎧', label = _U('ear'), description = _U('draws')..' '.._U('ear')..' '.._U('onoff')})
        menu3_ohr:On('select', function(item)
            ExecuteCommand(Config.earcmd)
        end)
        local menu3_kette = menu3:AddButton({ icon = '💍', label = _U('chain'), description = _U('draws')..' '.._U('chain')..' '.._U('onoff')})
        menu3_kette:On('select', function(item)
            ExecuteCommand(Config.chaincmd)
        end)
        local menu3_uhr = menu3:AddButton({ icon = '⌚', label = _U('glock'), description = _U('draws')..' '.._U('glock')..' '.._U('onoff')})
        menu3_uhr:On('select', function(item)
            ExecuteCommand(Config.glockcmd)
        end)
        local menu3_reset = menu3:AddButton({ icon = '⏳', label = _U('reset'), description = _U('resetdesc')})
        menu3_reset:On('select', function(item)
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
            ExecuteCommand(Config.ResetClothingcmd)
        end)
        local menu3_reset2 = menu3:AddButton({ icon = '⏳', label = _U('reset2'), description = _U('reset2desc')})
        menu3_reset2:On('select', function(item)
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
        end)
--Admin
    local menu4 = MenuV:CreateMenu(false, _U('admin'), Config.position, Config.color.r, Config.color.g, Config.color.b, 'size-'..Config.size, Config.headerpngnormal, 'menuv')
        menu4:On('open', function()
            ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
                Config.group = group
            end)
            menu4:ClearItems()
            --if adutymode then
            if isusingfuncs == false then
                local menu4_noclip = menu4:AddCheckbox({ icon = '🐦', label = _U('noclip'), description = _U('doubleformat', _U('onoff'), _U('noclip')), value = 'n' })
                menu4_noclip:On('check', function(item)
                    if adutymode then
                        togglenoclip()
                    else
                    if Config.notify == 'qs' then
                        exports['qs-notify']:Alert(_U('noaduty'), 3000, Config.infotype)
                    elseif Config.notify == 'b-notify' then
                        TriggerEvent('b-notify:notify', Config.errortype, _U('aduty'), _U('noaduty'))
                    elseif Config.notify == 'cs-hud' then
                        exports['cs_hud']:showNotification(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                    else
                        notify(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                    end
                    end
                end)
                menu4_noclip:On('uncheck', function(item)
                    isusingfuncs = false
                    isnoclipping = false
                    SetEntityVisible(PlayerPedId(), true)
                end)
            elseif isusingfuncs == true then
                local menu4_noclip = menu4:AddCheckbox({ icon = '🐦', label = _U('noclip'), description = _U('doubleformat', _U('onoff'), _U('noclip')), value = 'y' })
                menu4_noclip:On('check', function(item)
                    if adutymode then
                        togglenoclip()
                    else
                    if Config.notify == 'qs' then
                        exports['qs-notify']:Alert(_U('noaduty'), 3000, Config.infotype)
                    elseif Config.notify == 'b-notify' then
                        TriggerEvent('b-notify:notify', Config.errortype, _U('aduty'), _U('noaduty'))
                    elseif Config.notify == 'cs-hud' then
                        exports['cs_hud']:showNotification(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                    else
                        notify(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                    end   
                    end
                end)
                menu4_noclip:On('uncheck', function(item)
                    isusingfuncs = false
                    isnoclipping = false
                    SetEntityVisible(PlayerPedId(), true)
                end)
            end
            local menu4_range = menu4:AddRange({ icon = '💨', label = _U('doubleformat', _U('noclip'), _U('speed')), description = _U('speedd'), min = 0, max = 10, value = noclipspeed, saveOnUpdate = true })
            if adutymode then 
                local menu4_aduty = menu4:AddCheckbox({ icon = '👮‍♂️', label = _U('aduty'), description = _U('doubleformat', _U('onoff'), _U('aduty')), value = 'y' })
                menu4_aduty:On('check', function(item)
                    ExecuteCommand(Config.adutycmd)
                end)
                menu4_aduty:On('uncheck', function(item)
                    ExecuteCommand(Config.adutycmd)
                end)
            elseif not adutymode then
                local menu4_aduty = menu4:AddCheckbox({ icon = '👮‍♂️', label = _U('aduty'), description = _U('doubleformat', _U('onoff'), _U('aduty')), value = 'n' })
                menu4_aduty:On('check', function(item)
                    ExecuteCommand(Config.adutycmd)
                end)
                menu4_aduty:On('uncheck', function(item)
                    ExecuteCommand(Config.adutycmd)
                end)
            end
            if Player.showName == false then
                local menu4_names = menu4:AddCheckbox({ icon = '🪂', label = _U('names'), description = _U('doubleformat', _U('onoff'), _U('names')), value = 'n'})
                menu4_names:On('check', function(item)
                    if adutymode then
                        Player.showName = true
                        Wait(1)
                        toggleNameDisplay()
                    else
                    if Config.notify == 'qs' then
                        exports['qs-notify']:Alert(_U('noaduty'), 3000, Config.infotype)
                    elseif Config.notify == 'b-notify' then
                        TriggerEvent('b-notify:notify', Config.errortype, _U('aduty'), _U('noaduty'))
                    elseif Config.notify == 'cs-hud' then
                        exports['cs_hud']:showNotification(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                    else
                        notify(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                    end 
                    end
                end)
                menu4_names:On('uncheck', function(item)
                    Player.showName = false
                    Wait(1)
                    toggleNameDisplay()
                end)
            elseif Player.showName == true then
                local menu4_names = menu4:AddCheckbox({ icon = '🪂', label = _U('names'), description = _U('doubleformat', _U('onoff'), _U('names')), value = 'y'})
                menu4_names:On('check', function(item)
                    if adutymode then
                        Player.showName = true
                        Wait(1)
                        toggleNameDisplay()
                    else
                    if Config.notify == 'qs' then
                        exports['qs-notify']:Alert(_U('noaduty'), 3000, Config.infotype)
                    elseif Config.notify == 'b-notify' then
                        TriggerEvent('b-notify:notify', Config.errortype, _U('aduty'), _U('noaduty'))
                    elseif Config.notify == 'cs-hud' then
                        exports['cs_hud']:showNotification(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                    else
                        notify(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                    end 
                    end
                end)
                menu4_names:On('uncheck', function(item)
                    Player.showName = false
                    Wait(1)
                    toggleNameDisplay()
                end)
            end
            if not Player.invis then
                local menu4_gohst = menu4:AddCheckbox({ icon = '👻', label = _U('vanish'), description = _U('doubleformat', _U('onoff'), _U('vanish')), value = 'n' })
                menu4_gohst:On('check', function(item)
                    vanish()
                end)
                menu4_gohst:On('uncheck', function(item)
                    vanish()
                end)
            elseif Player.invis then
                local menu4_gohst = menu4:AddCheckbox({ icon = '👻', label = _U('vanish'), description = _U('doubleformat', _U('onoff'), _U('vanish')), value = 'y' })
                menu4_gohst:On('check', function(item)
                    vanish()
                end)
                menu4_gohst:On('uncheck', function(item)
                    vanish()
                end)
            end
            if Config.group == "admin" then
                local menu4_tpmaker = menu4:AddButton({ icon = '📍', label = _U('tpm'), description = _U('tpmd')})
                local menu4_heal = menu4:AddButton({ icon = '🚑', label = _U('heal'), description = _U('heald')})
                local menu4_armor = menu4:AddButton({ icon = '🔨', label = _U('armor'), description = _U('armord')})
                local menu4_rev = menu4:AddButton({ icon = '👨‍⚕️', label = _U('revive'), description = _U('revived')})
            menu4_rev:On('select', function(item)
            ExecuteCommand("revive me")
            end)
            menu4_heal:On('select', function(item)
            if adutymode then
                ExecuteCommand("heal me")
            else
                if Config.notify == 'qs' then
                    exports['qs-notify']:Alert(_U('noaduty'), 3000, Config.infotype)
                elseif Config.notify == 'b-notify' then
                    TriggerEvent('b-notify:notify', Config.errortype, _U('aduty'), _U('noaduty'))
                elseif Config.notify == 'cs-hud' then
                    exports['cs_hud']:showNotification(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                else
                    notify(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                end
            end
            end)
            menu4_armor:On('select', function(item)
            if adutymode then
                SetPedArmour(PlayerPedId(), 100)
            else
                if Config.notify == 'qs' then
                    exports['qs-notify']:Alert(_U('noaduty'), 3000, Config.infotype)
                elseif Config.notify == 'b-notify' then
                    TriggerEvent('b-notify:notify', Config.errortype, _U('aduty'), _U('noaduty'))
                elseif Config.notify == 'cs-hud' then
                    exports['cs_hud']:showNotification(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                else
                    notify(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                end
            end

            end)
            menu4_tpmaker:On('select', function(item)
                tpm()
            end)
            end
            menu4_range:On('change', function(item, newValue, oldValue)
                noclipspeed = newValue
            end)
    end)
--Default Page
    local menu = MenuV:CreateMenu(false, _U('personalheader'), Config.position, Config.color.r, Config.color.g, Config.color.b, 'size-'..Config.size, Config.headerpngnormal, 'menuv')
    menu:On('open', function()
        menu:ClearItems()
        RegisterNetEvent('esx:playerLoaded')
            AddEventHandler('esx:playerLoaded', function(xPlayer)
    	    ESX.PlayerData = xPlayer
        end)
        ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
            Config.group = group
            if Config.Debug then
                print("Deine rolle ist "..Config.group)
            end
        end)
        Wait(1)
        local menu_perso = menu:AddButton({ icon = '🔷', label = _U('personals'), value = menu2, description = _U('personalsdesc')})
        if Config.useKleidung then local menu_klothing = menu:AddButton({ icon = '🥼', label = _U('clothing'), value = menu3, description = _U('clothingmenu')}) end
        local menu_vehicleoptions = menu:AddButton({ icon = '🚘', label = _U('carmenu'), value = menu6, description = 'Auto Menu'})
        if Config.group == "admin" or Config.group == "mod" or Config.group == "sup" then
            local menu_admintools = menu:AddButton({ icon = '🛠', label = _U('admin'), value = menu4, description = 'Open Admin Tools' })
        elseif Config.Debug == true then
            local menu_admintools = menu:AddButton({ icon = '🛠', label = _U('admin'), value = menu4, description = 'Open Admin Tools' })
        else
            local menu_admintools = menu:AddButton({ icon = '🛠', label = _U('admin'), value = menu4, description = 'Open Admin Tools', disabled = true })
        end
        menu_vehicleoptions:On('select', function(item)
        local inveh = IsPedInAnyVehicle(PlayerPedId(), false)
        if inveh then
            ExecuteCommand(Config.carmenucmd)
            menu:Close()
        else
            if Config.notify == 'qs' then
                exports['qs-notify']:Alert(_U('novehodriver'), 3000, Config.infotype)
            elseif Config.notify == 'b-notify' then
                TriggerEvent('b-notify:notify', Config.errortype, _U('carmenu'), _U('novehodriver'))
            elseif Config.notify == 'cs-hud' then
                exports['cs_hud']:showNotification(_U('carmenu'), _U('novehodriver'), Config.errortype, 4000)
            else
                notify(_U('carmenu'), _U('novehodriver'), Config.errortype, 4000)
            end 
        end
        end)
    end)
--Functions
    function tpm()
        RegisterNetEvent('esx:playerLoaded')
        AddEventHandler('esx:playerLoaded', function(xPlayer)
        ESX.PlayerData = xPlayer
        end)
        ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
        Config.group = group
        end)
        if Config.group == "admin" then
        if adutymode then
            local _waypoint = GetFirstBlipInfoId(8)
            if DoesBlipExist(_waypoint) then
                local waypointCoords = GetBlipInfoIdCoord(_waypoint)
            
                for height = 1, 1000 do
                    SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
                
                    local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)
                
                    if foundGround then
                        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
                        break
                    end
                
                    Citizen.Wait(5)
                end
            end
            else
                if Config.notify == 'qs' then
                    exports['qs-notify']:Alert(_U('noaduty'), 3000, Config.infotype)
                elseif Config.notify == 'b-notify' then
                    TriggerEvent('b-notify:notify', Config.errortype, _U('aduty'), _U('noaduty'))
                elseif Config.notify == 'cs-hud' then
                    exports['cs_hud']:showNotification(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                else
                    notify(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                end
             end
        else
        if Config.notify == 'qs' then
            exports['qs-notify']:Alert(_U('nopermisson'), 3000, Config.infotype)
        elseif Config.notify == 'b-notify' then
            TriggerEvent('b-notify:notify', Config.errortype, _U('aduty'), _U('nopermisson'))
        elseif Config.notify == 'cs-hud' then
            exports['cs_hud']:showNotification(_U('aduty'), _U('nopermisson'), Config.infotype, 4000)
        else
            notify(_U('aduty'), _U('nopermisson'), Config.infotype, 4000)
        end 
        end
        end
    function toggelnames()
        RegisterNetEvent('esx:playerLoaded')
        AddEventHandler('esx:playerLoaded', function(xPlayer)
        ESX.PlayerData = xPlayer
        end)
        ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
        Config.group = group
        end)
        if Config.group == "admin" or Config.group == "mod" or Config.group == "sup" then
            if adutymode then
                if Player.showName == false then
                    Player.showName = true
                    Wait(1)
                    toggleNameDisplay()
                elseif Player.showName == true then
                    Player.showName = false
                    Wait(1)
                    toggleNameDisplay()
                end
            else
                if Config.notify == 'qs' then
                    exports['qs-notify']:Alert(_U('noaduty'), 3000, Config.infotype)
                elseif Config.notify == 'b-notify' then
                    TriggerEvent('b-notify:notify', Config.errortype, _U('aduty'), _U('noaduty'))
                elseif Config.notify == 'cs-hud' then
                    exports['cs_hud']:showNotification(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                else
                    notify(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                end 
            end
        else
            if Config.notify == 'qs' then
                exports['qs-notify']:Alert(_U('nopermisson'), 3000, Config.infotype)
            elseif Config.notify == 'b-notify' then
                TriggerEvent('b-notify:notify', Config.errortype, _U('aduty'), _U('nopermisson'))
            elseif Config.notify == 'cs-hud' then
                exports['cs_hud']:showNotification(_U('aduty'), _U('nopermisson'), Config.infotype, 4000)
            else
                notify(_U('aduty'), _U('nopermisson'), Config.infotype, 4000)
            end 
        end  
        end
    function vanish()
        RegisterNetEvent('esx:playerLoaded')
        AddEventHandler('esx:playerLoaded', function(xPlayer)
        ESX.PlayerData = xPlayer
        end)
        ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
        Config.group = group
        end)
        if Config.group == "admin" or Config.group == "mod" or Config.group == "sup" then
            if adutymode then
                Player.invis = not Player.invis
                if Player.invis then
                    SetEntityVisible(PlayerPedId(), false)
                else
                    SetEntityVisible(PlayerPedId(), true)
                end
            else
                if Config.notify == 'qs' then
                    exports['qs-notify']:Alert(_U('noaduty'), 3000, Config.infotype)
                elseif Config.notify == 'b-notify' then
                    TriggerEvent('b-notify:notify', Config.errortype, _U('aduty'), _U('noaduty'))
                elseif Config.notify == 'cs-hud' then
                    exports['cs_hud']:showNotification(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                else
                    notify(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                end 
            end 
        else
        if Config.notify == 'qs' then
            exports['qs-notify']:Alert(_U('nopermisson'), 3000, Config.infotype)
        elseif Config.notify == 'b-notify' then
            TriggerEvent('b-notify:notify', Config.errortype, _U('aduty'), _U('nopermisson'))
        elseif Config.notify == 'cs-hud' then
            exports['cs_hud']:showNotification(_U('aduty'), _U('nopermisson'), Config.infotype, 4000)
        else
            notify(_U('aduty'), _U('nopermisson'), Config.infotype, 4000)
        end 
        end
        end
    function toggleNameDisplay()--Names
        CreateThread(function()
            local playerPed = PlayerPedId()
            local playerId = PlayerId()

            while Player.showName do
                Wait(5)
                local players = GetActivePlayers()
                --print(players)
                for i = 1, #players do
                    local playerPed = PlayerPedId()
                    local playersPed = GetPlayerPed(players[i])


                    local headCoord = GetPedBoneCoords(playersPed, 0x796E, 0, 0, 0)
                    local playerCoord = GetEntityCoords(playerPed)
                    local playerIds = GetPlayerServerId(players[i])
                    local playernames = GetPlayerName(players[i])
                    local playerHealth = math.floor(GetEntityHealth(playersPed) - 100 --[[/ GetEntityMaxHealth(playersPed) * 200]])
                    local playerArmor = GetPedArmour(playersPed)

                    local dist = #(headCoord.xyz - playerCoord.xyz)
                    if playerHealth ~= -1 and playerHealth <= 0 then
                        playerHealth = "Dead"
                    end
                    -- if playersPed ~= playerPed then
                        if dist < 300 then
                            local playerName = '['..playerIds..'] ~h~'..playernames..'~h~\nHealth: ~r~~h~'..playerHealth..' ~h~~s~Armor: ~b~~h~'..playerArmor
                            Draw3DText(headCoord.x, headCoord.y, headCoord.z + 0.6, playerName, 255, 255, 255, 0.25)
                        end
                    -- end
                end
            end
        end)
        end
    function Draw3DText(x, y, z, msg, r, g, b, size)
        SetDrawOrigin(x, y, z, 0)
        SetTextFont(0)
        SetTextProportional(0)
        SetTextScale(0, size or 0.2)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(msg)
        DrawText(0, 0)
        ClearDrawOrigin()
        end
    function togglenoclip()
        if isusingfuncs == true then
            isusingfuncs = false
            isnoclipping = false
            SetEntityVisible(PlayerPedId(), true)
        elseif isusingfuncs == false then
            isusingfuncs = true
            isnoclipping = true
        end
        end
    function cleanPlayer(playerPed)
        SetPedArmour(playerPed, 0)
        ClearPedBloodDamage(playerPed)
        ResetPedVisibleDamage(playerPed)
        ClearPedLastWeaponDamage(playerPed)
        ResetPedMovementClipset(playerPed, 0)
        end
    function setUniform(playerPed)
        local playerPed = PlayerPedId()
        TriggerEvent('skinchanger:getSkin', function(skin)
        ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
            if skin.sex == 0 then
                    if group == "admin" then
                        TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.admin.male)
                    elseif group == "mod" then
                        TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.mod.male)
                    elseif group == "dev" then
                        TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.dev.male)					
                    elseif group == "sup" then
                        TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.sup.male)					
                    end
                else
                    if group == "admin" then
                        TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.admin.female)
                    elseif group == "mod" then
                        TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.mod.female)
                    elseif group == "sup" then
                        TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.sup.female)					
                    elseif group == "dev" then
                        TriggerEvent("skinchanger:loadClothes", skin, Config.Admin.dev.female)					
                    end
                end
            end)
        end)
        end
    Citizen.CreateThread(function()--Noclip
        while NRPadmin do
            Citizen.Wait(0)
            if isusingfuncs then
                if isnoclipping then
                    local _ped = PlayerPedId()
                    local _pcoords = GetEntityCoords(_ped)
                    local _x = _pcoords.x
                    local _y = _pcoords.y
                    local _z = _pcoords.z
                    local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(PlayerPedId())
                    local pitch = GetGameplayCamRelativePitch()
                    local x = -math.sin(heading*math.pi/180.0)
                    local y = math.cos(heading*math.pi/180.0)
                    local z = math.sin(pitch*math.pi/180.0)
                    local len = math.sqrt(x*x+y*y+z*z)
                    if len ~= 0 then
                      x = x/len
                      y = y/len
                      z = z/len
                    end
                    local speednoclip = noclipspeed * 2
                    local normalnoclipspeed = noclipspeed
                    local _camx = x
                    local _camy = y
                    local _camz = z
                    if IsControlPressed(0, 32) then
                        _x = _x + noclipspeed * _camx
                        _y = _y + noclipspeed * _camy
                        _z = _z + noclipspeed * _camz
                    elseif IsControlPressed(0, 33) then
                        _x = _x - noclipspeed * _camx
                        _y = _y - noclipspeed * _camy
                        _z = _z - noclipspeed * _camz
                    elseif IsControlPressed(0, 22) then -- Hoch
                        _z = _z + noclipspeed /2 
                    elseif IsControlPressed(0, 36) then -- Runter
                        _z = _z - noclipspeed /2 
                    elseif IsControlPressed(0, 32) and IsControlPressed(0, 22) then
                        _x = _x + noclipspeed * _camx
                        _y = _y + noclipspeed * _camy
                        _z = _z + noclipspeed * _camz
                        _z = _z + noclipspeed / 2
                    elseif IsControlPressed(0, 33) and IsControlPressed(0, 22) then
                        _x = _x - noclipspeed * _camx
                        _y = _y - noclipspeed * _camy
                        _z = _z - noclipspeed * _camz
                        _z = _z + noclipspeed /2 
                    elseif IsControlPressed(0, 32) and IsControlPressed(0, 36) then
                        _x = _x + noclipspeed * _camx
                        _y = _y + noclipspeed * _camy
                        _z = _z + noclipspeed * _camz
                        _z = _z - noclipspeed /2 
                    elseif IsControlPressed(0, 33) and IsControlPressed(0, 36) then
                        _x = _x - noclipspeed * _camx
                        _y = _y - noclipspeed * _camy
                        _z = _z - noclipspeed * _camz
                        _z = _z - noclipspeed /2 
                    end
                    if IsControlPressed(0, 22) then -- Hoch
                        _z = _z + noclipspeed - 4  
                    elseif IsControlPressed(0, 36) then -- Runter
                        _z = _z - noclipspeed - 4 
                    end
                    if IsControlPressed(0, 21) then
                        noclipspeed = Config.defaultnoclipspeed * Config.noclipboostmultiplyer
                    elseif IsControlJustReleased(0, 21) then
                        noclipspeed = Config.defaultnoclipspeed
                    end
                    SetEntityVisible(_ped, false)
                    SetEntityVelocity(_ped, 0.05,  0.05,  0.05)
                    SetEntityCoordsNoOffset(_ped, _x, _y, _z, true, true, true) 
                end
            end
        end
        end)
--Commands
    RegisterCommand('F5', function(source, args)
        local isdead = IsPlayerDead(PlayerPedId())
        if not isdead then
            menu:Open()
        elseif isdead and Config.group == "admin" or Config.group == "mod" or Config.group == "sup" then
            menu4:Open()
        end
        end, false)
        RegisterKeyMapping('F5', _U('personalopencdesc'), 'keyboard', 'F5')
    RegisterCommand(Config.adutycmd, function(source, args)
        RegisterNetEvent('esx:playerLoaded')
        AddEventHandler('esx:playerLoaded', function(xPlayer)
        ESX.PlayerData = xPlayer
        end)
        ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
        Config.group = group
        end)
        if Config.group == "admin" or Config.group == "mod" or Config.group == "sup" then
        adutymode = not adutymode
        if adutymode then
            setUniform()
            toggelnames()
            SetPedCanRagdoll(PlayerPedId(), false)
            local sid = GetPlayerServerId(PlayerId())
            local sname = GetPlayerName(PlayerId())
            SetEntityInvincible(PlayerPedId(), true)
            --print('['..sid..'] '..sname)
            TriggerServerEvent('aduty.log', 6144214, _U('aduty'), "**[**"..sid.."**]** "..sname.." ".._U('adutylog'), Config.servername)
            Wait(100)        
            exports['screenshot-basic']:requestScreenshotUpload(Config.webhook, 'files', function(data)
                local image = json.decode(data)
            end)
        else
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
            end)
            SetEntityInvincible(PlayerPedId(), false)
            Player.showName = false
            Wait(1)
            toggleNameDisplay()
            isusingfuncs = false
            isnoclipping = false
            SetEntityVisible(PlayerPedId(), true)
            SetPedCanRagdoll(PlayerPedId(), true)
        end
        while adutymode do
            SetEntityInvincible(PlayerPedId(), true)
            Wait(500)
        end
        while not adutymode do
            SetEntityInvincible(PlayerPedId(), false)
            Wait(500)
        end
        else
        if Config.notify == 'qs' then
            exports['qs-notify']:Alert(_U('nopermisson'), 3000, Config.infotype)
        elseif Config.notify == 'b-notify' then
            TriggerEvent('b-notify:notify', Config.errortype, _U('aduty'), _U('nopermisson'))
        elseif Config.notify == 'cs-hud' then
            exports['cs_hud']:showNotification(_U('aduty'), _U('nopermisson'), Config.infotype, 4000)
        else
            notify(_U('aduty'), _U('nopermisson'), Config.infotype, 4000)
        end 
        end
        end, false)
        RegisterKeyMapping(Config.adutycmd, _U('goadutykdesc'), 'keyboard', '')
    RegisterCommand(Config.vanishcmd, function(source)
        vanish()
        end, false)
    RegisterCommand(Config.tpmcmd, function(source)
        tpm()
        end, false)
        RegisterKeyMapping(Config.vanishcmd, _U('govanishkdesc'), 'keyboard', '')
    RegisterCommand(Config.noclipcmd, function(source)
        RegisterNetEvent('esx:playerLoaded')
        AddEventHandler('esx:playerLoaded', function(xPlayer)
        ESX.PlayerData = xPlayer
        end)
        ESX.TriggerServerCallback("Admin:getRankFromPlayer", function(group)
        Player.group = group
        Config.group = group
        if Config.Debug then
            print("Deine rolle ist "..Config.group)
        end
        end)
        if Config.group == "admin" or Config.group == "mod" or Config.group == "sup" then
            if adutymode then
                togglenoclip()
            else
                if Config.notify == 'qs' then
                    exports['qs-notify']:Alert(_U('noaduty'), 3000, Config.infotype)
                elseif Config.notify == 'b-notify' then
                    TriggerEvent('b-notify:notify', Config.errortype, _U('aduty'), _U('noaduty'))
                elseif Config.notify == 'cs-hud' then
                    exports['cs_hud']:showNotification(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                else
                    notify(_U('aduty'), _U('noaduty'), Config.infotype, 4000)
                end 
            end 
        else
            if Config.notify == 'qs' then
                exports['qs-notify']:Alert(_U('nopermisson'), 3000, Config.infotype)
            elseif Config.notify == 'b-notify' then
                TriggerEvent('b-notify:notify', Config.errortype, _U('aduty'), _U('nopermisson'))
            elseif Config.notify == 'cs-hud' then
                exports['cs_hud']:showNotification(_U('aduty'), _U('nopermisson'), Config.infotype, 4000)
            else
                notify(_U('aduty'), _U('nopermisson'), Config.infotype, 4000)
            end
        end 
        end, false)
        RegisterKeyMapping(Config.noclipcmd, _U('gonoclipkdesc'), 'keyboard', '')
    RegisterCommand(Config.namecmd, function(source)
        toggelnames()
end, false)