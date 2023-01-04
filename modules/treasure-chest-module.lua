local HttpService = game:GetService("HttpService")
local Player = game.Players.LocalPlayer
local Character = Player.Character
local Island = game.Workspace.Islands:GetChildren()[1]
local TS = game:GetService('TweenService')
local Noclipping
local tween
local noSit

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

local function setTreasureHunter(value)
    Player:SetAttribute("hunting", value or false)
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

local function redeemMap()
    if game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.GetPlayerActiveTreasureMap:InvokeServer() == nil then
        print("getting map maybe")
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.ClaimTreasureMap:FireServer()
    end
end

local function getMapInfo()
    
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.GetPlayerActiveTreasureMap:InvokeServer() -- has to run twice some reason
    local infos = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.GetPlayerActiveTreasureMap:InvokeServer()
    return infos.location, infos.position

end

local function getTeleporters()
    local teleporters = {}
    
    for i,v in pairs(game:GetService("Workspace").spawnPrefabs.Teleporter:GetChildren()) do
        if v:FindFirstChild("teleporter") then
            table.insert(teleporters, v.teleporter)
        end
    end
    
    table.sort(teleporters, function(t1, t2) 
		return Player:DistanceFromCharacter(t1.Position) < Player:DistanceFromCharacter(t2.Position) end)
    return teleporters
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

local function getIslandPortal()
    for i,v in pairs(Island.Blocks:GetChildren()) do
        if v.Name:find("portalToSpawn") then
            return v
        end
    end
end

local function goToHub()
    local portal = getIslandPortal()
    local tween, Time = goToPoint(portal.Position, 0)
    task.wait(Time + 3)
end

local function stopSitting()
    if Character.Humanoid.Sit == true then
        task.wait()
        Character.Humanoid.Sit = false
    end
end

local function teleport()
    local teleporters = getTeleporters()
    local location, Point = getMapInfo()
    
    if Player:DistanceFromCharacter(teleporters[1].Position) > 2000 then
        goToHub()
    end
    
    if Player:DistanceFromCharacter(point) > 500 then
        local tween, Time = goToPoint(teleporters[1].Position, 0)
        task.wait(Time + 0.5)
      
        local args = {
        [1] = HttpService:GenerateGUID(false),
        [2] = {
        [1] = {
        ["target"] = {
        ["islandId"] = location,
        ["type"] = "Island"
        }
        }
        }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("Teleporters/UseHubTeleporter"):FireServer(unpack(args))
    end
end

local function dropIntoVoid()
    if Player:GetAttribute("hunting") then
        HR.CFrame = CFrame.new(HR.Position.X, -101, HR.Position.Z)
    end
end

local function digTreasure()
    local args = {
    [1] = HttpService:GenerateGUID(false),
    [2] = {}
    }

    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.PlayerDigTreasure:FireServer(unpack(args))
end

local function startFarmingChests()
    setTreasureHunter(true)
    redeemMap()
    Float()
    noClip = true
    Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
    noSit = Character.Humanoid:GetPropertyChangedSignal("Sit"):Connect(stopSitting)
    
    while Player:GetAttribute("hunting") and wait() do
        local location, Point = getMapInfo()
        teleport()
        task.wait(2)
        if Player:GetAttribute("hunting") then
            local tween, Time = goToPoint(Point, 0)
            wait(Time)
        end
        digTreasure()
        task.wait(0.5)
        dropIntoVoid()
	    task.wait(1)
    end
end

local function stopFarmingChests()
    setTreasureHunter(false)
    Noclipping:Disconnect()
    noClip = false
    noSit:Disconnect()
    unFloat()
    if tween then
        tween:Cancel()
    end
end

return {
    startFarmingChests = startFarmingChests,
    stopFarmingChests = stopFarmingChests,
    redeemMap = redeemMap
}
