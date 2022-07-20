resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Money Washing'

version '0.0.1'

server_scripts {
	'@salty_tokenizer/init.lua', 
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'server/main.lua',
}

client_scripts {
	'@salty_tokenizer/init.lua', 
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/main.lua',
}

dependencies {
	'es_extended',
}