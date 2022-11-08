local UAF = require(game.ReplicatedStorage.UAFramework)
local InputClass = UAF.InputClass

function callback()
    print("Got the command")
end

-- Binding Keys
InputClass:CombineKey("test", callback, Enum.KeyCode.LeftControl, Enum.KeyCode.LeftShift, Enum.KeyCode.C)

-- Unbinding Keys
InputClass:UnbindKey("test")

-- Registering Input
InputClass:BeginInput({
    Proccessed = true,
    Key = Enum.KeyCode.A,
    Callback = callback
})

InputClass:ChangeInput({
    Proccessed = true,
    Key = Enum.KeyCode.C,
    Callback = callback,
})

InputClass:EndInput({
    Proccessed = true,
    Key = Enum.KeyCode.C,
    Callback = callback
})