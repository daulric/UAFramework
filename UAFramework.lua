local module = {}
local ServerApi = script:WaitForChild("ServerApi")
local GlobalApi = script:WaitForChild("GlobalApi")
local ClientApi = script:WaitForChild("ClientApi")
local AdvancedDataTypes = script:WaitForChild("AdvancedDataTypes")
local RS = game:GetService("RunService")

-- Global Api
module.Event = require(GlobalApi.UAEvent)

-- Advanced Data Types
module.NTS = require(AdvancedDataTypes.NumberToString)
module.Numbers = require(AdvancedDataTypes.Numbers)

if RS:IsClient() then
	module.GuiClass = require(ClientApi.GuiClass)
	module.InputClass = require(ClientApi.InputClass)
end

if RS:IsServer() then
	module.Team = require(ServerApi.TeamClass)
	module.IsPrivateServer = require(ServerApi.IsServer):IsPrivateServer()
	module.IsReserveServer = require(ServerApi.IsServer):IsReserveServer()
end

function module:DestroyAll()
	if RS:IsServer() then
		warn("Destroying All Classes in the UA Framework")
		return module == nil
	end
end

return module