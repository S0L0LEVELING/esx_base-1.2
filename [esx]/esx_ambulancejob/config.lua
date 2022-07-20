Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 500  -- revive reward, set to 0 if you don't want it enabled
Config.ReviveReward2              = 100  -- revive reward politie, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'nl'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 10 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 15 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 2000

Config.RespawnPoint = {coords = vector3(298.55, -584.56, 42.26), heading = 70.07}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(333.21, -582.48, 104.77),
			sprite = 61,
			scale  = 1.2,
			color  = 37
		},

		AmbulanceActions = {
			vector3(300.75, -597.17, 42.28)
		},

		Pharmacies = {
			vector3(311.2, -596.72, 42.28)
		},

		Vehicles = {
			--[[{
				Spawner = vector3(329.93, -572.3, 29.23),
				InsideShop = vector3(332.23, -541.23, 28.32),
				Marker = {type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(325.9, -566.56, 28.44), heading = 340.33, radius = 4.0},
					{coords = vector3(337.18, -570.57, 28.67), heading = 28.44, radius = 4.0}
				}
			}]]
		},

		Helicopters = {
			--[[{
				Spawner = vector3(341.67, -582.13, 74.17),
				InsideShop = vector3(351.41, -587.87, 74.55),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(351.41, -587.87, 74.55), heading = 249.28, radius = 10.0}
				}
			}]]
		},

		FastTravels = {
			--[[{
				From = vector3(294.7, -1448.1, 29.0),
				To = {coords = vector3(272.8, -1358.8, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(275.3, -1361, 23.5),
				To = {coords = vector3(295.8, -1446.5, 28.9), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(247.3, -1371.5, 23.5),
				To = {coords = vector3(333.1, -1434.9, 45.5), heading = 138.6},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(335.5, -1432.0, 45.50),
				To = {coords = vector3(249.1, -1369.6, 23.5), heading = 0.0},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = {coords = vector3(320.9, -1478.6, 28.8), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = {coords = vector3(238.6, -1368.4, 23.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			}]]
		},

		FastTravelsPrompt = {
			--{
			--	From = vector3(332.04, -595.67, 42.28),
			--	To = {coords = vector3(338.43, -584.25, 73.17), heading = 0.0},
			--	Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
			--	Prompt = _U('fast_travel')
			--},

			--{
			--	From = vector3(256.5, -1357.7, 36.0),
			--	To = {coords = vector3(235.4, -1372.8, 26.3), heading = 0.0},
			--	Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
			--	Prompt = _U('fast_travel')
			--}
		}

	}
}

Config.AuthorizedVehicles = {
	car = {
		ambulance = {
			{model = 'ambum', price = 1},
			{model = 'ambumicu', price = 1},
			{model = 'ambucrafter', price = 1},
			{model = 'ambumotor', price = 1},
			{model = 'ambuopleiding', price = 1}
		},

		doctor = {
			{model = 'ambum', price = 1},
			{model = 'ambumicu', price = 1},
			{model = 'ambucrafter', price = 1},
			{model = 'ambumotor', price = 1}
		},

		chief_doctor = {
			{model = 'ambum', price = 1},
			{model = 'ambumicu', price = 1},
			{model = 'ambucrafter', price = 1},
			{model = 'ambumotor', price = 1}
		},

		boss = {
			{model = 'ambum', price = 1},
			{model = 'ambumicu', price = 1},
			{model = 'ambucrafter', price = 1},
			{model = 'ambumotor', price = 1}
		}
	},

	helicopter = {
		ambulance = {},

		doctor = {
			{model = 'supervolito', price = 1}
		},

		chief_doctor = {
			{model = 'supervolito', price = 1}
		},

		boss = {
			{model = 'supervolito', price = 1}
		}
	}
}
