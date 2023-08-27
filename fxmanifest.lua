fx_version 'cerulean'

game 'gta5'

author 'TAKZOBYE (ZOBYETEAM)'
description 'Notify System By ZOBYETEAM'
version '1.1.0'

client_scripts {
    'config.lua',
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}

ui_page 'interface/index.html'

files {
    'interface/**'
}

exports {
    'send'
}