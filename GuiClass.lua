local module = {}
local Event = script:FindFirstChildOfClass("BindableEvent")

function module:EditTextButton(gui: TextButton, Settings)
	
	if not (typeof(Settings) == "table") then
		warn("This is not a table")
		return
	end
	
	if Settings.Text ~= nil then
		gui.Text = Settings.Text
	end
	
	if Settings.Background ~= nil then
		gui.BackgroundColor3 = Settings.Background
	end
	
	local connection
	if Settings.Callback ~= nil then
		connection = gui.MouseButton1Click:Connect(Settings.Callback)
	end
	
	function Settings:Stop()
		warn("Connection Stoped", "Cant be used")
		connection:Disconnect()
	end
	
	return Settings
end

function module:EditImageButton(gui: ImageButton, Settings)
	if not (typeof(Settings) == "table") then
		warn("This is not a table")
		return
	end
	
	if Settings.Image ~= nil then
		gui.Image = Settings.Image
	end
	
	if Settings.HoverImage ~= nil then
		gui.HoverImage = Settings.HoverImage
	end
	
	if Settings.Background ~= nil then
		gui.BackgroundColor3 = Settings.Background
	end
	
	local Connection
	if Settings.Callback ~= nil then
		Connection = gui.MouseButton1Click:Connect(Settings.Callback)
	end
	
	function Settings:Stop()
		warn("Connection Stoped", "Cant be used")
		Connection:Disconnect()
	end
	
	return Settings
end

function module:EditImage(gui: ImageLabel,Settings)
	if not (typeof(Settings) == "table") then
		warn("this is not a table")
		return
	end
	
	if Settings.Image ~= nil then
		gui.Image = Settings.Image
	end
	
	if Settings.Background ~= nil then
		gui.BackgroundColor3 = Settings.Background
	end
	
	return Settings
end

function module:EditFrame(gui: Frame, Settings)
	if not (typeof(Settings) == "table") then
		warn("this is not a table")
		return
	end

	if Settings.Size ~= nil then
		gui.Size = Settings.Size
	end
	
	
	if Settings.Transparency ~= nil then
		gui.BackgroundTransparency = Settings.Transparency
	end

	if Settings.Background ~= nil then
		gui.BackgroundColor3 = Settings.Background
	end

	return Settings
end

return module