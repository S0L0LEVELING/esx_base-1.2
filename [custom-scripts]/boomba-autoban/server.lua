ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("boomba-autoban:checkitems")
AddEventHandler("boomba-autoban:checkitems", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    for k,v in pairs(Config.govermentItems) do 
        local itemQuantity = xPlayer.getInventoryItem(v).count
        if itemQuantity >= 1 then
            if itemQuantity >= 1 then
                if xPlayer.job.name == Config.policejob then 
                elseif xPlayer.job.name == Config.offpolicejob then 
                elseif xPlayer.job.name == Config.ambulancejob then
                elseif xPlayer.job.name == Config.offambulancejob then end 
                if IsPlayerAceAllowed(source, Config.aceGroupStaff) then
                    if itemQuantity >= 1 then 
                        xPlayer.removeInventoryItem(v, itemQuantity)
                    end 
                else 
                    xPlayer.removeInventoryItem(v, itemQuantity)
                    TriggerEvent("EasyAdmin:addBan", source, "You had "..itemQuantity.."X "..v.." in your inventory. This is a job item.", 10444633200, false)
                end 
            end 
        end
    end 
end)

RegisterServerEvent("boomba-autoban:checkitems")
AddEventHandler("boomba-autoban:checkitems", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    for k,v in pairs(Config.blacklistedItems) do 
        local itemQuantity = xPlayer.getInventoryItem(v).count
        if itemQuantity >= 1 then
            if itemQuantity >= 1 then
                if IsPlayerAceAllowed(source, Config.aceGroupStaff) then
                    if itemQuantity >= 1 then 
                        xPlayer.removeInventoryItem(v, itemQuantity)
                    end 
                else 
                    xPlayer.removeInventoryItem(v, itemQuantity)
                    TriggerEvent("EasyAdmin:addBan", source, "You had "..itemQuantity.."X "..v.." in your inventory. This is a job item.", 10444633200, false)
                end 
            end 
        end
    end 
end)