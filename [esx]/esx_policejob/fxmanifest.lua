fx_version 'adamant'

game 'gta5'

description 'ESX Police Job'

version '1.4.0'

server_scripts {
	'@salty_tokenizer/init.lua', 
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/nl.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@salty_tokenizer/init.lua', 
	'@es_extended/locale.lua',
	'locales/nl.lua',
	'config.lua',
	'client/radial.lua',
	'client/main.lua',
	'client/vehicle.lua',
	'client/speed.lua',
	'client/overheid.lua'
}

ui_page('index.html') --HEAD BAG IMAGE

files {
    'index.html'
}


dependencies {
	'es_extended',
	'esx_rekening',
	'esx_vehicleshop'
}
