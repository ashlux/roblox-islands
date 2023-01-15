local function Instn(cls,prop)local obj = Instance.new(cls)for i,v in pairs(prop)do obj[i] = v end return obj end
local Plr = game.Players.LocalPlayer
local GetM = Plr:GetMouse()
local ScreenGui = Instn("ScreenGui",{Name = 'JoinByID', Parent = game:GetService("CoreGui"), ResetOnSpawn = false})
local Title = Instn("Frame",{AnchorPoint = Vector2.new(.5,.5), BackgroundColor3 = Color3.new(0,0,0), BorderColor3 = Color3.new(0,0,1), Name = 'Title',Parent = ScreenGui, Position = UDim2.new(.5,0,.5,0), Size = UDim2.new(0,180,0,95)})
local Drag = Instn("TextButton",{AutoButtonColor = false, BackgroundColor3 = Color3.new(0,0,0), BorderColor3 = Color3.new(0,0,1), Name = 'Drag',Parent = Title, Size = UDim2.new(0,163,0,15), Text = "Join/invite by username", TextColor = BrickColor.new(1), TextScaled = true})
local Exit = Instn("TextButton",{BackgroundColor3 = Color3.new(1,0,0), BorderColor3 = Color3.new(1,1,1), Name = 'Exit',Parent = Title, Position = UDim2.new(0,165,0,0), Size = UDim2.new(0,15,0,15), Text = "x", TextColor = BrickColor.new(26), TextScaled = true})
local Main = Instn("TextBox",{BackgroundColor3 = Color3.new(0,0,0), BorderColor3 = Color3.new(1,1,1), Name = 'Tbox',Parent = Title, Position = UDim2.new(0,5,0,20), Size = UDim2.new(0,165,0,30), Text = "", PlaceholderText = "Enter Username Here", TextColor = BrickColor.new(1), TextScaled = true, ClearTextOnFocus = false})
local Button = Instn("TextButton",{BackgroundColor3 = Color3.new(0,1,1), BorderColor3 = Color3.new(1,1,1), Name = 'Invite',Parent = Title, Position = UDim2.new(0,100,0,55), Size = UDim2.new(0,60,0,15), Text = "INVITE", TextColor = BrickColor.new(26), TextScaled = true})
local Button1 = Instn("TextButton",{BackgroundColor3 = Color3.new(0,1,1), BorderColor3 = Color3.new(1,1,1), Name = 'Join',Parent = Title, Position = UDim2.new(0,10,0,55), Size = UDim2.new(0,70,0,15), Text = "JOIN", TextColor = BrickColor.new(26), TextScaled = true})
local Button2 = Instn("TextButton",{BackgroundColor3 = Color3.new(0,1,1), BorderColor3 = Color3.new(1,1,1), Name = 'Repeat Join',Parent = Title, Position = UDim2.new(0,10,0,76), Size = UDim2.new(0,70,0,15), Text = "repeat JOIN", TextColor = BrickColor.new(26), TextScaled = true})
local Button3 = Instn("TextButton",{BackgroundColor3 = Color3.new(0,1,1), BorderColor3 = Color3.new(1,1,1), Name = 'Saved >',Parent = Title, Position = UDim2.new(0,100,0,76), Size = UDim2.new(0,60,0,15), Text = "Saved >", TextColor = BrickColor.new(26), TextScaled = true})
local Togl = false
local dontAdd = false

Drag.MouseButton1Down:Connect(function()Dragg = true while Dragg do game.TweenService:Create(Title, TweenInfo.new(.1), {Position = UDim2.new(0,GetM.X+10,0,GetM.Y+45)}):Play()wait()end end)
Drag.MouseButton1Up:Connect(function()Dragg = false end)
Exit.MouseButton1Click:Connect(function()ScreenGui:Destroy()Togl = false end)

local Background2 = Instance.new("Frame")
Background2.Name = "Background2"
Background2.Parent = Title
Background2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background2.BorderSizePixel = 0
Background2.BorderColor3 = Color3.new(1,0,1)
Background2.Position = UDim2.new(1, 0, 0, 0)
Background2.Size = UDim2.new(0, 120, 0, 275)
Background2.Active = true
Background2.Visible = false

local CmdHandler = Instance.new("ScrollingFrame")
CmdHandler.Name = "CmdHandler"
CmdHandler.Parent = Background2
CmdHandler.Active = true
CmdHandler.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler.BackgroundTransparency = 1.000
CmdHandler.BorderSizePixel = 0
CmdHandler.AutomaticCanvasSize = "Y"
CmdHandler.Position = UDim2.new(0, 0, 0, 0)
CmdHandler.Size = UDim2.new(0, 120, 0, 275)
CmdHandler.ScrollBarThickness = 4

local Grid = Instance.new("UIGridLayout")
Grid.CellSize = UDim2.new(0.95,0,0,20)
Grid.CellPadding = UDim2.new(0,1,0,5)
Grid.SortOrder = "LayoutOrder"
Grid.Parent = CmdHandler

local function csvToTable(list) -- Comma-Separated-Values to Table
	local out = {}
	for entry in string.gmatch(list, "[^,]+") do -- [^,] means: anything that is not a comma (the ^ is the not). + means: as many of it in a row as you can get
		table.insert(out, entry)
	end
	return out
end

local function tableToCsv(list) -- turn the table into one string, with a comma between each value
	return table.concat(list, ",")
end

local saveButton = Instn("TextButton",{BackgroundColor3 = Color3.new(0,1,1), BorderColor3 = Color3.new(1,1,1), Name = 'Save Typed',Parent = CmdHandler, Position = UDim2.new(0,2,0,0), Size = UDim2.new(0,110,0,15), Text = "Save Typed", TextColor = BrickColor.new(26), TextScaled = true})
saveButton.MouseButton1Click:Connect(function()
    local check = isfile("Saved Names.txt")
    if not check then writefile("Saved Names.txt", "") end
    
    if Main.Text and Main.Text ~= "" then
        
        local contents = readfile("Saved Names.txt")
        local tableList = csvToTable(contents)
        for i,v in pairs(tableList) do
            if string.lower(Main.Text) == string.lower(v) then
                print(string.lower(Main.Text), string.lower(v))
                dontAdd = true
            end
        end
        
        if dontAdd == false then
            table.insert(tableList, Main.Text)
            writefile("Saved Names.txt", tableToCsv(tableList))
            
            local newPlayerButton = Instn("TextButton",{BackgroundColor3 = Color3.new(0,1,1), BorderColor3 = Color3.new(1,1,1), Name = Main.Text,Parent = CmdHandler, Position = UDim2.new(0,2,0,0), Size = UDim2.new(0,110,0,15), Text = Main.Text, TextColor = BrickColor.new(26), TextScaled = true})
            
            newPlayerButton.MouseButton1Click:Connect(function()
                Main.Text = newPlayerButton.Text
            end)
            
        else
            saveButton.Text = "Already Added"
            task.wait(2)
            saveButton.Text = "Save Typed"
        end
        
    end
    dontAdd = false
end)

local deleteButton = Instn("TextButton",{BackgroundColor3 = Color3.new(1,0,0), BorderColor3 = Color3.new(1,1,1), Name = 'Delete Typed',Parent = CmdHandler, Position = UDim2.new(0,2,0,0), Size = UDim2.new(0,110,0,15), Text = "Delete Typed", TextColor = BrickColor.new(50), TextScaled = true})
deleteButton.MouseButton1Click:Connect(function()
    local check = isfile("Saved Names.txt")
    if not check then writefile("Saved Names.txt", "") end
    
    if Main.Text and Main.Text ~= "" then
        
        local contents = readfile("Saved Names.txt")
        local tableList = csvToTable(contents)
        for i,v in pairs(tableList) do
            if string.lower(Main.Text) == string.lower(v) then
                delete = true
                number = i
                
                for i2,v2 in pairs(CmdHandler:GetChildren()) do
                    if v == v2.Name then
                        v2:Destroy()
                    end
                end
            end
        end
        
        if delete then
            table.remove(tableList, number)
            writefile("Saved Names.txt", tableToCsv(tableList))
        else
            deleteButton.Text = "Name doesnt exsist"
            task.wait(2)
            deleteButton.Text = "Delete Typed"
        end
        
    end
    dontAdd = false
end)

local function createPlayerList()
local contents = readfile("Saved Names.txt")
local tableList = csvToTable(contents)
for i,v in pairs(tableList) do
    local playerButton = Instn("TextButton",{BackgroundColor3 = Color3.new(0,1,1), BorderColor3 = Color3.new(1,1,1), Name = v,Parent = CmdHandler, Position = UDim2.new(0,2,0,0), Size = UDim2.new(0,110,0,15), Text = v, TextColor = BrickColor.new(26), TextScaled = true})
    
    playerButton.MouseButton1Click:Connect(function()
        Main.Text = playerButton.Text
    end)
            
end
end

createPlayerList()

Button.MouseButton1Click:Connect(function()
    local Players = game:GetService("Players")
    local NAME = Main.Text
    
    local cache = {}
    function getUserIdFromUsername(name)
        if cache[name] then return cache[name] end
        local id
        pcall(function()
            id = Players:getUserIdFromNameAsync(name)
        end)
        cache[name] = id
        return id
    end
   wait()
    
local args = {
    [1] = {
        ["userId"] = (getUserIdFromUsername(NAME)),
        ["name"] = NAME
    }
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_8:InvokeServer(unpack(args))
    wait()
    Button.Text = "invited"
    wait(7)
    Button.Text = "INVITE"
    Button.BackgroundColor3 = Color3.new(0,1,1)
    end)

Button1.MouseButton1Click:Connect(function()
    local Players = game:GetService("Players")
    local NAME = Main.Text
    
    local cache = {}
    function getUserIdFromUsername(name)
        if cache[name] then return cache[name] end
        local id
        pcall(function()
            id = Players:getUserIdFromNameAsync(name)
        end)
        cache[name] = id
        return id
    end
   wait()
    Button1.Text = "joining"
local args = {
    [1] = {
        ["targetPlayerId"] = (getUserIdFromUsername(NAME))
    }
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_2:InvokeServer(unpack(args))
    wait()
    Button1.Text = "joining"
    wait(1.5)
    Button1.Text = "Error"
    Button1.BackgroundColor3 = Color3.new(1,0,0)
    wait(2)
    Button1.Text = "JOIN"
    Button1.BackgroundColor3 = Color3.new(0,1,1)
end)

Button2.MouseButton1Click:Connect(function()
local Timed = 0
    while wait(1) do
    local Players = game:GetService("Players")
    local NAME = Main.Text
    
    local cache = {}
    function getUserIdFromUsername(name)
        if cache[name] then return cache[name] end
        local id
        pcall(function()
            id = Players:getUserIdFromNameAsync(name)
        end)
        cache[name] = id
        return id
    end
   wait()
   Timed = Timed + 1
    Button2.Text = "joining"..Timed
local args = {
    [1] = {
        ["targetPlayerId"] = (getUserIdFromUsername(NAME))
    }
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_2:InvokeServer(unpack(args))
end
end)

Button3.MouseButton1Click:Connect(function()
    if Background2.Visible == false then
        Background2.Visible = true
        Button3.Text = "Saved <"
        
    else
        Background2.Visible = false
        Button3.Text = "Saved >"
    end
end)
