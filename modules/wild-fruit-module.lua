--This can probably be merged with the other fruit module--

local Player = game.Players.LocalPlayer
local Character = Player.Character
local TS = game:GetService('TweenService')
local Noclipping
local tween
local noClip = false

function getRoot(char) -- find root part of character if they dont have HR
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

local HR = getRoot(Character)

local function NoclipLoop()
    if noClip == true then
        for _, child in pairs(Character:GetDescendants()) do
            if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                child.CanCollide = false
            end
    	end
    end
end

local function Float() -- makes you float using BV
	local BV = Instance.new("BodyVelocity", HR)
	BV.Velocity = Vector3.new(0,0,0)
	BV.MaxForce = Vector3.new(0,math.huge,0)
end

local function unFloat() -- gets rid of BV so you dont float
    if HR:FindFirstChild("BodyVelocity") then
        HR.BodyVelocity:Destroy()
    end
end

local function goToPoint(Point, distance)
    if (HR.Position - Point).magnitude > distance then
    local Distance = (HR.Position - Point).Magnitude
    local Speed = 25
    local Time = Distance/Speed
    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
    tween:Play()
    return tween, Time
    end
end

local function setCollectWildFruit(value)
    Player:SetAttribute("pickWildFruit", value or false)
end

local function getWildKiwi()
    local kiwiTrees = {}
    for i,v in pairs(game.Workspace.WildernessBlocks:GetChildren()) do
        if v.Name == "treeKiwi" then
            table.insert(kiwiTrees, v)
        end
    end
    return kiwiTrees
end

local function getFruit()
    local Fruits = {}
    local kiwiTrees = getWildKiwi()
    for _,v in pairs(kiwiTrees) do
        if #v.FruitLocations:GetChildren()[1]:GetChildren() >= 2 and v.FruitLocations:GetChildren()[1]:GetChildren()[2]:FindFirstChild("HandleDisabled") then
            table.insert(Fruits, v.FruitLocations:GetChildren()[1]:GetChildren()[2])
        end
        if #v.FruitLocations:GetChildren()[2]:GetChildren() >= 2 and v.FruitLocations:GetChildren()[2]:GetChildren()[2]:FindFirstChild("HandleDisabled") then
            table.insert(Fruits, v.FruitLocations:GetChildren()[2]:GetChildren()[2])
        end
        if #v.FruitLocations:GetChildren()[3]:GetChildren() >= 2 and v.FruitLocations:GetChildren()[3]:GetChildren()[2]:FindFirstChild("HandleDisabled") then
            table.insert(Fruits, v.FruitLocations:GetChildren()[3]:GetChildren()[2])
        end
    end
    table.sort(Fruits, function(t1, t2) 
		return Player:DistanceFromCharacter(t1.HandleDisabled.Position) < Player:DistanceFromCharacter(t2.HandleDisabled.Position) end)
    return Fruits
end

local function pickWildFruit(fruit)
    local args = {
    [1] = {
    ["tool"] = fruit,
    ["player_tracking_category"] = "join_from_web"
    }
    }
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
end

local function startPickingWildFruit()
    setCollectWildFruit(true)
    Float()
    noClip = true
    Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
    while Player:GetAttribute("pickWildFruit") do
        local Fruits = getFruit()
        local tween, Time = goToPoint(Fruits[1].HandleDisabled.Position, 0)
        task.wait(Time)
        pickWildFruit(Fruits[1])
    end
end

local function stopPickingWildFruit()
    setCollectWildFruit(false)
    noClip = false
    Noclipping:Disconnect()
    unFloat()
    if tween then
        tween:Cancel()
    end
end

return {
    startPickingWildFruit = startPickingWildFruit,
    stopPickingWildFruit = stopPickingWildFruit
}
