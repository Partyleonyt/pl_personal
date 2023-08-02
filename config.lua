--PPPPPPPPPPPPPPPPP                                               tttt                              lllllll                                                        
--P::::::::::::::::P                                           ttt:::t                              l:::::l                                                        
--P::::::PPPPPP:::::P                                          t:::::t                              l:::::l                                                        
--PP:::::P     P:::::P                                         t:::::t                              l:::::l                                                        
--  P::::P     P:::::Paaaaaaaaaaaaa  rrrrr   rrrrrrrrr   ttttttt:::::tttttttyyyyyyy           yyyyyyyl::::l     eeeeeeeeeeee       ooooooooooo   nnnn  nnnnnnnn    
--  P::::P     P:::::Pa::::::::::::a r::::rrr:::::::::r  t:::::::::::::::::t y:::::y         y:::::y l::::l   ee::::::::::::ee   oo:::::::::::oo n:::nn::::::::nn  
--  P::::PPPPPP:::::P aaaaaaaaa:::::ar:::::::::::::::::r t:::::::::::::::::t  y:::::y       y:::::y  l::::l  e::::::eeeee:::::eeo:::::::::::::::on::::::::::::::nn 
--  P:::::::::::::PP           a::::arr::::::rrrrr::::::rtttttt:::::::tttttt   y:::::y     y:::::y   l::::l e::::::e     e:::::eo:::::ooooo:::::onn:::::::::::::::n
--  P::::PPPPPPPPP      aaaaaaa:::::a r:::::r     r:::::r      t:::::t          y:::::y   y:::::y    l::::l e:::::::eeeee::::::eo::::o     o::::o  n:::::nnnn:::::n
--  P::::P            aa::::::::::::a r:::::r     rrrrrrr      t:::::t           y:::::y y:::::y     l::::l e:::::::::::::::::e o::::o     o::::o  n::::n    n::::n
--  P::::P           a::::aaaa::::::a r:::::r                  t:::::t            y:::::y:::::y      l::::l e::::::eeeeeeeeeee  o::::o     o::::o  n::::n    n::::n
--  P::::P          a::::a    a:::::a r:::::r                  t:::::t    tttttt   y:::::::::y       l::::l e:::::::e           o::::o     o::::o  n::::n    n::::n
--PP::::::PP        a::::a    a:::::a r:::::r                  t::::::tttt:::::t    y:::::::y       l::::::le::::::::e          o:::::ooooo:::::o  n::::n    n::::n
--P::::::::P        a:::::aaaa::::::a r:::::r                  tt::::::::::::::t     y:::::y        l::::::l e::::::::eeeeeeee  o:::::::::::::::o  n::::n    n::::n
--P::::::::P         a::::::::::aa:::ar:::::r                    tt:::::::::::tt    y:::::y         l::::::l  ee:::::::::::::e   oo:::::::::::oo   n::::n    n::::n
--PPPPPPPPPP          aaaaaaaaaa  aaaarrrrrrr                      ttttttttttt     y:::::y          llllllll    eeeeeeeeeeeeee     ooooooooooo     nnnnnn    nnnnnn
--                                                                                y:::::y                                                                          
--                                                                               y:::::y                                                                           
--                                                                              y:::::y                                                                            
--                                                                             y:::::y                                                                             
--                                                                            yyyyyyy                                                                            


Config = {}
Config.servername = 'servername'
Config.usewatermark = true
Config.watermark = "^5 ___________________________________________________\r\n^5|                                                   |\r\n^5|^0  Script:         ^6Personalmenu                     ^5|^0\r\n^5|^0  Gescripted von: ^8Partyleon                        ^5|^0\r\n^5|^0  Status:         ^2gestarted                        ^5|\r\n^5|^0  Version:        V: ^31.0                           ^5|\r\n^5|^0  Lizenz:         Exklusiv Für ^5Universumlife       |\r\n^5|___________________________________________________|"

Config.notify = 'coustom'-- Accessible 'qs' , 'b-notify', 'cs-hud', ore Somthing else to use a Coustom Notify
function notify(title, message, art, length)
    exports['cs_hud']:showNotification(title, message, art, length) --CS_HUD example
end
Config.infotype = 'info'
Config.errortype = 'error'

Config.group = user --DONT TOUCH
Config.Locale = 'en'
Config.position = 'centerleft'
Config.headerpngnormal = 'default'
Config.headercarmenu = 'default'
Config.size = 125
Config.color = {
    r = 255,
    g = 255,
    b = 255
}
--Rokstar Editor aufnahme
Config.useeditor = true
Config.recordcmd = "editor" --Normale Stuff
Config.startrec = 'start' --Arg Commands
Config.stoprec = 'stop' --Arg Commands
Config.editoropen = 'open' --Arg Commands

--Personal Stuff
Config.useonebutton = true

--NPS reduce
Config.reducenpcs = true
Config.wert = 0.10
--Your commands for clothes I use dpClothing+ here: https://forum.cfx.re/t/dpclothing-1-0-3-clothing-variations-and-toggles-gloves-vest-top-hair-bag-and-more/1326317 and changed the commands to German
Config.useKleidung = true
Config.hutcmd = "hut"
Config.brillecmd = "brille"
Config.maskecmd = "maske"
Config.hemdcmd = "hemd"
Config.westecmd = "weste"
Config.hosecmd = "hose"
Config.schuhecmd = "schuhe"
Config.earcmd = "ohr"
Config.chaincmd = "kette"
Config.glockcmd = "uhr"
Config.backpackcmd = "rucksackab"
Config.ResetClothingcmd = "kleidungzurücksetzen"

Config.usecarmenu = true
Config.carmenucmd = "cmenu"
Config.limitresetcmd = "tempomatreset"
Config.defaultlimitresetkey = 'x'
Config.skinmax = {    
    { label = 'Skin 1', value = '1', description = 'Ändert zu Skin 1' },
    { label = 'Skin 2', value = '2', description = 'Ändert zu Skin 2' },
    { label = 'Skin 3', value = '3', description = 'Ändert zu Skin 3' },
    { label = 'Skin 4', value = '4', description = 'Ändert zu Skin 4' },
    { label = 'Skin 5', value = '5', description = 'Ändert zu Skin 5' },
    { label = 'Skin 6', value = '6', description = 'Ändert zu Skin 6' },
    { label = 'Skin 7', value = '7', description = 'Ändert zu Skin 7' },
    { label = 'Skin 8', value = '8', description = 'Ändert zu Skin 8' },
    { label = 'Skin 9', value = '9', description = 'Ändert zu Skin 9' },
    { label = 'Skin 10', value = '10', description = 'Ändert zu Skin 10' }
    }

--Debug Stuff (It's only been for testing when creating maybe, there are sometimes test things in the updates)
Config.Debug = false
Config.debugcmd = "Test"
--Aduty
Config.defaultnoclipspeed = 5
Config.noclipboostmultiplyer = 2
Config.DiscordWebHookadutylog = 'WEBHOOK_URL' 
Config.adutycmd = 'aduty'
Config.noclipcmd = 'noclip'
Config.namecmd = 'names'
Config.vanishcmd = 'vanish'
Config.tpmcmd = 'tpm'
Config.Admin = {
    admin = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 30,   ['torso_2'] = 3,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 1,
            ['pants_1'] = 121,   ['pants_2'] = 2,
            ['shoes_1'] = 39,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['chain_1'] = 1,    ['chain_2'] = 0,
            --['ears_1'] = 0,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0,
            --['hair_1'] = 0,     ['hair_2'] = 0,
            ['bproof_1'] = 18,  ['bproof_2'] = 2
        },
        female = {
            ['tshirt_1'] = 14,  ['tshirt_2'] = 0,
            ['torso_1'] = 452,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 1,
            ['pants_1'] = 50,   ['pants_2'] = 1,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 2,
            ['chain_1'] = 1,    ['chain_2'] = 0,
            --['ears_1'] = 0,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0,
            --['hair_1'] = 0,     ['hair_2'] = 0,
            ['bproof_1'] = 7,  ['bproof_2'] = 4
        }
    },
    mod = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 30,   ['torso_2'] = 3,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 1,
            ['pants_1'] = 121,   ['pants_2'] = 2,
            ['shoes_1'] = 39,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['chain_1'] = 1,    ['chain_2'] = 0,
            --['ears_1'] = 0,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0,
            --['hair_1'] = 0,     ['hair_2'] = 0,
            ['bproof_1'] = 18,  ['bproof_2'] = 2
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 30,   ['torso_2'] = 3,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 1,
            ['pants_1'] = 121,   ['pants_2'] = 9,
            ['shoes_1'] = 82,   ['shoes_2'] = 9,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 153,  ['mask_2'] = 9,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0,
            ['hair_1'] = 0,     ['hair_2'] = 0,
            ['bproof_1'] = 14,  ['bproof_2'] = 0
        } 
    },
    dev = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 30,   ['torso_2'] = 3,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 1,
            ['pants_1'] = 121,   ['pants_2'] = 2,
            ['shoes_1'] = 39,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 135,  ['mask_2'] = 9,
            ['chain_1'] = 0,    ['chain_2'] = 0,
          --  ['ears_1'] = 2,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0,
           -- ['hair_1'] = 0,     ['hair_2'] = 0,
            ['bproof_1'] = 14,  ['bproof_2'] = 0
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 30,   ['torso_2'] = 3,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 1,
            ['pants_1'] = 121,   ['pants_2'] = 9,
            ['shoes_1'] = 82,   ['shoes_2'] = 9,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = 153,  ['mask_2'] = 9,
            ['chain_1'] = 0,    ['chain_2'] = 0,
           -- ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0,
           -- ['hair_1'] = 0,     ['hair_2'] = 0,
            ['bproof_1'] = 14,  ['bproof_2'] = 0
        } 
    },
    sup = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 30,   ['torso_2'] = 3,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 1,
            ['pants_1'] = 121,   ['pants_2'] = 2,
            ['shoes_1'] = 39,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 0,
            ['chain_1'] = 1,    ['chain_2'] = 0,
            --['ears_1'] = 0,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0,
            --['hair_1'] = 0,     ['hair_2'] = 0,
            ['bproof_1'] = 18,  ['bproof_2'] = 2
        },
        female = {
            ['tshirt_1'] = 14,  ['tshirt_2'] = 0,
            ['torso_1'] = 452,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 1,
            ['pants_1'] = 50,   ['pants_2'] = 1,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['mask_1'] = -1,  ['mask_2'] = 2,
            ['chain_1'] = 1,    ['chain_2'] = 0,
            --['ears_1'] = 0,     ['ears_2'] = 0,
            ['bags_1'] = 0,     ['bags_2'] = 0,
            --['hair_1'] = 0,     ['hair_2'] = 0,
            ['bproof_1'] = 7,  ['bproof_2'] = 4
        }
    }
}

