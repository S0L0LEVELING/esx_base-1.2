# es_wsync
# DRAFT fork from [es_wsync](https://github.com/StockholmCityRP/es_wsync), use at your own risk!
Simple weather and time sync script for FiveM servers.

### Requirements
- ES
- ESX

### Fork Extra Features
- Smoother time synchronization. Moon and clouds should be way smoother.
- Configuration file, more flexible dynamic weather options.
- Hopefully fixed sky flickering of original code.
- Hopefully smoother weather changing (need testing).
- Extra admin commands.

### Features
- Dynamic changing weather every 10 minutes (can be (temporarily or permanently) disabled. The weather will only change according to realistic patterns. Some types like snow, xmas, halloween and neutral have been disabled. This means that if the weather is currenlty one of those types, it won't be changed. It will also never change to those types.
- Blackout. Enable/disable this in the config or using /blackout ingame.
- Weather and Time synced across all players.

### Commands
- `/weather <type>` Change the weather type (will fade to the new weather type within 15 seconds).
- `/time <h> <m>`,`/time <h>:<m>` Set the time.
- `/time` Get current time.
- `/freeze_time` Stop game time.
- `/blackout` Turn off all of the game lights.

### Triggers
Server only:
- `es_wsync:set_time(hour,minute)`

Client/server:
- `es_wsync:blackout(source)`
- `es_wsync:freeze_time(source)`
- `es_wsync:freeze_weather(source)`
