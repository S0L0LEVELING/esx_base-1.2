Config              = {}
Config.DrawDistance = 100.0
Config.MarkerColor  = { r = 120, g = 120, b = 240 }
Config.Locale       = 'en'

Config.Zones = {
	OfficeEnter = {
		Pos   = { x = -114.39, y = -605.47, z = 35.28 },
		Size  = { x = 2.5, y = 2.5, z = 1.0 },
		Type  = 1
	},

	OfficeExit = {
		Pos   = { x = -141.226, y = -614.166, z = 167.820 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = 1
	},

	OfficeInside = {
		Pos   = { x = -140.969, y = -616.785, z = 167.820 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},

	OfficeOutside = {
		Pos   = { x = -109.34, y = -607.45, z = 35.28 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},

	OfficeActions = {
		Pos   = { x = -124.786, y = -641.486, z = 167.820 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	}
}
