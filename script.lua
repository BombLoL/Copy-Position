function dragGUI(gui) -- skidded from inf yield
	local TweenService = game:GetService("TweenService")
	local UserInputService = game:GetService("UserInputService")
	
	task.spawn(function()
		local dragging
		local dragInput
		local dragStart = Vector3.new(0,0,0)
		local startPos
		local function update(input)
			local delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			TweenService:Create(gui, TweenInfo.new(.20), {Position = Position}):Play()
		end
		gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = gui.Position
	
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragging = false
					end
				end)
			end
		end)
		gui.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and dragging then
				update(input)
			end
		end)
	end)
end

local copymovement = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local title = Instance.new("TextLabel")
local desc = Instance.new("TextLabel")
local nocopy = Instance.new("TextLabel")
local user = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local copy = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local reset = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")

--Properties:

copymovement.Name = "copy movement"
copymovement.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
copymovement.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
copymovement.ResetOnSpawn = false

Frame.Parent = copymovement
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 257, 0, 306)
Frame.ZIndex = 999999999
dragGUI(Frame)

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = Frame

title.Name = "title"
title.Parent = Frame
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.000
title.BorderColor3 = Color3.fromRGB(0, 0, 0)
title.BorderSizePixel = 0
title.Position = UDim2.new(0.073929958, 0, 0.0294117648, 0)
title.Size = UDim2.new(0, 219, 0, 43)
title.ZIndex = 999999999
title.Font = Enum.Font.Nunito
title.Text = "Copy Position (R6, R15)"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.TextSize = 14.000
title.TextWrapped = true

desc.Name = "desc"
desc.Parent = Frame
desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
desc.BackgroundTransparency = 1.000
desc.BorderColor3 = Color3.fromRGB(0, 0, 0)
desc.BorderSizePixel = 0
desc.Position = UDim2.new(0.073929958, 0, 0.14705883, 0)
desc.Size = UDim2.new(0, 219, 0, 27)
desc.ZIndex = 999999999
desc.Font = Enum.Font.Nunito
desc.Text = "Includes rotation as well"
desc.TextColor3 = Color3.fromRGB(53, 53, 53)
desc.TextScaled = true
desc.TextSize = 14.000
desc.TextWrapped = true

nocopy.Name = "no copy"
nocopy.Parent = Frame
nocopy.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
nocopy.BackgroundTransparency = 1.000
nocopy.BorderColor3 = Color3.fromRGB(0, 0, 0)
nocopy.BorderSizePixel = 0
nocopy.Position = UDim2.new(0.073929958, 0, 0.911764681, 0)
nocopy.Size = UDim2.new(0, 219, 0, 27)
nocopy.ZIndex = 999999999
nocopy.Font = Enum.Font.Nunito
nocopy.Text = ".xyveria"
nocopy.TextColor3 = Color3.fromRGB(53, 53, 53)
nocopy.TextScaled = true
nocopy.TextSize = 14.000
nocopy.TextWrapped = true

user.Name = "user"
user.Parent = Frame
user.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
user.BorderColor3 = Color3.fromRGB(0, 0, 0)
user.BorderSizePixel = 0
user.Position = UDim2.new(0.108949415, 0, 0.326797396, 0)
user.Size = UDim2.new(0, 200, 0, 50)
user.ZIndex = 999999999
user.ClearTextOnFocus = false
user.Font = Enum.Font.SourceSans
user.PlaceholderText = "Username"
user.Text = ""
user.TextColor3 = Color3.fromRGB(255, 255, 255)
user.TextScaled = true
user.TextSize = 14.000
user.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 3)
UICorner_2.Parent = user

copy.Name = "copy"
copy.Parent = Frame
copy.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
copy.BorderColor3 = Color3.fromRGB(0, 0, 0)
copy.BorderSizePixel = 0
copy.Position = UDim2.new(0.108949415, 0, 0.594771266, 0)
copy.Size = UDim2.new(0, 200, 0, 35)
copy.ZIndex = 999999999
copy.Font = Enum.Font.SourceSans
copy.Text = "Copy movement"
copy.TextColor3 = Color3.fromRGB(255, 255, 255)
copy.TextScaled = true
copy.TextSize = 14.000
copy.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0, 3)
UICorner_3.Parent = copy

reset.Name = "reset"
reset.Parent = Frame
reset.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
reset.BorderColor3 = Color3.fromRGB(0, 0, 0)
reset.BorderSizePixel = 0
reset.Position = UDim2.new(0.108949415, 0, 0.741830051, 0)
reset.Size = UDim2.new(0, 200, 0, 35)
reset.ZIndex = 999999999
reset.Font = Enum.Font.SourceSans
reset.Text = "Reset"
reset.TextColor3 = Color3.fromRGB(255, 255, 255)
reset.TextScaled = true
reset.TextSize = 14.000
reset.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(0, 3)
UICorner_4.Parent = reset

-- Scripts:

local function MWCX_fake_script() -- copy.onClick 
	local script = Instance.new('LocalScript', copy)

	script.Parent.MouseButton1Click:Connect(function()
		
		local target = script.Parent.Parent.user.Text
		local targetWs = workspace[target]
		local plr = game.Players.LocalPlayer
		local char = plr.Character
		
		while task.wait() do
			
			char.HumanoidRootPart.CFrame = targetWs.HumanoidRootPart.CFrame + Vector3.new(0, 20, 0)
			
		end
		
	end)
end
coroutine.wrap(MWCX_fake_script)()
local function UNVET_fake_script() -- reset.onClick 
	local script = Instance.new('LocalScript', reset)

	script.Parent.MouseButton1Click:Connect(function()
		
		local char = game.Players.LocalPlayer.Character
		local head = char:WaitForChild("Head")
		
		head:Destroy()
		
	end)
end
coroutine.wrap(UNVET_fake_script)()
