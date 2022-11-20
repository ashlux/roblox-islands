local HttpService = game:GetService("HttpService")
local Island = game.Workspace.Islands:GetChildren()[1]

local item = "Void Parasite Seeds"
local cost = 1000000
local buyEvent = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("fokeelqbqjuN/cxwernWAuwnyqMmlgcocadqiRuvqyMNhvazl")
local openMachine = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("fokeelqbqjuN/phylbtajnCdrIpwpgcruhxk")

local Players = game:GetService("Players")
local Player = game.Players.LocalPlayer
local Character = Player.Character

local test = Instance.new("Model")
local hum  = Instance.new("Humanoid")
local animation = Instance.new("Model")
local humanoidanimation = Instance.new("Humanoid")
test.Parent = workspace
hum.Parent = test
animation.Parent = workspace
humanoidanimation.Parent = animation

Player.Character = test
wait()
Character:FindFirstChildOfClass('Humanoid').Animator.Parent = humanoidanimation
Character:FindFirstChildOfClass('Humanoid'):Destroy()
Players.LocalPlayer.Character = Character

local hum2 = Instance.new("Humanoid")
hum2.Parent = Character
Character:FindFirstChildOfClass("Humanoid").Jump = true

humanoidanimation.Animator.Parent = hum2
Character.Animate.Disabled = true
wait()
Character.Animate.Disabled = false
wait()

hum2.HipHeight = 2.19

wait()

Character:BreakJoints()

function displayToName(DisplayName)
    for i,v in pairs(game.ReplicatedStorage.Tools:GetChildren()) do
        if v:FindFirstChild("DisplayName") then
            if v.DisplayName.Value == DisplayName then
                return v.Name
            end
        end
    end
end

function getVendings(mode, item, cost)
    local vendings = {}
    if mode == "sell" then mode = 1 elseif mode == "buy" then mode = 0 end
    for i,v in pairs(Island.Blocks:GetChildren()) do
        if (v.Name == "vendingMachine" or v.Name == "vendingMachine1") and v.Mode.Value == mode and v.TransactionPrice.Value <= cost and v.SellingContents:GetChildren()[1] then
            if v.SellingContents:GetChildren()[1].Name == item then
                table.insert(vendings, v)
            end
        end
    end
    return vendings
end

itemDisplay = displayToName(item)

vendings = getVendings("buy", itemDisplay, cost) -- sell or buy , what to buy

wait(3)

Player = game.Players.LocalPlayer
Character = Player.Character

for i,v in pairs(vendings) do
    if Player:DistanceFromCharacter(v.Position) > 24 then
        Character.HumanoidRootPart.CFrame = v.CFrame
        wait(5)
    end
    print("buying from "..v.Name)
    local args = {
    [1] = HttpService:GenerateGUID(false),
    [2] = {
    [1] = {
    ["vendingMachine"] = v
    }}}
    openMachine:FireServer(unpack(args))
    
    local args = {
    [1] = HttpService:GenerateGUID(false),
    [2] = {
    [1] = {
    ["vendingMachine"] = v,
    ["player_tracking_category"] = "join_from_web",
    ["amount"] = 1
    }}}
    buyEvent:FireServer(unpack(args))
end