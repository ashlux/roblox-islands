local Island = workspace.Islands:GetChildren()[1]
local Blocks = Island.Blocks
local Player = game.Players.LocalPlayer
local HR = Player.Character.HumanoidRootPart
local GetM = Player:GetMouse()
local trapToggle = false

local oldGui = game.CoreGui:FindFirstChild("TDButton")
if oldGui then
    oldGui:Destroy()
end

CmdGui = Instance.new("ScreenGui")
CmdGui.Name = "TDButton"
CmdGui.Parent = game:GetService("CoreGui")

Background = Instance.new("Frame")
Background.Name = "Background"
Background.Parent = CmdGui
Background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background.BorderSizePixel = 0
Background.BorderColor3 = Color3.new(1,0,1)
Background.Position = UDim2.new(0.07, 0, 0.5, 0)
Background.Size = UDim2.new(0, 100, 0, 100)
Background.Active = true

CmdName = Instance.new("TextButton")
CmdName.Name = "CmdName"
CmdName.AutoButtonColor = false
CmdName.Parent = Background
CmdName.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CmdName.BorderSizePixel = 0
CmdName.Size = UDim2.new(0, 87, 0, 15)
CmdName.Font = Enum.Font.GothamBlack
CmdName.Text = "Islands GUI"
CmdName.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdName.TextScaled = true
CmdName.TextSize = 14.000
CmdName.TextWrapped = true
Dragg = false
CmdName.MouseButton1Down:Connect(function()Dragg = true while Dragg do game.TweenService:Create(Background, TweenInfo.new(.06), {Position = UDim2.new(0,GetM.X-40,0,GetM.Y-5)}):Play()wait()end end)
CmdName.MouseButton1Up:Connect(function()Dragg = false end)

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

speed = Instance.new("TextBox")
speed.Name = "speed"
speed.Position = UDim2.new(0,1,0,21)
speed.Size = UDim2.new(0,100,0,20)
speed.BackgroundColor3 = Color3.fromRGB(50,100,50)
speed.BorderColor3 = Color3.new(1,1,1)
speed.ZIndex = 2
speed.Parent = Background
speed.Text = ""
speed.PlaceholderText = "wait how long"
speed.TextColor3 = Color3.new(1,1,1)
speed.TextScaled = true


local function randomizeTrapdoors()
    for _,d in pairs(Blocks:GetChildren()) do
        if d.Name:find("trap") then
            if math.random(1,3) == 2 then
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.TrapDoorToggle:FireServer(d)
                task.wait(tonumber(speed.Text))
            end
        end
    end
end

trapDoorToggle = Instance.new("TextButton")
trapDoorToggle.Name = "trapDoorToggle"
trapDoorToggle.Position = UDim2.new(0,1,0,42)
trapDoorToggle.Size = UDim2.new(0,100,0,20)
trapDoorToggle.BackgroundColor3 = Color3.fromRGB(50,100,50)
trapDoorToggle.BorderColor3 = Color3.new(1,1,1)
trapDoorToggle.ZIndex = 2
trapDoorToggle.Parent = Background
trapDoorToggle.Text = "Randomize Trap Doors"
trapDoorToggle.TextColor3 = Color3.new(1,1,1)
trapDoorToggle.TextScaled = true
trapDoorToggle.MouseButton1Click:Connect(function()
    if trapToggle == true then
        trapToggle = false
        trapDoorToggle.Text = "Randomize Trap Doors"
        trapDoorToggle.BackgroundColor3 = Color3.fromRGB(50,100,50)
    else
        trapToggle = true
        trapDoorToggle.Text = "Randomizing"
        trapDoorToggle.BackgroundColor3 = Color3.fromRGB(100,50,100)
        while trapToggle == true do
            randomizeTrapdoors()
        end
    end
end)
