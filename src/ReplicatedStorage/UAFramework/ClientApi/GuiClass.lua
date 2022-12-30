local module = {}
local Event = script:FindFirstChildOfClass("BindableEvent")

function General(gui: GuiObject, Settings)
	if Settings.MouseEnterCallback  then
		gui.MouseEnter:Connect(Settings.MouseEnterCallback)
	end

	if Settings.MouseExitCallback then
		gui.MouseLeave:Connect(Settings.MouseExitCallback)
	end

	if Settings.InputStart  then
		gui.InputBegan:Connect(Settings.InputStart)
	end

	if Settings.InputEnd  then
		gui.InputEnded:Connect(Settings.InputEnd)
	end

	if Settings.InputChanged  then
		gui.InputChanged:Connect(Settings.InputChanged)
	end

	if Settings.WheelForward then
		gui.MouseWheelForward:Connect(Settings.WheelForward)
	end

	if Settings.WheelBackward then
		gui.MouseWheelBackward:Connect(Settings.WheelBackward)
	end
end

function module:EditButton(gui: GuiButton, Settings)

	if not (typeof(Settings) == "table") then
		warn("This is not a table")
		return
	end

	if gui:IsA("ImageButton") then
		if Settings.Image then
			gui.Image = Settings.Image
		end

		if Settings.PressedImage then
			gui.PressedImage = Settings.PressedImage
		end
	end

	if gui:IsA("TextButton") then
		if Settings.Text  then
			gui.Text = Settings.Text
		end
	end

	if Settings.Background then
		gui.BackgroundColor3 = Settings.Background
	end
	
	-- this for when the button is pressed
	
	if Settings.Callback then
		gui.MouseButton1Click:Connect(Settings.Callback)
	end
	
	if Settings.RightButtonCallback then
		gui.MouseButton2Click:Connect(Settings.RightButtonCallback)
	end
	

	if Settings.ButtonDown then
		gui.MouseButton1Down:Connect(Settings.ButtonDown)
	end

	if Settings.ButtonUp then
		gui.MouseButton1Up:Connect(Settings.ButtonUp)
	end
	
	if Settings.RightButtonDown then
		gui.MouseButton2Down:Connect(Settings.RightButtonDown)
	end
	
	if Settings.RightButtonUp then
		gui.MouseButton2Up:Connect(Settings.RightButtonUp)
	end
	
	General(gui, Settings)
	
end

function module:EditLabel(gui: GuiLabel, Settings)

	if not (typeof(Settings) == "table") then
		warn("This is not a table")
		return
	end

	if gui:IsA("ImageLabel") then
		if Settings.Image  then
			gui.Image = Settings.Image
		end
	end

	if gui:IsA("TextLabel") then
		if Settings.Text  then
			gui.Text = Settings.Text
		end
	end

	if Settings.Background then
		gui.BackgroundColor3 = Settings.Background
	end
	
	General(gui, Settings)

end

return module