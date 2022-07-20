Config = {}

-- Base settings --
Config.amountperlootcircle = math.random(1000, 2000)
Config.minimumcops = 2
Config.minimumspeed = 2
Config.HackBlock = 4
Config.HackTime = 20 
Config.timer = 200 
Config.policejob = 'police'
Config.CooldownMinutes = 60
Config.CopsCheckRefreshTime = 5 

-- Location settings -- 
Config.locationdoorlocks = { 
    Doorlock1 = {
		Pos   = {x = 112.8709, y = -1038.1420, z = 28.3332}, --112.8709, -1038.1420, 29.3360, 311.4930
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1
	},
	checkifexited = {
		Pos   = {x = 114.8743, y = -1038.6919, z = 28.3332}, -- 114.8743, -1038.6919, 29.3332, 88.5679
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 43
	}--,
    --[[Doorlock2 = {
		Pos   = {x = 239.471, y = -1380.960, z = 32.741},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1
	}]]
}

Config.location = {
    Loot1 = {
		Pos   = {x = 122.3437, y = -1037.2701, z = 28.1567}, -- 122.3437, -1037.2701, 29.1567, 257.9244
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Type  = 1
	},
    Loot2 = {
		Pos   = {x = 120.1204, y = -1043.1143, z = 28.3058}, -- 120.1204, -1043.1143, 29.3058, 113.9399
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Type  = 1
	},
    Loot3 = {
		Pos   = {x = 115.2784, y = -1043.3873, z = 28.3058}, -- 115.2784, -1043.3873, 29.3058, 277.5011
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Type  = 1
	},
    Loot4 = {
		Pos   = {x = 121.8163, y = -1028.9556, z = 28.3058}, -- 121.8163, -1028.9556, 29.3058, 342.9025
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 255, g = 255, b = 255},
		Type  = 1
	}
}

Config.DoorList = {
	{
		objHash = -1671171579,
		objHeading = 250.36,
		objCoords = vector3(114.5403, -1039.768, 29.7655),
		textCoords = vector3(114.5403, -1039.768, 29.7655),
		authorizedJobs = { 'ramkraak' },
		locked = true,
		maxDistance = 3
	}
} 