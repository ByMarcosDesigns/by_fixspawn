ESX = nil
local enable = true
Config = {}

Config.CoordsFirstTime = vector3(-269.4, -955.3, 31.2) --Las coordenadas en las que va a aparecer el jugador por primera vez en caso de que no haya entrado nunca al server


Citizen.CreateThread(function() 
    while ESX == nil do 
		if enable then 
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
			Citizen.Wait(0)
		else
			return
		end
	end 
end)

AddEventHandler('playerConnecting', function(playerData)
	ESX.TriggerServerCallback('by_fixspawn:getPlDbCoords', function(coords)
		local defaultesxcoords = vector3(-269.4, -955.3, 31.2) -- Estas son las coordenadas que vienen por defecto en la sql de la tabla users

		if coords == defaultesxcoords then -- reconocemos si las coords son las que estan por defecto en la sql
			TriggerEvent('by_fixspawn:setPosToPl', Config.CoordsFirstTime) --En caso de ser las coords que estan por defecto le decimos que lo teletransporte a las coords que
																		   --se pueden cambiar en Config.CoordsFirstTime en la linea 5
		else
			TriggerEvent('by_fixspawn:setPosToPl', coords) -- En caso de no ser las default envia al jugador a su ultima pos registrada
		end
	end)
end)

RegisterNetEvent('by_fixspawn:setPosToPl')
AddEventHandler('by_fixspawn:setPosToPl', function (coords)
	local pl = PlayerPedId()
	SetPedCoordsKeepVehicle(pl, coords)
	enable = false
end)

--Todos los derechos de este script pertenecen a [👑]𝔹𝕪𝕄𝕒𝕣𝕔𝕠𝕤𝔻𝕖𝕤𝕚𝕘𝕟𝕤 []𝔼𝕊[]#3147