Config = {}
Config.DrawDistance    = 100.0

-- Discord logging 
Config.billingwebhook = '' 
Config.nobillingwebhook = ''


-- General Config
Config.licensetype = "drive"
Config.licensetype1 = "drive_truck"
Config.licensetype2 = "drive_bike"

Config.price = 2000 
Config.price1 = 2000 
Config.price2 = 2000 
Config.useBilling = true

Config.keybind = 38 
Config.notifymessage = "~b~Druk op ~INPUT_PICKUP~ om de rijbewijs cirkel te openen!"

Config.Zones = {
	rijbewijs_menu = {
		Pos   = {x = -260.24, y = -965.52, z = 30.22}, 
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1
	}
}

-- Menu 
Config.menutitle = "Rijbewijs Menu"
Config.elements = {
	{label = "Koop je auto rijbewijs", value = 'buy_license'}, 
	{label = "Koop je vrachtwagen rijbewijs", value = 'buy_license1'}, 
	{label = "koop je motor rijbewijs", value = 'buy_license2'}
}

-- When using billing 
Config.society = 'society_police' 
Config.billreason = 'Rijbewijs gekocht'
Config.billreason1 = "Rijbewijs gekocht"
Config.billreason2 = "Rijbewijs gekocht"
Config.billTrigger = 'esx_rekening:sendBill'

