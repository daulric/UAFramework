
local module = {}

function module:IsPrivateServer()
	if game.PrivateServerOwnerId ~= 0 and game.PrivateServerId ~= "" then
		return true
	end
end

function module:IsReserveServer()
	if game.PrivateServerId ~= "" and game.PrivateServerOwnerId == 0 then
		return true
	end
end

function module.PrivateServerStarted(handler)
	if not module:IsPrivateServer() then
		return
	end

	game.Players.PlayerAdded:Connect(function(player)
		if game.PrivateServerOwnerId == player.UserId then
			handler(player)
		end
	end)
	
end

function module.ReserveServerStarted(handler)
	if not module:IsReserveServer() then
		return
	end
	
	game.Players.PlayerAdded:Connect(function(player)
		handler(player)
	end)
	
end

return module