function send(options)
    if Config.anotherNotify.enable then
        Config.anotherNotify.callback(options.type, options.content, options.time)
        return
    end

    options.type = options.type or 'info'
    options.time = options.time or 2000

    SendNUIMessage({
        action = 'send',
        type = options.type,
        header = options.header,
        content = options.content,
        image = options.image,
        time = options.time
    })
end
RegisterNetEvent('zobyeteam_notify:send', send)

function sendTwitter(options)
    options.time = options.time or 6000

    SendNUIMessage({
        action = 'sendTwitter',
        profile =  options.profile,
        name =  options.name,
        message =  options.message,
        image = options.image,
        type = options.type,
        time = options.time,
        background = options.background
    })
end
RegisterNetEvent('zobyeteam_notify:sendTwitter', sendTwitter)

function openDisplay()
    if IsEntityDead(PlayerPedId()) then return end
    SendNUIMessage({
        action = 'openDisplay',
        type = 'twitter'
    })
end
RegisterNUICallback('openDisplay', openDisplay)

function closeDisplay()
    SendNUIMessage({
        action = 'closeDisplay',
        type = 'twitter'
    })
end
RegisterNUICallback('closeDisplay', closeDisplay)