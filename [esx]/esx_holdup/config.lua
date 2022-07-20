Config = {}
Config.Locale = 'en'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.PoliceNumberRequired = 0
Config.TimerBeforeNewRob    = 1800 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 20   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Stores = {
	["paleto_twentyfourseven"] = {
		position = { x = 1736.32, y = 6419.47, z = 35.03 },
		reward = math.random(50000, 100000),
		nameOfStore = "24/7. (Paleto Bay)",
		secondsRemaining = 350, -- seconds
		lastRobbed = 0
	},
	["sandyshores_twentyfoursever"] = {
		position = { x = 1961.24, y = 3749.46, z = 32.34 },
		reward = math.random(50000, 100000),
		nameOfStore = "24/7. (Sandy Shores)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["littleseoul_twentyfourseven"] = {
		position = { x = -709.17, y = -904.21, z = 19.21 },
		reward = math.random(50000, 100000),
		nameOfStore = "Shell. (Little Seoul)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["bar_one"] = {
		position = { x = 1990.57, y = 3044.95, z = 47.21 },
		reward = math.random(50000, 100000),
		nameOfStore = "Yellow Jack. (Sandy Shores)",
		secondsRemaining = 300, -- seconds
		lastRobbed = 0
	},
	["ocean_liquor"] = {
		position = { x = -2959.33, y = 388.21, z = 14.00 },
		reward = math.random(50000, 100000),
		nameOfStore = "Robs Liquor. (Great Ocean Highway)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["rancho_liquor"] = {
		position = { x = 1126.80, y = -980.40, z = 45.41 },
		reward = math.random(50000, 100000),
		nameOfStore = "Robs Liquor. (El Rancho Blvd)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["sanandreas_liquor"] = {
		position = { x = -1219.85, y = -916.27, z = 11.32 },
		reward = math.random(50000, 100000),
		nameOfStore = "Robs Liquor. (San Andreas Avenue)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["grove_ltd"] = {
		position = { x = -43.40, y = -1749.20, z = 29.42 },
		reward = math.random(50000, 100000),
		nameOfStore = "LTD Gasoline. (Grove Street)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["beach_247"] = {
		position = { x = -3047.93, y = 587.66, z = 7.91 },
		reward = math.random(50000, 100000),
		nameOfStore = "Jumbo. (Strand)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["beach_ltd"] = {
		position = { x = -3249.33, y = 1004.71, z = 12.83 },
		reward = math.random(50000, 100000),
		nameOfStore = "Albert Heijn.",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["sandy_shop"] = {
		position = { x = 1393.69, y = 3608.96, z = 34.98 },
		reward = math.random(50000, 100000),
		nameOfStore = "Boni.",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["snelweg"] = {
		position = { x = 2673.26, y = 3286.16, z = 55.24 },
		reward = math.random(50000, 100000),
		nameOfStore = "TankStation Shell.",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["shandyletto"] = {
		position = { x = 1706.49, y = 4919.72, z = 42.06 },
		reward = math.random(50000, 100000),
		nameOfStore = "TankStation BP.",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["shandystad"] = {
		position = { x = 2549.91, y = 385.9, z = 108.6 },
		reward = math.random(50000, 100000),
		nameOfStore = "TankStation OK.",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["albert"] = {
		position = { x = 28.89, y = -1340.02, z = 29.5 },
		reward = math.random(50000, 100000),
		nameOfStore = "Albert Heijn (ANWB).",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["247g"] = {
		position = { x = 377.98, y = 332.5, z = 103.57 },
		reward = math.random(50000, 100000),
		nameOfStore = "Albert Heijn (Grote Bank).",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["gall"] = {
		position = { x = -1479.47, y = -374.24, z = 39.16 },
		reward = math.random(50000, 100000),
		nameOfStore = "Gall en Gall.",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["station"] = {
		position = { x = -1827.78, y = 799.21, z = 138.16 },
		reward = math.random(50000, 100000),
		nameOfStore = "TankStation Tamoil.",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["mirror_ltd"] = {
		position = { x = 1160.67, y = -314.40, z = 69.20 },
		reward = math.random(50000, 100000),
		nameOfStore = "LTD Gasoline. (Mirror Park Boulevard)",
		secondsRemaining = 200, -- seconds
		lastRobbed = 0
	},
	["PrincipalBank"] = {
		position = { x = 255.001098632813, y = 225.855895996094, z = 101.88 },
		reward = math.random(250000,1000000),
		nameOfStore = "Principal bank",
		secondsRemaining = 240, -- seconds
		lastRobbed = 0
	}
}
