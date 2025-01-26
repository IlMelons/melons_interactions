---@diagnostic disable

lib.versionCheck("IlMelons/melons_interactions")

AddEventHandler("onResourceStart", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    local expectedName = GetResourceMetadata(GetCurrentResourceName(), "name")

    if GetCurrentResourceName() ~= expectedName then
        print(("^1[WARNING]: The resource name is incorrect. Please set it to %s.^0"):format(expectedName))
    end
end)