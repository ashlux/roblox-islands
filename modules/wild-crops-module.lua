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

local function getPlant()
    local plants = {}
    for i,v in pairs(game:GetService("Workspace").WildernessBlocks:GetChildren()) do
        if Player:DistanceFromCharacter(v.Position) < 1000 and (v:FindFirstChild("stage") or v:FindFirstChild("Watered")) then
            table.insert(plants, v)
        end
    end
    
    table.sort(plants, function(t1, t2) 
		return Player:DistanceFromCharacter(t1.Position) < Player:DistanceFromCharacter(t2.Position) end)
    return plants
end

local function setPickingWild(value)
    Player:SetAttribute("pickingWild", value or false)
end

local function harvestPlant(plant)
    if plant:FindFirstChild("Watered") then
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer({["flower"] = plant})
    else
        local args = {
        [1] = {
        ["player"] = Player,
        ["player_tracking_category"] = "join_from_web",
        ["model"] = plant
        }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_HARVEST_CROP_REQUEST:InvokeServer(unpack(args))
    end
end

local function startHarvestingWild()
    setPickingWild(true)
    noClip = true
    Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
    Float()
    while Player:GetAttribute("pickingWild") and wait() do
        local plant = getPlant()[1]
        local tween, Time = goToPoint(plant.Position, 0)
        wait(Time)
        harvestPlant(plant)
    end
end

local function stopHarvestingWild()
    setPickingWild(false)
    noClip = false
    Noclipping:Disconnect()
    unFloat()
    if tween then
        tween:Cancel()
    end
end

return {
    startHarvestingWild = startHarvestingWild,
    stopHarvestingWild = stopHarvestingWild
}
