author "Brodino"
description "Audioplayer based on plunkettscott's interact-sound"
version "2.0"

fx_version "cerulean"
game "gta5"

client_script "client.lua"

server_script "server.lua"

ui_page("html/index.html")

files({
    "html/index.html",
    "html/sounds/*"
})
