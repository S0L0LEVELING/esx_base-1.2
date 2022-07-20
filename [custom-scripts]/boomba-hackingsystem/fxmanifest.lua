fx_version 'cerulean'
games { 'gta5' }
author 'Boomba#0001'
resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'
description 'Boomba Hacking System For FiveM'

ui_page 'html/index.html'

client_scripts { 
    '@mysql-async/lib/MySQL.lua', 
    'config.lua', 
    'client.lua', 
    'clientconfig.lua'
}

server_scripts {    
    '@mysql-async/lib/MySQL.lua',
    'config.lua', 
    'server.lua', 
    'database.lua'
}

files({
    'html/index.html',
    'html/style.css',
    'html/reset.css',
    'html/listener.js', 
    'html/desktop.png', 
    'html/terminal.png'
})

escrow_ignore {
    'clientconfig.lua', 
    'config.lua'
}

lua54 'yes' 