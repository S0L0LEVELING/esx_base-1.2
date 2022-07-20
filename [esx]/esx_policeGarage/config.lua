

Config = {}

Config.Locale = 'en'

Config.KeyToOpenCarGarage = 38			-- default 38 is E
Config.KeyToOpenHeliGarage = 38			-- default 38 is E
Config.KeyToOpenBoatGarage = 38			-- default 38 is E
Config.KeyToOpenExtraGarage = 38		-- default 38 is E

Config.policeDatabaseName = 'police'	-- set the exact name from your jobs database for police

--police Car Garage:
Config.CarZones = {
	policeCarGarage = {
		Pos = {
			{x = 1853.57, y = 3676.1, z = 32.28},
			{x = 1850.51, y = 3674.58, z = 32.2},
			{x = 474.76, y = -986.49, z = 26.90},
			{x = -83.44, y = 361.89, z = 112.46},
			{x = -451.6363, y = 5997.9160, z = 31.3405},
			{x = -1115.62, y = -835.79, z = 13.34} 

		}
	}
}

--police Heli Garage:
Config.HeliZones = {
	policeHeliGarage = {
		Pos = {
			{x = 449.35,  y = -981.4, z = 43.69},
			{x = -1112.49, y = -2883.74, z = 13.95},
			{x = -1145.91, y = -2864.54, z = 13.95},
			{x = -1096.55, y = -832.33, z = 37.7},
			{x = -1178.23, y = -2846.04, z = 13.95}
		}
	}
}

--police Boat Garage:
Config.BoatZones = {
	policeBoatGarage = {
		Pos = {
			{x = -785.94,  y = -1497.71, z = 0.00},
			{x = -1615.24,  y = -1173.81, z = 0.35},
			{x = 3839.53, y = 4501.81, z = 0,88}
		}
	}
}

--police Car Garage Blip Settings:
Config.CarGarageSprite = 357
Config.CarGarageDisplay = 4
Config.CarGarageScale = 0.65
Config.CarGarageColour = 38
Config.CarGarageName = "Politsei Garaaz"
Config.EnableCarGarageBlip = false

-- police Heli Garage Blip Settings:
Config.HeliGarageSprite = 43
Config.HeliGarageDisplay = 4
Config.HeliGarageScale = 0.65
Config.HeliGarageColour = 38
Config.HeliGarageName = "Politsei helikopter"
Config.EnableHeliGarageBlip = false

-- police Boat Garage Blip Settings:
Config.BoatGarageSprite = 427
Config.BoatGarageDisplay = 4
Config.BoatGarageScale = 0.65
Config.BoatGarageColour = 38
Config.BoatGarageName = "Politie boot garage"
Config.EnableBoatGarageBlip = true

-- police Extra Menu Blip Settings:
Config.ExtraGarageSprite = 566
Config.ExtraGarageDisplay = 4
Config.ExtraGarageScale = 0.65
Config.ExtraGarageColour = 38
Config.ExtraGarageName = "Auto Lisad"
Config.EnableExtraGarageBlip = false

-- police Car Garage Marker Settings:
Config.policeCarMarker = 27 												-- marker type
Config.policeCarMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 			-- rgba color of the marker
Config.policeCarMarkerScale = { x = 1.5, y = 1.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.CarDraw3DText = "[E] om de garage te openen"			-- set your desired text here

-- police Heli Garage Marker Settings:
Config.policeHeliMarker = 27 												-- marker type
Config.policeHeliMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.policeHeliMarkerScale = { x = 5.5, y = 5.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.HeliDraw3DText = "[E] om de garage te openen"		-- set your desired text here

-- police Boat Garage Marker Settings:
Config.policeBoatMarker = 27 												-- marker type
Config.policeBoatMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.policeBoatMarkerScale = { x = 3.0, y = 3.0, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.BoatDraw3DText = "[E] om de garage te openen"		-- set your desired text here

-- police Extra Garage Marker Settings:
Config.policeExtraMarker = 27 												-- marker type
Config.policeExtraMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.policeExtraMarkerScale = { x = 2.5, y = 2.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.ExtraDraw3DText = "Press ~g~[E]~s~ for ~y~police Extra Menu~s~"		-- set your desired text here

-- police Cars:
Config.policeVehicles = {
	{ model = 'mercedesb', label = '============ Handhaving ============'},
	{ model = 'pmcbike', label = 'Handhaving Fiets HH'},
	{ model = 'boa1', label = 'Skoda Karoq HH'},
	{ model = 'hvito', label = 'Volkswagen T6 HH'},
	{ model = 'scorcher', label = '============= Noodhulp =============='},
	{ model = 'scorcher', label = 'Politie Fiets NH'},
	{ model = 'mercedesb', label = 'Mercedes B-Klasse 2019 NH'},
	{ model = 'politiebklasse', label = 'Mercedes B-Klasse 2017 NH'},
	{ model = 'politievito', label = 'Mercedes Vito NH'},
	{ model = 'poltouran', label = 'Volkswagen Touran NH'},
	{ model = 'volkswagent6', label = 'Volkswagen T6 NH'},
	{ model = 'politieamarok', label = 'Volkswagen Amarok NH'},
	{ model = 'polkia', label = 'Kia E-Niro NH'},
	{ model = 'tostikaas', label = 'Yari is een tokkie'},
	{ model = 'politielicht', label = '============= Overig ============'},
	{ model = 'polhilux', label = 'Toyota Hilux SW'}, 
	{ model = 'politieoffroad', label = 'Ford Ranger OR'},
	{ model = 'polatbus', label = 'Mercedes Sprinter AV'},
	{ model = 'poldvobus', label = 'Mercedes Sprinter DV&O'},
	{ model = 'politieme', label = 'Mercedes Sprinter ME'},
	{ model = 'vwtouareg', label = 'Volkswagen Touareg BE'},
	{ model = 'BOTLR', label = 'Range Rover Vogue BOT'},
	{ model = 'politiexc90', label = 'Volvo XC90 OVD'},
	{ model = 'politielicht', label = '============= Motor ============'},
	{ model = 'politielicht', label = 'Yahama MT-07 MT Licht'},
	{ model = 'polmotor', label = 'BMW R 1200 RT MT Zwaar'},
	{ model = 'polmotor2', label = 'BMW R 1200 P 2019 MT Zwaar'},  
	{ model = 'polaudi', label = '============= Landelijke Eenheid =============='},
	{ model = 'polpassat2', label = 'Volkswagen Passat LE'},
	{ model = 'polvolvovp', label = 'Volvo V70 LE'},
	{ model = 'polaudi', label = 'Audi A6 2017 LE'},
	{ model = 'polaudi2', label = 'Audi A6 2020 LE'},
	{ model = 'mercedesb', label = '=========== Onopvallend ==========='},
	{ model = 'polmotorun2', label = 'BMW R 1200 P 2019 OV'},
	{ model = 'polbmwg20', label = 'BMW G20 OV'},
	{ model = 'polaudia8', label = 'Audi A8 OV'},
	{ model = 'politie15', label = 'Volkswagen Polo OV'},
	{ model = 'polo', label = 'Volkswagen Polo OV'},
	{ model = 'wpu', label = 'Audi A4 Sedan OV'},	
	{ model = 'c300', label = 'Mercedes C300 OV'}, 
	{ model = 'pvwpassatk9', label = 'Volkswagen Passat OV'},
	{ model = 'a6un', label = 'Audi A6 OV'},
	{ model = 'mercedesb', label = '============ DSI ============'},
	{ model = 'polmotorun', label = 'BMW R 1250 GS DSI'},
	{ model = 'pland', label = 'Toyota Landcruiser DSI'},
	{ model = 'Crafter', label = 'Volkswagen Crafter DSI'},
	{ model = 'ov3', label = 'Audi SQ7 DSI'},
	{ model = 'pvito', label = 'Mercedes Vito DSI'}, 
	{ model = 'rs6avant20', label = 'Audi RS6 DSI'},
	{ model = 'audia4pol', label = 'Audi A4 DSI'},
	{ model = 'politieq7', label = 'Audi Q7 DSI'},
	{ model = 'mercml63', label = 'Mercedes ML63 AMG DSI'},
	{ model = 'vcrafterdsi', label = 'Volkswagen Crafter DSI'},
	{ model = 'upolitiearteon', label = 'Volkswagen Arteon DSI'},
	{ model = 'polx5', label = 'BMW X5 DSI'},
	{ model = 'upolitietesla', label = 'Tesla Model S DSI'},
	{ model = 'bearcat2',   label = 'Lenco Bearcat DSI'},
	{ model = 'dsibearcat', label = 'Lenco Bearcat Loopbrug DSI'}
}

-- police Helicopters:
Config.policeHelicopters = {
	{ model = 'pzulu', label = 'Politie Zulu', livery = 0, price = 0 },
	{ model = 'aw139', label = 'DSI Helikopter', livery = 0, price = 0 }
}

-- police Boats:
Config.policeBoats = {
	{ model = 'predator', label = 'Politie Predator', livery = 0, price = 0 },
	{ model = 'polboot', label = 'politie boot', livery = 0, price = 0 }
}

-- Commands:
Config.RepairCommand = 'repair'
Config.CleanCommand = 'clean'

-- Menu Labels & Titles:
Config.LabelStoreVeh = "Een voertuig terugbrengen"
Config.LabelGetVeh = "Haal een ​​voertuig uit de garage"
Config.LabelPrimaryCol = "Primair"
Config.LabelSecondaryCol = "Bijhorend"
Config.LabelExtra = "Extra"
Config.LabelLivery = "Kleurstelling"
Config.TitlepoliceGarage = "police Garage"
Config.TitlepoliceExtra = "Extra"
Config.TitlepoliceLivery = "Kleurstelling"
Config.TitleColorType = "Kleurtype"
Config.TitleValues = "Waarde"

-- ESX.ShowNotifications:
Config.VehicleParked = "uw voertuig is gestald!"
Config.NoVehicleNearby = "je hebt geen voertuig!"
Config.CarOutFromPolGar = "Je hebt een ~b~auto~s~ uit~y~ de police Garage~s~ genomen!"
Config.HeliOutFromPolGar = "Je haalde een ~b~Helicopter~s~uit ~y~police Heli Garage~s~!"
Config.BoatOutFromPolGar = "Je haalde een ~b~boot~s~ uit ~y~police boot garage~s~!"
Config.VehRepNotify = "Uw ~b~ voertuig ~s~ wordt ~y~ gerepareerd~s~, even geduld aub!"
Config.VehRepDoneNotify = "Uw ~b~voertuig~s~ is ~y~gerepareerd~s~!"
Config.VehCleanNotify = "Uw ~b~voertuig~s~ wordt ~y~schoongemaakt~s~, even geduld aub!"
Config.VehCleanDoneNotify = "Uw ~b~voertuig~s~ is ~y~schoongemaakt~s~!"

-- ProgressBars text
Config.Progress1 = "AUTO REPARATIE"
Config.Progress2 = "AUTO REINIGING"

-- ProgressBar Timers, in seconds:
Config.RepairTime = 5					-- time to repair vehicle
Config.CleanTime = 3.5					-- time to clean vehicle

Config.VehicleLoadText = "Wait for vehicle to spawn"			-- text on screen when vehicle model is being loaded

-- Distance from garage marker to the point where /fix and /clean shall work
Config.Distance = 20

Config.DrawDistance      = 100.0
Config.TriggerDistance 	 = 3.0
Config.Marker 			 = {Type = 27, r = 0, g = 127, b = 22}

-- police Extra Menu Positions:
Config.ExtraZones = {
	ExtraPositions = {
		Pos = {
			{x = 447.36,  y = -1014.18, z = 28.53}
		}
	}
}

Config.Colors = {
	{ label = _U('black'), value = 'black'},
	{ label = _U('white'), value = 'white'},
	{ label = _U('grey'), value = 'grey'},
	{ label = _U('red'), value = 'red'},
	{ label = _U('pink'), value = 'pink'},
	{ label = _U('blue'), value = 'blue'},
	{ label = _U('yellow'), value = 'yellow'},
	{ label = _U('green'), value = 'green'},
	{ label = _U('orange'), value = 'orange'},
	{ label = _U('brown'), value = 'brown'},
	{ label = _U('purple'), value = 'purple'}
}

function GetColors(color)
	local colors = {}
	if color == 'black' then
		colors = {
			{ index = 0, label = _U('black')},
			{ index = 1, label = _U('graphite')},
			{ index = 2, label = _U('black_metallic')},
			{ index = 3, label = _U('caststeel')},
			{ index = 11, label = _U('black_anth')},
			{ index = 12, label = _U('matteblack')},
			{ index = 15, label = _U('darknight')},
			{ index = 16, label = _U('deepblack')},
			{ index = 21, label = _U('oil')},
			{ index = 147, label = _U('carbon')}
		}
	elseif color == 'white' then
		colors = {
			{ index = 106, label = _U('vanilla')},
			{ index = 107, label = _U('creme')},
			{ index = 111, label = _U('white')},
			{ index = 112, label = _U('polarwhite')},
			{ index = 113, label = _U('beige')},
			{ index = 121, label = _U('mattewhite')},
			{ index = 122, label = _U('snow')},
			{ index = 131, label = _U('cotton')},
			{ index = 132, label = _U('alabaster')},
			{ index = 134, label = _U('purewhite')}
		}
	elseif color == 'grey' then
		colors = {
			{ index = 4, label = _U('silver')},
			{ index = 5, label = _U('metallicgrey')},
			{ index = 6, label = _U('laminatedsteel')},
			{ index = 7, label = _U('darkgray')},
			{ index = 8, label = _U('rockygray')},
			{ index = 9, label = _U('graynight')},
			{ index = 10, label = _U('aluminum')},
			{ index = 13, label = _U('graymat')},
			{ index = 14, label = _U('lightgrey')},
			{ index = 17, label = _U('asphaltgray')},
			{ index = 18, label = _U('grayconcrete')},
			{ index = 19, label = _U('darksilver')},
			{ index = 20, label = _U('magnesite')},
			{ index = 22, label = _U('nickel')},
			{ index = 23, label = _U('zinc')},
			{ index = 24, label = _U('dolomite')},
			{ index = 25, label = _U('bluesilver')},
			{ index = 26, label = _U('titanium')},
			{ index = 66, label = _U('steelblue')},
			{ index = 93, label = _U('champagne')},
			{ index = 144, label = _U('grayhunter')},
			{ index = 156, label = _U('grey')}
		}
	elseif color == 'red' then
		colors = {
			{ index = 27, label = _U('red')},
			{ index = 28, label = _U('torino_red')},
			{ index = 29, label = _U('poppy')},
			{ index = 30, label = _U('copper_red')},
			{ index = 31, label = _U('cardinal')},
			{ index = 32, label = _U('brick')},
			{ index = 33, label = _U('garnet')},
			{ index = 34, label = _U('cabernet')},
			{ index = 35, label = _U('candy')},
			{ index = 39, label = _U('matte_red')},
			{ index = 40, label = _U('dark_red')},
			{ index = 43, label = _U('red_pulp')},
			{ index = 44, label = _U('bril_red')},
			{ index = 46, label = _U('pale_red')},
			{ index = 143, label = _U('wine_red')},
			{ index = 150, label = _U('volcano')}
		}
	elseif color == 'pink' then
		colors = {
			{ index = 135, label = _U('electricpink')},
			{ index = 136, label = _U('salmon')},
			{ index = 137, label = _U('sugarplum')}
		}
	elseif color == 'blue' then
		colors = {
			{ index = 54, label = _U('topaz')},
			{ index = 60, label = _U('light_blue')},
			{ index = 61, label = _U('galaxy_blue')},
			{ index = 62, label = _U('dark_blue')},
			{ index = 63, label = _U('azure')},
			{ index = 64, label = _U('navy_blue')},
			{ index = 65, label = _U('lapis')},
			{ index = 67, label = _U('blue_diamond')},
			{ index = 68, label = _U('surfer')},
			{ index = 69, label = _U('pastel_blue')},
			{ index = 70, label = _U('celeste_blue')},
			{ index = 73, label = _U('rally_blue')},
			{ index = 74, label = _U('blue_paradise')},
			{ index = 75, label = _U('blue_night')},
			{ index = 77, label = _U('cyan_blue')},
			{ index = 78, label = _U('cobalt')},
			{ index = 79, label = _U('electric_blue')},
			{ index = 80, label = _U('horizon_blue')},
			{ index = 82, label = _U('metallic_blue')},
			{ index = 83, label = _U('aquamarine')},
			{ index = 84, label = _U('blue_agathe')},
			{ index = 85, label = _U('zirconium')},
			{ index = 86, label = _U('spinel')},
			{ index = 87, label = _U('tourmaline')},
			{ index = 127, label = _U('paradise')},
			{ index = 140, label = _U('bubble_gum')},
			{ index = 141, label = _U('midnight_blue')},
			{ index = 146, label = _U('forbidden_blue')},
			{ index = 157, label = _U('glacier_blue')}
		}
	elseif color == 'yellow' then
		colors = {
			{ index = 42, label = _U('yellow')},
			{ index = 88, label = _U('wheat')},
			{ index = 89, label = _U('raceyellow')},
			{ index = 91, label = _U('paleyellow')},
			{ index = 126, label = _U('lightyellow')}
		}
	elseif color == 'green' then
		colors = {
			{ index = 49, label = _U('met_dark_green')},
			{ index = 50, label = _U('rally_green')},
			{ index = 51, label = _U('pine_green')},
			{ index = 52, label = _U('olive_green')},
			{ index = 53, label = _U('light_green')},
			{ index = 55, label = _U('lime_green')},
			{ index = 56, label = _U('forest_green')},
			{ index = 57, label = _U('lawn_green')},
			{ index = 58, label = _U('imperial_green')},
			{ index = 59, label = _U('green_bottle')},
			{ index = 92, label = _U('citrus_green')},
			{ index = 125, label = _U('green_anis')},
			{ index = 128, label = _U('khaki')},
			{ index = 133, label = _U('army_green')},
			{ index = 151, label = _U('dark_green')},
			{ index = 152, label = _U('hunter_green')},
			{ index = 155, label = _U('matte_foilage_green')}
		}
	elseif color == 'orange' then
		colors = {
			{ index = 36, label = _U('tangerine')},
			{ index = 38, label = _U('orange')},
			{ index = 41, label = _U('matteorange')},
			{ index = 123, label = _U('lightorange')},
			{ index = 124, label = _U('peach')},
			{ index = 130, label = _U('pumpkin')},
			{ index = 138, label = _U('orangelambo')}
		}
	elseif color == 'brown' then
		colors = {
			{ index = 45, label = _U('copper')},
			{ index = 47, label = _U('lightbrown')},
			{ index = 48, label = _U('darkbrown')},
			{ index = 90, label = _U('bronze')},
			{ index = 94, label = _U('brownmetallic')},
			{ index = 95, label = _U('Expresso')},
			{ index = 96, label = _U('chocolate')},
			{ index = 97, label = _U('terracotta')},
			{ index = 98, label = _U('marble')},
			{ index = 99, label = _U('sand')},
			{ index = 100, label = _U('sepia')},
			{ index = 101, label = _U('bison')},
			{ index = 102, label = _U('palm')},
			{ index = 103, label = _U('caramel')},
			{ index = 104, label = _U('rust')},
			{ index = 105, label = _U('chestnut')},
			{ index = 108, label = _U('brown')},
			{ index = 109, label = _U('hazelnut')},
			{ index = 110, label = _U('shell')},
			{ index = 114, label = _U('mahogany')},
			{ index = 115, label = _U('cauldron')},
			{ index = 116, label = _U('blond')},
			{ index = 129, label = _U('gravel')},
			{ index = 153, label = _U('darkearth')},
			{ index = 154, label = _U('desert')}
		}
	elseif color == 'purple' then
		colors = {
			{ index = 71, label = _U('indigo')},
			{ index = 72, label = _U('deeppurple')},
			{ index = 76, label = _U('darkviolet')},
			{ index = 81, label = _U('amethyst')},
			{ index = 142, label = _U('mysticalviolet')},
			{ index = 145, label = _U('purplemetallic')},
			{ index = 148, label = _U('matteviolet')},
			{ index = 149, label = _U('mattedeeppurple')}
		}
	end
	return colors
end