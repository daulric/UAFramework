# UserDatabase Sample

[UserDatabase Documentation](../docs/UserDatabase.md)

This is a simple script for managing player datastore

``` lua
local Players = game:GetService("Players")
local UAFramework = require(path.to.module)

local DataManager = UAFramework.DataManager
local PlayersData = DataManager.createUserDB("DataStore")
local Event = path.to.event

local Template = PlayersData.CreateTemplate {
    Cash = 0,
    Token = 0
}

Players.PlayerAdded:Connect(function(player)
    local Profile = PlayersData:OpenProfile(player)
    local Data = Profile:Get()

    local leaderstats = Instance.new("Folder", player)
    leaderstats.Name = "Data"

    for i, v in pairs(Template) do 
        local Items = Instance.new("StringValue", leaderstats)
        Items.Name = i
        Items.Value = Data[i] or v

        Items:GetPropertyChangedSignal("Value"):Connect(function() 
            Profile:Update(function(currentData)
                currentData[i] = Items.Value
                return currentData
            end)
        end)

    end
end)

function closeProfile(player)
    PlayersData:CloseProfile(player)
end

Players.PlayerRemoving:Connect(closeProfile)

game:BindToClose:Connect(function()
    for i, player in pairs(Players:GetPlayers()) do 
        closeProfile(player)
    end
end)

```

This is a simple script to showing basic AntiCheat Database

``` lua
local UAFramework = require(path.to.module)
local DataManager = UAFramework.DataManager

local Players = game:GetService("Players")

local AntiCheatDB = DataManager.createUserDB("AntiCheat")

AntiCheatDB.CreateTemplate {
    Banned = true,
    Reason = "",
}

Players.PlayerAdded:Connect(function(player) 
    local Profile = AntiCheatDB:OpenProfile(player)

    local Data = Profile:Get()

    if Data.Banned == true then
        AntiCheatDB:CloseProfile(player)
        player:Kick("Banned For Using Cheats", Data.Reason)
    end

end)

-- kick player is data.Banned == true
AntiCheatDB:GetChangedSignal("ProfileUpdated"):Connect(function(player, data)
    if data.Banned == true then
        player:Kick(data.Reason)
        AntiCheatDB:CloseProfile(player)
    end
end)

-- close profile if player is removed
Players.PlayerRemoving:Connect(function(player) 
    AntiCheatDB:CloseProfile(player)
end)

Event.OnServerEvent:Connect(function(player, data)
    local Profile = AntiCheatDB:OpenProfile(player)

    Profile:Update(function(currentData)
        for i, v in pairs(data) do 
            currentData[i] = v
        end

        return currentData
    end)

end)

```