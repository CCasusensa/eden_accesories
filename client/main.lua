ESX = nil
local used = 0

local silencieuxlist = {
    {weapon = 'WEAPON_PISTOL', compent = 'component_at_pi_supp_02'},
    {weapon = 'WEAPON_PISTOL50', compent = 'COMPONENT_AT_AR_SUPP_02'},
    {weapon = 'WEAPON_COMBATPISTOL', compent = 'COMPONENT_AT_PI_SUPP'},
    {weapon = 'WEAPON_APPISTOL', compent = 'COMPONENT_AT_PI_SUPP'},
    {weapon = 'WEAPON_HEAVYPISTOL', compent = 'COMPONENT_AT_PI_SUPP'},
    {weapon = 'WEAPON_VINTAGEPISTOL', compent = 'COMPONENT_AT_PI_SUPP'},
    {weapon = 'WEAPON_SMG', compent = 'COMPONENT_AT_PI_SUPP'},
    {weapon = 'WEAPON_MICROSMG', compent = 'COMPONENT_AT_AR_SUPP_02'},
    {weapon = 'WEAPON_ASSAULTSMG', compent = 'COMPONENT_AT_AR_SUPP_02'},
    {weapon = 'WEAPON_ASSAULTRIFLE', compent = 'COMPONENT_AT_AR_SUPP_02'},
    {weapon = 'WEAPON_CARBINERIFLE', compent = 'COMPONENT_AT_AR_SUPP'},
    {weapon = 'WEAPON_ADVANCEDRIFLE', compent = 'COMPONENT_AT_AR_SUPP'},
    {weapon = 'WEAPON_SPECIALCARBINE', compent = 'COMPONENT_AT_AR_SUPP_02'},
    {weapon = 'WEAPON_BULLPUPRIFLE', compent = 'COMPONENT_AT_AR_SUPP'},
    {weapon = 'WEAPON_ASSAULTSHOTGUN', compent = 'COMPONENT_AT_AR_SUPP'},
    {weapon = 'WEAPON_HEAVYSHOTGUN', compent = 'COMPONENT_AT_AR_SUPP_02'},
    {weapon = 'WEAPON_BULLPUPSHOTGUN', compent = 'COMPONENT_AT_AR_SUPP_02'},
    {weapon = 'WEAPON_PUMPSHOTGUN', compent = 'COMPONENT_AT_SR_SUPP'},
    {weapon = 'WEAPON_MARKSMANRIFLE', compent = 'COMPONENT_AT_AR_SUPP'},
    {weapon = 'WEAPON_SNIPERRIFLE', compent = 'COMPONENT_AT_AR_SUPP_02'}
}

local flashlightlist = {
    {weapon = 'WEAPON_PISTOL', compent = 'COMPONENT_AT_PI_FLSH'},
    {weapon = 'WEAPON_PISTOL50', compent = 'COMPONENT_AT_PI_FLSH'},
    {weapon = 'WEAPON_COMBATPISTOL', compent = 'COMPONENT_AT_PI_FLSH'},
    {weapon = 'WEAPON_APPISTOL', compent = 'COMPONENT_AT_PI_FLSH'},
    {weapon = 'WEAPON_HEAVYPISTOL', compent = 'COMPONENT_AT_PI_FLSH'},
    {weapon = 'WEAPON_SMG', compent = 'COMPONENT_AT_AR_FLSH'},
    {weapon = 'WEAPON_MICROSMG', compent = 'COMPONENT_AT_PI_FLSH'},
    {weapon = 'WEAPON_ASSAULTSMG', compent = 'COMPONENT_AT_AR_FLSH'},
    {weapon = 'WEAPON_COMBATPDW', compent = 'COMPONENT_AT_AR_FLSH'},
    {weapon = 'WEAPON_ASSAULTRIFLE', compent = 'COMPONENT_AT_AR_FLSH'},
    {weapon = 'WEAPON_CARBINERIFLE', compent = 'COMPONENT_AT_AR_FLSH'},
    {weapon = 'WEAPON_ADVANCEDRIFLE', compent = 'COMPONENT_AT_AR_FLSH'},
    {weapon = 'WEAPON_SPECIALCARBINE', compent = 'COMPONENT_AT_AR_FLSH'},
    {weapon = 'WEAPON_BULLPUPRIFLE', compent = 'COMPONENT_AT_AR_FLSH'},
    {weapon = 'WEAPON_ASSAULTSHOTGUN', compent = 'COMPONENT_AT_AR_FLSH'},
    {weapon = 'WEAPON_HEAVYSHOTGUN', compent = 'COMPONENT_AT_AR_FLSH'},
    {weapon = 'WEAPON_BULLPUPSHOTGUN', compent = 'COMPONENT_AT_AR_FLSH'},
    {weapon = 'WEAPON_PUMPSHOTGUN', compent = 'COMPONENT_AT_AR_FLSH'},
    {weapon = 'WEAPON_MARKSMANRIFLE', compent = 'COMPONENT_AT_AR_FLSH'}
}

local griplist = {
    {weapon = 'WEAPON_COMBATPDW', compent = 'COMPONENT_AT_AR_AFGRIP'},
    {weapon = 'WEAPON_ASSAULTRIFLE', compent = 'COMPONENT_AT_AR_AFGRIP'},
    {weapon = 'WEAPON_CARBINERIFLE', compent = 'COMPONENT_AT_AR_AFGRIP'},
    {weapon = 'WEAPON_SPECIALCARBINE', compent = 'COMPONENT_AT_AR_AFGRIP'},
    {weapon = 'WEAPON_BULLPUPRIFLE', compent = 'COMPONENT_AT_AR_AFGRIP'},
    {weapon = 'WEAPON_ASSAULTSHOTGUN', compent = 'COMPONENT_AT_AR_AFGRIP'},
    {weapon = 'WEAPON_HEAVYSHOTGUN', compent = 'COMPONENT_AT_AR_AFGRIP'},
    {weapon = 'WEAPON_BULLPUPSHOTGUN', compent = 'COMPONENT_AT_AR_AFGRIP'},
    {weapon = 'WEAPON_MARKSMANRIFLE', compent = 'COMPONENT_AT_AR_AFGRIP'}
}

local yusuflist = {
    {weapon = 'WEAPON_PISTOL', compent = 'COMPONENT_PISTOL_VARMOD_LUXE'},
    {weapon = 'WEAPON_PISTOL50', compent = 'COMPONENT_PISTOL50_VARMOD_LUXE'},
    {weapon = 'WEAPON_APPISTOL', compent = 'COMPONENT_APPISTOL_VARMOD_LUXE'},
    {weapon = 'WEAPON_HEAVYPISTOL', compent = 'COMPONENT_HEAVYPISTOL_VARMOD_LUXE'},
    {weapon = 'WEAPON_SMG', compent = 'COMPONENT_SMG_VARMOD_LUXE'},
    {weapon = 'WEAPON_MICROSMG', compent = 'COMPONENT_MICROSMG_VARMOD_LUXE'},
    {weapon = 'WEAPON_ASSAULTRIFLE', compent = 'COMPONENT_ASSAULTRIFLE_VARMOD_LUXE'},
    {weapon = 'WEAPON_CARBINERIFLE', compent = 'COMPONENT_CARBINERIFLE_VARMOD_LUXE'},
    {weapon = 'WEAPON_ADVANCEDRIFLE', compent = 'COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE'}
}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
        Citizen.Wait(0)
    end
end)

AddEventHandler('playerSpawned', function()
    used = 0
end)

RegisterNetEvent('eden_accesories:registerAccesories')
AddEventHandler('eden_accesories:registerAccesories', function(duration)
    if duration ~= 'silencieux' and duration ~= 'flashlight' and duration ~= 'grip' and duration ~= 'yusuf' then
        return
    end
    
    local forhash = 'silencieuxlist'
    
    if duration == 'flashlight' then
        forhash = 'flashlightlist'
    elseif duration == 'grip' then
        forhash = 'griplist'
    elseif duration == 'yusuf' then
        forhash = 'yusuflist'
    end
    
    
    local currentWeaponHash = GetSelectedPedWeapon(PlayerPedId())
    local ped = GetPlayerPed(-1)
    
    for k, v in pairs(forhash) do
        if currentWeaponHash == GetHashKey(v.weapon) then
            if HasPedGotWeaponComponent(ped, GetHashKey(v.weapon), GetHashKey(v.compent)) then
                used = 1
                break
            end
            used = 2
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(v.weapon), GetHashKey(v.compent))
            ESX.ShowNotification(("裝備穿戴成功，如果角色重生或登入切記請重新穿戴！"))
            break
        end
    end
    
    if used == 1 then
        ESX.ShowNotification(("該武器已經有裝備此配件。"))
    elseif used == 0 then
        ESX.ShowNotification(("目前該武器沒有適合的配件可以裝備。"))
    end
    
    used = 0
end)