local HttpService = game:GetService("HttpService")
local Player = game.Players.LocalPlayer
local Character = Player.Character
local HR = Character:FindFirstChild("HumanoidRootPart") or Character.UpperTorso
local TS = game:GetService('TweenService')


local BV = Instance.new("BodyVelocity")
BV.Velocity = Vector3.new(0,0,0)
BV.Parent = HR
BV.MaxForce = Vector3.new(0,math.huge,0)

local function NoclipLoop()
    if noClip == true then
        for _, child in pairs(Character:GetDescendants()) do
            if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                child.CanCollide = false
            end
    	end
    end
end

noClip = true
Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)

local args = {
    [1] = {}
}

if game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.GetPlayerActiveTreasureMap:InvokeServer(unpack(args)) == nil then
    print("getting map maybe")
game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.ClaimTreasureMap:FireServer()
end
for i,v in pairs(game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.GetPlayerActiveTreasureMap:InvokeServer(unpack(args))) do

if i == "position" then
    Point = v
else
    location = v
end

end

print(location, Point)

if location == "maple" then
    game:GetService("ReplicatedStorage")["rbxts_include"]["node_modules"].net.out["_NetManaged"].TravelMapleIsland:FireServer()
    wait(1)
elseif location == "slime" then
    local args = {
    [1] = HttpService:GenerateGUID(false),
    [2] = {
    [1] = {
    ["target"] = {
    ["islandId"] = "slime",
    ["type"] = "Island"
    },
    ["block"] = workspace.Islands:FindFirstChild("08ddb3e2-4696-4a72-9cd3-0e70ba482dee-island").Blocks.teleporter
    }
    }
    }
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("Teleporters/UseTeleporter"):FireServer(unpack(args))
elseif location == "spirit" then
    local args = {
    [1] = HttpService:GenerateGUID(false),
    [2] = {
    [1] = {
    ["target"] = {
    ["islandId"] = "spirit",
    ["type"] = "Island"
    },
    ["block"] = workspace.Islands:FindFirstChild("08ddb3e2-4696-4a72-9cd3-0e70ba482dee-island").Blocks.teleporter
    }}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("Teleporters/UseTeleporter"):FireServer(unpack(args))
end

if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Point).magnitude > 24 then
    Distance = (HR.Position - Point).Magnitude
    Speed = 20
    Time = Distance/Speed
    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
    tween:Play()
    wait(Time)
end

local args = {
    [1] = HttpService:GenerateGUID(false), -- dig treasure
    [2] = {}
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.PlayerDigTreasure:FireServer(unpack(args))

Noclipping:Disconnect()
noClip = false

BV:Destroy()