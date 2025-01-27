fx_version "cerulean"
game "gta5"
lua54 "yes"

name "melons_interactions"
author "IlMelons"
description "Melons Interactions"
version "1.0.1"
repository "https://github.com/IlMelons/melons_interactions"

shared_scripts {
    "@ox_lib/init.lua",
}

client_scripts {
    "client/*.lua",
}

server_scripts {
    "bridge/server/**/*.lua",
    "config/server.lua",
    "server/*.lua",
    "checker.lua",
}