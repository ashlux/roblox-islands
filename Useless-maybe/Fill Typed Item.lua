local HttpService = game:GetService("HttpService")
local Island = game.Workspace.Islands:GetChildren()[1]
local Player = game.Players.LocalPlayer
local HR = Player.Character.HumanoidRootPart
local GetM = Player:GetMouse()

openVending = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("hLdugvjigjlIxyrksmu/rmhmkwRgpgvdyo")
closeVending = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("hLdugvjigjlIxyrksmu/cNimmRedkeerbeclaqhja")
emptyItem = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("hLdugvjigjlIxyrksmu/zoKvfiycUxmTlTtthjuEbfvttyccsbg")
refillItem = emptyItem
refillCoins = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("hLdugvjigjlIxyrksmu/nUeebiktrkWqpnplGuyOLvDUuxtboBcNbe")
takeCoins = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("hLdugvjigjlIxyrksmu/ccqeDCwzucMqdNa")

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

thingToStock = Instance.new("TextBox")
thingToStock.Position = UDim2.new(0,1,0,21)
thingToStock.Size = UDim2.new(0,100,0,20)
thingToStock.BackgroundColor3 = Color3.fromRGB(50,100,50)
thingToStock.BorderColor3 = Color3.new(1,1,1)
thingToStock.ZIndex = 2
thingToStock.Parent = Background
thingToStock.Text = ""
thingToStock.PlaceholderText = "Enter Amount"
thingToStock.TextColor3 = Color3.new(1,1,1)
thingToStock.TextScaled = true

function getVendings()
    vendings = {}
    otherBlocks = {}
    for i,v in pairs(Island.Blocks:GetChildren()) do
        if (v.Name == "vendingMachine" or v.Name == "vendingMachine1") and (HR.Position - v.Position).Magnitude < 200 then
            table.insert(vendings, v)
        else
            table.insert(otherBlocks, v)
        end
    end
    return vendings, otherBlocks
end
 
function displayToName(DisplayName)
    for i,v in pairs(game.ReplicatedStorage.Tools:GetChildren()) do
        if v:FindFirstChild("DisplayName") then
            if v.DisplayName.Value == DisplayName then
                return v.Name
            end
        end
    end
end
 
function refillMachines()   
vendings, otherBlocks = getVendings()
for _,v in pairs(vendings) do
    contents = v.SellingContents:GetChildren()[1]
    if v.Mode.Value == 0 and Player:DistanceFromCharacter(v.Position) < 24 and (contents == nil or contents.Amount.Value > 1000) then
        local args = {
        [1] = HttpService:GenerateGUID(false),
        [2] = {
        [1] = {
        ["vendingMachine"] = v
        }
        }
        }
        openVending:FireServer(unpack(args))
        -------
        item = displayToName(thingToStock.Text)
        print(item)
        local args = {
        [1] = HttpService:GenerateGUID(false),
        [2] = {
        [1] = {
        ["player_tracking_category"] = "join_from_web",
        ["amount"] = 1000,
        ["vendingMachine"] = v,
        ["tool"] = Player.Backpack[displayToName(thingToStock.Text)],
        ["action"] = "deposit"
        }
        }
        }
        refillItem:FireServer(unpack(args))
        -------
        local args = {
        [1] = {
        ["vendingMachine"] = v
        }
        }
        closeVending:FireServer(unpack(args))
    end
end
end


Cauldrons = Instance.new("TextButton")
Cauldrons.Position = UDim2.new(0,1,0,42)
Cauldrons.Size = UDim2.new(0,100,0,20)
Cauldrons.BackgroundColor3 = Color3.fromRGB(50,100,50)
Cauldrons.BorderColor3 = Color3.new(1,1,1)
Cauldrons.ZIndex = 2
Cauldrons.Parent = Background
Cauldrons.Text = "Refill Nearby"
Cauldrons.TextColor3 = Color3.new(1,1,1)
Cauldrons.TextScaled = true
Cauldrons.MouseButton1Click:Connect(function()
    refillMachines()
end)