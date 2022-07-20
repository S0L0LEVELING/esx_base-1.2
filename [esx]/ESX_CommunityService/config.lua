Config = {}

-- # Locale to be used. You can create your own by simple copying the 'en' and translating the values.
Config.Locale       				= 'en' -- Traduções disponives en / br

-- # By how many services a player's community service gets extended if he tries to escape
Config.ServiceExtensionOnEscape		= 8

-- # Don't change this unless you know what you are doing.
Config.ServiceLocation 				= {x = -452.08, y = 6106.61, z = 30.72}

-- # Don't change this unless you know what you are doing.
Config.ReleaseLocation				= {x = -439.87, y = 6020.93, z = 31.49}


-- # Don't change this unless you know what you are doing.
Config.ServiceLocations = {
	{ type = "cleaning", coords = vector3(-442.46, 6110.35, 31.16) },
	{ type = "cleaning", coords = vector3(-437.58, 6115.87, 31.23) },
	{ type = "cleaning", coords = vector3(-432.15, 6118.72, 31.46) },
	{ type = "cleaning", coords = vector3(-427.56, 6116.41, 31.61) },
	{ type = "cleaning", coords = vector3(-428.99, 6114.16, 31.66) },
	{ type = "cleaning", coords = vector3(-432.16, 6109.17, 31.6) },
	{ type = "gardening", coords = vector3(-436.05, 6102.92, 31.48) },
	{ type = "gardening", coords = vector3(-438.29, 6096.79, 31.49) },
	{ type = "gardening", coords = vector3(-466.73, 6109.72, 29.9) },
	{ type = "gardening", coords = vector3(-457.23, 6116.78, 30.17) },
	{ type = "gardening", coords = vector3(-448.13, 6117.97, 30.64) },
	{ type = "gardening", coords = vector3(-441.9, 6112.98, 31.11) },
	{ type = "gardening", coords = vector3(-452.08, 6106.61, 30.72) }
}



Config.Uniforms = {
	prison_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 146, ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 119, ['pants_1']  = 3,
			['pants_2']  = 7,   ['shoes_1']  = 12,
			['shoes_2']  = 12,  ['chain_1']  = 0,
			['chain_2']  = 0
		},
		female = {
			['tshirt_1'] = 3,   ['tshirt_2'] = 0,
			['torso_1']  = 38,  ['torso_2']  = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 120,  ['pants_1'] = 3,
			['pants_2']  = 15,  ['shoes_1']  = 66,
			['shoes_2']  = 5,   ['chain_1']  = 0,
			['chain_2']  = 0
		}
	}
}
