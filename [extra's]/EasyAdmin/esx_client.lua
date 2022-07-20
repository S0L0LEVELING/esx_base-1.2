
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(500)
	end
end)


AddEventHandler("EasyAdmin:BuildPlayerOptions", function(playerId) -- BuildPlayerOptions is triggered after building options like kick, ban.. Passes a Player ServerId
	
	-- comment this out if you want to see it in action
	if not ESX then return end

	local playerInfos
	local playerLicenses
	if permissions["kick"] then -- you can also check if a user has a specific Permission.
		local thisESXMenu = _menuPool:AddSubMenu(thisPlayer,"~y~[ESX]~s~ Options","",true) -- Submenus work, too!
		thisESXMenu:SetMenuWidthOffset(menuWidth)

		ESX.TriggerServerCallback('esx:getOtherPlayerData', function(player)
			playerInfos = player	
		end, playerId)

		if GetResourceState("esx_license") == "started" then		
			ESX.TriggerServerCallback('esx_license:getLicenses', function(licenses)
				playerLicenses = licenses
			end, playerId)

			repeat 
				Wait(0)
			until playerLicenses
		end

		repeat
			Wait(0)
		until playerInfos

		local accountsText = "Accounts:\n"

		
		local haveMoneyAccount = false
		for i, account in pairs(playerInfos.accounts) do
			accountsText=accountsText..""..account.name..":€"..account.money.."\n"
			if account.name == "money" then
				haveMoneyAccount = true
			end
		end

		if not haveMoneyAccount then
			print("doesnt have money account")
			if playerInfos.money then
				table.insert(playerInfos.accounts, {name = "money", money=playerInfos.money})
			end
		end

		local thisItem = NativeUI.CreateItem("~y~[ESX]~s~ Add/Remove Accountmoney",accountsText) -- create our new item
		thisESXMenu:AddItem(thisItem) -- thisPlayer is global.
		thisItem.Activated = function(ParentMenu,SelectedItem)
			AddTextEntry("ESX_ADDACCOUNTMONEY_ACCOUNT", "Enter the Account to add Money to")
			DisplayOnscreenKeyboard(1, "ESX_ADDACCOUNTMONEY_ACCOUNT", "", "", "", "", "", 16)

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait( 0 )
			end
	
			local result = GetOnscreenKeyboardResult()
	
			if result and result ~= "" then
				AddTextEntry("ESX_ADDACCOUNTMONEY", "Enter the Amount of Money to add")
				DisplayOnscreenKeyboard(1, "ESX_ADDACCOUNTMONEY", "", "", "", "", "", 16)
	
				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait( 0 )
				end
		
				local result2 = GetOnscreenKeyboardResult()
				if result2 and result2 ~= "" then
					TriggerServerEvent("EasyAdmin:esx:addAccountMoney", playerId, result,tonumber(result2))
				end
			end
		end


		local thisItem = NativeUI.CreateItem("~y~[ESX]~s~ Add/Remove Money",accountsText) -- create our new item
		thisESXMenu:AddItem(thisItem) -- thisPlayer is global.
		thisItem.Activated = function(ParentMenu,SelectedItem)
			AddTextEntry("ESX_ADDACCOUNTMONEY", "Enter Ammount")
			DisplayOnscreenKeyboard(1, "ESX_ADDACCOUNTMONEY", "", "", "", "", "", 16)

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait( 0 )
			end
	
			local result = GetOnscreenKeyboardResult()
	
			if result and result ~= "" and tonumber(result) then
				TriggerServerEvent("EasyAdmin:esx:addMoney", playerId, tonumber(result))
			end
		end

		local thisItem = NativeUI.CreateItem("~y~[ESX]~s~ Add/Remove Inventory Item","") -- create our new item
		thisESXMenu:AddItem(thisItem) -- thisPlayer is global.
		thisItem.Activated = function(ParentMenu,SelectedItem)
			AddTextEntry("ESX_ADDINVENTORYITEM", "Enter Item Name")
			DisplayOnscreenKeyboard(1, "ESX_ADDINVENTORYITEM", "", "", "", "", "", 16)

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait( 0 )
			end
	
			local result = GetOnscreenKeyboardResult()
	
			if result and result ~= "" then
				DisplayOnscreenKeyboard(1, "ESX_ADDACCOUNTMONEY", "", "", "", "", "", 16)
	
				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait( 0 )
				end
		
				local result2 = GetOnscreenKeyboardResult()
				if result2 and result2 ~= "" and tonumber(result2) then
					TriggerServerEvent("EasyAdmin:esx:addInventoryItem", playerId, result, tonumber(result2))
				end
			end
		end

		local thisItem = NativeUI.CreateItem("~y~[ESX]~s~ Set Job","Current Job:\nname: "..playerInfos.job.name.."\ngrade: "..playerInfos.job.grade) -- create our new item
		thisESXMenu:AddItem(thisItem) -- thisPlayer is global.
		thisItem.Activated = function(ParentMenu,SelectedItem)
			AddTextEntry("ESX_SETJOB", "Enter Job")
			DisplayOnscreenKeyboard(1, "ESX_SETJOB", "", "", "", "", "", 16)

			while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
				Citizen.Wait( 0 )
			end
	
			local result = GetOnscreenKeyboardResult()
	
			if result and result ~= "" then
				AddTextEntry("ESX_SETJOBRANK", "Enter Grade")
				DisplayOnscreenKeyboard(1, "ESX_SETJOBRANK", "", "", "", "", "", 16)
	
				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait( 0 )
				end
		
				local result2 = GetOnscreenKeyboardResult()
				if result2 and result2 ~= "" then
					TriggerServerEvent("EasyAdmin:esx:SetJob", playerId, result, result2)
				end
			end
		end

		if GetResourceState("esx_license") == "started" then
			local licenses = "Licenses:\n"
	
			for i, license in pairs(playerLicenses) do
				licenses=licenses..""..license.label.." ("..license.type..")\n"
			end
			local thisItem = NativeUI.CreateItem("~y~[ESX]~s~ Add/Remove License",licenses) -- create our new item
			thisESXMenu:AddItem(thisItem) -- thisPlayer is global.
			thisItem.Activated = function(ParentMenu,SelectedItem)
				AddTextEntry("ESX_ADDLICENSE", "Enter License Type")
				DisplayOnscreenKeyboard(1, "ESX_ADDLICENSE", "", "", "", "", "", 16)

				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait( 0 )
				end
		
				local result = GetOnscreenKeyboardResult()
		
				if result and result ~= "" then
					TriggerServerEvent("EasyAdmin:esx:toggleLicense", playerId, result)
				end
			end
		end

		if GetResourceState("esx_ambulancejob") == "started" then
			local thisItem = NativeUI.CreateItem("~y~[ESX]~s~ Revive Player","") -- create our new item
			thisESXMenu:AddItem(thisItem) -- thisPlayer is global.
			thisItem.Activated = function(ParentMenu,SelectedItem)
				TriggerServerEvent("EasyAdmin:esx:RevivePlayer", playerId)
			end
		end

		if GetResourceState("esx_policejob") == "started" then
			local thisItem = NativeUI.CreateItem("~y~[ESX]~s~ Handcuff Player","") -- create our new item
			thisESXMenu:AddItem(thisItem) -- thisPlayer is global.
			thisItem.Activated = function(ParentMenu,SelectedItem)
				TriggerServerEvent("EasyAdmin:esx:HandcuffPlayer", playerId)
			end
		end




		if GetResourceState("esx_skin") == "started" then
			local thisItem = NativeUI.CreateItem("~y~[ESX]~s~ ~r~Reset Skin~s~","") -- create our new item
			thisESXMenu:AddItem(thisItem) -- thisPlayer is global.
			thisItem.Activated = function(ParentMenu,SelectedItem)
				TriggerServerEvent("EasyAdmin:esx:ResetSkin", playerId)
			end
		end


		
		local thisPlayerDataMenu = _menuPool:AddSubMenu(thisESXMenu,"~y~[ESX]~s~ View Player Data","",true) -- Submenus work, too!
		thisPlayerDataMenu:SetMenuWidthOffset(menuWidth)

		local thisItem = NativeUI.CreateItem("Identifier", playerInfos.identifier) 
		thisPlayerDataMenu:AddItem(thisItem)

		local thisItem = NativeUI.CreateItem("~r~--ACCOUNTS--~s~", "") 
		thisPlayerDataMenu:AddItem(thisItem)

		for i, item in pairs(playerInfos.accounts) do
			local thisItem = NativeUI.CreateItem(item.name, "")
			thisItem:RightLabel(item.money)
			thisPlayerDataMenu:AddItem(thisItem)
			thisItem.Activated = function(ParentMenu,SelectedItem)
				AddTextEntry("ESX_SETACCOUNTMONEY", "Enter the Amount of Money to set.")
				DisplayOnscreenKeyboard(1, "ESX_SETACCOUNTMONEY", "", "", "", "", "", 16)
	
				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait( 0 )
				end
		
				local result = GetOnscreenKeyboardResult()
				if result and result ~= "" and tonumber(result) then
					TriggerServerEvent("EasyAdmin:esx:setAccountMoney", playerId, item.name,tonumber(result))
					thisItem:RightLabel(result)
				end
			end
		end


		if #playerInfos.loadout > 0 then
			local thisItem = NativeUI.CreateItem("~r~--LOADOUT--~s~", "") 
			thisPlayerDataMenu:AddItem(thisItem)

			for i, item in pairs(playerInfos.loadout) do
				local thisItem = NativeUI.CreateItem(item.name, "")
				thisItem:RightLabel(item.ammo)
				thisPlayerDataMenu:AddItem(thisItem)
			end
		end
		
		if playerLicenses and #playerLicenses > 0 then
			local thisItem = NativeUI.CreateItem("~r~--LICENSES--~s~", "") 
			thisPlayerDataMenu:AddItem(thisItem)

			for i,license in pairs(playerLicenses) do
				local thisItem = NativeUI.CreateItem(license.label, "")
				thisPlayerDataMenu:AddItem(thisItem)
			end
		end

		local thisItem = NativeUI.CreateItem("~r~--INVENTORY ITEMS--~s~", "") 
		thisPlayerDataMenu:AddItem(thisItem)
		

		for i, item in pairs(playerInfos.inventory) do
			if (ea_esx_hidenoitems == true and item.count ~= 0) or (ea_esx_hidenoitems == false) then
				local thisItem = NativeUI.CreateItem(item.name, "")
				thisItem:RightLabel(item.count)
				thisPlayerDataMenu:AddItem(thisItem)
				thisItem.Activated = function(ParentMenu,SelectedItem)
					AddTextEntry("ESX_SETITEMAMOUNT", "Enter the Amount of Items to set.")
					DisplayOnscreenKeyboard(1, "ESX_SETITEMAMOUNT", "", "", "", "", "", 16)
		
					while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
						Citizen.Wait( 0 )
					end
			
					local result = GetOnscreenKeyboardResult()
					if result and result ~= "" and tonumber(result) then
						TriggerServerEvent("EasyAdmin:esx:setInventoryItem", playerId, item.name,tonumber(result))
						thisItem:RightLabel(result)
					end
				end
			end
		end
		_menuPool:ControlDisablingEnabled(false)
		_menuPool:MouseControlsEnabled(false)
	end
end)


AddEventHandler("EasyAdmin:BuildCachedOptions", function(playerId) -- Options for Cached Players, do note that these do not not support Player natives! They're cached BY EASYADMIN
	
end)

AddEventHandler("EasyAdmin:BuildServerManagementOptions", function() -- Options for the Server Management Submenu, passes nothing.

end)

AddEventHandler("EasyAdmin:BuildSettingsOptions", function() -- Options for the Settings Page, once again, passes nothing

	local thisItem = NativeUI.CreateListItem("~y~[ESX]~s~ Hide missing Items", {"true", "false"}, 1, "Hides Items which player has 0 of.")
	settingsMenu:AddItem(thisItem)
	settingsMenu.OnListChange = function(sender, item, index)
			if item == thisItem then
					local i = item:IndexToItem(index)
					if i == "true" then
						ea_esx_hidenoitems = true
					else
						ea_esx_hidenoitems = false
					end
					SetResourceKvp("ea_esx_hidenoitems", i)
			end
	end

end)

if not GetResourceKvpString("ea_esx_hidenoitems") then
	SetResourceKvp("ea_esx_hidenoitems", "true")
	ea_esx_hidenoitems = true
else
	ea_esx_hidenoitems = GetResourceKvpString("ea_esx_hidenoitems")
	if ea_esx_hidenoitems == "true" then
		ea_esx_hidenoitems=true
	else
		ea_esx_hidenoitems=false
	end
end 