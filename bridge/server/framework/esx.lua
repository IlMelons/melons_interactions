---@diagnostic disable lowercase-global

if GetResourceState("es_extended") ~= "started" then return end

server = {}

function server.GetDeathState(src)
    local playerState = Player(src).state
    local isDead = playerState.dead

    return isDead
end