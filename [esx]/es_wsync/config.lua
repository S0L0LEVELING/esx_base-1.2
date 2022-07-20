Config = {}

Config.Locale = 'en'
Config.Debug = true
Config.DynamicWeather = true  -- set this to false if you don't want the weather to change automatically
Config.WeatherDuration = 5 -- how many minutes single weather stage goes
Config.WeatherDurationMult = { -- min and max multiplier for certain stages
	['EXTRASUNNY'] 	= {2,3},
	['CLEAR'] 	= {2,5},
	['NEUTRAL'] 	= 1,
	['SMOG'] 	= {1,4},
	['FOGGY'] 	= {1,2},
	['OVERCAST'] 	= {1,3},
	['CLOUDS'] 	= {1,3},
	['CLEARING'] 	= {1,2},
	['RAIN'] 	= 1,
	['THUNDER'] 	= 1,
	['SNOW'] 	= 1,
	['BLIZZARD'] 	= 1,
	['SNOWLIGHT'] 	= 1,
	['XMAS'] 	= 1,
	['HALLOWEEN'] 	= 1
}
