
ESX = exports["es_extended"]:getSharedObject()
local function makeTargetedEventFunction(fn)
	return function(target, ...)
		if tonumber(target) == -1 then return end
		fn(target, ...)
	end
end
ESX.RegisterServerCallback('nrp_aduty:getPlayerCoords', function(source, cb) -- Für Spieler Blips
    local source = source
    local xPlayers = ESX.GetExtendedPlayers()
    local coords = {}

    for _, xPlayer in pairs(xPlayers) do 
        if xPlayer.source ~= source then
            coords[#coords + 1] = {coords = xPlayer.coords, playerId = xPlayer.source, name = GetPlayerName(xPlayer.source)}
        end
    end

    cb(coords)
end)
ESX.RegisterServerCallback("Admin:getRankFromPlayer", function(source, cb)
    local player = ESX.GetPlayerFromId(source)

    if player ~= nil then
        local playerGroup = player.getGroup()

        if playerGroup ~= nil then 
            cb(playerGroup)
        else
            cb("user")
        end
    else
        cb("user")
    end
end)
RegisterNetEvent('aduty.log')
AddEventHandler('aduty.log', function(color, name, message, footer)
    local log = {
        {
            ["color"] = color,
            ["title"] = "**".. name .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = footer,
            },
        }
    }
    
    
    PerformHttpRequest('https://discord.com/api/webhooks/1126868456994766918/orhCDvY4fRNZ4jlhlg6PcEhRJFtq0ANi15u2js8IfCKAsY65ysrfhh1S1UVf6lVoAS1F', function(err, text, headers)
    end, 'POST', json.encode({
        username = "Aduty - Log",
        embeds = log
    }), {
        ['Content-Type'] = 'application/json'
    })
end)
RegisterServerEvent('personalmenu:Boss_einstellen')
AddEventHandler('personalmenu:Boss_einstellen', makeTargetedEventFunction(function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()

	if sourceJob.grade_name == 'boss' then
		local targetXPlayer = ESX.GetPlayerFromId(target)

		targetXPlayer.setJob(sourceJob.name, 0)
		TriggerClientEvent('esx:showNotification', sourceXPlayer.source, ('Du hast %s Eingestelt.'):format(targetXPlayer.name))
		TriggerClientEvent('esx:showNotification', target, ('Du wurdest von %s eingestellt.'):format(sourceXPlayer.name))
	end
end))
RegisterServerEvent('krz_personalmenu:Boss_virerplayer')
AddEventHandler('krz_personalmenu:Boss_virerplayer', makeTargetedEventFunction(function(target)
	local sourceXPlayer = ESX.GetPlayerFromId(source)
	local sourceJob = sourceXPlayer.getJob()
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local targetJob = targetXPlayer.getJob()
	    if sourceJob.name == targetJob.name then
			targetXPlayer.setJob('unemployed', 0)
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, ('Du hast %s gefeuert.'):format(targetXPlayer.name))
			TriggerClientEvent('esx:showNotification', target, ('Du wurdest von %s gefeuert.'):format(sourceXPlayer.name))
		else
			TriggerClientEvent('esx:showNotification', sourceXPlayer.source, 'Der Spieler ist nich Eingestelt.')
		end
end))