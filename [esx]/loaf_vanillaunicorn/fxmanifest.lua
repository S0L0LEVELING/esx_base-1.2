fx_version "adamant"
game "gta5"

shared_script "config/*.lua"
client_script {
    "client/*.lua",
    "client/grades/*.lua"
}
server_script "server/*.lua"