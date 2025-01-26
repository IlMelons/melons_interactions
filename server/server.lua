---@diagnostic disable lowercase-global

local InAction = {}

interaction = {}

function interaction.IsAvailable(playerId)
    return InAction[playerId] == nil
end

function interaction.ArePlayersAvailable(playerId, targetId)
    return interaction.IsAvailable(playerId) and interaction.IsAvailable(targetId)
end

function interaction.CanCancel(playerId, actionType)
    local playerAction = InAction[playerId]

    if playerAction ~= nil and playerAction.type == "host" and playerAction.action == actionType then
        return true, playerAction.partner
    end

    return false, nil
end

function interaction.CacheAction(playerId, targetId, actionType)
    InAction[playerId] = {partner = targetId, type = "host", action = actionType}
    InAction[targetId] = {partner = playerId, type = "guest", action = actionType}
end

function interaction.UncacheAction(playerId, targetId)
    if InAction[playerId] then
        InAction[playerId] = nil
    end
    if InAction[targetId] then
        InAction[targetId] = nil
    end
end

function interaction.BreakAction(playerId)
    if InAction[playerId] then
        local partnerId = InAction[playerId].partner
        local type = InAction[playerId].type
        local actionType = InAction[playerId].action

        TriggerClientEvent("melons_interactions:client:Stop"..actionType, playerId, type)
        InAction[playerId] = nil

        if partnerId and InAction[partnerId] then
            TriggerClientEvent("melons_interactions:client:Stop"..actionType, partnerId, InAction[partnerId].type)
            InAction[partnerId] = nil
        end
    end
end

AddEventHandler("playerDropped", function (reason)
    interaction.BreakAction(source)
end)