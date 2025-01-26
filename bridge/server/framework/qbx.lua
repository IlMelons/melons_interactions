---@diagnostic disable lowercase-global

if GetResourceState("qbx_core") ~= "started" then return end

local QBX = exports.qbx_core

server = {}

function server.GetDeathState(src)
    local player = QBX:GetPlayer(src)
    local isDead = player.PlayerData.metadata.isdead
    local inLastStand = player.PlayerData.metadata.inlaststand
    return inLastStand or isDead
end