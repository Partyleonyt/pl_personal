--Locals
    local globalDriftState = false
    local SMOKEON = false
    local cisnotopend = true
--Extra
    local menu2 = MenuV:CreateMenu(false, _U('extra'), Config.position, Config.color.r, Config.color.g, Config.color.b, 'size-'..Config.size, Config.headercarmenu, 'menuv')
        menu2:On('open', function(menu2)
            menu2:ClearItems()
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            local fuel = GetVehicleFuelLevel(veh)
            local availableExtras = {}
            local items = {}
            local extrasExist = false
            for extra = 0, 20 do
                if DoesExtraExist(veh, extra) then
                    availableExtras[extra] = extra
                    extrasExist = true
                end
            end
            if extrasExist then
                for k, v in pairs(availableExtras) do
                if IsVehicleExtraTurnedOn(veh, k) then
                    local extraItem = menu2:AddCheckbox({
                    label = 'Extra ' .. k,
                    value = 'y'
                    })
                    items[k] = extraItem
                else
                    local extraItem = menu2:AddCheckbox({
                    label = 'Extra ' .. k,
                    value = 'n'
                    })
                    items[k] = extraItem
                end
                    items[k]:On('change', function(item, value)
                      for k, v in pairs(items) do
                       if item == v then
                        availableExtras[k] = value
                        if availableExtras[k] then
                          SetVehicleExtra(veh, k, 0)
                        else
                          SetVehicleExtra(veh, k, 1)
                        end
                      end
                    end
                  end)
                end
            end
    end)
--Doors
    local menu3 = MenuV:CreateMenu(false, _U('door'), Config.position, Config.color.r, Config.color.g, Config.color.b, 'size-'..Config.size, Config.headercarmenu, 'menuv')
    local vlt = menu3:AddButton({ icon = '🚗', label = _U('frontleft'), value = 'vlt', description = _U('doubleformat', _U('openclose'), _U('frontleft')) })
        vlt:On('select', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            local isopen = GetVehicleDoorAngleRatio(veh,0)
        	if isopen == 0 then
        		SetVehicleDoorOpen(veh, 0, false, false)
        	else
        		SetVehicleDoorShut(veh, 0, 0)
        	end
        end)

    local vrt = menu3:AddButton({ icon = '🚕', label = _U('frontright'), value = 'vrt', description = _U('doubleformat', _U('openclose'), _U('frontright')) })
        vrt:On('select', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            local isopen = GetVehicleDoorAngleRatio(veh,1)
        	if isopen == 0 then
        		SetVehicleDoorOpen(veh,1, false, false)
        	else
        		SetVehicleDoorShut(veh, 1, 0)
        	end
        end)

    local hlt = menu3:AddButton({ icon = '🚙', label = _U('backleft'), value = 'hlt', description = _U('doubleformat', _U('openclose'), _U('backleft')) })
        hlt:On('select', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            local isopen = GetVehicleDoorAngleRatio(veh,2)
        	if isopen == 0 then
        		SetVehicleDoorOpen(veh, 2, false, false)
        	else
        		SetVehicleDoorShut(veh, 2, 0)
        	end
        end)

    local hrt = menu3:AddButton({ icon = '🚚', label = _U('backright'), value = 'hrt', description = _U('doubleformat', _U('openclose'), _U('backright')) })
        hrt:On('select', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            local isopen = GetVehicleDoorAngleRatio(veh,3)
        	if isopen == 0 then
        		SetVehicleDoorOpen(veh, 3, false, false)
        	else
        		SetVehicleDoorShut(veh, 3, 0)
        	end
        end)

    local mvt = menu3:AddButton({ icon = '🚘', label = _U('hood'), value = 'mvt', description = _U('doubleformat', _U('openclose'), _U('hood')) })
        mvt:On('select', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            local isopen = GetVehicleDoorAngleRatio(veh,4)
        	if isopen == 0 then
        		SetVehicleDoorOpen(veh, 4, false, false)
        	else
        		SetVehicleDoorShut(veh, 4, 0)
        	end
        end)

    local mht = menu3:AddButton({ icon = '🏍', label = _U('trunk'), value = 'mht', description = _U('doubleformat', _U('openclose'), _U('trunk')) })
        mht:On('select', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            local isopen = GetVehicleDoorAngleRatio(veh,5)
        	if isopen == 0 then
        		SetVehicleDoorOpen(veh, 5, false, false)
        	else
        		SetVehicleDoorShut(veh, 5, 0)
        	end
        end)

    local allt = menu3:AddButton({ icon = '🚒', label = _U('all'), value = 'allt', description = _U('drippleformat', _U('openclose'), _U('all'), _U('door')) })
        allt:On('select', function(item)
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            local isopen = GetVehicleDoorAngleRatio(veh,5)
        	if isopen == 0 then
                for i = 0, 5 do
                    SetVehicleDoorOpen(veh, i, false, false) -- will open every door from 0-5
                end          
        	else
                for i = 0, 5 do
                    SetVehicleDoorShut(veh, i, false) -- will close all doors from 0-5
                end
        	end
        end)
--Windows
    local menu4 = MenuV:CreateMenu(false, _U('window'), Config.position, Config.color.r, Config.color.g, Config.color.b, 'size-'..Config.size, Config.headercarmenu, 'menuv')
        local vlf = menu4:AddButton({ icon = '🚗', label = _U('frontleft'), value = 'vlf', description = _U('doubleformat', _U('openclose'), _U('frontleft')) })
            vlf:On('select', function(item)
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                local isopen = IsVehicleWindowIntact(veh, 0)
                if isopen then
                    RollDownWindow(veh, 0, 0, 0)
                else
                    RollUpWindow(veh, 0, 0)
                end
            end)
    
        local vrf = menu4:AddButton({ icon = '🚕', label = _U('frontright'), value = 'vrf', description = _U('doubleformat', _U('openclose'), _U('frontright')) })
            vrf:On('select', function(item)
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                local isopen = IsVehicleWindowIntact(veh, 1)
                if isopen then
                    RollDownWindow(veh, 1, 0, 0)
                else
                    RollUpWindow(veh, 1, 0)
                    RollUpWindow(veh, 2, 0)
                end
            end)
    
        local hlf = menu4:AddButton({ icon = '🚙', label = _U('backleft'), value = 'hlf', description = _U('doubleformat', _U('openclose'), _U('backleft')) })
            hlf:On('select', function(item)
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                local isopen = IsVehicleWindowIntact(veh, 2)
                if isopen then
                    RollDownWindow(veh, 2, 0, 0)
                else
                    RollUpWindow(veh, 2, 0)
                end
            end)
    
        local hrf = menu4:AddButton({ icon = '🚚', label = _U('backright'), value = 'hrf', description = _U('doubleformat', _U('openclose'), _U('backright')) })
            hrf:On('select', function(item, label)
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                local isopen = IsVehicleWindowIntact(veh, 3)
                if isopen then
                    RollDownWindow(veh, 3, 0, 0)
                else
                    RollUpWindow(veh, 3, 0)
                end
            end)
    
        local allf = menu4:AddButton({ icon = '🚒', label = _U('all'), value = 'allf', description = _U('drippleformat', _U('openclose'), _U('all'), _U('window')) })
            allf:On('select', function(item)
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                local isopen = IsVehicleWindowIntact(veh, 3)
                if isopen then
                    RollDownWindow(veh, 3, 0, 0)
                    for i = 0, 3 do
                        RollDownWindow(veh, i, 0, 0)
                    end
                else
                    for i = 0, 3 do
                        RollUpWindow(veh, i, 0)
                    end
                end
            end)
--Admin
    local menu5 = MenuV:CreateMenu(false, _U('caradmin'), Config.position, Config.color.r, Config.color.g, Config.color.b, 'size-'..Config.size, Config.headercarmenu, 'menuv')
        local fix = menu5:AddButton({ icon = '🛠', label = _U('fix'), description = _U('fixd')})
            fix:On('select', function()
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                SetVehicleFixed(veh)
        end)
        local wash = menu5:AddButton({ icon = '🧽', label = _U('wash'), description = _U('washd')})
            wash:On('select', function()
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                SetVehicleDirtLevel(veh, 0.0)
        end)
--Special
    local menu6 = MenuV:CreateMenu(false, _U('special'), Config.position, Config.color.r, Config.color.g, Config.color.b, 'size-'..Config.size, Config.headercarmenu, 'menuv')
        if (GetResourceState("vehicles_keys") == "started") then
            local stealkeys = menu6:AddButton({ icon = '🔑', label = _U('stealkeys'), description = _U('stealkeysd')})
            stealkeys:On('select', function(item)
                local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1))
                if (GetResourceState("AdvancedParking") == "started") or Config.useAdvancedParking then
                    exports["AdvancedParking"]:UpdateVehicle(vehicle)
                end
                TriggerServerEvent("vehicles_keys:selfGiveVehicleKeys", GetVehicleNumberPlateText(vehicle))
                if Config.notify == 'qs' then
                    exports['qs-notify']:Alert(_U('keysgiven', GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1)))), 3000, Config.infotype)
                elseif Config.notify == 'b-notify' then
                    TriggerEvent('b-notify:notify', Config.infotype, _U('carmenu'), _U('keysgiven', GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1)))))
                elseif Config.notify == 'cs-hud' then
                    exports['cs_hud']:showNotification(_U('carmenu'), _U('keysgiven', GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1)))), Config.infotype, 4000)
                else
                    notify(_U('carmenu'), _U('keysgiven', GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1)))), Config.infotype, 4000)
                end 
            end)
        end
        local dtoggle = menu6:AddCheckbox({ icon = '🦼', label = 'Driftmode', description = 'An/Aus Driftmode', value = 'n'})
            dtoggle:On('check', function(item)
                SMOKEON = true
                ChangeDrift(true)
            end)
            dtoggle:On('uncheck', function(item)
                SMOKEON = false
                ChangeDrift(false)
            end)
--Limit
    local menu7 = MenuV:CreateMenu(false, _U('limit'), Config.position, Config.color.r, Config.color.g, Config.color.b, 'size-'..Config.size, Config.headercarmenu, 'menuv')
        local Tempomatspeed = 0

        local kmh50l = 50
        local kmh80l = 80
        local kmh100l = 100
        local kmh130l = 130
        local kmh150l = 150
        local kmh200l = 200

        local kmh50 = menu7:AddButton({ icon = '🚗', label = _U('kmh', kmh50l), description = _U('kmhd', kmh50l)})
        local kmh80 = menu7:AddButton({ icon = '🚌', label = _U('kmh', kmh80l), description = _U('kmhd', kmh80l)})
        local kmh100 = menu7:AddButton({ icon = '🛺', label = _U('kmh', kmh100l), description = _U('kmhd', kmh100l)})
        local kmh130 = menu7:AddButton({ icon = '🚐', label = _U('kmh', kmh130l), description = _U('kmhd', kmh130l)})
        local kmh150 = menu7:AddButton({ icon = '🚓', label = _U('kmh', kmh150l), description = _U('kmhd', kmh150l)})
        local kmh200 = menu7:AddButton({ icon = '🏎', label = _U('kmh', kmh200l), description = _U('kmhd', kmh200l)})
        local kmh0 = menu7:AddButton({ icon = '🚙', label = _U('reset'), description = _U('resetd')})
        kmh50:On('select', function(item)
            Tempomatspeed = kmh50l
            SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), true), Tempomatspeed / 3.6)
        end)
        kmh80:On('select', function(item)
            Tempomatspeed = kmh80l
            SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), true), Tempomatspeed / 3.6)
        end)
        kmh100:On('select', function(item)
            Tempomatspeed = kmh100l
            SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), true), Tempomatspeed / 3.6)
        end)
        kmh130:On('select', function(item)
            Tempomatspeed = kmh130l
            SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), true), Tempomatspeed / 3.6)
        end)
        kmh150:On('select', function(item)
            Tempomatspeed = kmh150l
            SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), true), Tempomatspeed / 3.6)
        end)
        kmh200:On('select', function(item)
            Tempomatspeed = kmh200l
            SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), true), Tempomatspeed / 3.6)
        end)
        kmh0:On('select', function(item)
            SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
            Tempomatspeed = 0
        end)


--Default Page
    local menu = MenuV:CreateMenu(false, _U('carmenu'), Config.position, Config.color.r, Config.color.g, Config.color.b, 'size-'..Config.size, Config.headercarmenu, 'menuv')
        local doors = menu:AddButton({ icon = '🛺', label = _U('door'), value = menu3, description = _U('doord')})
        local fenst = menu:AddButton({ icon = '🚈', label = _U('window'), value = menu4, description = _U('windowd')})
        local Skin = menu:AddSlider({ icon = '👕', label = _U('skin'), value = 'skin', description = _U('skind'), values = Config.skinmax })
        local menu_extra = menu:AddButton({ icon = '♟', label = _U('extra'), value = menu2, description = _U('extrad')})
        local menu_spezial = menu:AddButton({ icon = '🛵', label = _U('special'), value = menu6, description = _U('speciald')})
        local menu_tempomat = menu:AddButton({ icon = '🚜', label = _U('limit'), value = menu7, description = _U('limitd')})
            menu:On('open', function()
                if cisnotopend then
                    Wait(10)
                    if Config.group == "admin" or Config.group == "mod" then
                        local admin = menu:AddButton({ icon = '👷‍♂️', label = _U('caradmin'), value = menu5, description = _U('caradmin')})
                    elseif Config.Debug == true then
                        local admin = menu:AddButton({ icon = '👷‍♂️', label = _U('caradmin'), value = menu5, description = _U('caradmin')})
                    else
                        local admin = menu:AddButton({ icon = '👷‍♂️', label = _U('caradmin'), value = menu5, description = _U('caradmin')})
                    end
                end
                cisnotopend = false
            end)
            Skin:On('change', function(item,value) 
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                local chel = GetVehicleLiveryCount(veh)
                SetVehicleLivery(veh, value)
            end)

            Skin:On('select', function(item,value)
                local ped = PlayerPedId()
                local veh = GetVehiclePedIsIn(ped, false)
                local chel = GetVehicleLiveryCount(veh)
                SetVehicleLivery(veh, value)
            end)

        RegisterCommand(Config.carmenucmd, function(source, args) 
            local inveh = IsPedInAnyVehicle(PlayerPedId(), false)
            local isdriver = GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId()
            if inveh and isdriver then    	
                menu:Open()
            else
                if Config.notify == 'qs' then
                    exports['qs-notify']:Alert(_U('novehodriver'), 3000, Config.infotype)
                elseif Config.notify == 'b-notify' then
                    TriggerEvent('b-notify:notify', 'error', _U('carmenu'), _U('novehodriver'))
                elseif Config.notify == 'cs-hud' then
                    exports['cs_hud']:showNotification(_U('carmenu'), _U('novehodriver'), 'error', 4000)
                else
                    notify(_U('carmenu'), _U('novehodriver'), 'error', 4000)
                end 
            end
        end, false)
--Commands
    RegisterCommand('fix', function(source, args) 
        local inveh = IsPedInAnyVehicle(PlayerPedId(), false)
        if Config.group == "admin" or Config.group == "mod" then
        if inveh then    	
            local ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(ped, false)
            SetVehicleFixed(veh)
        else
            if Config.notify == 'qs' then
                exports['qs-notify']:Alert(_U('novehodriver'), 3000, Config.infotype)
            elseif Config.notify == 'b-notify' then
                TriggerEvent('b-notify:notify', 'error', _U('carmenu'), _U('novehodriver'))
            elseif Config.notify == 'cs-hud' then
                exports['cs_hud']:showNotification(_U('carmenu'), _U('novehodriver'), 'error', 4000)
            else
                notify(_U('carmenu'), _U('novehodriver'), 'error', 4000)
            end 
        end
        else
        if Config.notify == 'qs' then
            exports['qs-notify']:Alert(_U('nopermisson'), 3000, Config.infotype)
        elseif Config.notify == 'b-notify' then
            TriggerEvent('b-notify:notify', 'error', _U('carmenu'), _U('nopermisson'))
        elseif Config.notify == 'cs-hud' then
            exports['cs_hud']:showNotification(_U('carmenu'), _U('novehodriver'), 'error', 4000)
        else
            notify(_U('carmenu'), _U('novehodriver'), 'error', 4000)
        end 
        end
    end, false)
    RegisterCommand(Config.limitresetcmd, function(source, args) 
    local inveh = IsPedInAnyVehicle(PlayerPedId(), false)
    if inveh then
        if Tempomatspeed == 50 or Tempomatspeed == 80 or Tempomatspeed == 100 or Tempomatspeed == 130 or Tempomatspeed == 150 or Tempomatspeed == 200 then
            Tempomatspeed = 0
            SetVehicleMaxSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0.0)
        end
    end
    end, false)
    RegisterKeyMapping(Config.limitresetcmd, _U('disablelimitkeydesc'), 'keyboard', Config.defaultlimitresetkey)
    --functions
    local bone_list = {"wheel_lr","wheel_rr"}
    Citizen.CreateThread(function()
        while true do Citizen.Wait(0)
            if SMOKEON then
            base = "scr_recartheft"
            base2 = "core"
            Request(base)
            Request(base2)
            ped = GetPlayerPed(-1)
            car = GetVehiclePedIsUsing(ped)
            ang,speed = angle(car)
            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                if speed >= 3.0 and ang ~= 0 then
                    DriftSmoke(base,"scr_wheel_burnout", car, 10, 0.2)
                elseif speed < 1.0 and IsVehicleInBurnout(car) then
                    DriftSmoke(base2 ,"exp_grd_bzgas_smoke", car, 3, 1.5)
                end
            end
            end
        end
    end)
    function Request(name)
        RequestNamedPtfxAsset(name)
        while not HasNamedPtfxAssetLoaded(name) do
            Wait(1)
        end
    end
    function DriftSmoke(base, sub, car, dens, size)
        all_part = {}    
        for i = 0,dens do
            UseParticleFxAssetNextCall(base)
            W1 = StartParticleFxLoopedOnEntityBone(sub, car, 0.05, 0, 0, 0, 0, 0, GetEntityBoneIndexByName(car, bone_list[1]), size, 0, 0, 0)

            UseParticleFxAssetNextCall(base)
            W2 = StartParticleFxLoopedOnEntityBone(sub, car, 0.05, 0, 0, 0, 0, 0, GetEntityBoneIndexByName(car, bone_list[2]), size, 0, 0, 0)

            table.insert(all_part, 1, W1)
            table.insert(all_part, 2, W2)
        end
        Citizen.Wait(1000)
        for _,W1 in pairs(all_part) do
            StopParticleFxLooped(W1, true)
        end
    end
    function angle(veh)
        if not veh then return false end
        local vx,vy,vz = table.unpack(GetEntityVelocity(veh))
        local modV = math.sqrt(vx*vx + vy*vy)
        local rx,ry,rz = table.unpack(GetEntityRotation(veh,0))
        local sn,cs = -math.sin(math.rad(rz)), math.cos(math.rad(rz))
        if GetEntitySpeed(veh)* 3.6 < 5 or GetVehicleCurrentGear(veh) == 0 then return 0,modV end --speed over 30 km/h
        local cosX = (sn*vx + cs*vy)/modV
        if cosX > 0.966 or cosX < 0 then return 0,modV end
        return math.deg(math.acos(cosX))*0.5, modV
    end
    function ChangeDrift(bool)
        local playerPed = PlayerPedId()
        local playerVehicle = GetVehiclePedIsIn(playerPed, false)
        if playerVehicle ~= 0 and IsVehicleOnAllWheels(playerVehicle) and GetPedInVehicleSeat(playerVehicle, -1) == playerPed then
            globalDriftState = bool
            SetDriftTyresEnabled(playerVehicle, globalDriftState)
            SetReduceDriftVehicleSuspension(playerVehicle, globalDriftState)
        end
    end