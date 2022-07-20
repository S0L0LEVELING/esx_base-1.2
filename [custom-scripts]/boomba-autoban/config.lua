Config = {}

-- YOU WILL NEED EASYADMIN FOR THIS!! IT USES THE EASYADMIN BAN TRIGGER!! YOU CAN CHANGE IT YOURSELF IN THE SERVER.LUA IF YOU WANT! 

-- How often does it needs to check all items? MS 
Config.checkTime = 20000

-- Staff ACE group, they dont get banned but the item will be removed from inventory. 
Config.aceGroupStaff = "steam"

-- Items that only specific jobs should have. 
Config.govermentItems = {
    'combatpistol', 
    'nightstick',
    'medikit', 
    'fixkit'  
}

Config.policejob = "police"
Config.offpolicejob = "offpolice"
Config.ambulancejob = "ambulance"
Config.offambulancejob = "offambulance"
Config.mechanicjob = nil 

-- Items that nobody should have. 
Config.blacklistedItems = {
    "rpg", 
    "assaultrifle_mk2" 
}