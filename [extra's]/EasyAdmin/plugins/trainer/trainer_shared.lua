Citizen.CreateThread(function()
	repeat
		Wait(0)
	until permissions
	permissions["trainer.player.heal"] = false
	permissions["trainer.player.ragdoll"] = false
	permissions["trainer.player.stamina"] = false
	permissions["trainer.player.god"] = false
	permissions["trainer.player.teleport"] = false

	
	permissions["trainer.vehicle.spawn"] = false
	permissions["trainer.vehicle.fix"] = false
	permissions["trainer.vehicle.god"] = false
	permissions["trainer.vehicle.clean"] = false
	permissions["trainer.vehicle.plate"] = false
	permissions["trainer.vehicle.delete"] = false
	permissions["trainer.noclip.self"] = false
	permissions["trainer.noclip.player"] = false

	permissions["trainer.vehicle.mod"] = false
	permissions["trainer.player.wanted"] = false
	permissions["trainer.player.weapons"] = false

end)
