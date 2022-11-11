local module = {}
local ServerApi = script:WaitForChild("ServerApi")
local GlobalApi = script:WaitForChild("GlobalApi")
local ClientApi = script:WaitForChild("ClientApi")
local AdvancedDataTypes = script:WaitForChild("AdvancedDataTypes")
local RS = game:GetService("RunService")

export type ClientClass = "GuiClass" | "InputClass"
export type ServerClass = "Team"
export type GlobalClass = "Event"
export type AdvancedDataTypes = "NTS" | "Numbers"
-- Final Export on Class
export type Service = ClientClass | ServerClass | GlobalClass | AdvancedDataTypes

-- Global Api
module.Event = require(GlobalApi.UAEvent)
module.Storage = require(GlobalApi.Storage)

-- Advanced Data Types
module.NTS = require(AdvancedDataTypes.NumberToString)
module.Numbers = require(AdvancedDataTypes.Numbers)


print(script.Name, "| Loading Global Api")

print("we are ulric")

if RS:IsClient() then
	module.GuiClass = require(ClientApi.GuiClass)
	module.InputClass = require(ClientApi.InputClass)
	script:SetAttribute("Client", true)
	script:SetAttribute("Server", nil)
	print(script.Name, "| Loading Client Api")
end

if RS:IsServer() then
	module.Team = require(ServerApi.TeamClass)
	module.IsServer = require(ServerApi.IsServer)
	script:SetAttribute("Server", true)
	print(script.Name, "| Loading Server Api")
end

print(script.Name, "| Finished Loading")

return module