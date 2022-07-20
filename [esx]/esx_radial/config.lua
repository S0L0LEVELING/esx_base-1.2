ESX = nil
Citizen.CreateThread(function()
    while true do
        Wait(5)
        if ESX ~= nil then
       
        else
            ESX = nil
            ESX = nil
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        end
    end
end)
 
local isJudge = false
local isPolice = false
local isMedic = false
local isDoctor = false
local isNews = false
local isKmar = false
local isInstructorMode = false
local myJob = "unemployed"
local isHandcuffed = false
local isHandcuffedAndWalking = false
local hasOxygenTankOn = false
local gangNum = 0
local cuffStates = {}
 
rootMenuConfig =  {
    {
        id = "voertuig",
        displayName = "Voertuig",
        icon = "#Voertuig",
        enableMenu = function()
        fuck = exports["esx_ambulancejob"]:GetDeath()
        if not fuck and IsPedInAnyVehicle(PlayerPedId(), false) then
            return true
           end
        end,
        subMenus = {"voertuigmenu:motor", "voertuigmenu:deur1", "voertuigmenu:deur2", "voertuigmenu:deur3", "voertuigmenu:deur4", "voertuigmenu:deur5", "voertuigmenu:deur6", "voertuigmenu:extra1", "voertuigmenu:extra2", "voertuigmenu:extra3", "voertuigmenu:extra4", "voertuigmenu:extra5", "voertuigmenu:extra6", "voertuigmenu:extra7", "voertuigmenu:extra8", "voertuigmenu:extra9", "voertuigmenu:extra10", "voertuigmenu:extra11", "voertuigmenu:extra12", "voertuigmenu:extra13", "voertuigmenu:extra14",  }
    },
    {
        id = "voertuig",
        displayName = "Ramen",
        icon = "#Voertuig",
        enableMenu = function()
        fuck = exports["esx_ambulancejob"]:GetDeath()
        if not fuck and IsPedInAnyVehicle(PlayerPedId(), false) then
            return true
           end
        end,
        subMenus = {"voertuigmenu:raam1", "voertuigmenu:raam2", "voertuigmenu:raam3", "voertuigmenu:raam4" }
    },
	{
        id = "general",
        displayName = "Algemeen",
        icon = "#globe-europe",
        enableMenu = function()
        fuck = exports["esx_ambulancejob"]:GetDeath()
            return not fuck
        end,
        subMenus = {"general:takehostage", "general:dragen",  "general:checkoverself", "general:checktargetstates", "general:shuff", "general:emotes", "general:rekeningen" }
    },
	{
        id = "id",
        displayName = "Bewijzen",
        icon = "#cards",
        enableMenu = function()
        fuck = exports["esx_ambulancejob"]:GetDeath()
            return not fuck
        end,
        subMenus = {"bewijzen:id-card", "bewijzen:zieid-card", "bewijzen:rijbewijs", "bewijzen:zierijbewijs", "bewijzen:vliegbrevet", "bewijzen:zievliegbrevet", "bewijzen:wapen", "bewijzen:ziewapen" }
    },
    {
        id = "police-action",
        displayName = "Politie acties",
        icon = "#police-action",
        enableMenu = function()
           local ped = PlayerPedId()
           PlayerData = ESX.GetPlayerData()
           fuck = exports["esx_ambulancejob"]:GetDeath()
            if PlayerData.job.name == "police" or PlayerData.job.name == "kmar" and not fuck then
                return true
            end
        end,
        subMenus = {"cuffs:cuff", "cuffs:softcuff", "cuffs:uncuff", "police:putinvehicle", "police:backup", "police:unseatnearest", "cuffs:checkinventory", "police:pschild", "police:revive", "police:impound"}
    },
    {
        id = "k9",
        displayName = "K9",
        icon = "#k9",
        enableMenu = function()
        local ped = PlayerPedId()
           PlayerData = ESX.GetPlayerData()
           fuck = exports["esx_ambulancejob"]:GetDeath()
           if PlayerData.job.name == "police" and PlayerData.job.grade_name == 'boss' or PlayerData.job.name == "kmar" and PlayerData.job.grade_name == 'boss' and not fuck then
                return true
            end
        end,
        subMenus = {"k9:follow", "k9:vehicle",   "k9:sniffvehicle", "k9:attack", "k9:sit", "k9:sniff", "k9:spawn", "k9:delete", }
    },
    {
        id = "animations",
        displayName = "Loopstijlen",
        icon = "#walking",
        enableMenu = function()
        fuck = exports["esx_ambulancejob"]:GetDeath()
            return not fuck
        end,
        subMenus = { "animations:brave", "animations:hurry", "animations:business", "animations:tipsy", "animations:injured","animations:tough", "animations:default", "animations:hobo", "animations:money", "animations:swagger", "animations:shady", "animations:maneater", "animations:chichi", "animations:sassy", "animations:sad", "animations:posh", "animations:alien" }
    },
    {
        id = "expressions",
        displayName = "Expressies",
        icon = "#expressions",
        enableMenu = function()
        fuck = exports["esx_ambulancejob"]:GetDeath()
            return not fuck
        end,
        subMenus = { "expressions:normal", "expressions:drunk", "expressions:angry", "expressions:dumb", "expressions:electrocuted", "expressions:grumpy", "expressions:happy", "expressions:injured", "expressions:joyful", "expressions:mouthbreather", "expressions:oneeye", "expressions:shocked", "expressions:sleeping", "expressions:smug", "expressions:speculative", "expressions:stressed", "expressions:sulking", "expressions:weird", "expressions:weird2"}
    },
    {
        id = "judge-raid",
        displayName = "Judge Raid",
        icon = "#judge-raid",
        enableMenu = function()
            return (not isDead and isJudge)
        end,
        subMenus = { "judge-raid:checkowner", "judge-raid:seizeall", "judge-raid:takecash", "judge-raid:takedm"}
    },
    {
        id = "judge-licenses",
        displayName = "Judge Licenses",
        icon = "#judge-licenses",
        enableMenu = function()
            return (not isDead and isJudge)
        end,
        subMenus = { "police:checklicenses", "judge:grantDriver", "judge:grantBusiness", "judge:grantWeapon", "judge:grantHouse", "judge:grantBar", "judge:grantDA", "judge:removeDriver", "judge:removeBusiness", "judge:removeWeapon", "judge:removeHouse", "judge:removeBar", "judge:removeDA", "judge:denyWeapon", "judge:denyDriver", "judge:denyBusiness", "judge:denyHouse" }
    },
    {
        id = "judge-actions",
        displayName = "ANWB acties",
        icon = "#police-vehicle",
        enableMenu = function()
            local ped = PlayerPedId()
           PlayerData = ESX.GetPlayerData()
           fuck = exports["esx_ambulancejob"]:GetDeath()
            if PlayerData.job.name == "mechanic" and not fuck then
                return true
            end
        end,
        subMenus = { "mechanic:factuur", "mechanic:repair", "mechanic:clean", "mechanic:impound"}
    },
    {
        id = "medic",
        displayName = "Ambulance",
        icon = "#medic",
        enableMenu = function()
        local ped = PlayerPedId()
           PlayerData = ESX.GetPlayerData()
           fuck = exports["esx_ambulancejob"]:GetDeath()
            if PlayerData.job.name == "ambulance" and not fuck then
                return true
            end
        end,
        subMenus = {"medic:revive", "medic:heal", "medic:bigheal", "medic:drag", "medic:undrag", "medic:putinvehicle", "medic:takeoutvehicle", }
    },
    {
        id = "news",
        displayName = "Nieuws",
        icon = "#news",
        enableMenu = function()
            return (not isDead and isNews)
        end,
        subMenus = { "news:setCamera", "news:setMicrophone", "news:setBoom" }
    },
    {
        id = "oxygentank",
        displayName = "Remove Oxygen Tank",
        icon = "#oxygen-mask",
        functionName = "RemoveOxyTank",
        enableMenu = function()
        fuck = exports["esx_ambulancejob"]:GetDeath()
            return not fuck and hasOxygenTankOn
        end
    }
}

newSubMenus = { 
    ['general:emotes'] = {
        title = "Emotes",
        icon = "#general-emotes",
        functionName = "dp:RecieveMenu"
    },    
    ['general:shuff'] = {
        title = "shuff",
        icon = "#police-vehicle",
        functionName = "general:shuff",
        functionParameters = { "shuff" }
    },
	['general:rekeningen'] = {
        title = "Rekeningen",
        icon = "#animation-money",
        functionName = "billing:rekeningmenu"
    },
    ['general:putinvehicle'] = {
        title = "Zet in voertuig",
        icon = "#general-put-in-veh",
        functionName = "police:forceEnter"
    },
    ['general:unseatnearest'] = {
        title = "Haal uit voertuig",
        icon = "#general-unseat-nearest",
        functionName = "unseatPlayer"
    },    
    ['general:takehostage'] = {
        title = "Gijzel",
        icon = "#gijzel",
        functionName = "takehostage"
    },
	['general:dragen'] = {
        title = "Dragen",
        icon = "#dragen",
        functionName = "carry:start"
    },
    ['animations:brave'] = {
        title = "Braaf",
        icon = "#animation-brave",
        functionName = "AnimSet:Brave"
    },
    ['animations:hurry'] = {
        title = "Opschieten",
        icon = "#animation-hurry",
        functionName = "AnimSet:Hurry"
    },
    ['animations:business'] = {
        title = "Zakelijk",
        icon = "#animation-business",
        functionName = "AnimSet:Business"
    },
    ['animations:tipsy'] = {
        title = "Aangeschoten",
        icon = "#animation-tipsy",
        functionName = "AnimSet:Tipsy"
    },
    ['animations:injured'] = {
        title = "Gewond",
        icon = "#animation-injured",
        functionName = "AnimSet:Injured"
    },
    ['animations:tough'] = {
        title = "Moeilijk",
        icon = "#animation-tough",
        functionName = "AnimSet:ToughGuy"
    },
    ['animations:sassy'] = {
        title = "Sassy",
        icon = "#animation-sassy",
        functionName = "AnimSet:Sassy"
    },
    ['animations:sad'] = {
        title = "Verdrietig",
        icon = "#animation-sad",
        functionName = "AnimSet:Sad"
    },
    ['animations:posh'] = {
        title = "Chique",
        icon = "#animation-posh",
        functionName = "AnimSet:Posh"
    },
    ['animations:alien'] = {
        title = "Alien",
        icon = "#animation-alien",
        functionName = "AnimSet:Alien"
    },
    ['animations:nonchalant'] =
    {
        title = "Nonchalant",
        icon = "#animation-nonchalant",
        functionName = "AnimSet:NonChalant"
    },
    ['animations:hobo'] = {
        title = "Hobo",
        icon = "#animation-hobo",
        functionName = "AnimSet:Hobo"
    },
    ['animations:money'] = {
        title = "Geld",
        icon = "#animation-money",
        functionName = "AnimSet:Money"
    },
    ['animations:swagger'] = {
        title = "Swagger",
        icon = "#animation-swagger",
        functionName = "AnimSet:Swagger"
    },
    ['animations:shady'] = {
        title = "Verlegen",
        icon = "#animation-shady",
        functionName = "AnimSet:Shady"
    },
    ['animations:maneater'] = {
        title = "Man eter",
        icon = "#animation-maneater",
        functionName = "AnimSet:ManEater"
    },
    ['animations:chichi'] = {
        title = "ChiChi",
        icon = "#animation-chichi",
        functionName = "AnimSet:ChiChi"
    },
    ['animations:default'] = {
        title = "Standaard",
        icon = "#animation-default",
        functionName = "AnimSet:default"
    },
    ['mechanic:factuur'] = {
        title = "Factuur",
        icon = "#animation-money",
        functionName = "anwb:factuur"
    },
    ['mechanic:repair'] = {
        title = "Repareren",
        icon = "#police-vehicle",
        functionName = "anwb:mechrepair"
    },
    ['mechanic:clean'] = {
        title = "Schoonmaken",
        icon = "#police-vehicle",
        functionName = "anwb:mechclean"
    },
    ['mechanic:impound'] = {
        title = "Impound",
        icon = "#police-vehicle",
        functionName = "anwb:hijack"
    },
    ['k9:spawn'] = {
        title = "Roepen",
        icon = "#k9-spawn",
        functionName = "K9:menu",
		functionParameters = { "spawn" }
    },
    ['k9:delete'] = {
        title = "Afwijzen",
        icon = "#k9-dismiss",
        functionName = "K9:menu",
		functionParameters = { "delete" }
    },
    ['k9:follow'] = {
        title = "Volgen",
        icon = "#k9-follow",
        functionName = "K9:menu",
		functionParameters = { "follow" }
    },
    ['k9:vehicle'] = {
        title = "Ga in/uit",
        icon = "#k9-vehicle",
        functionName = "K9:menu",
		functionParameters = { "vehicle" }
    },
    ['k9:sit'] = {
        title = "Zit",
        icon = "#k9-sit",
        functionName = "K9:menu",
		functionParameters = { "stay" }
    },
    ['k9:sniff'] = {
        title = "Ruik persoon",
        icon = "#k9-sniff",
        functionName = "K9:menu",
		functionParameters = { "sehcit" }
    },
    ['k9:sniffvehicle'] = {
        title = "Zoek voertuig",
        icon = "#k9-sniff-vehicle",
        functionName = "K9:menu",
		functionParameters = { "sehveh" }
    },
    ['cuffs:cuff'] = {
        title = "Crimineel boeien",
        icon = "#cuffs-cuff",
        functionName = "politie:cuffcrimineel"
    }, 
    ['cuffs:softcuff'] = {
        title = "Boeien",
        icon = "#cuffs-cuff",
        functionName = "politie:cuff"
    },
    ['cuffs:uncuff'] = {
        title = "Boeien los",
        icon = "#cuffs-uncuff",
        functionName = "politie:uncuff"
    },
    ['cuffs:checkinventory'] = {
        title = "Doorzoek persoon",
        icon = "#cuffs-check-inventory",
        functionName = "politie:doorzoek"
    },
    ['cuffs:unseat'] = {
        title = "Unseat",
        icon = "#cuffs-unseat-player",
        functionName = "esx_ambulancejob:pullOutVehicle"
    },
    ['cuffs:checkphone'] = {
        title = "Read Phone",
        icon = "#cuffs-check-phone",
        functionName = "police:checkPhone"
    },
    ['medic:revive'] = {
        title = "Reanimeren",
        icon = "#medic",
        functionName = "ambu:revive"
    },
    ['medic:heal'] = {
        title = "Kleine wonden",
        icon = "#medic-heal",
        functionName = "ambu:small"
    },
    ['medic:bigheal'] = {
        title = "Grote wonden",
        icon = "#medic-heal",
        functionName = "ambu:big"
    },
    ['police:backup'] = {
        title = "Backup vragen",
        icon = "#dragen",
        functionName = "politie:AskBackup"
    },
    ['police:revive'] = {
        title = "Reanimeer",
        icon = "#general-escort",
        functionName = "politie:revive"
    },
    ['police:putinvehicle'] = {
        title = "Erin zetten",
        icon = "#general-put-in-veh",
        functionName = "politie:zetinvrtg"
    },
    ['police:unseatnearest'] = {
        title = "Eruit halen",
        icon = "#general-unseat-nearest",
        functionName = "politie:zetuitvrtg"
    },
    ['police:impound'] = {
        title = "Impound",
        icon = "#police-vehicle",
        functionName = "anwb:hijack"
    },
    ['police:cuff'] = {
        title = "Cuff",
        icon = "#cuffs-cuff",
        functionName = "police:cuffFromMenu"
    },
    ['police:checkbank'] = {
        title = "Check Bank",
        icon = "#police-check-bank",
        functionName = "police:checkBank"
    },
    ['police:checklicenses'] = {
        title = "Check Licenses",
        icon = "#police-check-licenses",
        functionName = "police:checkLicenses"
    },
  ['police:pschild'] = {
        title = "schild",
        icon = "#police-shield",
        functionName = "pschild"
    },
    ['judge:grantDriver'] = {
        title = "Grant Drivers",
        icon = "#judge-licenses-grant-drivers",
        functionName = "police:grantDriver"
    }, 
    ['judge:grantBusiness'] = {
        title = "Grant Business",
        icon = "#judge-licenses-grant-business",
        functionName = "police:grantBusiness"
    },  
    ['judge:grantWeapon'] = {
        title = "Grant Weapon",
        icon = "#judge-licenses-grant-weapon",
        functionName = "police:grantWeapon"
    },
    ['judge:grantHouse'] = {
        title = "Grant House",
        icon = "#judge-licenses-grant-house",
        functionName = "police:grantHouse"
    },
    ['judge:grantBar'] = {
        title = "Grant BAR",
        icon = "#judge-licenses-grant-bar",
        functionName = "police:grantBar"
    },
    ['judge:grantDA'] = {
        title = "Grant DA",
        icon = "#judge-licenses-grant-da",
        functionName = "police:grantDA"
    },
    ['judge:removeDriver'] = {
        title = "Remove Drivers",
        icon = "#judge-licenses-remove-drivers",
        functionName = "police:removeDriver"
    },
    ['judge:removeBusiness'] = {
        title = "Remove Business",
        icon = "#judge-licenses-remove-business",
        functionName = "police:removeBusiness"
    },
    ['judge:removeWeapon'] = {
        title = "Remove Weapon",
        icon = "#judge-licenses-remove-weapon",
        functionName = "police:removeWeapon"
    },
    ['judge:removeHouse'] = {
        title = "Remove House",
        icon = "#judge-licenses-remove-house",
        functionName = "police:removeHouse"
    },
    ['judge:removeBar'] = {
        title = "Remove BAR",
        icon = "#judge-licenses-remove-bar",
        functionName = "police:removeBar"
    },
    ['judge:removeDA'] = {
        title = "Remove DA",
        icon = "#judge-licenses-remove-da",
        functionName = "police:removeDA"
    },
    ['judge:denyWeapon'] = {
        title = "Deny Weapon",
        icon = "#judge-licenses-deny-weapon",
        functionName = "police:denyWeapon"
    },
    ['judge:denyDriver'] = {
        title = "Deny Drivers",
        icon = "#judge-licenses-deny-drivers",
        functionName = "police:denyDriver"
    },
    ['judge:denyBusiness'] = {
        title = "Deny Business",
        icon = "#judge-licenses-deny-business",
        functionName = "police:denyBusiness"
    },
    ['judge:denyHouse'] = {
        title = "Deny House",
        icon = "#judge-licenses-deny-house",
        functionName = "police:denyHouse"
    },
    ['news:setCamera'] = {
        title = "Camera",
        icon = "#news-job-news-camera",
        functionName = "camera:setCamera"
    },
    ['news:setMicrophone'] = {
        title = "Microphone",
        icon = "#news-job-news-microphone",
        functionName = "camera:setMic"
    },
    ['news:setBoom'] = {
        title = "Microphone Boom",
        icon = "#news-job-news-boom",
        functionName = "camera:setBoom"
    },
    ["expressions:angry"] = {
        title="Boos",
        icon="#expressions-angry",
        functionName = "expressions",
        functionParameters =  { "mood_angry_1" }
    },
    ["expressions:drunk"] = {
        title="Dronken",
        icon="#expressions-drunk",
        functionName = "expressions",
        functionParameters =  { "mood_drunk_1" }
    },
    ["expressions:dumb"] = {
        title="Dom",
        icon="#expressions-dumb",
        functionName = "expressions",
        functionParameters =  { "pose_injured_1" }
    },
    ["expressions:electrocuted"] = {
        title="Geëlektrocuteerd",
        icon="#expressions-electrocuted",
        functionName = "expressions",
        functionParameters =  { "electrocuted_1" }
    },
    ["expressions:grumpy"] = {
        title="Knorrig",
        icon="#expressions-grumpy",
        functionName = "expressions", 
        functionParameters =  { "mood_drivefast_1" }
    },
    ["expressions:happy"] = {
        title="Blij",
        icon="#expressions-happy",
        functionName = "expressions",
        functionParameters =  { "mood_happy_1" }
    },
    ["expressions:injured"] = {
        title="Gewond",
        icon="#expressions-injured",
        functionName = "expressions",
        functionParameters =  { "mood_injured_1" }
    },
    ["expressions:joyful"] = {
        title="Genieten",
        icon="#expressions-joyful",
        functionName = "expressions",
        functionParameters =  { "mood_dancing_low_1" }
    },
    ["expressions:mouthbreather"] = {
        title="Zucht",
        icon="#expressions-mouthbreather",
        functionName = "expressions",
        functionParameters = { "smoking_hold_1" }
    },
    ["expressions:normal"]  = {
        title="Normaal",
        icon="#expressions-normal",
        functionName = "expressions:clear"
    },
    ["expressions:oneeye"]  = {
        title="Knipoog",
        icon="#expressions-oneeye",
        functionName = "expressions",
        functionParameters = { "pose_aiming_1" }
    },
    ["expressions:shocked"]  = {
        title="Geschokt",
        icon="#expressions-shocked",
        functionName = "expressions",
        functionParameters = { "shocked_1" }
    },
    ["expressions:sleeping"]  = {
        title="Slapen",
        icon="#expressions-sleeping",
        functionName = "expressions",
        functionParameters = { "dead_1" }
    },
    ["expressions:smug"]  = {
        title="Zelfvoldaan",
        icon="#expressions-smug",
        functionName = "expressions",
        functionParameters = { "mood_smug_1" }
    },
    ["expressions:speculative"]  = {
        title="Speculatief",
        icon="#expressions-speculative",
        functionName = "expressions",
        functionParameters = { "mood_aiming_1" }
    },
    ["expressions:stressed"]  = {
        title="Gestrest",
        icon="#expressions-stressed",
        functionName = "expressions",
        functionParameters = { "mood_stressed_1" }
    },
    ["expressions:sulking"]  = {
        title="Mokkend",
        icon="#expressions-sulking",
        functionName = "expressions",
        functionParameters = { "mood_sulk_1" },
    },
    ["expressions:weird"]  = {
        title="Raar",
        icon="#expressions-weird",
        functionName = "expressions",
        functionParameters = { "effort_2" }
    },
    ["expressions:weird2"]  = {
        title="Raar 2",
        icon="#expressions-weird2",
        functionName = "expressions",
        functionParameters = { "effort_3" }
    },
	['bewijzen:id-card'] = {
        title = "Geef ID-kaart",
        icon = "#id-card",
        functionName = "bewijzen:geefid"
    },
	['bewijzen:zieid-card'] = {
        title = "Zie ID-kaart",
        icon = "#id-card",
        functionName = "bewijzen:id"
    },
	['bewijzen:rijbewijs'] = {
        title = "Geef Rijbewijs",
        icon = "#judge-licenses-grant-drivers",
        functionName = "bewijzen:geefrijbewijs"
    },
	['bewijzen:zierijbewijs'] = {
        title = "Zie Rijbewijs",
        icon = "#judge-licenses-grant-drivers",
        functionName = "bewijzen:rijbewijs"
    },
	['bewijzen:vliegbrevet'] = {
        title = "Geef Vliegbrevet",
        icon = "#vliegbrevet",
        functionName = "bewijzen:geefvliegbrevet"
    },
	['bewijzen:zievliegbrevet'] = {
        title = "Zie Vliegbrevet",
        icon = "#vliegbrevet",
        functionName = "bewijzen:vliegbrevet"
    },
    ['bewijzen:wapen'] = {
        title = "Geef Wapen Licentie",
        icon = "#judge-licenses-search-licenses",
        functionName = "bewijzen:geefwapen"
    },
	['bewijzen:ziewapen'] = {
        title = "Zie wapen licentie",
        icon = "#judge-licenses-search-licenses",
        functionName = "bewijzen:wapen"
    },
	['voertuigmenu:motor'] = {
        title = "Motor aan/uit",
        icon = "#motor",
        functionName = "voertuig:motor"
    },
	['voertuigmenu:deur1'] = {
        title = "L voor",
        icon = "#deur",
        functionName = "voertuig:deur1"
    },
	['voertuigmenu:deur2'] = {
        title = "R voor",
        icon = "#deur",
        functionName = "voertuig:deur2"
    },
	['voertuigmenu:deur3'] = {
        title = "L achter",
        icon = "#deur",
        functionName = "voertuig:deur3"
    },
	['voertuigmenu:deur4'] = {
        title = "R achter",
        icon = "#deur",
        functionName = "voertuig:deur4"
    },
	['voertuigmenu:deur5'] = {
        title = "Motorkap",
        icon = "#deur",
        functionName = "voertuig:deur5"
    },
	['voertuigmenu:deur6'] = {
        title = "Kofferbak",
        icon = "#deur",
        functionName = "voertuig:deur6"
    },
    ['voertuigmenu:raam1'] = {
        title = "L voor",
        icon = "#raam",
        functionName = "voertuig:raam1"
    },
    ['voertuigmenu:raam2'] = {
        title = "R voor",
        icon = "#raam",
        functionName = "voertuig:raam2"
    },
    ['voertuigmenu:raam3'] = {
        title = "L achter",
        icon = "#raam",
        functionName = "voertuig:raam3"
    },
    ['voertuigmenu:raam4'] = {
        title = "R achter",
        icon = "#raam",
        functionName = "voertuig:raam4"
    },
	['voertuigmenu:extra1'] = {
        title = "Extra 1",
        icon = "#extras",
        functionName = "voertuig:extra1"
    },
	['voertuigmenu:extra2'] = {
        title = "Extra 2",
        icon = "#extras",
        functionName = "voertuig:extra2"
    },
	['voertuigmenu:extra3'] = {
        title = "Extra 3",
        icon = "#extras",
        functionName = "voertuig:extra3"
    },
	['voertuigmenu:extra4'] = {
        title = "Extra 4",
        icon = "#extras",
        functionName = "voertuig:extra4"
    },
	['voertuigmenu:extra5'] = {
        title = "Extra 5",
        icon = "#extras",
        functionName = "voertuig:extra5"
    },
	['voertuigmenu:extra6'] = {
        title = "Extra 6",
        icon = "#extras",
        functionName = "voertuig:extra6"
    },
	['voertuigmenu:extra7'] = {
        title = "Extra 7",
        icon = "#extras",
        functionName = "voertuig:extra7"
    },
	['voertuigmenu:extra8'] = {
        title = "Extra 8",
        icon = "#extras",
        functionName = "voertuig:extra8"
    },
	['voertuigmenu:extra9'] = {
        title = "Extra 9",
        icon = "#extras",
        functionName = "voertuig:extra9"
    },
	['voertuigmenu:extra10'] = {
        title = "Extra 10",
        icon = "#extras",
        functionName = "voertuig:extra10"
    },
	['voertuigmenu:extra11'] = {
        title = "Extra 1",
        icon = "#extras",
        functionName = "voertuig:extra11"
    },
	['voertuigmenu:extra12'] = {
        title = "Extra 12",
        icon = "#extras",
        functionName = "voertuig:extra12"
    },
	['voertuigmenu:extra13'] = {
        title = "Extra 13",
        icon = "#extras",
        functionName = "voertuig:extra13"
    },
	['voertuigmenu:extra14'] = {
        title = "Extra 14",
        icon = "#extras",
        functionName = "voertuig:extra14"
    }
}

RegisterNetEvent("menu:setCuffState")
AddEventHandler("menu:setCuffState", function(pTargetId, pState)
    cuffStates[pTargetId] = pState
end)


RegisterNetEvent("isJudge")
AddEventHandler("isJudge", function()
    isJudge = true
end)

RegisterNetEvent("isJudgeOff")
AddEventHandler("isJudgeOff", function()
    isJudge = false
end)

RegisterNetEvent('pd:deathcheck')
AddEventHandler('pd:deathcheck', function()
    if not isDead then
        isDead = true
    else
        isDead = false
    end
end)

RegisterNetEvent("drivingInstructor:instructorToggle")
AddEventHandler("drivingInstructor:instructorToggle", function(mode)
    if myJob == "driving instructor" then
        isInstructorMode = mode
    end
end)

RegisterNetEvent("police:currentHandCuffedState")
AddEventHandler("police:currentHandCuffedState", function(pIsHandcuffed, pIsHandcuffedAndWalking)
    isHandcuffedAndWalking = pIsHandcuffedAndWalking
    isHandcuffed = pIsHandcuffed
end)

RegisterNetEvent("menu:hasOxygenTank")
AddEventHandler("menu:hasOxygenTank", function(pHasOxygenTank)
    hasOxygenTankOn = pHasOxygenTank
end)

RegisterNetEvent('enablegangmember')
AddEventHandler('enablegangmember', function(pGangNum)
    gangNum = pGangNum
end)

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            players[#players+1]= i
        end
    end

    return players
end

function GetClosestPlayer()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local closestPed = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        for index,value in ipairs(players) do
            local target = GetPlayerPed(value)
            if(target ~= ply) then
                local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
                local distance = #(vector3(targetCoords["x"], targetCoords["y"], targetCoords["z"]) - vector3(plyCoords["x"], plyCoords["y"], plyCoords["z"]))
                if(closestDistance == -1 or closestDistance > distance) and not IsPedInAnyVehicle(target, false) then
                    closestPlayer = value
                    closestPed = target
                    closestDistance = distance
                end
            end
        end
        return closestPlayer, closestDistance, closestPed
    end
end
