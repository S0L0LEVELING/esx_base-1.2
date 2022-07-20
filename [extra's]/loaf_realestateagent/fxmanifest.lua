--[[-----------------------------------
© Loaf Scripts 2021 All Rights Reserved
--]]-----------------------------------

fx_version "cerulean"
game "gta5"

client_script "client/*.lua"
shared_script "config/*.lua"
server_script {
    "@mysql-async/lib/MySQL.lua",
    "server/*.lua"
}

dependency "loaf_housing"
client_script "@Badger-Anticheat/acloader.lua"
