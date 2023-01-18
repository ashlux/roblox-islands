local Island = game.Workspace.Islands:GetChildren()[1]
local Player = game.Players.LocalPlayer
local Character = Player.Character
local HR = Character.HumanoidRootPart
local TS = game:GetService("TweenService")

function Float() -- makes you float using BV
	BV = Instance.new("BodyVelocity", HR)
	BV.Velocity = Vector3.new(0,0,0)
	BV.MaxForce = Vector3.new(0,math.huge,0)
end

function unFloat() -- gets rid of BV so you dont float
    if HR:FindFirstChild("BodyVelocity") then
        HR.BodyVelocity:Destroy()
    end
end

function getBlocks(block)
    Blocks = {}
    for i,tree in pairs(Island.Blocks:GetChildren())do
        if tree.Name == block then
            table.insert(Blocks, tree)
        end
    end
    return Blocks
end

function getFruit(block)
    Fruits = {}
    Blocks = getBlocks(block)
    for _,v in pairs(Blocks) do
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

function goToPoint(Point, distance)
    if (HR.Position - Point).magnitude > distance then
    Distance = (HR.Position - Point).Magnitude
    Speed = 25
    Time = Distance/Speed
    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
    tween:Play()
    return tween, Time
    end
end

local function setCollectFruit(value)
    Player:SetAttribute("pickFruit", value or false)
end


local function pickFruits(fruitTree)
Fruits = getFruit(fruitTree)
for i,v in pairs(Fruits) do
    tween, Time = goToPoint(v.HandleDisabled.Position, 10)
    if tween then
        wait(Time)
    end
    local args = {
    [1] = {
    ["tool"] = v,
    ["player_tracking_category"] = "join_from_web"
    }
    }
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
    break
end
end

local function stopCollectingFruit()
    setCollectFruit(false)
    if tween then
        tween:Cancel()
    end
    wait()
end

local function startCollectingFruit(fruitTree) -- treeApple, treeOrange, treeAvocado, treeKiwi, treeCoconut, treeLemon, treePlum
setCollectFruit(true)
Float()
    while wait() do
        if Player:GetAttribute("pickFruit") == false then unFloat() return end
        pickFruits(fruitTree)
    end
end

return{
    startCollectingFruit = startCollectingFruit,
    stopCollectingFruit = stopCollectingFruit,
}
