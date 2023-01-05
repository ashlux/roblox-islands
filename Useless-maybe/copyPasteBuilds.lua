local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local Mouse = Player:GetMouse()
local HR = Character.HumanoidRootPart
local TS = game:GetService("TweenService")
local Island = game.Workspace.Islands:GetChildren()[1]
local Blocks = Island.Blocks
local lastDragDist = 0
local redToggled = false
local blueToggled = false

local function notification(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {Title=title; Text=text; Duration=duration;})
    local Player = game.Players.LocalPlayer
end

if CoreGui:FindFirstChild("Draggable") then
    CoreGui.Draggable:Destroy()
end

local CmdGui = Instance.new("ScreenGui")
CmdGui.Name = "Draggable"
CmdGui.Parent = game:GetService("CoreGui")

local Background = Instance.new("Frame")
Background.Name = "Background"
Background.Parent = CmdGui
Background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background.BorderSizePixel = 0
Background.BorderColor3 = Color3.new(1,0,1)
Background.Position = UDim2.new(0.06, 0, 0.20, 0)
Background.Size = UDim2.new(0, 120, 0, 275)
Background.Active = true

local Drag = Instance.new("TextButton")
Drag.Name = "Drag"
Drag.Parent = Background
Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Drag.Size = UDim2.new(1, 0, 0.150000006, 0)
Drag.Font = Enum.Font.SourceSans
Drag.Text = "Build Copier"
Drag.TextColor3 = Color3.fromRGB(0, 0, 0)
Drag.TextSize = 14.000
Dragg = false
Drag.MouseButton1Down:Connect(function()Dragg = true while Dragg do TS:Create(Background, TweenInfo.new(.06), {Position = UDim2.new(0,Mouse.X - 50,0,Mouse.Y - 11)}):Play()wait()end end)
Drag.MouseButton1Up:Connect(function()Dragg = false end)

local Close = Instance.new("TextButton")
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
    redToggled = false blueToggled = false
    CmdGui:Destroy()
end)

local Red = Instance.new("TextButton")
local Blue = Instance.new("TextButton")
Red.Name = "Red"
Red.Parent = Background
Red.AnchorPoint = Vector2.new(0, 0.5)
Red.BackgroundColor3 = Color3.fromRGB(255, 200, 200)
Red.BackgroundTransparency = 0.500
Red.Position = UDim2.new(0, 0, 0.3, 0)
Red.Size = UDim2.new(0.5, 0, 0.3, 0)
Red.Font = Enum.Font.SourceSans
Red.Text = "Red Corner"
Red.TextColor3 = Color3.fromRGB(0, 0, 0)
Red.TextSize = 14.000
Red.MouseButton1Click:Connect(function()
    if redToggled == true then
        redToggled = false
        Red.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    else
        redToggled = true
        blueToggled = false
        Blue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Red.BackgroundColor3 = Color3.fromRGB(0,0,0)
    end
end)

Blue.Name = "Blue"
Blue.Parent = Background
Blue.AnchorPoint = Vector2.new(1, 0.5)
Blue.BackgroundColor3 = Color3.fromRGB(200, 200, 255)
Blue.BackgroundTransparency = 0.500
Blue.Position = UDim2.new(1, 0, 0.3, 0)
Blue.Size = UDim2.new(0.5, 0, 0.3, 0)
Blue.Font = Enum.Font.SourceSans
Blue.Text = "Blue Corner"
Blue.TextColor3 = Color3.fromRGB(0, 0, 0)
Blue.TextSize = 14.000
Blue.MouseButton1Click:Connect(function()
    if blueToggled == true then
        Blue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        blueToggled = false
    else
        Blue.BackgroundColor3 = Color3.fromRGB(0,0,0)
        Red.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        blueToggled = true
        redToggled = false
    end
end)

Mouse.Button1Down:connect(function()

    if redToggled then
        redToggled = false
        Red.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        if game.CoreGui:FindFirstChild("redHandles") then game.CoreGui.redHandles:Destroy() end
        if game.Workspace:FindFirstChild("redPart") then game.Workspace.redPart:Destroy() end
    
    
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

    
    elseif blueToggled then
        blueToggled = false
        Blue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        if game.CoreGui:FindFirstChild("blueHandles") then game.CoreGui.blueHandles:Destroy() end
        if game.Workspace:FindFirstChild("bluePart") then game.Workspace.bluePart:Destroy() end
    
    
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
    return actualBlocks
end

local nameBox = Instance.new("TextBox")
nameBox.Name = "nameBox"
nameBox.Parent = Background
nameBox.AnchorPoint = Vector2.new(0.5, 0.5)
nameBox.BackgroundColor3 = Color3.new(1,1,1)
nameBox.Position = UDim2.new(0.5, 0, 0.55, 0)
nameBox.Size = UDim2.new(0.7, 0, 0.1, 0)
nameBox.Font = Enum.Font.SourceSans
nameBox.Text = ""
nameBox.PlaceholderText = "File name here"
nameBox.TextColor3 = Color3.new(0,0,0)
nameBox.TextSize = 14.000

local copyButton = Instance.new("TextButton")
copyButton.Name = "copyButton"
copyButton.Parent = Background
copyButton.AnchorPoint = Vector2.new(0.5, 0.5)
copyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
copyButton.BackgroundTransparency = 0.500
copyButton.Position = UDim2.new(0.5, 0, 0.7, 0)
copyButton.Size = UDim2.new(0.5, 0, 0.1, 0)
copyButton.Font = Enum.Font.SourceSans
copyButton.Text = "Copy"
copyButton.TextColor3 = Color3.fromRGB(0, 0, 0)
copyButton.TextSize = 14.000
copyButton.MouseButton1Click:Connect(function()
    local fileName = nameBox.Text
    if fileName == "" then
        local dt = "%m-%d-%y %H-%M-%S"
        fileName = os.date(dt, os.time())
    end
    if not isfolder("Saved Builds") then
        makefolder("Saved Builds")
    end
    writefile("Saved Builds/"..fileName..".txt", "")
    readfile("Saved Builds/"..fileName..".txt")
    local A = game.Workspace.bluePart
    local B = game.Workspace.redPart
    local allBlocksBetween = getBlocksBetween(A,B)

    for i,v in pairs(allBlocksBetween) do
        if v ~= A and v ~= B then
            appendfile("Saved Builds/"..fileName..".txt", v.Name..", "..tostring(v.Position)..", "..tostring(v.CFrame.LookVector).."\n")
        end
    end
    notification("Success!", "file named "..fileName.." was created", 5)
end)

local function toVector3(String, Separator)
    local Separator = Separator or ','

    local axes = {}

    for axis in String:gmatch('[^'..Separator..']+') do
        axes[#axes + 1] = axis
    end

    return Vector3.new(axes[1], axes[2], axes[3])
end

local function generatePreview(item, position, lookVector)
    if game.Workspace:FindFirstChild("Preview") == nil then
        local newFolder = Instance.new("Folder")
        newFolder.Name = "Preview"
        newFolder.Parent = Workspace
    end
    for i,v in pairs(game.ReplicatedStorage.Blocks:GetChildren()) do
        if v.Name == item then
            local itemClone = v:Clone()
            itemClone.Name = "item preview"
            itemClone.PrimaryPart.CFrame = CFrame.new(position * lookVector) -- this part is messed up.  I'm making the CFrame wrong or something
            print(CFrame.new(position, lookVector))
            itemClone.Parent = game.Workspace.Preview
        end
    end
end

local pasteButton = Instance.new("TextButton")
pasteButton.Name = "pasteButton"
pasteButton.Parent = Background
pasteButton.AnchorPoint = Vector2.new(0.5, 0.5)
pasteButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
pasteButton.BackgroundTransparency = 0.500
pasteButton.Position = UDim2.new(0.5, 0, 0.85, 0)
pasteButton.Size = UDim2.new(0.5, 0, 0.1, 0)
pasteButton.Font = Enum.Font.SourceSans
pasteButton.Text = "Paste"
pasteButton.TextColor3 = Color3.fromRGB(0, 0, 0)
pasteButton.TextSize = 14.000
pasteButton.MouseButton1Click:Connect(function()
    local fileName = nameBox.Text
    if not isfile("Saved Builds/"..fileName..".txt") then
        notification("Error", "file name "..fileName.." doesnt exsist", 5)
        return
    end
    
    local B = game.Workspace.redPart
    if not B then
        notification("Error", "Place down Red Corner first!", 5)
        return
    end
    
    local info = readfile("Saved Builds/"..fileName..".txt")
    local comma = 0
    local beginning = 1
    
    for i = 1,#info do
        if string.sub(info, i, i) == "," then
            comma = comma + 1
            if comma == 1 then
                start = i
            elseif comma == 4 then
                number1 = i
            elseif comma == 6 then
                local blockName = string.sub(info, beginning, start-1)
                local Position = string.sub(info, start+1, number1-1)
                local lookVector = string.sub(info, i-6, i+3)
                
                local positionVector3 = toVector3(Position, ", ")
                local lookVector3 = toVector3(lookVector, ", ")
                
                local positionFromRed = positionVector3 - B.Position
                
                local newPosition = B.Position + positionFromRed
                
                print(newPosition)
                
                generatePreview(blockName, newPosition, lookVector3)
                
                comma = 0
                beginning = i+5
            end
        end
    end
end)
