**Boomba Hacking System For FiveM:** 

Hi, 

My goal with the Hacking System was to make FiveM roleplay more realistic. I wanted to give players the ability to get data about other players using dark chat, for example, or to hack into cameras to better plan a heist. This is where the new blackout feature comes in very handy.

Features: 
[+] Unlimited Commands, add your own with your own triggers. 
[+] All LUA files are encrypted except config.lua & clientconfig.lua. You can change HTML, CSS & JS however you like but we will not provide support if you do. 
[+] Discord logging included 
[+] Lifetime Support 
[+] City blackout command build in. 
[+] You can change default notify 
[+] Integrate with other scripts 
 
If you have any suggestions, please contact me on CFX ( Boomba2022 ) or on Discord ( Boomba#0001 ). 

Author: Boomba#0001 // Boomba Scripting
Discord: discord.boomba.nl 
Version data: 2.0 
TEBEX Store: store.boomba.nl 
Support: Via Discord 

**Instal:** 

In the config.lua & clientconfig.lua you can find everything you need. You can add new commands here, change command names. 

__How to add data dump source?:__
1. Put the following trigger in the script you want to get data from. ( `TriggerServerEvent("boomba-hackingsystem:dumptodatabase", name, message, time, type`) ) This will dump the data to the "datadump" table.  

__How to add a command?:__
1. Add a Config.commandname under "-- // Commands \\ --". This step is optional but i would recommend it. 
2. Open clientconfig.lua and go to "-- [ Command Configuration ] --" tab and copy this: 
```
elseif string.find(finaldata, Config.commandname) then
    ESX.TriggerServerCallback("getdumpdata", function(cb)
                SendNUIMessage({
                    type = "datadump",
                    display = true, 
                    dump = cb
                })
                TriggerServerEvent("boomba-hackingsystem:logtodiscord", Config.legitcommand_wh, "Boomba Hacking System For FiveM", "Event: Known command\nPlayer: "..GetPlayerName(PlayerId()).." ["..GetPlayerServerId(PlayerId()).."]", 16711900)   
            end, type) 
```
3. Change "type" next to the "end)" to the type name in de "datadump" database table. ( Read __How to add data dump source?:__ to get more info about how to add data to the datadump table.)
4. Change the Config.commandname to the Config value you configured earlier or to the command you want in "". 
5. You can use it now! 

__How to change blackout settings?:__ 
1. Go to the config.lua & clientconfig.lua
2. For the duration you can change Config.blackoutduration to the correct duration. 
3. If you want to change the blackout notify scroll down to the "-- [ Blackout ] --" section. Change the notify here. 
4. If you want to change the blackout command name change Config.blackouthack. 

__How to change notify settings?:__
1. Read __How to change blackout settings?:__ 

__How to setup Discord logging?:__ 
1. Put in the webhooks under "-- // Discord Logging \\ --" and it should work. 

**Pictures:**
http://screenshot.boomba.nl/pijI0/FUgOmutO90.png
