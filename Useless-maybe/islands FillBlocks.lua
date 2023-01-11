local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local HR = Character.HumanoidRootPart
local Mouse = Player:GetMouse()
local CoreGui = game:GetService("CoreGui")
local TS = game:GetService("TweenService")

local printDeleteGui = Instance.new("ScreenGui") -- idk if all of this is necessary lol
local Frame = Instance.new("Frame")
local Red = Instance.new("TextButton")
local Corners = Instance.new("UICorner")
local Blue = Instance.new("TextButton")
local Corners_2 = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local Drag = Instance.new("TextButton")
local Exit = Instance.new("TextButton")
local Corners_3 = Instance.new("UICorner")
local Corners_4 = Instance.new("UICorner")
local Print = Instance.new("TextButton")
local Delete = Instance.new("TextButton")
local useless = Instance.new("TextLabel")

local Toggled1 = false 
local Toggled2 = false 
local Deleting = false
local lastDragDist = 0

local function destroyOld()
    if game.CoreGui:FindFirstChild("printDeleteGui") then game.CoreGui.printDeleteGui:Destroy() end
    if game.Workspace:FindFirstChild("redPart") then game.Workspace.redPart:Destroy() game.CoreGui.redHandles:Destroy() end
    if game.Workspace:FindFirstChild("bluePart") then game.Workspace.bluePart:Destroy() game.CoreGui.blueHandles:Destroy() end
    Toggled1 = false Toggled2 = false
    Deleting = false
end

destroyOld()

local function Float() -- makes you float using BV
	BV = Instance.new("BodyVelocity", HR)
	BV.Velocity = Vector3.new(0,0,0)
	BV.MaxForce = Vector3.new(0,math.huge,0)
end

local function unFloat() -- gets rid of BV so you dont float
    for i,v in pairs(HR:GetChildren()) do
        if v.Name == "BodyVelocity" then
            v:Destroy()
        end
    end
end

function goToPoint(Point) -- go to "Point" (Vector3)
    if (HR.Position - Point).magnitude > 24 then
    Distance = (HR.Position - Point).Magnitude
    Speed = 25
    Time = Distance/Speed
    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
    tween:Play()
    return tween, Time
    end
end

printDeleteGui.Name = "printDeleteGui"
printDeleteGui.Parent = CoreGui
printDeleteGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = printDeleteGui -- Background
Frame.AnchorPoint = Vector2.new(0, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0, 50, 0, 200)
Frame.Size = UDim2.new(0.150000006, 0, 0.300000012, 0)

function GetCorner(sz, pos, anch)
	pos = typeof(pos) == 'UDim2' and Vector2.new(pos.X.Offset, pos.Y.Offset) or pos
	anch = anch or Vector2.new(0,0)
	return pos+(sz*anch)
end

local guiCorner = GetCorner(Frame.AbsoluteSize, Frame.Position, Frame.AnchorPoint)
local Center = guiCorner+(Frame.AbsoluteSize/2)

Red.Name = "Red"
Red.Parent = Frame
Red.AnchorPoint = Vector2.new(0, 0.5)
Red.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Red.BackgroundTransparency = 0.500
Red.Position = UDim2.new(0, 0, 0.4, 0)
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
        Blue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Red.BackgroundColor3 = Color3.fromRGB(0,0,0)
    end
end)

Corners.CornerRadius = UDim.new(1, 0)
Corners.Name = "Corners"
Corners.Parent = Red

Blue.Name = "Blue"
Blue.Parent = Frame
Blue.AnchorPoint = Vector2.new(1, 0.5)
Blue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Blue.BackgroundTransparency = 0.500
Blue.Position = UDim2.new(1, 0, 0.4, 0)
Blue.Size = UDim2.new(0.5, 0, 0.5, 0)
Blue.Font = Enum.Font.SourceSans
Blue.Text = "Blue Corner"
Blue.TextColor3 = Color3.fromRGB(0, 0, 0)
Blue.TextSize = 14.000
Blue.MouseButton1Click:Connect(function()
    if Toggled1 == true then
        Blue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Toggled1 = false
    else
        Blue.BackgroundColor3 = Color3.fromRGB(0,0,0)
        Red.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Toggled1 = true
        Toggled2 = false
    end
end)

Corners_2.CornerRadius = UDim.new(1, 0)
Corners_2.Name = "Corners"
Corners_2.Parent = Blue

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(3, 57, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 196, 255))}
UIGradient.Parent = Frame

Drag.Name = "Drag"
Drag.Parent = Frame
Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Drag.BackgroundTransparency = 1.000
Drag.Size = UDim2.new(1, 0, 0.150000006, 0)
Drag.Font = Enum.Font.SourceSans
Drag.Text = "Print/Delete"
Drag.TextColor3 = Color3.fromRGB(0, 0, 0)
Drag.TextSize = 14.000
Dragg = false
Drag.MouseButton1Down:Connect(function()Dragg = true while Dragg do game.TweenService:Create(Frame, TweenInfo.new(.06), {Position = UDim2.new(0,Mouse.X - (Center.X /2),0,Mouse.Y + (Center.Y/4))}):Play()wait()end end)
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
Exit.MouseButton1Click:Connect(function()
    destroyOld()
end)

Corners_3.CornerRadius = UDim.new(1, 0)
Corners_3.Name = "Corners"
Corners_3.Parent = Exit

Corners_4.CornerRadius = UDim.new(.1, 0)
Corners_4.Name = "Corners"
Corners_4.Parent = Frame

Mouse.Button1Down:connect(function()
    if Toggled2 then
        Red.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Toggled2 = false
        if game.Workspace:FindFirstChild("redPart") then game.Workspace.redPart:Destroy() game.CoreGui.redHandles:Destroy() end
        local redPart = Instance.new("Part", game.Workspace)
        redPart.Name = "redPart"
        redPart.Transparency = 0.4
        redPart.Color = Color3.fromRGB(250,0,0)
        if Mouse.Target.Name == "Top" then -- grass tops suck
            redPart.Position = Mouse.Target.Parent.Position
        else
            redPart.Position = Mouse.Target.Position
        end
        redPart.Size = Vector3.new(3,3,3)
        redPart.Anchored = true
    
        local red = Instance.new("Handles", game.CoreGui)
        red.Name = "redHandles"
        red.Style = "Movement"
        red.Adornee = redPart
        red.Transparency = 0.3
        red.MouseDrag:Connect(function(Face,Distance)
            if math.floor(Distance) % 3 == 0 and lastDragDist ~= math.floor(Distance) then
                if Face == Enum.NormalId.Back then
                        Pos, addPos = red.Adornee.Position, Vector3.new(0,0,3)
                elseif Face == Enum.NormalId.Front then
                    Pos, addPos  = red.Adornee.Position, Vector3.new(0,0,-3)
                elseif Face == Enum.NormalId.Right then
                    Pos, addPos  = red.Adornee.Position, Vector3.new(3,0,0)
                elseif Face == Enum.NormalId.Left then
                    Pos, addPos  = red.Adornee.Position, Vector3.new(-3,0,0)
                elseif Face == Enum.NormalId.Top then
                    Pos, addPos  = red.Adornee.Position, Vector3.new(0,3,0)
                elseif Face == Enum.NormalId.Bottom then
                        Pos, addPos  = red.Adornee.Position, Vector3.new(0,-3,0)
                end
                if math.floor(Distance) > lastDragDist then
                    red.Adornee.Position = Pos + addPos
                    lastDragDist = math.floor(Distance)
                elseif math.floor(Distance) < lastDragDist then
                    red.Adornee.Position = Pos - addPos
                    lastDragDist = math.floor(Distance)
                end
            end
        end)
    
        red.MouseButton1Up:connect(function(face)
            lastDragDist = 0
        end)
        
    elseif Toggled1 then
        Blue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Toggled1 = false
        if game.Workspace:FindFirstChild("bluePart") then game.Workspace.bluePart:Destroy() game.CoreGui.blueHandles:Destroy() end
        local bluePart = Instance.new("Part", game.Workspace)
        bluePart.Name = "bluePart"
        bluePart.Transparency = 0.4
        bluePart.Color = Color3.fromRGB(0,0,250)
        if Mouse.Target.Name == "Top" then -- grass tops suck
            bluePart.Position = Mouse.Target.Parent.Position
        else
            bluePart.Position = Mouse.Target.Position
        end
        bluePart.Size = Vector3.new(3,3,3)
        bluePart.Anchored = true
    
        local blue = Instance.new("Handles", game.CoreGui)
        blue.Name = "blueHandles"
        blue.Style = "Movement"
        blue.Adornee = bluePart
        blue.Transparency = 0.3
        blue.MouseDrag:Connect(function(Face,Distance)
            if math.floor(Distance) % 3 == 0 and lastDragDist ~= math.floor(Distance) then
                if Face == Enum.NormalId.Back then
                        Pos, addPos = blue.Adornee.Position, Vector3.new(0,0,3)
                elseif Face == Enum.NormalId.Front then
                    Pos, addPos  = blue.Adornee.Position, Vector3.new(0,0,-3)
                elseif Face == Enum.NormalId.Right then
                    Pos, addPos  = blue.Adornee.Position, Vector3.new(3,0,0)
                elseif Face == Enum.NormalId.Left then
                    Pos, addPos  = blue.Adornee.Position, Vector3.new(-3,0,0)
                elseif Face == Enum.NormalId.Top then
                    Pos, addPos  = blue.Adornee.Position, Vector3.new(0,3,0)
                elseif Face == Enum.NormalId.Bottom then
                        Pos, addPos  = blue.Adornee.Position, Vector3.new(0,-3,0)
                end
                if math.floor(Distance) > lastDragDist then
                    blue.Adornee.Position = Pos + addPos
                    lastDragDist = math.floor(Distance)
                elseif math.floor(Distance) < lastDragDist then
                    blue.Adornee.Position = Pos - addPos
                    lastDragDist = math.floor(Distance)
                end
            end
        end)
    
        blue.MouseButton1Up:connect(function(face)
            lastDragDist = 0
        end)
    end
end)

Print.Name = "Print"
Print.Parent = Frame
Print.AnchorPoint = Vector2.new(0.5, 0.8)
Print.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Print.BackgroundTransparency = 0.500
Print.Position = UDim2.new(0.3, 0, 0.9, 0)
Print.Size = UDim2.new(0.4, 0, 0.15, 0)
Print.Font = Enum.Font.SourceSans
Print.Text = "Print"
Print.TextColor3 = Color3.fromRGB(0, 0, 0)
Print.TextSize = 14.000
Print.MouseButton1Click:Connect(function()
if not game.Workspace:FindFirstChild("redPart") and game.Workspace:FindFirstChild("bluePart") then return end
stop = false
local p1 = game.Workspace.redPart.Position
local p2 = game.Workspace.bluePart.Position
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

local function getSize(pos1, pos2)
    local diff = pos2-pos1
    return Vector3.new(math.abs(diff.X),math.abs(diff.Y),math.abs(diff.Z))
end

local function getBlocksBetween(A,B)
    
    local boxPosition = CFrame.new((A.Position + B.Position) / 2)
    local boxSize = getSize(A.Position,B.Position)
    local maxObjectsAllowed = 10
    local params = OverlapParams.new(filterObjects,Enum.RaycastFilterType.Blacklist,maxObjectsAllowed,"Default")
    local objectsInSpace = workspace:GetPartBoundsInBox(boxPosition,boxSize,params)
    
    local actualBlocks = {}
    for i,v in pairs(objectsInSpace) do
        for i2,v2 in pairs(game.ReplicatedStorage.Blocks:GetChildren()) do
            if v.Name == v2.Name then
                table.insert(actualBlocks, v)
            end
        end
    end
    
    table.sort(actualBlocks, function(t1, t2) 
		return Player:DistanceFromCharacter(t1.Position) < Player:DistanceFromCharacter(t2.Position) end)
    table.insert(actualBlocks, 1, B)
    return actualBlocks
end

local function breakBlock(block)

    local args = {
    [1] = {
    ["player_tracking_category"] = "join_from_web",
    ["part"] = block,
    ["block"] = block,
    ["norm"] = block.Position,
    ["pos"] = block.Position
    }
    }
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))

end

Delete.Name = "Print"
Delete.Parent = Frame
Delete.AnchorPoint = Vector2.new(0.5, 0.8)
Delete.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Delete.BackgroundTransparency = 0.500
Delete.Position = UDim2.new(0.7, 0, 0.9, 0)
Delete.Size = UDim2.new(0.4, 0, 0.15, 0)
Delete.Font = Enum.Font.SourceSans
Delete.Text = "Delete"
Delete.TextColor3 = Color3.fromRGB(0, 0, 0)
Delete.TextSize = 14.000
Delete.MouseButton1Click:Connect(function()
    if Deleting then
        Deleting = false
        Delete.Text = "Delete"
        Delete.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        unFloat()
    else
        Deleting = true
        Delete.Text = "Deleting"
        Delete.BackgroundColor3 = Color3.fromRGB(255, 55, 55)
        Float()
        if game.Workspace:FindFirstChild("redPart") and game.Workspace:FindFirstChild("bluePart") then
            local A = game.Workspace.redPart
            local B = game.Workspace.bluePart
            local allBlocksBetween = getBlocksBetween(A,B)
            for i,v in pairs(allBlocksBetween) do
                if Deleting then
                    tween, Time = goToPoint(v.Position)
                    goToPoint(v.Position)
                    local tooMuch = 0
                    repeat breakBlock(v)
                        tooMuch = tooMuch + 1
                    until v:FindFirstChild("Health") == nil or tooMuch == 20 or Deleting == false
                end
            end
        end
    end
end)

useless.Name = "Print"
useless.Parent = Frame
useless.AnchorPoint = Vector2.new(0.5, 0.8)
useless.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
useless.BackgroundTransparency = 1
useless.Position = UDim2.new(0.5, 0, 0.7, 0)
useless.Size = UDim2.new(0.4, 0, 0.15, 0)
useless.Font = Enum.Font.SourceSans
useless.Text = "^"
useless.TextColor3 = Color3.fromRGB(0, 0, 0)
useless.TextSize = 40.000
