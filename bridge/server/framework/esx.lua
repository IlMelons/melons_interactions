---@diagnostic disable lowercase-global

if GetResourceState("es_extended") ~= "started" then return end

local ESX = exports["es_extended"]:getSharedObject()

server = {}

function server.GetDeathState(src)
    local xPlayer = ESX.GetPlayerFromId(src)
    local isDead = MySQL.scalar.await('SELECT `is_dead` FROM `users` WHERE `identifier` = ? LIMIT 1', {xPlayer.identifier})

    return isDead
end