local UAF = require(game.ReplicatedStorage.UAFramework)
local GuiClass = UAF.GuiClass

function callback()
    print("works")
end

GuiClass:EditTextButton({
    Callback = callback,
    MouseEnterCallback = callback,
    MouseExitCallback = callback
})

GuiClass:EditFrame({
    MouseExitCallback = callback,
    MouseEnterCallback = callback
})

GuiClass:EditGeneralButton({
    Callback = callback,
    MouseEnterCallback = callback,
    MouseExitCallback = callback
})

GuiClass:EditImage({
    Image = "rbxassetid://"..1,
})

GuiClass:EditImageButton({
    Callback = callback,
    MouseEnterCallback = callback,
    MouseExitCallback = callback,
    HoverImage = "rbxassetid://"..1,
    Image = "rbxassetid://"..1
})