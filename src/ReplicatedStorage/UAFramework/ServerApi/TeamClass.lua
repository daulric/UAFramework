local module = {}
local Players = game:GetService("Players")
local RS = game:GetService("RunService")

local CurrentTeam = {}
local Teams = {}

function module:SwitchTeam(player: Player, team:Team)
	CurrentTeam[player.UserId] = player.Team
	RS.Heartbeat:Wait()
	player.Team = team
	return "New Team: "..team.Name
end

function module:ReturnToFormerTeam(player: Player)
	if CurrentTeam[player.UserId] ~= nil then
		player.Team = CurrentTeam[player.UserId]
		return player.Name.." returned to previous team. "..CurrentTeam[player.UserId].Name
	end
end

return module