Config              = {}
Config.DrawDistance = 100.0
Config.CopsRequired = 2
Config.BlipUpdateTime = 20 --In milliseconds. I used it on 3000. If you want instant update, 50 is more than enough. Even 100 is good. I hope it doesn't kill FPS and the server.
Config.CooldownMinutes = 10
Config.Locale = 'en'

Config.Zones = {
	VehicleSpawner = {
		Pos   = {x = 931.8492, y = -67.6718, z = 77.7824}, -- 931.8492, -67.6718, 78.7824, 333.7967
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Colour    = 6, --BLIP
		Id        = 229, --BLIP
	},
}

Config.VehicleSpawnPoint = {
      Pos   = {x = 880.3652, y = -81.9393, z = 78.7643, alpha = 143.9281}, --880.3652, -81.9393, 78.7643, 143.9281
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Type  = -1,
}

Config.Delivery = {
	--Desert
	--Trevor Airfield 9.22KM
	Delivery1 = {
		Pos      = {x = 1062.1178, y = -1967.2267, z = 30.0146}, -- 1062.1178, -1967.2267, 31.0146, 225.0253
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 4000,
		Cars = {'emperor2','tornado3','bodhi2'},
	},
	--Lighthouse 9.61KM
	Delivery4 = {
		Pos      = {x = -1140.2688, y = -1981.0963, z = 12.1626}, -- -1140.2688, -1981.0963, 13.1626, 195.4657
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 6000,
		Cars = {'emperor2','tornado3','bodhi2'},
	},
	--House in Paleto 12.94KM
	Delivery7 = {
		Pos      = {x = -1862.6006, y = -355.4542, z = 48.2212}, -- -1862.6006, -355.4542, 49.2212, 238.4657
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 3000,
		Cars = {'emperor2','tornado3','bodhi2'},
	},
	--Great Ocean Highway 10.47KM
	Delivery10 = {
		Pos      = {x = -328.7701, y = -1525.5028, z =  26.5338}, -- -328.7701, -1525.5028, 27.5338, 268.9977
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 5500,
		Cars = {'emperor2','tornado3','bodhi2'},
	},
	--Marina Drive Desert 8.15KM
	Delivery13 = {
		Pos      = {x = -226.7000, y = -1387.1000, z = 30.2538}, -- -226.7000, -1387.1000, 31.2538, 71.0007
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 6000,
		Cars = {'emperor2','tornado3','bodhi2'},
	},
}
