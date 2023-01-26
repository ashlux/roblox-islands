if game.PlaceId ~= 11838346571 then return end

if not game:IsLoaded() then
game.Loaded:Wait()
end

local Players = game:GetService("Players")

repeat wait()
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse

local rabbitBoss = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild("lunarRabbit")

local Player = Players.LocalPlayer
local Character = Player.Character
local HR = Character.HumanoidRootPart
local Mouse = Player:GetMouse()
local killEverything
local HttpService = game:GetService("HttpService")
local hitMobEvent = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged:FindFirstChild("ymMtnfy/zyuMcgagquC")

function getRoot(char) -- find root part of character if they dont have HR
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

function killAura()
    HR = getRoot(Character)
    for i,v in pairs(workspace.WildernessIsland.Entities:GetChildren()) do
    if v:FindFirstChild("HumanoidRootPart") then
        if (HR.Position - v.HumanoidRootPart.Position).magnitude < 30 then
            local args = {
            [1] = HttpService:GenerateGUID(false),
            [2] = {
            [1] = {
            ["hitUnit"] = v
            }
            }
            }
            hitMobEvent:FireServer(unpack(args))
        end
    end
end
end

local function AntiAFK()
    while wait(25) do
        game:GetService('VirtualUser'):CaptureController();
        wait();
        game:GetService('VirtualUser'):ClickButton2(Vector2.new(0,0))
    end
end



local oldGui = game.CoreGui:FindFirstChild("Snowball")
if oldGui then    oldGui:Destroy()    end

local CmdGui = Instance.new("ScreenGui")
CmdGui.Name = "Snowball"
CmdGui.Parent = game:GetService("CoreGui")


local function createMainBackground()
    local Background = Instance.new("Frame")
    Background.Name = "mainPage"
    Background.Parent = CmdGui
    Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Background.BorderSizePixel = 0
    Background.BorderColor3 = Color3.new(1,0,1)
    Background.Position = UDim2.new(0.12, 0, 0.5, 0)
    Background.Size = UDim2.new(0, 150, 0, 150)
    Background.Active = true
    
    local hideFromGrid = Instance.new("Folder")
    hideFromGrid.Name = "Top Bar"
    hideFromGrid.Parent = Background
    
    local CmdName = Instance.new("TextButton")
    CmdName.Name = "Drag Bar"
    CmdName.AutoButtonColor = false
    CmdName.Parent = hideFromGrid
    CmdName.BackgroundColor3 = Color3.fromRGB(0, 128, 68)
    CmdName.BorderSizePixel = 0
    CmdName.Size = UDim2.new(0.9, 0, 0.1, 0)
    CmdName.Font = Enum.Font.Roboto
    CmdName.Text = "Lunar Event"
    CmdName.TextColor3 = Color3.fromRGB(255, 255, 255)
    CmdName.TextScaled = true
    CmdName.TextSize = 14.000
    CmdName.TextWrapped = true
    Dragg = false
    CmdName.MouseButton1Down:Connect(function()Dragg = true while Dragg do game.TweenService:Create(Background, TweenInfo.new(.06), {Position = UDim2.new(0,Mouse.X-40,0,Mouse.Y-5)}):Play()wait()end end)  
    CmdName.MouseButton1Up:Connect(function()Dragg = false end)

    local Close = Instance.new("TextButton")
    Close.Name = "Close"
    Close.Parent = hideFromGrid
    Close.BackgroundColor3 = Color3.fromRGB(155, 0, 0)
    Close.BorderSizePixel = 0
    Close.Position = UDim2.new(0.87, 0, 0.0001, 0)
    Close.Size = UDim2.new(0, 15, 0, 15)
    Close.Font = Enum.Font.Roboto
    Close.Text = "X"
    Close.TextColor3 = Color3.fromRGB(255, 255, 255)
    Close.TextSize = 14.000
    Close.MouseButton1Click:Connect(function()
    CmdGui:Destroy()
    if killEverything then
        killEverything:Disconnect()
    end
    end)
    
    local Background2 = Instance.new("Frame")
    Background2.Name = "mainPage"
    Background2.Parent = Background
    Background2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Background2.BorderSizePixel = 0
    Background2.BorderColor3 = Color3.new(1,0,1)
    Background2.Position = UDim2.new(0, 0, 0.15, 0)
    Background2.Size = UDim2.new(1, 0, 0.9, 0)
    Background2.Active = true
    
    local Grid = Instance.new("UIGridLayout")
    Grid.CellSize = UDim2.new(0.95,0,0.2,0)
    Grid.CellPadding = UDim2.new(0,1,0,5)
    Grid.SortOrder = "LayoutOrder"
    Grid.Parent = Background2
    
    local God = Instance.new("TextButton")
    God.BackgroundColor3 = Color3.fromRGB(0, 128, 68)
    God.BorderSizePixel = 1
    God.BorderColor3 = Color3.fromRGB(250,250,250)
    God.ZIndex = 2
    God.Font = Enum.Font.Roboto
    God.Parent = Background2
    God.Text = "Break Rabbit"
    God.TextColor3 = Color3.fromRGB(200,200,150)
    God.TextScaled = true
	God.Visible = false
    God.MouseButton1Click:Connect(function()
        Character.IsPlayer:Destroy()
        God.Text = "Rabbit should stop"
        God.BackgroundColor3 = Color3.fromRGB(250,250,250)
        God.TextColor3 = Color3.fromRGB(0,0,0)
    end)
    
    local KillAura = Instance.new("TextButton")
    KillAura.BackgroundColor3 = Color3.fromRGB(0, 128, 68)
    KillAura.BorderSizePixel = 1
    KillAura.BorderColor3 = Color3.fromRGB(250,250,250)
    KillAura.ZIndex = 2
    KillAura.Font = Enum.Font.Roboto
    KillAura.Parent = Background2
    KillAura.Text = "Kill Aura"
    KillAura.TextColor3 = Color3.fromRGB(200,200,150)
    KillAura.TextScaled = true
    KillAura.MouseButton1Click:Connect(function()
        if killing then
            killing = false
            KillAura.Text = "Kill Aura"
            KillAura.BackgroundColor3 = Color3.fromRGB(0, 128, 68)
            killEverything:Disconnect()
        else
            killing = true
            KillAura.Text = "Killing"
            KillAura.BackgroundColor3 = Color3.fromRGB(250, 100, 100)
            killEverything = game:GetService('RunService').Stepped:Connect(killAura)
        end
    end)
end

createMainBackground()
task.spawn(AntiAFK)
