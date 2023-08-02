local komma = Config.wert
local prozent = komma * 10
Citizen.CreateThread(function()
	while Config.reducenpcs do
	    Citizen.Wait(0)
	    SetVehicleDensityMultiplierThisFrame(Config.wert)
	    SetPedDensityMultiplierThisFrame(Config.wert)
	    SetRandomVehicleDensityMultiplierThisFrame(Config.wert)
	    SetParkedVehicleDensityMultiplierThisFrame(Config.wert)
	    SetScenarioPedDensityMultiplierThisFrame(Config.wert, Config.wert)
	end
    if Config.Debug then
	print("Npcs sind auf einer Spawn rate von"..prozent.."%")
	end
end)