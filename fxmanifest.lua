fx_version "cerulean"
game "gta5"
lua54 "yes"

author "AD Development"
description "AD Elevators"
version "2.0"

shared_scripts {
	"config.lua",
	"@ox_lib/init.lua"
} 

client_scripts {
	"@PolyZone/client.lua", 
	"@PolyZone/BoxZone.lua", 
	"client/*.lua",
	"bridge/*.lua"
}
