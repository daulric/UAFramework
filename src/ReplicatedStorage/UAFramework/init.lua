--[[ 
		🔹This is a Package/Library Maintain by UA Software. 
		🔹We called it UAFramework because it sounded cooler to say you nerds.
		🔹Anyways we just create and/or add and modify modules to make life easier.
		🔹Join UA Software for more modules like this.
]]


local module = {}

local ServerApi = script:WaitForChild("ServerApi")
local GlobalApi = script:WaitForChild("GlobalApi")
local ClientApi = script:WaitForChild("ClientApi")
local AdvancedDataTypes = script:WaitForChild("AdvancedDataTypes")

local RS = game:GetService("RunService")

-- Raw Exports
export type ClientClass = "GuiClass" | "InputClass"
export type ServerClass = "Team" | "IsServer" | "DataManager"
export type GlobalClass = "Event" | "Storage"
export type AdvancedDataTypes = "NTS" | "Numbers"
-- Final Exports
export type Service = ClientClass | ServerClass | GlobalClass | AdvancedDataTypes

-- Global Api
module.Event = require(GlobalApi.UAEvent)
module.Storage = require(GlobalApi.Storage)

-- Advanced Data Types
module.NTS = require(AdvancedDataTypes.NumberToString)
module.Numbers = require(AdvancedDataTypes.Numbers)

if RS:IsClient() then
	module.GuiClass = require(ClientApi.GuiClass)
	module.InputClass = require(ClientApi.InputClass)
	module.AdvancedCAS = require(ClientApi.CASClass)
end

if RS:IsServer() then
	module.Team = require(ServerApi.TeamClass)
	module.IsServer = require(ServerApi.IsServer)
	module.DataManager = require(ServerApi.DataManager)
end

print("🔹UAFramework🔹")

return module