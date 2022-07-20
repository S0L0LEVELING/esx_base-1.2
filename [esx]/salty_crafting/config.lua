Config = {}

-- Ammo given by default to crafted weapons
Config.WeaponAmmo = 0

Config.Recipes = {
	["snspistol"] = { 
		{item = "scrap", quantity = 55 }, 
		{item = "rubber", quantity = 2 },
		{item = "rope", quantity = 4 },
	},
	["vintagepistol"] = { 
		{item = "scrap", quantity = 95 }, 
		{item = "rubber", quantity = 20 },
		{item = "rope", quantity = 16 },
	},
	["pistol_mk2"] = { 
		{item = "scrap", quantity = 89 }, 
		{item = "rubber", quantity = 2 },
		{item = "rope", quantity = 8 },
		{item = "gunpowder", quantity = 8 },
	},
	["pistol50"] = { 
		{item = "scrap", quantity = 120 }, 
		{item = "rubber", quantity = 14 },
		{item = "rope", quantity = 23 },
	},
	["pistol_ammo"] = { 
		{item = "metal", quantity = 3 }, 
		{item = "gunpowder", quantity = 4 },
	},
	["knife"] = { 
		{item = "metal", quantity = 20 }, 
		{item = "rubber", quantity = 1 },
		{item = "rope", quantity = 5 },
	},
	["bat"] = { 
		{item = "metal", quantity = 20 }, 
		{item = "rubber", quantity = 8 },
		{item = "rope", quantity = 5 },
		{item = "iron", quantity = 6 },
	},
	["crowbar"] = { 
		{item = "rubber", quantity = 4 }, 
		{item = "rope", quantity = 1 },
		{item = "metal", quantity = 40 }, 
	},
}

-- Enable a shop to access the crafting menu
Config.Shop = {
	useShop = true,
	shopCoordinates = { x=1509.2913, y=-2122.3254, z=75.5647 }, --1509.2913, -2122.3254, 76.5647, 5.9332
	shopName = "Crafting Station",
	shopBlipID = 2,
	zoneSize = { x = 2.5, y = 2.5, z = 1.5 },
	zoneColor = { r = 255, g = 0, b = 0, a = 100 }
}

-- Enable crafting menu through a keyboard shortcut
Config.Keyboard = {
	useKeyboard = false,
	keyCode = 303
}
