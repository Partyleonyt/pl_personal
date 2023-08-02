lua54 "yes"
fx_version 'cerulean'
name 'pl_personal'
description 'a Personal menu DC id : <@784556464299049011>'
author 'Partyleon'
game 'gta5'

client_scripts {
    '@menuv/menuv.lua',
    'config.lua',
    'client/*.lua',
    'locales/*.lua',
    --'client/client_auto.lua',
}
dependencies {
    'menuv',
    'es_extended',
    'jsfour-idcard'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/*.lua',
}
shared_script {
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
}

escrow_ignore {
    '*.lua',
    'locales/*.lua',
    'client/*.lua',
    'server/*.lua'
  }