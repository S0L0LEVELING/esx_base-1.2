

Config = {}

Config.Locale = 'en'

Config.KeyToOpenCarGarage = 38			-- default 38 is E
Config.KeyToOpenHeliGarage = 38			-- default 38 is E
Config.KeyToOpenBoatGarage = 38			-- default 38 is E
Config.KeyToOpenExtraGarage = 38		-- default 38 is E

Config.kmarDatabaseName = 'kmar'	-- set the exact name from your jobs database for kmar

--kmar Car Garage:
Config.CarZones = {
	kmarCarGarage = {
		Pos = {
			{x = 1853.57, y = 3676.1, z = 33.28},
			{x = 1850.51, y = 3674.58, z = 33.2},
			{x = -455.25,  y = 6001.95, z = 31.34},
			{x = -451.25,  y = 5997.95, z = 31.34},
			{x = 453.93, y = -1024.62, z = 29.55}, 
			{x = 2535.85,  y = -362.68, z = 92.99}
		}
	}
}

--kmar Heli Garage:
Config.HeliZones = {
	kmarHeliGarage = {
		Pos = {
			{x = -2216.35,  y = 3209.97, z = 32.81}
		}
	}
}

--kmar Boat Garage:
Config.BoatZones = {
	kmarBoatGarage = {
		Pos = {
		}
	}
}

--kmar Car Garage Blip Settings:
Config.CarGarageSprite = 357
Config.CarGarageDisplay = 4
Config.CarGarageScale = 0.65
Config.CarGarageColour = 38
Config.CarGarageName = "Politsei Garaaz"
Config.EnableCarGarageBlip = false

-- kmar Heli Garage Blip Settings:
Config.HeliGarageSprite = 43
Config.HeliGarageDisplay = 4
Config.HeliGarageScale = 0.65
Config.HeliGarageColour = 38
Config.HeliGarageName = "Politsei helikopter"
Config.EnableHeliGarageBlip = false

-- kmar Boat Garage Blip Settings:
Config.BoatGarageSprite = 427
Config.BoatGarageDisplay = 4
Config.BoatGarageScale = 0.65
Config.BoatGarageColour = 38
Config.BoatGarageName = "Politie boot garage"
Config.EnableBoatGarageBlip = true

-- kmar Extra Menu Blip Settings:
Config.ExtraGarageSprite = 566
Config.ExtraGarageDisplay = 4
Config.ExtraGarageScale = 0.65
Config.ExtraGarageColour = 38
Config.ExtraGarageName = "Auto Lisad"
Config.EnableExtraGarageBlip = true

-- kmar Car Garage Marker Settings:
Config.kmarCarMarker = 27 												-- marker type
Config.kmarCarMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 			-- rgba color of the marker
Config.kmarCarMarkerScale = { x = 1.5, y = 1.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.CarDraw3DText = "[E] om de garage te openen"			-- set your desired text here

-- kmar Heli Garage Marker Settings:
Config.kmarHeliMarker = 27 												-- marker type
Config.kmarHeliMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.kmarHeliMarkerScale = { x = 5.5, y = 5.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.HeliDraw3DText = "[E] om de garage te openen"		-- set your desired text here

-- kmar Boat Garage Marker Settings:
Config.kmarBoatMarker = 27 												-- marker type
Config.kmarBoatMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.kmarBoatMarkerScale = { x = 3.0, y = 3.0, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.BoatDraw3DText = "[E] om de garage te openen"		-- set your desired text here

-- kmar Extra Garage Marker Settings:
Config.kmarExtraMarker = 27 												-- marker type
Config.kmarExtraMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.kmarExtraMarkerScale = { x = 2.5, y = 2.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.ExtraDraw3DText = "Press ~g~[E]~s~ for ~y~kmar Extra Menu~s~"		-- set your desired text here

-- kmar Cars:
Config.kmarVehicles = {
	{ model = '', label = '==============Kmar============='},
		{ model = 'kmarcar', label = 'Mercedes G Klasse'},
		{ model = 'kmara6', label = 'Audi A6'},
		{ model = 'kmar2', label = 'Mercedes B klasse'},
		{ model = 'rrstPOL', label = 'Range Rover'},
		{ model = 'Kmaropel', label = 'Opel Kmar'},
		{ model = 'VolkswagenAmarokKmar', label = 'Volkswagen amarok'},
		{ model = 'KMarPassat', label = 'Volkswagen Passat'},
		{ model = 'KMarTouran', label = 'Volkswagen Touran'},
		{ model = '', label = '=============Busjes=============='},
		{ model = 'police2', label = 'Volkswagen T5'},
		{ model = 'kmart61', label = 'Volkswagen T6'},
		{ model = 'KMarVito', label = 'Mercedes Vito'},
		{ model = '', label = '==========Motor/Offroad==========='},
		{ model = 'kmotor', label = 'BMW R1200RT'},
		{ model = 'KMarOffroadMotor', label = 'KMar offroad motor BMW'},
		{ model = 'kmarmotor', label = 'Yamaha FJR 1300A'},
		{ model = 'kmar3', label = 'Ford raptor Offroad'},
		{ model = 'policeb', label = 'Politie motor'},
		{ model = 'kmaroffroadmotor', label = 'Offroad motor'},
		{ model = '', label = '==========Undermarked==========='},
		{ model = 'police3', label = 'Mercedes'},
		{ model = 'polrs6', label = 'Audi RS6'},
		{ model = 'wpu', label = 'Audi S4 avant'},
		{ model = 'upolitiebmw', label = 'DSI BMW'},
		{ model = 'nisanunmarked', label = 'Nissan GTR'},
		{ model = 'polo', label = 'Volkswagen Polo'},
		{ model = 'a6unmarked', label = 'Audi A6 Unmarked'},
		{ model = 'rs6avant20', label = 'Audi RS6 Avant 2020 Unmarked'},
		{ model = 'polmotorun2', label = 'BMW R 1200 P 2019 OV'},
		{ model = 'polbmwg20', label = 'BMW G20 OV'},
		{ model = 'polaudia8', label = 'Audi A8 OV'},
		{ model = 'politie15', label = 'Volkswagen Polo OV'},
		{ model = 'polo', label = 'Volkswagen Polo OV'},
		{ model = 'wpu', label = 'Audi A4 Sedan OV'},	
		{ model = 'c300', label = 'Mercedes C300 OV'}, 
		{ model = 'pvwpassatk9', label = 'Volkswagen Passat OV'},
		{ model = 'a6un', label = 'Audi A6 OV'},
		{ model = '', label = '=============BSB=============='},
		{ model = 'kmarbearcat', label = 'Lenco Bearcat'},
		{ model = 'm113', label = 'YPR Pantser voertuig'},
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
		{ model = 'dsibearcat', label = 'Lenco Bearcat Loopbrug DSI'}, 
		{ model = '', label = '=============EOD=============='},
		{ model = 'eodcrafter', label = 'Volkswagen Crafter'}
	}

-- kmar Helicopters:
Config.kmarHelicopters = {
	{ model = 'valkyrie2', label = 'Gevechts helicopter', livery = 0, price = 0 },
	{ model = 'hunter', label = 'Apache helicopter', livery = 0, price = 0 },
	{ model = 'apc', label = 'APC', livery = 0, price = 0 },
	{ model = 'barracks', label = 'Vrachtwagen', livery = 0, price = 0 },
	{ model = 'halftrack', label = 'Halftrack', livery = 0, price = 0 },
	{ model = 'lazer2', label = 'F16', livery = 0, price = 0 },
	{ model = 'ac130u', label = 'AC 130', livery = 0, price = 0 },
	{ model = 'hydra', label = 'F35', livery = 0, price = 0 },
	{ model = 'mh60l', label = 'Black Hawk', livery = 0, price = 0 },
	{ model = 'lav25ifv', label = 'Defensie voertuig #1', livery = 0, price = 0 },
	{ model = 'lavadadv', label = 'Defensie voertuig #2', livery = 0, price = 0 },
	{ model = 'unarmed1', label = 'Defensie voertuig #3', livery = 0, price = 0 },
	{ model = 'unarmed2', label = 'Defensie voertuig #4', livery = 0, price = 0 },
	{ model = 'm142as', label = 'Defensie voertuig #5', livery = 0, price = 0 },
	{ model = 'hasrad', label = 'Defensie voertuig #6', livery = 0, price = 0 },
	{ model = 'hmvs', label = 'Defensie voertuig #7', livery = 0, price = 0 },
	{ model = 'abrams', label = 'Defensie voertuig #8', livery = 0, price = 0 },
	{ model = 'abrams2', label = 'Defensie voertuig #9', livery = 0, price = 0 },
	{ model = 'brad', label = 'Defensie voertuig #10', livery = 0, price = 0 },
	{ model = 'brad2', label = 'Defensie voertuig #11', livery = 0, price = 0 },
	{ model = 'uparmor', label = 'Defensie voertuig #12', livery = 0, price = 0 },
	{ model = 'uparmorw', label = 'Defensie voertuig #13', livery = 0, price = 0 },
	{ model = 'bspec', label = 'Defensie voertuig #14', livery = 0, price = 0 },
	{ model = 'm1128s', label = 'Defensie voertuig #15', livery = 0, price = 0 },
	{ model = 'mrap', label = 'Defensie voertuig #16', livery = 0, price = 0 },
	{ model = 'sr71b', label = 'SR71 Blackbird ( 500kmph )', livery = 0, price = 0 },
	{ model = 'rhino', label = 'Tank', livery = 0, price = 0 }
}

-- kmar Boats:
Config.kmarBoats = {

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
Config.TitlekmarGarage = "kmar Garage"
Config.TitlekmarExtra = "Extra"
Config.TitlekmarLivery = "Kleurstelling"
Config.TitleColorType = "Kleurtype"
Config.TitleValues = "Waarde"

-- ESX.ShowNotifications:
Config.VehicleParked = "uw voertuig is gestald!"
Config.NoVehicleNearby = "je hebt geen voertuig!"
Config.CarOutFromPolGar = "Je hebt een ~b~auto~s~ uit~y~ de kmar Garage~s~ genomen!"
Config.HeliOutFromPolGar = "Je haalde een ~b~Helicopter~s~uit ~y~kmar Heli Garage~s~!"
Config.BoatOutFromPolGar = "Je haalde een ~b~boot~s~ uit ~y~kmar boot garage~s~!"
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

-- kmar Extra Menu Positions:
Config.ExtraZones = {
	ExtraPositions = {
		Pos = {
			--{x = -1119.17,  y = -859.02, z = 12.54},
			--{x = 467.6,  y = 2530.54, z = 33.437}
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
	{ label = _U('purple'), value = 'purple'},
	{ label = _U('chrome'), value = 'chrome'},
	{ label = _U('gold'), value = 'gold'}
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
	elseif color == 'chrome' then
		colors = {
			{ index = 117, label = _U('brushedchrome')},
			{ index = 118, label = _U('blackchrome')},
			{ index = 119, label = _U('brushedaluminum')},
			{ index = 120, label = _U('chrome')}
		}
	elseif color == 'gold' then
		colors = {
			{ index = 37, label = _U('gold')},
			{ index = 158, label = _U('puregold')},
			{ index = 159, label = _U('brushedgold')},
			{ index = 160, label = _U('lightgold')}
		}
	end
	return colors
end