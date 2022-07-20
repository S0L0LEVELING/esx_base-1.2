resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'mn-policejob'

version '1.1.0'

ui_page "html/index.html"

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    "server/*",
    "config.lua"
}

client_scripts {
    "client/*",
    "config.lua"
}

files {
    'html/*',
    "html/img/*"
}
dependency {
    'es_extended',
    'skeexsNotify'
}