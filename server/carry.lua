local SVConfig = require "config.server"
local Command = SVConfig.Commands

local function Carry(playerId, targetId)
	if not interaction.ArePlayersAvailable(playerId, targetId) then return end

	interaction.CacheAction(playerId, targetId, "Carry")
	TriggerClientEvent("melons_interactions:client:CarryAnim", playerId, {status = "carry"})
	TriggerClientEvent("melons_interactions:client:CarryAnim", targetId, {status = "carried", target = playerId})
end

local function StopCarry(playerId, targetId)
	TriggerClientEvent("melons_interactions:client:StopCarry", playerId)
	TriggerClientEvent("melons_interactions:client:StopCarry", targetId)
	interaction.UncacheAction(playerId, targetId)
end

lib.addCommand(Command["carry"].name, {
    help = Command["carry"].help,
}, function(source, args, raw)
	if source <= 0 then return end
	local canCancel, target = interaction.CanCancel(source, "Carry")
	if canCancel then
		StopCarry(source, target)
	else
		if interaction.IsAvailable(source) and not server.GetDeathState(source) then
			local playerPed = GetPlayerPed(source)
			local playerCoords = GetEntityCoords(playerPed)
			local players = lib.getNearbyPlayers(playerCoords, 5.0, false)
			for _, player in pairs(players) do
				if player.id ~= source then
					if interaction.IsAvailable(player.id) then
						Carry(source, player.id)
					end
				end
			end
		end
	end
end)