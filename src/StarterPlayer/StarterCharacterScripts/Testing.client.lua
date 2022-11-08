local BitCoins = {
    Balance = 10,
    Wallet = 90,
    Withdraw = 100,
}

local Player = game.Players.LocalPlayer
local UAF = require(game.ReplicatedStorage.UAFramework)
local Event = UAF.Event

if script.Parent:FindFirstChildOfClass("Humanoid") then
    Event:SendServer("hello", BitCoins)
end