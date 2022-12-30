local UserInputService = game:GetService("UserInputService")

local module = {}
local binds = {}

function checkSetting(setting)
	if not (typeof(setting) == "table") then
		warn("this is not a table")
		return
	end
end

function module:CombineKey(name, callback, ...)
	local keys = table.pack(...)
	keys.n = nil

	binds[name] = UserInputService.InputBegan:Connect(function(input, bool)
		if bool then return end
		local KeyCode = (input.KeyCode == keys[#keys])
		if KeyCode then
			for key, _ in pairs(keys) do
				if not UserInputService:IsKeyDown(keys[key]) then
					return
				end
			end
			callback(name)
		end
	end)
end

function module:UnbindKey(name)
	print("action unbind", name)
	binds[name]:Disconnect()
end

function module:BeginInput(Settings)
	UserInputService.InputBegan:Connect(function(input, bool)
		if Settings.Proccessed == true then
			if bool then return end
		end

		if input.KeyCode == Settings.Key then
			Settings.Callback()
		elseif input.UserInputType == Settings.Key then
			Settings.Callback()
		end
	end)
end

function module:EndInput(Settings)
	checkSetting(Settings)
	UserInputService.InputEnded:Connect(function(input, bool)
		if Settings.Proccessed == true then
			if bool then return end
		end

		if input.KeyCode == Settings.Key then
			Settings.Callback()
		elseif input.UserInputType == Settings.Key then
			Settings.Callback()
		end
	end)
end

function module:ChangeInput(Settings)
	checkSetting(Settings)
	UserInputService.InputChanged:Connect(function(input, bool)
		if Settings.Proccessed == true then
			if bool then return end
		end

		if input.KeyCode == Settings.Key then
			Settings.Callback()
		elseif input.UserInputType == Settings.Key then
			Settings.Callback()
		end
	end)
end

return module