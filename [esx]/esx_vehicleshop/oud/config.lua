Config                            = {}
Config.DrawDistance               = 100
Config.MarkerColor                = {r = 120, g = 120, b = 240}
Config.EnablePlayerManagement     = true -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.ResellPercentage           = 75

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
		Pos   = vector3(-794.39, -217.82, 36.08),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = 1
	},

	ShopInside = {
		Pos     = vector3(-783.41, -223.35, 37.32),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 133.65,
		Type    = -1
	},

	ShopOutside = {
		Pos     = vector3(-774.2, -233.47, 37.08),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 205.61,
		Type    = -1
	},

	BossActions = {
		Pos   = vector3(-810.29, -207.93, 36.08),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	GiveBackVehicle = {
		Pos   = vector3(-768.41, -232.65, 36.08),
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

	ResellVehicle = {
		Pos   = vector3(-774.79, -194.11, 36.28),
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = 1
	}

}
