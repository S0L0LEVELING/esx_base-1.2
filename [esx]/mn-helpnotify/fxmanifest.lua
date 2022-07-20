fx_version 'cerulean'
games {'gta5'}

author 'mn#0810'
description 'Help Notifications made by mn#0810'
version '1.0.0'

client_scripts { -- Client side Scripts
    'notify.lua'
}



files {
    'html/*'
}


exports {
    "OpenNotify",
    "CloseNotify",
}

ui_page "html/index.html"
