local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character.Humanoid
local Island = game.Workspace.Islands:GetChildren()[1] or ""

function getRoot(char) -- find root part of character if they dont have HR
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

local HR = getRoot(Character)

local function setWateringFertiles(value)
    Player:SetAttribute("wateringFertiles", value or false)
end

local function getClosestFlower()
    local flowers = {}
    for i,v in pairs(Island.Blocks:GetChildren()) do
        if (v:IsA("Part")) and v:FindFirstChild("Watered") and v:FindFirstChild("Top") and v.Watered.Value == false then
            table.insert(flowers, v)
        end
    end
    table.sort(flowers, function(t1, t2) 
		return Player:DistanceFromCharacter(t1.Position) < Player:DistanceFromCharacter(t2.Position) end)
    return flowers
end

local function runFaster()
    runFast = Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        Humanoid.WalkSpeed = 30
    end)
    Humanoid.WalkSpeed = 30 -- this activates the initial change in walkspeed
end

local function unRunFaster()
    runFast:Disconnect()
end

local function walkToFlower(flower)
    if (HR.Position - flower.Position).magnitude > 24 then
        Humanoid:MoveTo(flower.Position)
        Humanoid.MoveToFinished:wait()
    end
end

local function equipWateringCan()
    if Player.Backpack:FindFirstChild("wateringCan") then
        Player.Backpack.wateringCan.Parent = Character
        task.wait()
    end
end

local function startWaterClosestFlower()
    setWateringFertiles(true)
    runFaster()
    while Player:GetAttribute("wateringFertiles") and task.wait() do
        local flower = getClosestFlower()
        walkToFlower(flower)
        equipWateringCan()
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_WATER_BLOCK:InvokeServer({["block"] = flower})
    end
end

local function stopWaterClosestFlower()
    setWateringFertiles(false)
    unRunFaster()
end

return {
    waterClosestFlower = startWaterClosestFlower
    stopWaterClosestFlower = stopWaterClosestFlower
}
