local UAF = require(game:GetService("ReplicatedStorage"):WaitForChild("UAFramework"))
local Storage = UAF.Storage
local Player = game.Players.LocalPlayer

Storage:dump("hello",
    "idk",
    Player,
    "hello",
    "wecare",
    "drugs"
)

local str = Storage:grab("hello")

local GetPlayer = Storage:mapStorage("hello", Player, "idk", "wecare")
print(GetPlayer, "founded")
