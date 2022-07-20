fx_version 'adamant'

game 'gta5'

description 'ESX Kmar Job'

version '1.2.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/nl.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/nl.lua',
	'config.lua',
	'client/main.lua',
	'client/catapult.lua'
}

ui_page('index.html') --HEAD BAG IMAGE

files {
    'index.html'
}

dependencies {
	'es_extended',
}
