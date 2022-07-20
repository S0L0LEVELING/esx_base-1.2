Config               = {}

Config.Locale        = 'en'

Config.LicenseEnable = true -- enable boat license? Requires esx_license
Config.LicensePrice  = 10000

Config.MarkerType    = 1
Config.DrawDistance  = 100.0

Config.Marker = {
	r = 100, g = 204, b = 100, -- blue-ish color
	x = 1.5, y = 1.5, z = 1.0  -- standard size circle
}

Config.StoreMarker = {
	r = 255, g = 0, b = 0,     -- red color
	x = 5.0, y = 5.0, z = 1.0  -- big circle for storing boat
}

Config.Zones = {

	Garages = {
	},

	BoatShops = {
		{ -- Shank St, nearby campaign boat garage
			Outside = vector3(-759.43, -1306.98, 3.98),
			Inside = vector4(-716.17, -1350.74, -0.48, 138.4)
		}
	}

}

Config.Vehicles = {
	{model = 'fxho', label = 'Yamaha FX HO', price = 13099},
	{model = 'seashark', label = 'SeaShark 1', price = 20853},
	{model = 'seashark3', label = 'SeaShark 2', price = 36854},
	{model = 'yacht2', label = 'Yacht Sea Ray L650 Express', price = 1195000},
	{model = 'sr650fly', label = 'Yacht Sea Ray 650 Fly', price = 1980414},
	{model = 'sr510', label = 'Yacht Sea Ray 510', price = 849999},
	{model = 'frauscher16', label = 'Frauscher 2016', price = 709821},
	{model = 'speeder2', label = 'Speeder 2', price = 689763},
	{model = 'speeder', label = 'Speeder', price = 689753}
}