-- Fix issue when health fully restored during /loadskin command
-- To resolve: It should be retreived properly from metadata
-- We do set metadata in loop in case health changed
local RSGCore = exports['rsg-core']:GetCoreObject()
local threadActivated = false
function init()
    local health = -1
    local prevHealth = -1
    print('Thread activated')
    threadActivated = true
    while threadActivated do
        prevHealth = health
        health = GetEntityHealth(PlayerPedId())
        if health ~= prevHealth then
            LocalPlayer.state:set('health', health, true)
            TriggerServerEvent('RSGCore:Server:SetMetaData', 'health', health)
            print('Sync health')
        end
        Wait(1000)
    end
    print('Thread deactivated')
end

if LocalPlayer.state.isLoggedIn then
    CreateThread(function()
        init()
    end)
end

RegisterNetEvent('RSGCore:Client:OnPlayerLoaded', function()
    init()
end)

RegisterNetEvent('RSGCore:Client:OnPlayerUnload', function()
    threadActivated = false
end)