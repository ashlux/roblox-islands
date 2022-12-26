if game.CoreGui:FindFirstChild("TestGUI") then game.CoreGui.TestGUI:Destroy() end

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local Mouse = Player:GetMouse()
local CoreGui = game:GetService("CoreGui")

local TestGUI = Instance.new("ScreenGui") -- idk if all of this is necessary lol
local Frame = Instance.new("Frame")
local Red = Instance.new("TextButton")
local Corners = Instance.new("UICorner")
local Green = Instance.new("TextButton")
local Corners_2 = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local Drag = Instance.new("TextButton")
local Exit = Instance.new("TextButton")
local Corners_3 = Instance.new("UICorner")
local Corners_4 = Instance.new("UICorner")
local Print = Instance.new("TextButton")

Toggled1 = false Toggled2 = false

TestGUI.Name = "TestGUI"
TestGUI.Parent = CoreGui
TestGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = TestGUI -- Background
Frame.AnchorPoint = Vector2.new(0, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0, 50, 0, 200)
Frame.Size = UDim2.new(0.150000006, 0, 0.300000012, 0)

Red.Name = "Red"
Red.Parent = Frame
Red.AnchorPoint = Vector2.new(0, 0.5)
Red.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Red.BackgroundTransparency = 0.500
Red.Position = UDim2.new(0, 0, 0.5, 0)
Red.Size = UDim2.new(0.5, 0, 0.5, 0)
Red.Font = Enum.Font.SourceSans
Red.Text = "Red Corner"
Red.TextColor3 = Color3.fromRGB(0, 0, 0)
Red.TextSize = 14.000
Red.MouseButton1Click:Connect(function()
    if Toggled2 == true then
        Toggled2 = false
        Red.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    else
        Toggled2 = true
        Toggled1 = false
        Green.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Red.BackgroundColor3 = Color3.fromRGB(0,0,0)
    end
end)

Corners.CornerRadius = UDim.new(1, 0)
Corners.Name = "Corners"
Corners.Parent = Red

Green.Name = "Green"
Green.Parent = Frame
Green.AnchorPoint = Vector2.new(1, 0.5)
Green.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Green.BackgroundTransparency = 0.500
Green.Position = UDim2.new(1, 0, 0.5, 0)
Green.Size = UDim2.new(0.5, 0, 0.5, 0)
Green.Font = Enum.Font.SourceSans
Green.Text = "Green Corner"
Green.TextColor3 = Color3.fromRGB(0, 0, 0)
Green.TextSize = 14.000
Green.MouseButton1Click:Connect(function()
    if Toggled1 == true then
        Green.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Toggled1 = false
    else
        Green.BackgroundColor3 = Color3.fromRGB(0,0,0)
        Red.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Toggled1 = true
        Toggled2 = false
    end
end)

Corners_2.CornerRadius = UDim.new(1, 0)
Corners_2.Name = "Corners"
Corners_2.Parent = Green

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(3, 57, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 196, 255))}
UIGradient.Parent = Frame

Drag.Name = "Drag"
Drag.Parent = Frame
Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Drag.BackgroundTransparency = 1.000
Drag.Size = UDim2.new(1, 0, 0.150000006, 0)
Drag.Font = Enum.Font.SourceSans
Drag.Text = "Test"
Drag.TextColor3 = Color3.fromRGB(0, 0, 0)
Drag.TextSize = 14.000
Dragg = false
Drag.MouseButton1Down:Connect(function()Dragg = true while Dragg do game.TweenService:Create(Frame, TweenInfo.new(.06), {Position = UDim2.new(0,Mouse.X - 90,0,Mouse.Y + 93)}):Play()wait()end end)
Drag.MouseButton1Up:Connect(function()Dragg = false end)



Exit.Name = "Exit"
Exit.Parent = Frame
Exit.AnchorPoint = Vector2.new(1, 0)
Exit.BackgroundColor3 = Color3.fromRGB(255, 110, 110)
Exit.Position = UDim2.new(1.00999999, 0, -0.00999999978, 0)
Exit.Size = UDim2.new(0.150000006, 0, 0.100000001, 0)
Exit.Font = Enum.Font.SourceSans
Exit.Text = "X"
Exit.TextColor3 = Color3.fromRGB(0, 0, 0)
Exit.TextSize = 14.000
Exit.MouseButton1Click:Connect(function() Toggled1 = false Toggled2 = false
TestGUI:Destroy()
if game.Workspace:FindFirstChild("redBlock") then game.Workspace.redBlock:Destroy() end
if game.Workspace:FindFirstChild("greenBlock") then game.Workspace.greenBlock:Destroy() end
end)

Corners_3.CornerRadius = UDim.new(1, 0)
Corners_3.Name = "Corners"
Corners_3.Parent = Exit

Corners_4.CornerRadius = UDim.new(1, 0)
Corners_4.Name = "Corners"
Corners_4.Parent = Frame

Mouse.Button1Down:connect(function()
    if Toggled2 then
        if game.Workspace:FindFirstChild("redBlock") then game.Workspace.redBlock:Destroy() end
        local red = Instance.new("BoxHandleAdornment")
        red.Name = "redBlock"
        red.Parent = game.Workspace
        red.Adornee = Mouse.Target
        red.AlwaysOnTop = true
        red.ZIndex = 0
        red.Size = Mouse.Target.Size
        red.Transparency = 0.3
        red.Color3 = Color3.fromRGB(250,100,100)
        p1 = Mouse.Target.Position
        Toggled2 = false
        Red.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    elseif Toggled1 then
        if game.Workspace:FindFirstChild("greenBlock") then game.Workspace.greenBlock:Destroy() end
        local green = Instance.new("BoxHandleAdornment")
        green.Name = "greenBlock"
        green.Parent = game.Workspace
        green.Adornee = Mouse.Target
        green.AlwaysOnTop = true
        green.ZIndex = 0
        green.Size = Mouse.Target.Size
        green.Transparency = 0.3
        green.Color3 = Color3.fromRGB(100,250,100)
        p2 = Mouse.Target.Position
        Toggled1 = false
        Green.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    end
end)

Print.Name = "Print"
Print.Parent = Frame
Print.AnchorPoint = Vector2.new(0.5, 0.8)
Print.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Print.BackgroundTransparency = 0.500
Print.Position = UDim2.new(0.5, 0, 0.9, 0)
Print.Size = UDim2.new(0.4, 0, 0.15, 0)
Print.Font = Enum.Font.SourceSans
Print.Text = "Print"
Print.TextColor3 = Color3.fromRGB(0, 0, 0)
Print.TextSize = 14.000
Print.MouseButton1Click:Connect(function()
stop = false
xBackup, yBackup, zBackup = p1.x, p1.y, p1.z
X, Y, Z = p1.x, p1.y, p1.z
X1, Y1, Z1 = p2.x, p2.y, p2.z
    for _,t in pairs(Character:GetChildren()) do
        if t:IsA("Tool") then
            tool = t.Name
            if string.find(t.DisplayName.Value, " Seeds") then print("changing name") tool = string.gsub(tool, "Seeds", "") end -- silly seeds need special names
        end
    end
repeat
    print(xBackup, yBackup, zBackup, p1.x, p1.y, p1.z, p2.x, p2.y, p2.z)
    if X > X1 then X = X - 3
    elseif X < X1 then X = X + 3
    elseif X == X1 then X = xBackup
        if Z > Z1 then Z = Z - 3
        elseif Z < Z1 then Z = Z + 3
        elseif Z == Z1 then Z = zBackup 
            if Y > Y1 then Y = Y - 3
            elseif Y < Y1 then Y = Y + 3
            elseif Y == Y1 then stop = true
            end
        end
    end
    task.spawn(function()
    local args = {
    [1] = {
        ["upperBlock"] = false,
        ["cframe"] = CFrame.new(Vector3.new(X,Y,Z), Vector3.new(X,Y,Z+3)), -- you can change rotation on the second Vector3. ex. Z-3, X+3, X-3
        ["player_tracking_category"] = "join_from_web",
        ["blockType"] = tool
        }
        }

        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_PLACE_REQUEST:InvokeServer(unpack(args))
    end)

until p1 == p2 or stop == true
end)