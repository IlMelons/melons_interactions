
RegisterNetEvent("melons_interactions:client:CarryAnim", function(data)
	local playerPed = cache.ped or PlayerPedId()
	if data.status == "carry" then
		lib.requestAnimDict("missfinale_c2mcs_1", 200)

		interaction.Disable()

		TaskPlayAnim(playerPed, "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 8.0, -8.0, -1, 49, 0, false, false, false)
	elseif data.status == "carried" then
		Carried = true
		lib.requestAnimDict("nm", 200)

		interaction.Disable()

		local target = GetPlayerFromServerId(data.target)
		local targetPed = GetPlayerPed(target)
		TaskPlayAnim(playerPed, "nm", "firemans_carry", 8.0, -8.0, -1, 33, 0, false, false, false)
		AttachEntityToEntity(playerPed, targetPed, 0, 0.27, 0.15, 0.63, 0.5, 0.5, 180, false, false, false, false, 2, false)
	end
end)

RegisterNetEvent("melons_interactions:client:StopCarry", function(type)
	local playerPed = cache.ped or PlayerPedId()
	
	ClearPedTasks(playerPed)
	DetachEntity(playerPed, true, false)
	if type == "host" then
		RemoveAnimDict("missfinale_c2mcs_1")
	elseif type == "guest" then
		RemoveAnimDict("nm")
	end

	interaction.Enable()
end)