---@diagnostic disable lowercase-global

if GetResourceState("qb-core") ~= "started" then return end

local QBCore = exports["qb-core"]:GetCoreObject()

server = {}

function server.GetDeathState(src)
    local Player = QBCore.Functions.GetPlayer(src)
    local isDead = Player.PlayerData.metadata["isdead"]
    local inLastStand = Player.PlayerData.metadata["inlaststand"]
    return inLastStand or isDead
end