ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('by_fixspawn:getPlDbCoords', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

    MySQL.Async.fetchAll('SELECT position FROM users WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier
	}, function(result)
        if result ~= nil then
            local alldata = json.decode(result[1]["position"])
            local dbcoords = vector3(alldata["x"], alldata["y"], alldata["z"])
            cb(dbcoords)
        end
	end)
end)