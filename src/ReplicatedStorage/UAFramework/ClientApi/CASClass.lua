local module = {}

local CAS = game:GetService("ContextActionService")
local SignalCAS = {}

function module:StartAction(actionName: string, handle: any, mobileButton: boolean, ...)

	local actionProperties = {}

	function actionProperties:Properties(Settings)
		task.wait()
		local Button = CAS:GetButton(actionName)
		
		local ImageLabel
		local TextLabel

		if Settings.Image then
			CAS:SetImage(actionName, Settings.Image)
		end

		if Settings.Position then
			CAS:SetPosition(actionName, Settings.Position)
		end

		if Settings.Title then
			CAS:SetTitle(actionName, Settings.Title)
		end

		if Settings.Description then
			CAS:SetDescription(actionName, Settings.Description)
		end

		if Button and Button:IsA("GuiButton") then
			Button.Name = actionName
			actionProperties.Button = Button

			ImageLabel = Button:FindFirstChildOfClass("ImageLabel")
			TextLabel = Button:FindFirstChildOfClass("TextLabel")

			if Settings.BackgroundColor then
				local function changeBackColor()
					Button.ImageTransparency = 1
					Button.Transparency = 0
					Button.BackgroundColor3 = Settings.BackgroundColor
					--wait(1)
				end

				changeBackColor()
			end

			if Settings.Corner then
				local UICornor = Instance.new("UICorner", Button)

				if Settings.Corner ~= true then
					UICornor.CornerRadius = Settings.Corner
				end
			end

			if Settings.AutoScale then
				local UIAspectRatioContraint = Instance.new("UIAspectRatioConstraint", Button)

				if Settings.AutoScale ~= true then
					UIAspectRatioContraint.AspectType = Settings.AutoScale.AspectType or Enum.AspectType.FitWithinMaxSize
					UIAspectRatioContraint.DominantAxis = Settings.AutoScale.DominantAxis or Enum.DominantAxis.Width
				end
			end

			if Settings.Size then
				Button.Size = Settings.Size
			end

			if Settings.ImageColor then
				ImageLabel.ImageColor3 = Settings.ImageColor
			end

		end

	end

	SignalCAS[actionName] = actionProperties
	CAS:BindAction(actionName, handle, mobileButton, ...)
	return actionProperties

end

function module:Properties(actionName, Settings)
	SignalCAS[actionName]:Properties(Settings)
end

function module:StopAction(actionName: string)
	if SignalCAS[actionName] then
		SignalCAS[actionName] = nil
		CAS:UnbindAction(actionName)
	end
end

function module:UnbindAllActions()
	for i, v in pairs(SignalCAS) do
		CAS:UnbindAction(i)
		SignalCAS[i] = nil
	end

end

function module:GetAllActions()
	return SignalCAS
end

if game:GetService("RunService"):IsStudio() then
	warn("Due To The Limitations Of Roblox CAS, You cannot bind more that 7 actions!")
end

return module