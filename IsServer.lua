
local module = {}

function module:IsPrivateServer()
	if game.PrivateServerOwnerId ~= 0  then
		if game.PrivateServerId ~= "" then
			return true
		end
		return false
	end
	return false
end

function module:IsReserveServer()
	if game.PrivateServerId ~= "" then
		return true
	end
	
	return false
end

return module