local UAF = require(game.ReplicatedStorage.UAFramework)
local Event = UAF.Event

Event:ListenForEvent("hello", function(player, number)
    for index, value in pairs(number) do
        print("Wallet:", index, value)
    end
end)