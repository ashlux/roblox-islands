if not game:IsLoaded() then
game.Loaded:Wait()
end

local Players = game:GetService("Players")

repeat wait()
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse

function loadModule(url)
	return loadstring(game:HttpGet(url))()
end

local HttpService = game:GetService("HttpService")
local Island = game.Workspace.Islands:GetChildren()[1]
local Player = Players.LocalPlayer
local HR = Player.Character.HumanoidRootPart
local GetM = Player:GetMouse()

--load remote events--
loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/remoteEvents.lua")

function getVendings()
    vendings = {}
    for i,v in pairs(Island.Blocks:GetChildren()) do
        if (HR.Position - v.Position).Magnitude < 45 and (v.Name == "vendingMachine" or v.Name == "vendingMachine1") then
            table.insert(vendings, v)
        end
    end
    return vendings
end
 
function refillMachines()   
vendings, otherBlocks = getVendings()
for _,v in pairs(vendings) do
    contents = v.SellingContents:GetChildren()[1]
    if v.Mode.Value == 0 and (contents == nil or contents.Amount.Value > 1000) then
        local rayOrigin = v.Position
        local rayDirection = Vector3.new(0, -100, 0)
        local raycastParams = RaycastParams.new()
        raycastParams.FilterDescendantsInstances = {v}
        raycastParams.FilterType = Enum.RaycastFilterType.Exclude
        raycastParams.IgnoreWater = true

        local raycastResult = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
        
        print(raycastResult.Instance.Name)
        if raycastResult then
            blockToFill = raycastResult.Instance.Name
        end
        
        print(blockToFill)
        
        if blockToFill ~= nil then
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
            if Player.Backpack:FindFirstChild(blockToFill) then
                
                if contents == nil then
                    if Player.Backpack[blockToFill].Amount.Value >= 1000 then
                        number = 1000
                    else
                        number = Player.Backpack[blockToFill].Amount.Value
                    end
                elseif Player.Backpack[blockToFill].Amount.Value < (1000 - contents.Amount.Value) then
                    number = Player.Backpack[blockToFill].Amount.Value
                else
                    number = 1000 - contents.Amount.Value
                end
                print(blockToFill, number)
                
                
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["amount"] = number,
                ["vendingMachine"] = v,
                ["tool"] = Player.Backpack[blockToFill],
                ["action"] = "deposit"
                }
                }
                }
                refillItem:FireServer(unpack(args))
            end
        end
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
Background.Position = UDim2.new(0.12, 0, 0.5, 0)
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

refillButton = Instance.new("TextButton")
refillButton.Position = UDim2.new(0,1,0,21)
refillButton.Size = UDim2.new(0,100,0,20)
refillButton.BackgroundColor3 = Color3.fromRGB(50,100,50)
refillButton.BorderColor3 = Color3.new(1,1,1)
refillButton.ZIndex = 2
refillButton.Parent = Background
refillButton.Text = "Refill Colored Blocks"
refillButton.TextColor3 = Color3.new(1,1,1)
refillButton.TextScaled = true
refillButton.MouseButton1Click:Connect(function()
    refillMachines()
end)





local function refillCoins()
for i,v in pairs(Island.Blocks:GetChildren()) do
    if (v.Name == "vendingMachine" or v.Name == "vendingMachine1") and v.Mode.Value == 1 and v.TransactionPrice.Value <= tonumber(fillAmount.Text) then
        if v.CoinBalance.Value < ((v.TransactionPrice.Value * 1.07) * 1000) then
        local args = {
        [1] = HttpService:GenerateGUID(false),
        [2] = {
        [1] = {
        ["vendingMachine"] = v
        }
        }
        }
        openVending:FireServer(unpack(args))
        local args = {
        [1] = HttpService:GenerateGUID(false),
        [2] = {
        [1] = {
        ["vendingMachine"] = v,
        ["player_tracking_category"] = "join_from_web",
        ["amount"] = v.CoinBalance.Value
        }
        }
        }
        takeCoins:FireServer(unpack(args))
        print((v.TransactionPrice.Value * 1.07) * 1000)
        local args = {
        [1] = HttpService:GenerateGUID(false),
        [2] = {
        [1] = {
        ["vendingMachine"] = v,
        ["player_tracking_category"] = "join_from_web",
        ["amount"] = 5000000000
        }
        }
        }
        refillCoins:FireServer(unpack(args))
        
        local args = {
        [1] = {
        ["vendingMachine"] = v
        }
        }
        closeVending:FireServer(unpack(args))
        print("Finished")
        end
    end
end
end)


refillCoinsButton = Instance.new("TextButton")
refillCoinsButton.Position = UDim2.new(0,1,0,42)
refillCoinsButton.Size = UDim2.new(0,100,0,20)
refillCoinsButton.BackgroundColor3 = Color3.fromRGB(50,100,50)
refillCoinsButton.BorderColor3 = Color3.new(1,1,1)
refillCoinsButton.ZIndex = 2
refillCoinsButton.Parent = Background
refillCoinsButton.Text = "insert 5b coins"
refillCoinsButton.TextColor3 = Color3.new(1,1,1)
refillCoinsButton.TextScaled = true
refillCoinsButton.MouseButton1Click:Connect(function()
    refillCoins()
end)
