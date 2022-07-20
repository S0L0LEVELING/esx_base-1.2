Config = Config or {}
Config.Locale = 'nl'
Config.randomdoor = 1 -- DONT TOUCH! 

-- Discord logging 
Config.wh_startrun = 'https://discord.com/api/webhooks/931728041183445053/10Be-YepTzNHyVeFoF0s_ZCUZAmpbc0ZFcmK8ljbs5SI1hU7YcxSnPjlpb1h5LhH_e7S'
Config.wh_endrun = 'https://discord.com/api/webhooks/931728224260603975/6s7ZIt4bJyWD_2VE0MB-X4FtNY1NniGWyg8FqwBx2fqEDFyivKOIxTHpQLLTfYxYuOxP'
Config.wh_copcounter = 'https://discord.com/api/webhooks/931728116542484580/esRyCqZjslqIPNb3ZD_9vLbfkvQEjHNMQbAxhMj5xH-2cvdB5fA7SzfsMGzQEKWovQo3' 

-- Police config --
Config.RequireCopsOnline = true -- If true you will NEED cops to do a run  
Config.policejob = 'police' -- Police job name 
Config.cops = 2 -- Amount of cops needed 
Config.CopsCheckRefreshTime = 0.1 -- Refresh time of the cop counter ( minutes )
Config.EnableCopCheckMessage = false -- Enable cop check console log 

-- Drugs config --
Config.limitpersellwithnocops = 20 
Config.limitpersell = math.random(37, 44)
Config.CooldownMinutes = 3 
Config.timer = 300
Config.MoneyCoke = 200 -- Amount of money that 1 drug adds to paycheck 
Config.MoneyMeth = 300 -- Amount of money that 1 drug adds to paycheck 
Config.MoneyWeed = 100 -- Amount of money that 1 drug adds to paycheck 
Config.Item = { -- Up to 3 items, Weed, Meth, Coke. 
	['Wiet'] = "weed_pooch",
	['Meth'] = "meth_pooch",
	['Coke'] = "coke_pooch" 
}

-- Location config --
Config.Location = {
	[1] = {
		['Door'] ={['X'] = 151.9823, ['Y'] = -1478.124, ['Z'] = 29.35707,}, 
		['Label'] = "Robert"
	},
}

Config.Locations = {
	[1] = {
		['Coords'] = vector3(1648.5405, 4779.3770, 42.0154) -- working 
	},
	[2] = {
		['Coords'] = vector3(1929.9795, 3721.6633, 32.8083), -- working  
	},
	[3] = {
		['Coords'] = vector3(22.6703, 3671.9004, 39.7550), -- working  
	}, 
	[4] = {
		['Coords'] = vector3(1510.4296, 6326.0479, 24.6071) -- Working 
	},
	[5] = {
		['Coords'] = vector3(2580.4766, 464.9248, 108.6273), -- Working
	},
	[6] = {
		['Coords'] = vector3(136.5446, 6643.3169, 31.8094), -- Working
	},
	[7] = {
		['Coords'] = vector3(101.9317, 3734.8958, 39.5126), -- working  
	},
	[8] = {
		['Coords'] = vector3(-1128.0889, 2692.2180, 18.8004), -- working  
	},
	[9] = {
		['Coords'] = vector3(-769.6530, 5597.6152, 33.6717), -- working  
	},
	[10] = {
		['Coords'] = vector3(3807.7144, 4478.5020, 6.3585), -- working  
	}, 
	[11] = {
		['Coords'] = vector3(-232.0717, -915.5380, 32.3108), -- working  
	},
	[12] = {
		['Coords'] = vector3(489.0989, -921.8360, 26.3818), -- working
	},
	[13] = {
		['Coords'] = vector3(183.8593, -945.8976, 30.0919), -- working  
	}, 
	[14] = {
		['Coords'] = vector3(-380.7155, -84.7808, 45.6640), -- working  
	},
	[15] = {
		['Coords'] = vector3(1234.6844, -354.7777, 69.0821), -- working 
	},
	[16] = {
		['Coords'] = vector3(1552.1439, 2155.7544, 78.9051), -- working  
	},
	[17] = {
		['Coords'] = vector3(-87.4947, 1879.6239, 197.3285), -- working 
	},
	[18] = {
		['Coords'] = vector3(-2221.0056, 3487.7729, 30.1696), -- working  
	}
}

-- Messaging config -- 
Config.Names = {
	['Deliver'] = {
		"Robert",
		"Frank",
		"Matt"
	},
}

Config.RandomText = {
    ['Greeting'] = {
        'Yo ',
        'Hi ',
        'Hey ',
        'Wassup ',
        'Sup ',
    },
    ['GoTo'] = {
        ' Ive set a route to the correct location for you ',
        ' Go to the assigned location on your map, dont be late!',
        ' Hurry up and go to the location ive set for you ',
    },
	['AlreadyBusy'] = {
		'What the fuck are you still doing here?',
	}
}
