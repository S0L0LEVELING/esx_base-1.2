MN = {}

isOpen = false

RegisterCommand("testnui", function()
    if not isOpen then 
        SendNUIMessage({
            action = "open",
            icon = "fas fa-university",
            text = "[E] Open Bank",
            color = "#887744"
        })
        isOpen = true
    else
        SendNUIMessage({
            action = "close"
        })
        isOpen = false
    end
end)






OpenNotify = function(data)
    if not isOpen then 
        SendNUIMessage({
            action = "open",
            icon = data.icon,
            text = data.text
            color = data.color
        })
        isOpen = true
    end
end



CloseNotify = function(data)
    if isOpen then 
        SendNUIMessage({
            action = "close"
        })
        isOpen = false
    end
end