Config = {

MarkerSprite = 22,
MarkerColor = {66, 135, 245},
MarkerSize = 1.1,

--Boss menu locations
BossMenuLocations = {

	{coords = 	vector3(453.67, -993.06, 30.72), job = "police", label = "Politie"},
	{coords = 	vector3(-545.54, -195.38, 70.48), job = "avocat", label = "Ministerie"},
	{coords = 	vector3(448.21, -972.94, 31.69), job = "police", label = "Politie"},
	{coords = 	vector3(-447.54, 6014.17, 36.51), job = "police", label = "Politie"},
	{coords =   vector3(-214.7810, -1336.4862, 35.8943), job = "mechanic", label = "ANWB"},
	{coords =   vector3(306.88, -600.72, 44.28), job = "ambulance", label = "Ambulance"},
	{coords =   vector3(-809.51, -208.99, 37.13), job = "cardealer", label = "G.A.S."},

},



--Boss menu users by grade name and their permissions
BossMenuUsers = {

	['boss'] = {canWithdraw = false, canDeposit = true, canHire = true, canRank = true, canFire = true, canBonus = false},

},


Text = {

	['promoted'] = 'Je bent gepromoveerd.',
	['promoted_other'] = 'Je bent gepromoveerd bij een andere baan!',
	['fired'] = 'Je bent ontslagen',
	['fired_other'] = 'Je bent ontslagen',
	['hired'] = 'Je bent aangenomen',
	['bossmenu_hologram'] = '[~b~E~w~] Om het baas menu te openen',
	['action_success'] = 'Actie successfull',
	['action_unsuccessful'] = 'Actie unsuccessfull',
	['cant_access_bossmenu'] = 'Je kan niet in het baas menu',
	['insufficent_balance'] = 'Onvoldoende saldo',
	['bonus_given'] = 'Bonus is gegeven!',
	['bonus_recieved'] = 'Je hebt een bonus ontvangen! +€'

}
	

}

-- Only change if you know what are you doing!
function SendTextMessage(msg)

		SetNotificationTextEntry('STRING')
		AddTextComponentString(msg)
		DrawNotification(0,1)

		--EXAMPLE USED IN VIDEO
		--exports['mythic_notify']:SendAlert('error', msg)

end
