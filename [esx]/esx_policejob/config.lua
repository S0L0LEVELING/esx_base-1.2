Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableLicenses             = true -- enable if you're using esx_license
Config.EnableJobLogs              = true -- only turn this on if you are using esx_joblogs
Config.ReviveReward               = 100  -- revive reward, set to 0 if you don't want it enabled

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 20 * 100000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for cops on duty, requires esx_society
Config.EnableCustomPeds           = false -- enable custom peds in cloak room? See Config.CustomPeds below to customize peds

Config.EnableESXService           = false -- enable esx service?
Config.MaxInService               = 1000

Config.Locale                     = 'nl'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(-1094.34, -828.22, 30.711),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 4
		},

		Items = {
            { name = 'nightstick',    		label = 'Wapenstok',    		price = 1 },
			{ name = 'pistol',    	        label = 'Walther P99',        	price = 1 },
			{ name = 'carbinerifle_mk2',    label = 'Carbine MK2',        	price = 1 },
			{ name = 'smg_mk2',    label = 'SMG Mk2',     price = 1 },
			{ name = 'stungun',    			label = 'Stroomstootwapen',     price = 1 },
			{ name = 'marksmanrifle',    	label = 'Marksman rifle',     price = 1 },
			{ name = 'sniperrifle',    	label = 'Sniper rifle',     price = 1 },
			{ name = 'flashlight',    		label = 'Zaklamp',  			price = 1 }, --pumpshotgun_mk2
			{ name = 'carbinerifle',    	label = 'HK416',    	        price = 1 },
			{ name = 'medikit',             label = 'Spoed koffer',         price = 1 },
			--{ name = 'flashbang',    		label = 'Flashbang',    		price = 1 },
			{ name = 'pistol_ammo',    		label = 'Pistool kogels x20',   price = 1 },
			{ name = 'rifle_ammo',    		label = 'Rifle kogels x20',    	price = 1 },			
        },

		Cloakrooms = {
			vector3(460.51, -977.69, 34.3),
			vector3(-448.7298, 6018.3564, 31.7164), -- 
			vector3(1849.12, 3696.01, 34.27)
		},	

		Armories = {
			vector3(1841.42, 3690.65, 34.26),
			vector3(-438.8673, 6009.3745, 31.7165), -- 
			vector3(438.38, -987.74, 34.3),
			vector3(467.72, -993.15, 23.92),
			vector3(-1095.77, -841.05, 19.20),
			vector3(-437.13, 6001.15, 31.72)
		},

		Vehicles = {
			{
				Spawner = vector3(1850.5, 3679.34, -134.27),
				InsideShop = vector3(1869.6, 3692.66, 33.32),
				SpawnPoints = {
					{coords = vector3(1853.67, 3674.2, 33.61), heading = 211.95, radius = 2.0},
					{coords = vector3(1850.37, 3674.36, 33.61), heading = 211.95, radius = 2.0},
					{coords = vector3(1847.02, 3674.44, 33.61), heading = 211.95, radius = 2.0}
				}
			},

			{
				Spawner = vector3(-1115.01, -834.98, -120.91),
				InsideShop = vector3(-1135.01, -856.01, 13.56),
				SpawnPoints = {
					{coords = vector3(-1112.4, -854.96, 13.18), heading = 38.01, radius = 2.0},
					{coords = vector3(-1116.11, -857.01, 13.18), heading = 38.01, radius = 2.0},
					{coords = vector3(-1126.48, -864.61, 13.18), heading = 38.01, radius = 2.0},
					{coords = vector3(-1123.58, -862.3, 13.18), heading = 38.01, radius = 2.0}
				}
			},
		},

		Helicopters = {
			{
				Spawner = vector3(-1094.44, -842.16, -137.7),
				InsideShop = vector3(-1096.23, -832.06, 37.7),
				SpawnPoints = {
					{coords = vector3(-1096.23, -832.06, 37.7), heading = 129.16, radius = 10.0}
				}
			}
		}

	}

}

Config.AuthorizedWeapons = {
	handhaving = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
	},

	aspirant = {
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
	},

	surveillant = {
		{weapon = 'WEAPON_PISTOL', components = {0, 0, 1000, 4000, nil}, price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
	},

	agent = {
		{weapon = 'WEAPON_PISTOL', components = {0, 10000, 0, nil, nil}, price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
	},

	hoofdagent = {
		{weapon = 'WEAPON_PISTOL', components = {0, 10000, 0, nil, nil}, price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 100000, 0, 0, 0, 0}, price = 1 }
	},

	brigadier = {
		{weapon = 'WEAPON_PISTOL', components = {0, 10000, 0, nil, nil}, price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_HEAVYSNIPER', price = 1 },
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 100000, 0, 0, 0, 0}, price = 1 }
	},

	inspecteur = {
		{weapon = 'WEAPON_PISTOL', components = {0, 10000, 0, nil, nil}, price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_HEAVYSNIPER', price = 1 },
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 100000, 0, 0, 0, 0}, price = 1 }
	},

	hoofdinspecteur = {
		{weapon = 'WEAPON_PISTOL', components = {0, 10000, 0, nil, nil}, price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_HEAVYSNIPER', price = 1 },
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 100000, 0, 0, 0, 0}, price = 1 }
	},

	commissaris = {
		{weapon = 'WEAPON_PISTOL', components = {0, 10000, 0, nil, nil}, price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_HEAVYSNIPER', price = 1 },
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 100000, 0, 0, 0, 0}, price = 1 }
	},

	hoofdcommissaris = {
		{weapon = 'WEAPON_PISTOL', components = {0, 10000, 0, nil, nil}, price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_HEAVYSNIPER', price = 1 },
		{weapon = 'WEAPON_CARBINERIFLE',components = {0, 0, 100000, 0, 0, 0, 0}, price = 1 }
	},

	boss = {
		{weapon = 'WEAPON_PISTOL', components = {0, 10000, 0, nil, nil}, price = 1},
		{weapon = 'WEAPON_NIGHTSTICK', price = 1},
		{weapon = 'WEAPON_STUNGUN', price = 1},
		{weapon = 'WEAPON_FLASHLIGHT', price = 1},
		{weapon = 'WEAPON_HEAVYSNIPER', price = 1 },
		{weapon = 'WEAPON_CARBINERIFLE', components = {0, 0, 100000, 0, 0, 0, 0}, price = 1 }
	}
}

Config.AuthorizedVehicles = {
	car = {
		aspirant = {
		{model = 'politiebklasse', price = 1},
		{model = 'politiefiets', price = 1}
		},

		surveillant = {
		{model = 'politiebklasse', price = 1},
		{model = 'politiefiets', price = 1}
		},

		agent = {
			{model = 'politiebklasse', price = 1},
			{model = 'politiefiets', price = 1},
			{model = 'politieoffroad', price = 1},
			{model = 'politiet6', price = 1},
			{model = 'politietouran', price = 1},
			{model = 'politiev70', price = 1},
			{model = 'politievito', price = 1},
			{model = 'politiexc90', price = 1}
		},

		hoofdagent = {
			{model = 'politiebklasse', price = 1},
			{model = 'politiefiets', price = 1},
			{model = 'politieoffroad', price = 1},
			{model = 'politiet6', price = 1},
			{model = 'politiemotor', price = 1},
			{model = 'politietouran', price = 1},
			{model = 'politiev70', price = 1},
			{model = 'politievito', price = 1},
			{model = 'politiexc90', price = 1},
			{model = 'politie12', price = 1},
			{model = 'politie13', price = 1},
			{model = 'upolitiea4', price = 1},
			{model = 'upolitietarteon', price = 1},
			{model = 'upolitiebmw', price = 1},
			{model = 'upolitiepassat', price = 1},
		},

		brigadier = {
			{model = 'politiebklasse', price = 1},
			{model = 'politiefiets', price = 1},
			{model = 'politieoffroad', price = 1},
			{model = 'politiet6', price = 1},
			{model = 'politiemotor', price = 1},
			{model = 'politietouran', price = 1},
			{model = 'politiev70', price = 1},
			{model = 'politievito', price = 1},
			{model = 'politiexc90', price = 1},
			{model = 'politie12', price = 1},
			{model = 'politie13', price = 1},
			{model = 'upolitiea4', price = 1},
			{model = 'upolitietarteon', price = 1},
			{model = 'upolitiebmw', price = 1},
			{model = 'upolitiepassat', price = 1},
			{model = 'politie1', price = 1},
			{model = 'politie15', price = 1},
		},

		inspecteur = {
			{model = 'politiebklasse', price = 1},
			{model = 'politiefiets', price = 1},
			{model = 'politieoffroad', price = 1},
			{model = 'politiet6', price = 1},
			{model = 'politiemotor', price = 1},
			{model = 'politietouran', price = 1},
			{model = 'politiev70', price = 1},
			{model = 'politievito', price = 1},
			{model = 'politiexc90', price = 1},
			{model = 'politie12', price = 1},
			{model = 'politie13', price = 1},
			{model = 'politie1', price = 1},
			{model = 'politie15', price = 1},
			{model = 'politie20', price = 1},
			{model = 'politie25', price = 1},
			{model = 'politie32', price = 1},
			{model = 'politie35', price = 1},
		},

		hoofdinspecteur = {
			{model = 'politiebklasse', price = 1},
			{model = 'politiefiets', price = 1},
			{model = 'politieoffroad', price = 1},
			{model = 'politiet6', price = 1},
			{model = 'politiemotor', price = 1},
			{model = 'politietouran', price = 1},
			{model = 'politiev70', price = 1},
			{model = 'politievito', price = 1},
			{model = 'politiexc90', price = 1},
			{model = 'politie12', price = 1},
			{model = 'politie13', price = 1},
			{model = 'politie1', price = 1},
			{model = 'politie15', price = 1},
			{model = 'politie20', price = 1},
			{model = 'politie25', price = 1},
			{model = 'politie32', price = 1},
			{model = 'politie35', price = 1},
		},

		commissaris = {
			{model = 'politiebklasse', price = 1},
			{model = 'politiefiets', price = 1},
			{model = 'politieoffroad', price = 1},
			{model = 'politiet6', price = 1},
			{model = 'politiemotor', price = 1},
			{model = 'politietouran', price = 1},
			{model = 'politiev70', price = 1},
			{model = 'politievito', price = 1},
			{model = 'politiexc90', price = 1},
			{model = 'politie12', price = 1},
			{model = 'politie13', price = 1},
			{model = 'politie1', price = 1},
			{model = 'politie15', price = 1},
			{model = 'politie20', price = 1},
			{model = 'politie25', price = 1},
			{model = 'politie32', price = 1},
			{model = 'politie35', price = 1},
			{model = 'riot',      price = 1},
			{model = 'upolities4avant', price = 1},
			{model = 'upolitiepassat', price = 1},
			{model = 'upolitiearteon', price = 1},
			{model = 'upolitiebmw', price = 1},
		},

		hoofdcommissaris = {
			{model = 'politiebklasse', price = 1},
			{model = 'politiefiets', price = 1},
			{model = 'politieoffroad', price = 1},
			{model = 'politiet6', price = 1},
			{model = 'politiemotor', price = 1},
			{model = 'politietouran', price = 1},
			{model = 'politiev70', price = 1},
			{model = 'politievito', price = 1},
			{model = 'politiexc90', price = 1},
			{model = 'politie12', price = 1},
			{model = 'politie13', price = 1},
			{model = 'politie1', price = 1},
			{model = 'politie15', price = 1},
			{model = 'politie20', price = 1},
			{model = 'politie25', price = 1},
			{model = 'politie32', price = 1},
			{model = 'politie35', price = 1},
			{model = 'riot',      price = 1},
			{model = 'upolities4avant', price = 1},
			{model = 'upolitiepassat', price = 1},
			{model = 'upolitiearteon', price = 1},
			{model = 'upolitiebmw', price = 1},
		},

		boss = {
			{model = 'politiebklasse', price = 1},
			{model = 'politiefiets', price = 1},
			{model = 'politieoffroad', price = 1},
			{model = 'politiet6', price = 1},
			{model = 'politiemotor', price = 1},
			{model = 'politietouran', price = 1},
			{model = 'politiev70', price = 1},
			{model = 'politievito', price = 1},
			{model = 'politiexc90', price = 1},
			{model = 'politie12', price = 1},
			{model = 'politie13', price = 1},
			{model = 'politie1', price = 1},
			{model = 'politie15', price = 1},
			{model = 'politie20', price = 1},
			{model = 'politie25', price = 1},
			{model = 'politie32', price = 1},
			{model = 'politie35', price = 1},
			{model = 'riot',      price = 1},
			{model = 'upolities4avant', price = 1},
			{model = 'upolitiepassat', price = 1},
			{model = 'upolitiearteon', price = 1},
			{model = 'upolitiebmw', price = 1},
		}
	},

	helicopter = {
        aspirant = {},

		surveillant = {},

		agent = {},

		hoofdagent = {},

		brigadier = {},

		inspecteur = {
			{model = 'polmav', props = {modLivery = 0}, price = 1}
		},

		hoofdinspecteur = {
			{model = 'polmav', props = {modLivery = 0}, price = 1}
		},

		commissaris = {
			{model = 'polmav', props = {modLivery = 0}, price = 1},
			{model = 'aw139', props = {modLivery = 0}, price = 1}
		},

		hoofdcommissaris = {
			{model = 'polmav', props = {modLivery = 0}, price = 1},
			{model = 'aw139', props = {modLivery = 0}, price = 1}
		},

		boss = {
			{model = 'polmav', props = {modLivery = 0}, price = 1},
			{model = 'aw139', props = {modLivery = 0}, price = 1}
		}
	}
}

Config.CustomPeds = {
	shared = {
		{label = 'Sheriff Ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'},
		{label = 'Police Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},

	aspirant = {},

	surveillant = {},

	agent = {},

	hoofdagent = {},

	brigadier = {},

	inspecteur = {},

	hoofdinspecteur = {},

	commissaris = {},

	hoofdcommissaris = {},

	boss = {
		{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	aspirant = {
		male = {
		},
		female = {
		}
	},

	surveillant = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	agent = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 1,
			arms = 44,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	hoofdagent = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 0,  helmet_2 = -1,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},


	brigadier = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 5,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 0,  helmet_2 = -1,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	inspecteur = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	hoofdinspecteur = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 0,  helmet_2 = -1,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},


	commissaris = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 0,  helmet_2 = -1,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	hoofdcommissaris = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 0,  helmet_2 = -1,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},


	boss = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 0,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0,
			bag_1 = 2,      bag_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 0,  helmet_2 = -1,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	dsi_wear = { -- currently the same as chef_wear
	male = {
		tshirt_1 = 6,  tshirt_2 = 0,
		torso_1 = 7,    torso_2 = 0,
		arms = 42,
		pants_1 = 4,    pants_2 = 2,
		helmet_1 = 4,   helmet_2 = 0,
		chain_1 = 2,    chain_2 = 0,
		ears_1 = -1,    ears_2 = 0,
		bproof_1 = 7,   bproof_2 = 0,
		mask_1 = 55,    mask_2 = 0,
		hair_1 = -1,    hair_2 = 0
	},
	female = {
		tshirt_1 = -1,  tshirt_2 = 0,
		torso_1 = 7,    torso_2 = 0,
		arms = 42,
		pants_1 = 4,    pants_2 = 2,
		helmet_1 = -1,   helmet_2 = 0,
		chain_1 = 2,    chain_2 = 0,
		ears_1 = -1,    ears_2 = 0,
		bproof_1 = 7,   bproof_2 = 0,
		mask_1 = 55,    mask_2 = 0,
		hair_1 = -1,    hair_2 = 0
	}
},
at_wear = {
	male = {
		tshirt_1 = -1,  tshirt_2 = 0,
		torso_1 = 6,    torso_2 = 0,
		arms = 42,
		pants_1 = 4,    pants_2 = 2,
		helmet_1 = 6,   helmet_2 = 0,
		chain_1 = 2,    chain_2 = 0,
		ears_1 = -1,    ears_2 = 0,
		bproof_1 = 8,   bproof_2 = 0,
		mask_1 = 55,    mask_2 = 0,
		hair_1 = -1,    hair_2 = 0
	},
	female = {
		bproof_1 = 7,   bproof_2 = 0,
	}
},

	helm_wear = {
		male = {
			helmet_1 = 2,  helmet_2 = 0,
		},
		female = {
			helmet_1 = 2,  helmet_2 = 0,
		}
	},

	motor_wear = {
		male = {
			helmet_1 = 17,  helmet_2 = 0,
			torso_1 = 9,   torso_2 = 0,
		},
		female = {
			helmet_1 = 17,  helmet_2 = 0,
			torso_1 = 9,   torso_2 = 0,
		}
	},

	motors_wear = {
		male = {
			bproof_1 = 1,   bproof_2 = 1
		},
		female = {
			bproof_1 = 1,   bproof_2 = 1
		}
	},

	honden_wear = {
		male = {
			bproof_1 = 1, bproof_2 = 4 
		},
		female = {
			bproof_1 = 1, bproof_2 = 4 
		}
	},

	gilet_wear = {
		male = {
			bproof_1 = 6,  bproof_2 = 4
		},
		female = {
			tshirt_1 = 6,  tshirt_2 = 4
		}
	},

	steek_wear = {
		male = {
			bproof_1 = 1,  bproof_2 = 0
		},
		female = {
			tshirt_1 = 1,  tshirt_2 = 0
		}
	},

	ibt_wear = {
		male = {
			tshirt_1 = 5,  tshirt_2 = 0,
			torso_1 = 10,   torso_2 = 4,
			arms = 41,
			pants_1 = 11,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0,
			bag_1 = 2,      bag_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 1
		}
	},

	bullet_wear = {
		male = {
			decals_1 = 1,  decals_2 = 0
		},
		female = {
			decals_1 = 1,  decals_2 = 0
		}
	}
}
