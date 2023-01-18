local TS = game:GetService('TweenService')
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character.Humanoid
local Island = game.Workspace.Islands:GetChildren()[1]
local feedAnimalEvent = game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_FEED_ANIMAL

local tween = nil
local aura = false

local function getRoot(character) -- find root part of character if they dont have HR
	return character:FindFirstChild('HumanoidRootPart') or 
	       character:FindFirstChild('Torso') or 
	       character:FindFirstChild('UpperTorso')
end

local function setGivingFertilities(value)
    Player:SetAttribute("givingFertilities", value or false)	
end

local function goToPoint(Point, distance)
    if aura then return end
        
	local HR = getRoot(Character)
    if (HR.Position - Point).magnitude > distance then
        local Distance = (HR.Position - Point).Magnitude
        local Speed = 25
        local Time = Distance/Speed
        local tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
        tween:Play()
		return tween, Time
    end
    return nil,0
end

local function startFloating()
	local BV = Instance.new("BodyVelocity", getRoot(Character))
	BV.Velocity = Vector3.new(0, 0, 0)
	BV.MaxForce = Vector3.new(0, math.huge, 0)
end

local function stopFloating()
    local HR = getRoot(Character)
    if HR:FindFirstChild("BodyVelocity") then
        HR.BodyVelocity:Destroy()
    end
end

local function stopMoving()
	if tween then
		tween:Cancel()
	end
end

local function getAnimals()
    local animals = {}
    for _,Animal in pairs(Island.Entities:GetChildren()) do
        if Animal:FindFirstChild("Sleeping") then
            table.insert(animals, Animal)
        end
    end
    
    return animals
end

local function getHorneyAnimals()
    local allAnimals = getAnimals()
    local readyToBreed = {}
    for _,Animal in pairs(allAnimals) do
        table.insert(readyToBreed, Animal)
    end
    
    return readyToBreed
end

local function equipFertilityPotion()
    if Player.Backpack:FindFirstChild("potionFertility") then
        Player.Backpack.potionFertility.Parent = Character
    end
end

local function giveFertilityPotion()
    local animals = getHorneyAnimals()
    for _,Animal in pairs(animals) do
        
    local tween, waitTime = goToPoint(Animal.HumanoidRootPart.Position, 24)
    task.wait(waitTime)
    
    equipFertilityPotion()

    feedAnimalEvent:InvokeServer({["animal"] = Animal})
    end
end

local function findItemPorts()
    local itemPorts = {}
    for i,itemPort in pairs(Island.Blocks:GetDescendants()) do
        if itemPort.Name == "itemPort" then
            table.insert(itemPorts, itemPort)
        end
    end
    
    return itemPorts
end
        
        
local function getSpawnEggs()
    local itemPorts = findItemPorts()
    for i,item in pairs(itemPorts) do
        if item:FindFirstChildWhichIsA('Tool').Name:sub(1, 8) == ("spawnEgg") then
            local egg = item:FindFirstChildWhichIsA('Tool')
            
            local tween, waitTime = goToPoint(item.Position, 24)
            task.wait(waitTime)
            
            local args = {
            [1] = {
            ["tool"] = egg,
            ["player_tracking_category"] = "join_from_web"
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))

        end
    end
end

local function startFertilityLoop()
    setGivingFertilities(true)
    startFloating()
    aura = false
    
    while Player:GetAttribute("givingFertilities") and task.wait() do
        giveFertilityPotion()
        getSpawnEggs()
    end
end

local function stopFertilityLoop()
    setGivingFertilities(false)
    stopFloating()
    stopMoving()
end

local function fertilityAura()
    setGivingFertilities(true)
    startFloating()
    aura = true
    
    while Player:GetAttribute("givingFertilities") and task.wait() do
        giveFertilityPotion()
        getSpawnEggs()
    end
end

return {
    startFertilityLoop = startFertilityLoop,
    stopFertilityLoop = stopFertilityLoop,
    fertilityAura = fertilityAura
}
