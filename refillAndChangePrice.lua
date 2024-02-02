--fill and change price

local HttpService = game:GetService("HttpService")
local Island = game.Workspace.Islands:GetChildren()[1]
local Player = game.Players.LocalPlayer
local HR = Player.Character.HumanoidRootPart
local GetM = Player:GetMouse()

local oldGui = game.CoreGui:FindFirstChild("Filler")
if oldGui then
    oldGui:Destroy()
end


function loadModule(url)
	return loadstring(game:HttpGet(url))()
end

--load remote events--
loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/remoteEvents.lua")

CmdGui = Instance.new("ScreenGui")
CmdGui.Name = "Filler"
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

cost = Instance.new("TextBox")
cost.Position = UDim2.new(0,1,0,21)
cost.Size = UDim2.new(0,100,0,20)
cost.BackgroundColor3 = Color3.fromRGB(50,100,50)
cost.BorderColor3 = Color3.new(1,1,1)
cost.ZIndex = 2
cost.Parent = Background
cost.Text = ""
cost.PlaceholderText = "Price"
cost.TextColor3 = Color3.new(1,1,1)
cost.TextScaled = true

modeNumber = Instance.new("TextBox")
modeNumber.Position = UDim2.new(0,1,0,42)
modeNumber.Size = UDim2.new(0,100,0,20)
modeNumber.BackgroundColor3 = Color3.fromRGB(50,100,50)
modeNumber.BorderColor3 = Color3.new(1,1,1)
modeNumber.ZIndex = 2
modeNumber.Parent = Background
modeNumber.Text = ""
modeNumber.PlaceholderText = "Mode"
modeNumber.TextColor3 = Color3.new(1,1,1)
modeNumber.TextScaled = true

CmdName = Instance.new("TextButton")
CmdName.Name = "CmdName"
CmdName.AutoButtonColor = false
CmdName.Parent = Background
CmdName.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CmdName.BorderSizePixel = 0
CmdName.Size = UDim2.new(0, 87, 0, 15)
CmdName.Font = Enum.Font.GothamBlack
CmdName.Text = "Filler"
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

local function getVendings()
    vendings = {}
    for i,v in pairs(Island.Blocks:GetChildren()) do
        if (v.Name == "vendingMachine" or v.Name == "vendingMachine1") and (HR.Position - v.Position).Magnitude < 200 then
            table.insert(vendings, v)
        end
    end
    return vendings
end
 
local function getHeldItem()
    for _,v in pairs(Player.Character:GetChildren()) do
        if v:IsA("Tool") then
            return v
        end
    end
end

local function getVendingMode()

	local vendingMode
	
	if string.lower(modeNumber.Text) == "sell" then
		vendingMode = 0
	elseif string.lower(modeNumber.Text) == "buy" then
		vendingMode = 1
	else
		vendingMode = 2
	end
	
	return vendingMode
end

local function openVending(vending)
	local args = {
		[1] = HttpService:GenerateGUID(false),
		[2] = {
			[1] = {
				["vendingMachine"] = vending
			}
		}
    }
    openVending:FireServer(unpack(args))
end

local function changeSettings(vending, vendingMode)
	local args = {
    [1] = HttpService:GenerateGUID(false),
    [2] = {
    [1] = {
    ["player_tracking_category"] = "join_from_web",
    ["vendingMachine"] = vending,
    ["transactionPrice"] = cost.Text, 
    ["mode"] = vendingMode
    }
    }
    }
    changeSettings:FireServer(unpack(args))
end

local function refillVending(vending)
	local contents = vending.SellingContents:GetChildren()[1]
	local item = getHeldItem()
        
    if item and (contents == nil or contents.Amount.Value < 1000) then
        local args = {
        [1] = HttpService:GenerateGUID(false),
        [2] = {
        [1] = {
        ["player_tracking_category"] = "join_from_web",
        ["amount"] = item.Amount.Value,
        ["vendingMachine"] = vending,
        ["tool"] = item,
        ["action"] = "deposit"
        }
        }
        }
        refillItem:FireServer(unpack(args))
        task.wait(0.5)
	end
end

local function closeVending(vending)
	local args = {
    [1] = {
    ["vendingMachine"] = vending
    }
    }
    closeVending:FireServer(unpack(args))
end
 
local function refillMachines()

	local vendingMode = getVendingMode()

	if cost.Text == "" or not cost.Text:IsA("NumberValue") then
		cost.Text = 1000000000
	end

	local vendings = getVendings()
	
	for _,v in pairs(vendings) do
	
		if Player:DistanceFromCharacter(v.Position) > 8 then continue end
        
		openVending(v)

		changeSettings(v, vendingMode)

		task.wait(0.5)
		
		refillVending(v)
		
		closeVending(v)

	end
end

refill = Instance.new("TextButton")
refill.Position = UDim2.new(0,1,0,63)
refill.Size = UDim2.new(0,100,0,20)
refill.BackgroundColor3 = Color3.fromRGB(50,100,50)
refill.BorderColor3 = Color3.new(1,1,1)
refill.ZIndex = 2
refill.Parent = Background
refill.Text = "Refill Nearby"
refill.TextColor3 = Color3.new(1,1,1)
refill.TextScaled = true
refill.MouseButton1Click:Connect(function()
    refillMachines()
end)
