local UAF = require(game:GetService("ReplicatedStorage"):WaitForChild("UAFramework"))
local Storage = UAF.Storage
local Player = game.Players.LocalPlayer

local Stored = Storage.createStorage('hello')
local Stored2 = Storage.createStorage("id")

Stored:dump(
    "hello",
    "idk",
    Player
)

Stored2:dump("we are ulric")

print(Stored:grab(), "Stored 1")
print(Stored2:grab(), "Stored 2")
