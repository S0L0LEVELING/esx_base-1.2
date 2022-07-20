Config                            = {}
Config.Locale                     = 'nl'

Config.DrawDistance               = 20.0 -- How close you need to be in order for the markers to be drawn (in GTA units).
Config.MaxInService               = -1
Config.EnablePlayerManagement     = true -- Enable society managing.
Config.EnableSocietyOwnedVehicles = false
Config.EnableJobBlip              = true -- enable blips for cops on duty, requires esx_society
Config.EnableJobLogs              = true -- only turn this on if you are using esx_joblogs
Config.NPCSpawnDistance           = 500.0
Config.NPCNextToDistance          = 25.0
Config.NPCJobEarnings             = { min = 15, max = 40 }

Config.Vehicles = {
	'flatbed',
	'anwbvito',
	'anwbamarok',
	'rwsmotor',
	'pranger',
	'anwbt5'
}

Config.Zones = {

    MechanicActions = {
		Pos   = { x = -352.43, y = -142.17, z = 38.01 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 1
	},

	--[[Garage = {
		Pos   = { x = -352.43, y = -142.17, z = 38.01 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 1
    },]]

	--[[Craft = {
		Pos   = { x = -331.11, y = -115.1, z = 44.58 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 1
	},]]

	VehicleSpawnPoint = {
		Pos   = { x = -370.81, y = -108.73, z = 38.73 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},

	VehicleDeleter = {
		Pos   = { x = -385.81, y = -107.99, z = 37.69 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = 1
	},

	VehicleDelivery = {
		Pos   = { x = -388.61, y = -103.88, z = 37.71 },
		Size  = { x = 20.0, y = 20.0, z = 3.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1
	},
}

Config.Towables = {
	vector3(-2480.9, -212.0, 17.4)
}

for k,v in ipairs(Config.Towables) do
	Config.Zones['Towable' .. k] = {
		Pos   = v,
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 204, g = 204, b = 0 },
		Type  = -1
	}
end