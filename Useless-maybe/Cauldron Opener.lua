local Island = game.Workspace.Islands:GetChildren()[1]

local oldGui = game.CoreGui:FindFirstChild("Button")
if oldGui then
    oldGui:Destroy()
end

CmdGui = Instance.new("ScreenGui")
CmdGui.Name = "Button"
CmdGui.Parent = game:GetService("CoreGui")

Background = Instance.new("Frame")
Background.Name = "Background"
Background.Parent = CmdGui
Background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background.BorderSizePixel = 0
Background.BorderColor3 = Color3.new(1,0,1)
Background.Position = UDim2.new(0.5, 0, 0.5, 0)
Background.Size = UDim2.new(0, 100, 0, 100)
Background.Active = true

Close = Instance.new("TextButton")
Close.Name = "Close"
Close.Parent = Background
Close.BackgroundColor3 = Color3.fromRGB(155, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.87, 0, 0.0001, 0)
Close.Size = UDim2.new(0, 15, 0, 15)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 14.000
Close.MouseButton1Click:Connect(function()
CmdGui:Destroy()
end)

Cauldrons = Instance.new("TextButton")
Cauldrons.Position = UDim2.new(0,1,0,21)
Cauldrons.Size = UDim2.new(0,100,0,20)
Cauldrons.BackgroundColor3 = Color3.fromRGB(50,100,50)
Cauldrons.BorderColor3 = Color3.new(1,1,1)
Cauldrons.ZIndex = 2
Cauldrons.Parent = Background
Cauldrons.Text = "Open Cauldrons"
Cauldrons.TextColor3 = Color3.new(1,1,1)
Cauldrons.TextScaled = true
Cauldrons.MouseButton1Click:Connect(function()
for i, v in pairs(Island.Blocks:GetChildren()) do
    if v.Name == "cauldron2" and #v.Contents:GetChildren() == 0 and v:FindFirstChild("ProximityPrompt") then
        fireproximityprompt(v.ProximityPrompt)
    end
end
end)

Collect = Instance.new("TextButton")
Collect.Position = UDim2.new(0,1,0,42)
Collect.Size = UDim2.new(0,100,0,20)
Collect.BackgroundColor3 = Color3.fromRGB(50,100,50)
Collect.BorderColor3 = Color3.new(1,1,1)
Collect.ZIndex = 2
Collect.Parent = Background
Collect.Text = "Collect all but Legendaries"
Collect.TextColor3 = Color3.new(1,1,1)
Collect.TextScaled = true
Collect.MouseButton1Click:Connect(function()
for i, v in pairs(Island.Blocks:GetChildren()) do
    if v.Name == "cauldron2" and #v.Contents:GetChildren() > 0 and v:FindFirstChild("ProximityPrompt") and v.Contents:FindFirstChild("halloweenEventTrophy2022") == nil and v.Contents:FindFirstChild("reaperScythe") == nil and v.Contents:FindFirstChild("reaperCrossbow") == nil and v.Contents:FindFirstChild("spawnEggSpider") == nil  then
        fireproximityprompt(v.ProximityPrompt)
    end
end
end)