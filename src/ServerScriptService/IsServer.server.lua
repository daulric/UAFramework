local UAF = require(game.ReplicatedStorage.UAFramework)
local IsServer = UAF.IsServer

if IsServer:IsPrivateServer() then
    print("its a private server")
end

if IsServer:IsReserveServer() then
    print("its a reserved server")
end

IsServer:PrivateServerStarted(function(player)
    print(player.Name, "is the owner")
end)