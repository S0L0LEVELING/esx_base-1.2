Config                            = {}
Config.DrawDistance               = 100
Config.MarkerColor                = {r = 120, g = 120, b = 240}
Config.EnablePlayerManagement     = true -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.ResellPercentage           = 40

Config.Locale                     = 'en'

Config.LicenseEnable = true -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 2
Config.PlateNumbers2  = 1
Config.PlateUseSpace = true
Config.Zones = {

	ShopEntering = {
		Pos   = vector3(-781.46, -210.65, 36.15),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = 1
	},

	ShopInside = {
		Pos     = vector3(-791.97, -217.53, 37.41),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 37.41,
		Type    = -1
	},

	ShopOutside = {
		Pos     = vector3(-773.97, -232.87, 37.15),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 37.15,
		Type    = -1
	},

	GiveBackVehicle = {
		Pos   = vector3(141.68, -135.96, 53.7),
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

	ResellVehicle = {
		Pos   = vector3(142.04, -127.66, -53.83),
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = 1
	}

}
