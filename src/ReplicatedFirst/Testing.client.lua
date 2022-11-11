local UAF = require(game:GetService("ReplicatedStorage"):WaitForChild("UAFramework"))
local Storage = UAF.Storage
local Player = game.Players.LocalPlayer

local Stored = Storage.createStorage('hello')

Stored:dump(
    "hello"
)

print("Storage First:", Stored:grab(), "- Previous:", Storage:GetStorageInfo())

Stored:UpdateStorage(function(oldData)
    local Data = {
        BitCoins = 10,
        Coins = 100,
        Etherium = 1000,
        Fake = "fake",
        oldData
    }

    return Data
end)

print(Stored:find("hello"))
print("Updated Storage:", Stored:grab(), "- After:", Storage:GetStorageInfo())