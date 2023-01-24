local itemsToTrade = {}

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local sendTradeEvent = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged:FindFirstChild("xDYmwujtl/ltkemoZnranznaMrEBvhjSqoPmoo")
local HttpService = game:GetService("HttpService")
local mouse = game.Players.LocalPlayer:GetMouse()

local function displayToName(DisplayName)
    if string.lower(DisplayName) == "cauldron1" then
        return "cauldron"
    elseif string.lower(DisplayName) == "cauldron2" then
        return "cauldron2"
    end
    for i,v in pairs(game.ReplicatedStorage.Tools:GetChildren()) do
        if v:FindFirstChild("DisplayName") then
            if v.DisplayName.Value == DisplayName then
                return v.Name
            end
        end
    end
end

function getHeldItem()
    for _,v in pairs(Player.Character:GetChildren()) do
        if v:IsA("Tool") then
            return v
        end
    end
    return "FAIL"
end

local function addItem(quantity, toolName)
    local args = {
    [1] = HttpService:GenerateGUID(false),
    [2] = {
        [1] = {
            ["quantity"] = quantity,
            ["toolName"] = toolName
        }
    }
}
sendTradeEvent:FireServer(unpack(args))
end

local function addItemToTable(quantity, toolName)
    itemsToTrade[toolName] = quantity
end

local function addItemsFromTable()
    for i,v in pairs(itemsToTrade) do
        addItem(v, displayToName(i))
    end
end

local function csvToTable(fileContents)
    local start = 1
    local itemsName = ""
    local itemAmount = 0
    itemsToTrade = {}
    for i = 1,#fileContents do
        if string.sub(fileContents, i, i) == "\n" then
            
            for i2 = start, i do
                if string.sub(fileContents, i2, i2) == "," then
                    local name = string.sub(fileContents, i2+1, i-1)
                    local number = string.sub(fileContents, start, i2-1)
                    itemsToTrade[name] = number
                end
            end
        start = i+1
        end
    end
end

local function destroyOldGUI()
    if game.CoreGui:FindFirstChild("Insta Trade") then
        game.CoreGui["Insta Trade"]:Destroy()
    end
end

local function createGUI()
    local CmdGui = Instance.new("ScreenGui")
    CmdGui.Name = "Insta Trade"
    CmdGui.Parent = game:GetService("CoreGui")
    
    local Background = Instance.new("Frame")
    Background.Name = "Background"
    Background.Parent = CmdGui
    Background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Background.BorderSizePixel = 0
    Background.BorderColor3 = Color3.new(1,0,1)
    Background.Position = UDim2.new(0.5, 0, 0.5, 0)
    Background.Size = UDim2.new(0, 120, 0, 170)
    Background.Active = true
    
    local infoBackground = Instance.new("Frame")
    infoBackground.Name = "infoBackground"
    infoBackground.Parent = Background
    infoBackground.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    infoBackground.BorderSizePixel = 0
    infoBackground.BorderColor3 = Color3.new(1,0,1)
    infoBackground.AnchorPoint = Vector2.new(1,0)
    infoBackground.Position = UDim2.new(0, 0, 0, 0)
    infoBackground.Size = UDim2.new(0, 170, 0, 200)
    infoBackground.Active = true
    
    local CmdHandler2 = Instance.new("ScrollingFrame")
    CmdHandler2.Name = "CmdHandler2"
    CmdHandler2.Parent = infoBackground
    CmdHandler2.Active = true
    CmdHandler2.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    CmdHandler2.BackgroundTransparency = 1.000
    CmdHandler2.BorderSizePixel = 0
    CmdHandler2.AutomaticCanvasSize = "Y"
    CmdHandler2.Position = UDim2.new(0, 5, 0, 0)
    CmdHandler2.Size = UDim2.new(1, 0, 1, 0)
    CmdHandler2.ScrollBarThickness = 4
    
    local Grid = Instance.new("UIGridLayout")
    Grid.Name = "Grid"
    Grid.CellSize = UDim2.new(1,0,0,20)
    Grid.CellPadding = UDim2.new(0,1,0,5)
    Grid.SortOrder = "LayoutOrder"
    Grid.Parent = CmdHandler2
    
    local function modifyCmdHandler2(command, number, item)
        if command == "add" then
            local TextLabel = Instance.new("TextButton")
            TextLabel.Name = item
            TextLabel.Parent = CmdHandler2
            TextLabel.BackgroundColor3 = Color3.fromRGB(0, 50, 250)
            TextLabel.BorderSizePixel = 0
            TextLabel.Font = Enum.Font.GothamBlack
            TextLabel.Text = item.." - "..number
            TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextLabel.TextScaled = true
            TextLabel.TextSize = 14.000
            TextLabel.TextWrapped = true
            TextLabel.MouseButton1Click:Connect(function()
                itemsToTrade[item] = nil
                TextLabel:Destroy()
            end)
        else
            for i,v in pairs(CmdHandler2:GetChildren()) do
                if v.Name ~= "Grid" then
                    v:Destroy()
                end
            end
        end
    end

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
        CmdGui:Destroy()
    end)
    
    local CmdName = Instance.new("TextButton")
    CmdName.Name = "CmdName"
    CmdName.AutoButtonColor = false
    CmdName.Parent = Background
    CmdName.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    CmdName.BorderSizePixel = 0
    CmdName.Size = UDim2.new(0, 87, 0, 15)
    CmdName.Font = Enum.Font.GothamBlack
    CmdName.Text = "Trade Maker"
    CmdName.TextColor3 = Color3.fromRGB(255, 255, 255)
    CmdName.TextScaled = true
    CmdName.TextSize = 14.000
    CmdName.TextWrapped = true
    local Dragg = false

    CmdName.MouseButton1Down:Connect(function()Dragg = true while Dragg do game.TweenService:Create(Background, TweenInfo.new(.06), {Position = UDim2.new(0,mouse.X-(Background.Size.Y.Offset / 6.875),0,mouse.Y-5)}):Play()wait()end end)
    CmdName.MouseButton1Up:Connect(function()Dragg = false end)
    
    local numberValue = Instance.new("TextBox")
    numberValue.Position = UDim2.new(0,10,0,20)
    numberValue.Size = UDim2.new(0,100,0,20)
    numberValue.BackgroundColor3 = Color3.fromRGB(0,0,250)
    numberValue.BorderSizePixel = 1
    numberValue.BorderColor3 = Color3.new(1,1,1)
    numberValue.ZIndex = 2
    numberValue.LayoutOrder = 2
    numberValue.Parent = Background
    numberValue.PlaceholderText = "number"
    numberValue.Text = ""
    numberValue.TextColor3 = Color3.fromRGB(250,250,250)
    numberValue.TextScaled = true
    
    local addItemButton = Instance.new("TextButton")
    addItemButton.Position = UDim2.new(0,10,0,45)
    addItemButton.Size = UDim2.new(0,100,0,20)
    addItemButton.BackgroundColor3 = Color3.fromRGB(0,0,250)
    addItemButton.BorderSizePixel = 1
    addItemButton.BorderColor3 = Color3.new(1,1,1)
    addItemButton.ZIndex = 2
    addItemButton.LayoutOrder = 2
    addItemButton.Parent = Background
    addItemButton.Text = "Add Held"
    addItemButton.TextColor3 = Color3.fromRGB(250,250,250)
    addItemButton.TextScaled = true
    addItemButton.MouseButton1Click:Connect(function()
        local item = getHeldItem()
        if item == "FAIL" then
            addItemButton.Text = "NOTHING FOUND"
            task.wait(0.5)
            addItemButton.Text = "Add Held"
            return
        end
        
        addItemToTable(numberValue.Text,item)
        modifyCmdHandler2("add", numberValue.Text, item.Name)
        addItemButton.Text = "Item Added"
        addItemButton.BackgroundColor3 = Color3.fromRGB(200,200,250)
        task.wait(1)
        addItemButton.BackgroundColor3 = Color3.fromRGB(0,0,250)
        addItemButton.Text = "Add Held"
    end)
    
    local loadTrade = Instance.new("TextButton") -- put here so savetrade could find it
    
    local saveTrade = Instance.new("TextButton")
    saveTrade.Position = UDim2.new(0,10,0,70)
    saveTrade.Size = UDim2.new(0,100,0,20)
    saveTrade.BackgroundColor3 = Color3.fromRGB(0,0,250)
    saveTrade.BorderSizePixel = 1
    saveTrade.BorderColor3 = Color3.new(1,1,1)
    saveTrade.ZIndex = 2
    saveTrade.LayoutOrder = 2
    saveTrade.Parent = Background
    saveTrade.Text = "Save Trade >"
    saveTrade.TextColor3 = Color3.fromRGB(250,250,250)
    saveTrade.TextScaled = true
    saveTrade.MouseButton1Click:Connect(function()
        if loadTrade:FindFirstChild("Frame") then
            for i,v in pairs(loadTrade:GetChildren()) do
                v:Destroy()
            end
            loadTrade.Text = "Load Trade >"
        end
        
        if saveTrade:FindFirstChild("TextBox") then
            for i,v in pairs(saveTrade:GetChildren()) do
                v:Destroy()
            end
            saveTrade.Text = "Save Trade >"
            return
        end
        saveTrade.Text = "Save Trade <"
        local fileName = Instance.new("TextBox")
        fileName.Position = UDim2.new(1,0,0,0)
        fileName.Size = UDim2.new(0,100,0,20)
        fileName.BackgroundColor3 = Color3.fromRGB(0,0,250)
        fileName.BorderSizePixel = 1
        fileName.BorderColor3 = Color3.new(1,1,1)
        fileName.ZIndex = 2
        fileName.LayoutOrder = 2
        fileName.Parent = saveTrade
        fileName.PlaceholderText = "Name Here"
        fileName.Text = ""
        fileName.TextColor3 = Color3.fromRGB(250,250,250)
        fileName.TextScaled = true
        
        local saveButton = Instance.new("TextButton")
        saveButton.Position = UDim2.new(1,0,1,1)
        saveButton.Size = UDim2.new(0,100,0,20)
        saveButton.BackgroundColor3 = Color3.fromRGB(0,0,250)
        saveButton.BorderSizePixel = 1
        saveButton.BorderColor3 = Color3.new(1,1,1)
        saveButton.ZIndex = 2
        saveButton.LayoutOrder = 2
        saveButton.Parent = saveTrade
        saveButton.Text = "Save"
        saveButton.TextColor3 = Color3.fromRGB(250,250,250)
        saveButton.TextScaled = true
        saveButton.MouseButton1Click:Connect(function()
            if fileName.Text == "" then
                saveButton.Text = "Name File First!"
                task.wait(1)
                saveButton.Text = "Save"
            else
                saveButton.Text = "Saving"
                
                local filename = fileName.Text..".csv"
                local foldername = "Trades"
                
                if not isfolder(foldername) then
                    makefolder(foldername)
                end
                
                writefile(foldername.."/"..filename, "")
                
                for i,v in pairs(itemsToTrade) do
                    appendfile(foldername.."/"..filename, v..","..i.Name.."\n")
                end
                
                task.wait(0.5)
                saveButton.Text = "Saved!"
                task.wait(0.5)
                saveButton.Text = "Save"
            end
        end)
    end)
    
    loadTrade.Position = UDim2.new(0,10,0,95)
    loadTrade.Size = UDim2.new(0,100,0,20)
    loadTrade.BackgroundColor3 = Color3.fromRGB(0,0,250)
    loadTrade.BorderSizePixel = 1
    loadTrade.BorderColor3 = Color3.new(1,1,1)
    loadTrade.ZIndex = 2
    loadTrade.LayoutOrder = 2
    loadTrade.Parent = Background
    loadTrade.Text = "Load Trade >"
    loadTrade.TextColor3 = Color3.fromRGB(250,250,250)
    loadTrade.TextScaled = true
    loadTrade.MouseButton1Click:Connect(function()
        if saveTrade:FindFirstChild("TextBox") then
            for i,v in pairs(saveTrade:GetChildren()) do
                v:Destroy()
            end
            saveTrade.Text = "Save Trade >"
        end
        
        if loadTrade:FindFirstChild("Frame") then
            for i,v in pairs(loadTrade:GetChildren()) do
                v:Destroy()
            end
            loadTrade.Text = "Load Trade >"
            return
        end
        
        loadTrade.Text = "Load Trade <"
        local Background2 = Instance.new("Frame")
        Background2.Parent = loadTrade
        Background2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        Background2.BorderSizePixel = 0
        Background2.BorderColor3 = Color3.new(1,0,1)
        Background2.AnchorPoint = Vector2.new(0,0.5)
        Background2.Position = UDim2.new(1, 10, 0, 0)
        Background2.Size = UDim2.new(0, 120, 0, 170)
        Background2.Active = true
        
        local CmdHandler = Instance.new("ScrollingFrame")
        CmdHandler.Name = "CmdHandler"
        CmdHandler.Parent = Background2
        CmdHandler.Active = true
        CmdHandler.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
        CmdHandler.BackgroundTransparency = 1.000
        CmdHandler.BorderSizePixel = 0
        CmdHandler.AutomaticCanvasSize = "Y"
        CmdHandler.Position = UDim2.new(0, 5, 0, 0)
        CmdHandler.Size = UDim2.new(1, 0, 1, 0)
        CmdHandler.ScrollBarThickness = 4
        
        local Grid = Instance.new("UIGridLayout")
        Grid.CellSize = UDim2.new(0.95,0,0.095,0)
        Grid.CellPadding = UDim2.new(0,1,0,5)
        Grid.SortOrder = "LayoutOrder"
        Grid.Parent = CmdHandler
        
        local foldername = "Trades"
        local list = listfiles(foldername)
        for i,v in pairs(list) do
            local saveName = Instance.new("TextButton")
            saveName.BackgroundColor3 = Color3.fromRGB(0,0,250)
            saveName.BorderSizePixel = 1
            saveName.BorderColor3 = Color3.new(1,1,1)
            saveName.ZIndex = 2
            saveName.LayoutOrder = 2
            saveName.Parent = CmdHandler
            saveName.Text = v
            saveName.TextColor3 = Color3.fromRGB(250,250,250)
            saveName.TextScaled = true
            saveName.MouseButton1Click:Connect(function()
                local backupName = saveName.Text
                saveName.Text = "Loading"
                modifyCmdHandler2("clear")
                local fileContents = readfile(backupName)
                csvToTable(fileContents)
                for i,v in pairs(itemsToTrade) do
                    print(i,v)
                    modifyCmdHandler2("add", v, i)
                end
                saveName.Text = "Loaded!"
                task.wait(0.8)
                saveName.Text = backupName
            end)
        end
    end)
    
    local doTrade = Instance.new("TextButton")
    doTrade.Position = UDim2.new(0,10,0,140)
    doTrade.Size = UDim2.new(0,100,0,20)
    doTrade.BackgroundColor3 = Color3.fromRGB(0,0,250)
    doTrade.BorderSizePixel = 1
    doTrade.BorderColor3 = Color3.new(1,1,1)
    doTrade.ZIndex = 2
    doTrade.LayoutOrder = 2
    doTrade.Parent = Background
    doTrade.Text = "Do the trade"
    doTrade.TextColor3 = Color3.fromRGB(250,250,250)
    doTrade.TextScaled = true
    doTrade.MouseButton1Click:Connect(function()
        for i,v in pairs(itemsToTrade) do
             addItem(v, i)
        end
    end)
end

destroyOldGUI()
task.wait()
createGUI()
