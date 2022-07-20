RegisterNetEvent('rocket-notify:Notify')
AddEventHandler('rocket-notify:Notify', function(data)
	Notify(data.text, data.type, data.length)
end)

RegisterNetEvent('rocket-notify:grootnotify')
AddEventHandler('rocket-notify:grootnotify', function(title, content, icon, timeout, color, time)
    grootnotify(title, content, icon, timeout, color, time)
end)

function Notify (text, type, length) -- [text] = message, [type] = primary | error | success, [length] = time till fadeout.
    local ttype = textype ~= nil and textype
    local length = length ~= nil and length or 5000
    SendNUIMessage({
        action = "show",
        text = text,
        type = type,
        length = length,
    })
end

grootnotify = function(title, content, icon, timeout, color, time)
    if time then
        SendNUIMessage({
            action = "Notification",
            NotifyData = {
                title = title,
                content = content, 
                icon = icon, 
                timeout = timeout, 
                color = color,
            },
        })
    else
        SendNUIMessage({
            action = "note",
            NotifyData = {
                title = title,
                content = content, 
                icon = icon, 
                timeout = timeout, 
                color = color,
            },
        })
    end
end