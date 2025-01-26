---@diagnostic disable lowercase-global

interaction = {}

local playerState = LocalPlayer.state

function interaction.Disable()
    playerState.canUseWeapons = false
    playerState.invBusy = true
    playerState.invHotkeys = false
end

function interaction.Enable()
    playerState.canUseWeapons = true
    playerState.invBusy = false
    playerState.invHotkeys = true
end