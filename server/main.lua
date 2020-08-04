ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)

ESX.RegisterUsableItem('silencieux', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        TriggerClientEvent('eden_accesories:registerAccesories', xPlayer.source, 'silencieux')
    end
end)

ESX.RegisterUsableItem('flashlight', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        TriggerClientEvent('eden_accesories:registerAccesories', xPlayer.source, 'flashlight')
    end
end)

ESX.RegisterUsableItem('grip', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        TriggerClientEvent('eden_accesories:registerAccesories', xPlayer.source, 'grip')
    end
end)

ESX.RegisterUsableItem('yusuf', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        TriggerClientEvent('eden_accesories:registerAccesories', xPlayer.source, 'yusuf')
    end
end)
