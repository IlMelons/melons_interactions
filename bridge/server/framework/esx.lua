---@diagnostic disable lowercase-global

if GetResourceState("es_extended") ~= "started" then return end

local ESX = exports["es_extended"]:getSharedObject()

server = {}

function server.GetDeathState(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    local isDead = xPlayer.PlayerData.dead

    return isDead
end