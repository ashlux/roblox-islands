local TS = game:GetService('TweenService')
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character.Humanoid
local Island = game.Workspace.Islands:GetChildren()[1]
local Camera = game.Workspace.CurrentCamera
local VirtualInputManager = game:GetService("VirtualInputManager")


local tween = nil

local function getRoot(character) -- find root part of character if they dont have HR
	return character:FindFirstChild('HumanoidRootPart') or 
	       character:FindFirstChild('Torso') or 
	       character:FindFirstChild('UpperTorso')
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

local function goToPoint(Point, distance)
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

local function stopMoving()
	if tween then
		tween:Cancel()
	end
end

local function getAllHarvestableCrops()
    local cropBlocks = {}
	for _,cropBlock in pairs(Island and Island.Blocks and Island.Blocks:GetChildren()) do
		local stage = cropBlock:FindFirstChild("stage")
	    if stage and stage.Value == 3 then
		    table.insert(cropBlocks, cropBlock)
        end
	end
	return cropBlocks
end

local function getHarvestableCropsByName(cropName, maxDistance)
	local cropBlocks = {}
	for _,cropBlock in pairs(getAllHarvestableCrops()) do
	    if cropBlock.Name == cropName and Player:DistanceFromCharacter(cropBlock.Position) < (maxDistance or math.huge) then
		    table.insert(cropBlocks, cropBlock)
        end
	end	

	table.sort(cropBlocks, function(t1, t2) 
		return Player:DistanceFromCharacter(t1.Position) < Player:DistanceFromCharacter(t2.Position) end)
	return cropBlocks
end

local function moveToRandomHarvestableCropByName(cropName)
    local cropBlocks = getHarvestableCropsByName(cropName)
    if (#cropBlocks == 0) then
	return nil, 0
    end
    local randomCropBlock = cropBlocks[math.random(1, #cropBlocks)]
    if randomCropBlock then
		tween, Time = goToPoint(randomCropBlock.Position, 2)
		return tween, Time
    end
end

local function moveCamera(focus)
    
    if focus == "Humanoid" then
        Camera.CameraSubject = Humanoid
        Camera.CameraType = Enum.CameraType.Custom
    elseif focus.Name:find("tree") then
        Camera.CameraType = Enum.CameraType.Scriptable
        Camera.CameraSubject = focus
        Camera.CFrame = CFrame.new(focus.CFrame.Position + Vector3.new(0,5,5))
    else
        Camera.CameraType = Enum.CameraType.Scriptable
        Camera.CameraSubject = focus
        Camera.Focus = focus.CFrame
        Camera.CFrame = CFrame.new(focus.CFrame.Position + Vector3.new(0,5,0), focus.Position)
    end
    
end

function clickScreen(area)
    
    local screenSize = Camera.ViewportSize
   
    if area == "middle" then
        VirtualInputManager:SendMouseButtonEvent(screenSize.X/2, screenSize.Y/2, 0, true, game, 1)
        task.wait()
        VirtualInputManager:SendMouseButtonEvent(screenSize.X/2, screenSize.Y/2, 0, false, game, 1)
    
    elseif area == "corner" then
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
        
        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
    end
    
end

local function replantCrop(crop, cframe)
    
    moveCamera(crop)
    task.wait()
    clickScreen("middle")
    task.wait()
    moveCamera("Humanoid")
    
	--local args = {
	--	[1] = {
	--		["upperBlock"] = false,
	--		["cframe"] = cframe,
	--		["player_tracking_category"] = "join_from_web",
	--		["blockType"] = cropName
	--	}
	--}
	--game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged
	--	.CLIENT_BLOCK_PLACE_REQUEST:InvokeServer(unpack(args))
end

local function sickleCrops(cropBlocks)
    local Tool = getSickle()
	if Tool and #cropBlocks >= 1 then
		local args = {
			[1] = Tool.Name,
			[2] = cropBlocks
		}

		game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged
			.SwingSickle:InvokeServer(unpack(args))
	end
end

function getSickle()
    for i,v in pairs(Character:GetChildren()) do
        if v:IsA("Tool") and v.Name:find("ickle") then
            Tool = v
        end
    end
    if not Tool then
        for i,v in pairs(Player.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.Name:find("ickle") then
                Tool = v
            end
        end
    end
    return Tool
end

local function setSickleAndReplanting(value)
    Player:SetAttribute("sickleAndReplanting", value or false)	
end

local function replantCropBlocks(cropBlocks)
	task.spawn(function()
		for i,cropBlock in pairs(cropBlocks or {}) do
			if not Player:GetAttribute("sickleAndReplanting") then
				return nil;
			end
			task.spawn(replantCrop, cropBlock, cropBlock.CFrame)
		end
	end)
end

local function startSicklingAndReplanting(cropNameToHarvest)
	setSickleAndReplanting(true)
	startFloating()
    while Player:GetAttribute("sickleAndReplanting") and wait() do
		local tween, movementTime = moveToRandomHarvestableCropByName(cropNameToHarvest)
		wait(movementTime)
		local cropsBlocksToSickle = getHarvestableCropsByName(cropNameToHarvest, 24)
		sickleCrops(cropsBlocksToSickle)
		replantCropBlocks(cropsBlocksToSickle)
	end	
end

local function stopSicklingAndReplanting()
	setSickleAndReplanting(false)
	stopFloating()
	stopMoving()
end

local function sicklingAndDoNotReplant(cropNameToHarvest)
	while wait() do
		local tween, movementTime = moveToRandomHarvestableCropByName(cropNameToHarvest)
		wait(movementTime)
		local cropsBlocksToSickle = getHarvestableCropsByName(cropNameToHarvest, 24)
		if (#cropsBlocksToSickle == 0) then
			return nil;
		end
		sickleCrops(cropsBlocksToSickle)
	end
end

local function plantCropsOnce(cropNameToPlant)
    
	function plantCropOnDirt(cropNameToPlant, plantLocation)
		for i,dirt in pairs(Island and Island.Blocks and Island.Blocks:GetChildren() or {}) do
			if dirt.Name == plantLocation and Player:DistanceFromCharacter(dirt.Position) < 150 then
				local ray = Ray.new(dirt.Position, Vector3.new(0,3,0))
                local hitPart, hitPosition = workspace:FindPartOnRay(ray,dirt)
                if not hitPart then
                    
                    task.spawn(replantCrop, dirt, dirt.CFrame)
					
			   end
		   end
	   end
   end

	if cropNameToPlant == "candyCaneVine" or 
		cropNameToPlant == "grapeVine" or 
		cropNameToPlant == "dragonfruit" then
		plantCropOnDirt(cropNameToPlant, "trellis")
	elseif cropNameToPlant == "cactus" then
		plantCropOnDirt(cropNameToPlant, "sand")
	elseif cropNameToPlant == "rice"or
			cropNameToPlant == "seaweed" then
		plantCropOnDirt(cropNameToPlant, "pond")
	else
		plantCropOnDirt(cropNameToPlant, "soil")
	end
end

return {
	startSicklingAndReplanting = startSicklingAndReplanting,
	stopSicklingAndReplanting = stopSicklingAndReplanting,
	sicklingAndDoNotReplant = sicklingAndDoNotReplant,
	plantCropsOnce = plantCropsOnce,
}
