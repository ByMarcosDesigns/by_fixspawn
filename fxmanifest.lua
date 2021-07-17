fx_version 'cerulean'
games { 'gta5' }

author '[👑]𝔹𝕪𝕄𝕒𝕣𝕔𝕠𝕤𝔻𝕖𝕤𝕚𝕘𝕟𝕤 []𝔼𝕊[]#3147'
description 'ByScript | Soluciona el bug de que el personaje salga en la posicion inicial y salga en su ultima posicion. Basado en el es_extended 1.2'
version '1.0.0'

client_scripts {
    'client.lua',
}

server_script {
	'@mysql-async/lib/MySQL.lua',
    'server.lua',
}