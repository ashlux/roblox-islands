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

local function setPickingUnfertiles(value)
    Player:SetAttribute("pickingUnfertiles", value or false)
end

local function getClosestFertileFlowers()
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
    local mag = (HR.Position - flower.Position).magnitude
    if mag > 24 then
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
        local flowers = getClosestFertileFlowers()
        for i,flower in pairs(flowers) do
            local mag = (HR.Position - flower.Position).magnitude
            walkToFlower(flower)
            equipWateringCan()
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_WATER_BLOCK:InvokeServer({["block"] = flower})
            if mag > 24 then break end
        end
    end
end

local function stopWaterClosestFlower()
    setWateringFertiles(false)
    unRunFaster()
end

local function waterOnlyNearby()
    local flowers = getClosestFertileFlowers()
    for i,flower in pairs(flowers) do
        local mag = (HR.Position - flower.Position).magnitude
        if mag < 24 then
        equipWateringCan()
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_WATER_BLOCK:InvokeServer({["block"] = flower})
        end
    end
end

local function getUnfertiles()
    local flowers = {}
    for i,v in pairs(Island.Blocks:GetChildren()) do
        if (v:IsA("Part")) and v:FindFirstChild("Watered") and v:FindFirstChild("Top") == nil then
            table.insert(flowers, v)
        end
    end
    return flowers
end

local function startPickUnfertiles()
    setPickingUnfertiles(true)
    while Player:GetAttribute("pickingUnfertiles") and task.wait() do
        local flowers = getUnfertiles()
        for _,v in pairs(flowers) do
            if Player:GetAttribute("pickingUnfertiles") then
                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer({["flower"] = v})
            end
        end
    end
end

local function stopPickUnfertiles()
    setPickingUnfertiles(false)
end

return {
    startWaterClosestFlower = startWaterClosestFlower,
    stopWaterClosestFlower = stopWaterClosestFlower,
    waterOnlyNearby = waterOnlyNearby,
    startPickUnfertiles = startPickUnfertiles,
    stopPickUnfertiles = stopPickUnfertiles
}
