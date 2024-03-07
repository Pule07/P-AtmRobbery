fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'pule_dev'
description 'P-SCRIPTS - ATM ROBBERY'

client_scripts {
    'src/c_*.lua',

}

server_scripts {
    'src/s_*.lua',
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}
