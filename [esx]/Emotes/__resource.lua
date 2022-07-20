resource_manifest_version '05cfa83c-a124-4cfa-a768-c24a5811d8f9'

client_scripts {
	'NativeUI.lua',
	'Config.lua',
	'Client/AnimationList.lua',
	'Client/Emote.lua',
	'Client/EmoteMenu.lua',
	'Client/Keybinds.lua',
	'Client/Ragdoll.lua',
	'Client/Syncing.lua',
	'Client/Walk.lua'
}

server_scripts {
	'Config.lua',
	'@mysql-async/lib/MySQL.lua',
	'Server/*.lua'
}

