local torque = 1.0

CreateThread(function()
	while true do
		Wait(1)
		local playerPed = PlayerPedId()
		local veh = GetVehiclePedIsIn(playerPed, false)

		if IsUsingKeyboard(2) then
			if veh ~= 0 then
				if GetPedInVehicleSeat(veh, -1) == playerPed then

					for i=1, #Config.Controls do
						local data = Config.Controls[i]
						local continue = false
						if data.modifierKey then
							if IsControlPressed(0, data.modifierKey) or IsDisabledControlPressed(0, data.modifierKey) then
								continue = true
							end
						else
							continue = true
						end
						if continue then
							if data.disableKeyDefaultFunc then
								DisableControlAction(0, data.key, true)
								if IsDisabledControlJustPressed(0, data.key) then
									torque += data.torque
									if torque < Config.HighestTorque and torque > Config.lowestTorque then
										PlaySound(-1, "CANCEL", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
									end
								end
							else
								if IsControlJustPressed(0, data.key) then
									torque += data.torque
									if torque < Config.HighestTorque and torque > Config.lowestTorque then
										PlaySound(-1, "CANCEL", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
									end
								end
							end
						end
					end

					if torque > Config.HighestTorque then torque = Config.HighestTorque; PlaySound(-1, "SELECT", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1) end
					if torque < Config.lowestTorque then torque = Config.lowestTorque; PlaySound(-1, "SELECT", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1) end

					if Config.debug then
						Draw2DText("Torque : ~b~"..torque..(torque > 0.98 and '~s~ (default)' or ''), 0.05, 0.08)
						Draw2DText("wheel power - ~p~1~s~ : ~g~"..tostring(GetVehicleWheelPower(veh, 1)), 0.40, 0.08)
						Draw2DText("wheel power - ~p~2~s~ : ~g~"..tostring(GetVehicleWheelPower(veh, 2)), 0.40, 0.18)
						Draw2DText("wheel power - ~p~3~s~ : ~g~"..tostring(GetVehicleWheelPower(veh, 3)), 0.40, 0.28)
						Draw2DText("wheel power - ~p~4~s~ : ~g~"..tostring(GetVehicleWheelPower(veh, 4)), 0.40, 0.38)
					end

					if torque <= 0.98 or torque > 1.01 then
						SetVehicleCheatPowerIncrease(veh, torque)
					end

					local text = ''
					if torque > 0.98 and torque < 1.01 then
						text = '~s~ (default)'
					elseif torque + 0.01 >= Config.HighestTorque then
						text = '~r~ (max)'
					elseif torque - 0.01 <= Config.lowestTorque then
						text = '~g~ (min)'
					end

					if Config.onScreenData.enabled then
						Draw2DText("Vehicle Power : ~b~"..torque..'x '..text, Config.onScreenData.location.x, Config.onScreenData.location.y, nil, nil, Config.onScreenData.scale)
					end
				else
					Wait(500)
				end
			else
				Wait(500)
			end
		else
			if Config.debug then
				Draw2DText("Controller Detected, Disabled torque controller", 0.05, 0.08)
			else
				Wait(1000)
			end
		end
	end
end)