print("Loading")

repeat wait()
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse()
repeat wait() until mouse

function loadModule(url)
	return loadstring(game:HttpGet(url))()
end

local treeModule = loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/modules/tree-module.lua")
local fruitModule = loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/modules/fruit-module.lua")
local cropModule = loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/modules/crop-module.lua")
local breakModule = loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/modules/break-blocks-module.lua")
local flowerWaterModule = loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/modules/flower-module.lua")
local animalModule = loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/modules/animal-module.lua")
local treasureModule = loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/modules/treasure-chest-module.lua")
local wildFruitModule = loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/modules/wild-fruit-module.lua")
local wildCropModule = loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/modules/wild-crops-module.lua")
local chestModule = loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/modules/chest-module.lua")

print("Loading Complete!")

local StarterGui = game:GetService("StarterGui")

if game.PlaceId == 11838346571 then -- lunar event (islands arcade)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ashlux/roblox-islands/main/lunar-area.lua'))()
    return
end

--placeId are in this order.  Home, OnlineIsland, Hub, Wilderness Islands
if (game.PlaceId == 4872321990 and game.PlaceVersion ~= 1038) or (game.PlaceId == 5626342417 and game.PlaceVersion ~= 691) or (game.PlaceId == 5899156129 and game.PlaceVersion ~= 615) or (game.PlaceId == 9501318975 and game.PlaceVersion ~= 259) then
    updates = "😲 GUI might not function in this server 😲"
    StarterGui:SetCore("ChatMakeSystemMessage", {Color = Color3.fromRGB(250,0,0), Font = Enum.Font.SourceSansBold, TextSize = 18, Text = updates})
end

updates = "[Matt]: GUI Updated 1/26"

StarterGui:SetCore("ChatMakeSystemMessage", {Color = Color3.fromRGB(0,255,255), Font = Enum.Font.SourceSansBold, TextSize = 18, Text = updates})

--- these items change all the dang time!
hitMobEvent = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged:FindFirstChild("ymMtnfy/zyuMcgagquC")
sendTrade = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged:FindFirstChild("BVoaoeblmxdiZ/LiwakzlsidhDjnvlsjowWssFp")
addTrade = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged:FindFirstChild("BVoaoeblmxdiZ/adwOrnziejawbchcqumYvETafUdav")
tradeAccept = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged:FindFirstChild("BVoaoeblmxdiZ/mlvjjTfzryledupfqh")
openVending = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged:FindFirstChild("rqokekunqlfo/wluhwadhskimjsesqrvoA")
emptyItem = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged:FindFirstChild("rqokekunqlfo/nxivpkwjtsNOoclwF")
refillItem = emptyItem
refillCoins = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged:FindFirstChild("rqokekunqlfo/qehkLxigoKjziygmblMaGvklpLzDs")
takeCoins = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged:FindFirstChild("rqokekunqlfo/vnmxfItueXzlrfohv")
changeSettings = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged:FindFirstChild("rqokekunqlfo/Ftgi")
closeVending = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged:FindFirstChild("rqokekunqlfo/TxdaKfwmjiRmiygdbHofYe")
useNet = game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged:FindFirstChild("quroasfEBgmYh/ljebncbKjwkeinysvfbikpfmd")

---
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character.Humanoid
local Island = game.Workspace.Islands:GetChildren()[1] or ""
local CmdGui = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local CmdHandler = Instance.new("ScrollingFrame")
local Close = Instance.new("TextButton")
local Minimum = Instance.new("TextButton")
local CmdName = Instance.new("TextButton")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TS = game:GetService('TweenService')
local HttpService = game:GetService("HttpService")
local uis = game:GetService("UserInputService")

local torso = Player.Character.LowerTorso
local flying = false
local deb = true 
local ctrl = {f = 0, b = 0, l = 0, r = 0} 
local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
local maxspeed = 25
local speed = 25
local fly = true
function Fly() 
	local bg = Instance.new("BodyGyro", torso) 
	bg.P = 9e4
	bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
		bg.cframe = torso.CFrame 
		local bv = Instance.new("BodyVelocity", torso) 
		bv.velocity = Vector3.new(0,0,0) 
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
		repeat wait() 
			Player.Character.Humanoid.PlatformStand = true 
			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
				speed = speed + 2
				if speed > maxspeed then 
					speed = maxspeed 
				end 
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
				speed = 0
				if speed < 0 then 
					speed = 0 
				end 
			end 
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
			else 
				bv.velocity = Vector3.new(0,0,0) 
			end 
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame
		until not flying 
		ctrl = {f = 0, b = 0, l = 0, r = 0} 
		lastctrl = {f = 0, b = 0, l = 0, r = 0} 
		speed = 0 
		bg:Destroy() 
		bv:Destroy() 
		Player.Character.Humanoid.PlatformStand = false 
end 
	mouse.KeyDown:connect(function(key) 
		if key:lower() == "v" and fly == true then 
			if flying then flying = false 
			else 
				flying = true 
				Fly() 
			end 
		elseif key:lower() == "w" then 
			ctrl.f = 1 
		elseif key:lower() == "s" then 
			ctrl.b = -1 
		elseif key:lower() == "a" then 
			ctrl.l = -1 
		elseif key:lower() == "d" then 
			ctrl.r = 1 
		end 
	end)
	mouse.KeyUp:connect(function(key) 
		if key:lower() == "w" then 
			ctrl.f = 0 
		elseif key:lower() == "s" then 
			ctrl.b = 0 
		elseif key:lower() == "a" then 
			ctrl.l = 0 
		elseif key:lower() == "d" then 
			ctrl.r = 0 
		end 
	end)
Fly()


Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
    if RUN then
        Humanoid.WalkSpeed = 30
    end
end)

local function NoclipLoop() -- lets you walk through stuff
    if noClip == true then
        for _, child in pairs(Character:GetDescendants()) do
            if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                child.CanCollide = false
            end
    	end
    end
end

local function iOwnTheWorld() -- own it up own it up own it up own it up own it up own it up
    if owning == true then
        sethiddenproperty(Player, "SimulationRadius", 999999999999)
    end
end

function addComma(amount) -- add commas to numbers
    while true do
        amount, k = string.gsub(amount, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k==0) then
            break
        end
    end
    return amount
end


local function pickWildernessPlantAura(plant)
    for i,v in pairs(game:GetService("Workspace").WildernessBlocks:GetChildren()) do
        if v.Name == plant and Player:DistanceFromCharacter(v.Position) < 24 then
            local args = {
            [1] = {
            ["player"] = Player,
            ["player_tracking_category"] = "join_from_web",
            ["model"] = v
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_HARVEST_CROP_REQUEST:InvokeServer(unpack(args))
        end
    end
    if pickingPlants == false then
        return "NOTHING"
    end
end

function getRoot(char) -- find root part of character if they dont have HR
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

local HR = getRoot(Character)

local function AntiAFK() -- keeps you from going afk by clicking corner of screen when player goes "Idled"
    game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController();
    wait();
    game:GetService('VirtualUser'):ClickButton2(Vector2.new(0,0))
    end)
end
spawn(AntiAFK)

function Float() -- makes you float using BV
	BV = Instance.new("BodyVelocity", getRoot(Character))
	BV.Velocity = Vector3.new(0,0,0)
	BV.MaxForce = Vector3.new(0,math.huge,0)
end

function unFloat() -- gets rid of BV so you dont float
    HR = getRoot(Character)
    for i,v in pairs(HR:GetChildren()) do
        if v.Name == "BodyVelocity" then
            v:Destroy()
        end
    end
end

function getMapInfo() -- get treasure map info
    for i,v in pairs(game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.GetPlayerActiveTreasureMap:InvokeServer()) do
        if i == "position" then
            Point = v
        else
            location = v
        end
end
return location, Point
end

local function goToPoint(Point, distance)
    if (HR.Position - Point).magnitude > distance then
    Distance = (HR.Position - Point).Magnitude
    Speed = 25
    Time = Distance/Speed
    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
    tween:Play()
    return tween, Time
    end
end

local function cancelTween()
    if tween then 
        tween:Cancel()
    end
end

function getSpawnables()
    local spawnables = {}
    for i,v in pairs(Island.Blocks:GetChildren()) do
        if v.Name == "naturalRock1" or v.Name == "tallGrass" then
            table.insert(spawnables, v)
        end
    end
    table.sort(spawnables, function(t1, t2) 
		return Player:DistanceFromCharacter(t1.Position) < Player:DistanceFromCharacter(t2.Position) end)
    return spawnables
end

function getVoidRocks()
    local Rocks = {}
    for i,v in pairs(game.Workspace.WildernessBlocks:GetChildren()) do
        if v.Name == "grassVoid" or v.Name == "sandVoid" or v.Name == "rockAmethystStone" or v.Name == "rockAmethyst" then
            table.insert(Rocks, v)
        end
    end
    table.sort(Rocks, function(t1, t2) 
		return Player:DistanceFromCharacter(t1.Position) < Player:DistanceFromCharacter(t2.Position) end)
    return Rocks
end

function hitBlock(Block)
    local args = {
    [1] = {
    ["player_tracking_category"] = "join_from_web",
    ["part"] = Block,
    ["block"] = Block,
    ["norm"] = nil --[[Vector3]],
    ["pos"] = nil --[[Vector3]]
    }
    }
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
end

function digSpot(Spot)
    local args = {
    [1] = {
    ["shovelType"] = "shovelStone",
    ["block"] = Spot
    }
    }
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_21:InvokeServer(unpack(args))
end

function getPick()
    for i,v in pairs(Character:GetChildren()) do
        if v:IsA("Tool") and (v.Name == "voidMattock" or v.Name:find("Pickaxe")) then
            Tool = v
        end
    end
    if not Tool then
        for i,v in pairs(Player.Backpack:GetChildren()) do
            if v:IsA("Tool") and (v.Name == "voidMattock" or v.Name:find("Pickaxe")) then
                Tool = v
            end
        end
    end
    return Tool
end



function getShovel()
    for i,v in pairs(Character:GetChildren()) do
        if v:IsA("Tool") and (v.Name:find("shovel")) then
            Tool = v
        end
    end
    if not Tool then
        for i,v in pairs(Player.Backpack:GetChildren()) do
            if v:IsA("Tool") and (v.Name:find("shovel")) then
                Tool = v
            end
        end
    end
    return Tool
end

function equipPick()
    local Tool = getPick()
    if Character:FindFirstChild(Tool) == nil then
        Tool.Parent = Character
    end
end

function equipShovel()
    local Tool = getShovel()
    if Character:FindFirstChild(Tool) == nil then
        Tool.Parent = Character
    end
end

function getMobs()
	local mobs = {}
	for k,v in pairs(game.Workspace.WildernessIsland.Entities:GetChildren()) do
	    if v:FindFirstChild("HumanoidRootPart") then
		    local mob = v
		    table.insert(mobs, mob)
        end
	end	

	table.sort(mobs, function(t1, t2) 
		return Player:DistanceFromCharacter(t1.HumanoidRootPart.Position) < Player:DistanceFromCharacter(t2.HumanoidRootPart.Position) end)
	return mobs
end

local function equipWeapon(weapon)
    if Player.Backpack:FindFirstChild(weapon) then
        Player.Backpack[weapon].Parent = Character
    end
end

function moveToMobs(mob, weapon)
    if Character.IsDead.Value then
        task.wait(7)
        equipWeapon(weapon)
        return nil, 1, 1
    end
    local distance = Player:DistanceFromCharacter(mob.HumanoidRootPart.Position)
    local speed = 25
    local tweenInfo = TweenInfo.new(distance/speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
    local tween
    if mob.Name == "magmaBlob" then
        tween = TS:Create(Player.Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(mob.HumanoidRootPart.Position)})
    elseif mob.Name == "buffalkor" or mob.Name:find("skorp") then
        tween = TS:Create(Player.Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(mob.HumanoidRootPart.Position + Vector3.new(0,-12,0))})
    else
        tween = TS:Create(Player.Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(mob.HumanoidRootPart.Position + Vector3.new(0,-8,0))})
    end
    tween:Play()
    return tween, distance, speed
end

function getEquipped()
    local tool = "rageblade"
    for _,v in pairs(Character:GetChildren()) do
        if v:IsA("Tool") then
            tool = v.Name
        end
    end
    return tool
end

function killAura()
    HR = getRoot(Character)
    for i,v in pairs(workspace.WildernessIsland.Entities:GetChildren()) do
    if v:FindFirstChild("HumanoidRootPart") then
        if (HR.Position - v.HumanoidRootPart.Position).magnitude < 30 then
            local args = {
            [1] = HttpService:GenerateGUID(false),
            [2] = {
            [1] = {
            ["hitUnit"] = v
            }
            }
            }
            hitMobEvent:FireServer(unpack(args))
        end
    end
end
end

function killPlayersAura()
    for i,v in pairs(Players:GetPlayers()) do
        playerCharacter = v.Character
        if playerCharacter and playerCharacter:FindFirstChild("HumanoidRootPart") and (HR.Position - playerCharacter.HumanoidRootPart.Position).magnitude < 30 then
            local args = {
            [1] = HttpService:GenerateGUID(false),
            [2] = {
            [1] = {
            ["crit"] = true,
            ["hitUnit"] = playerCharacter
            }
            }
            }
            hitMobEvent:FireServer(unpack(args))
        end
    end
end

function round(number)
    return math.floor(number + 0.5)
end

function moveToCrop(Crop)
    randomCrop = getAllCrops(Crop)
    if randomCrop[1] then
    tween, Time = goToPoint(randomCrop[1].Position, 24)
    return tween, Time
    end
end

function rePlant(Crop)
local args = {
    [1] = {
        ["upperBlock"] = false,
        ["cframe"] = Crop.CFrame,
        ["player_tracking_category"] = "join_from_web",
        ["blockType"] = Crop.Name
    }
}
game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_PLACE_REQUEST:InvokeServer(unpack(args))
end

function sicklePlants(Crop)
    local Tool = getSickle()
    Crops = getCrops(Crop)
    local args = {
    [1] = Tool.Name,
    [2] = Crops
    }

    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.SwingSickle:InvokeServer(unpack(args))
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

function getCrops(Crop)
	local crops = {}
	for k,v in pairs(Island.Blocks:GetChildren()) do
	    if v.Name == Crop and Player:DistanceFromCharacter(v.Position) < 24 then
		    table.insert(crops, v)
        end
	end	

	table.sort(crops, function(t1, t2) 
		return Player:DistanceFromCharacter(t1.Position) < Player:DistanceFromCharacter(t2.Position) end)
	return crops
end

function getAllCrops(Crop)
    local crops = {}
	for k,v in pairs(Island.Blocks:GetChildren()) do
	    if v.Name == Crop and v.stage.Value == 3 then
		    table.insert(crops, v)
        end
	end
	return crops
end

if Island.Blocks then
Island.Blocks.ChildRemoved:Connect(function(child)
    if sickleFarming then
        wait(0.5)
        rePlant(child)
    end
end)
end

function getIslandEntities()
    local Entities = {}
    for i,v in pairs(Island.Entities:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") then
            table.insert(Entities, v)
        end
    end
    table.sort(Entities, function(t1, t2) 
		return Player:DistanceFromCharacter(t1.HumanoidRootPart.Position) < Player:DistanceFromCharacter(t2.HumanoidRootPart.Position) end)
    return Entities
end

function getChests()
    Chests = {}
    for i,v in pairs(Island.Blocks:GetChildren()) do
        if v.Name:find("chest") then
        table.insert(Chests, v)
        end
    end
    return Chests
end

function withdrawFromChest(chest)
    for i,b in pairs(chest.Contents:GetChildren()) do
        task.spawn(function()
        local args = {
        [1] = {
        ["chest"] = chest,
        ["player_tracking_category"] = "join_from_web",
        ["amount"] = b.Amount.Value,
        ["tool"] = b,
        ["action"] = "withdraw"
        }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_CHEST_TRANSACTION:InvokeServer(unpack(args))
        end)
    end
end

function getTrees()
	local trees = {}
	for k,v in pairs(Island.Blocks:GetChildren()) do
		local tree = v
		if (tree.Name:find("treePine") or 
	    	tree.Name:find("treeMaple") or
		    tree.Name:find("treeSpirit") or 
		    tree.Name:find("treeHickory") or
		    tree.Name:find("treeBirch") or
		    tree.Name:find("treeCherry") or
		    tree.Name == "tree1" or 
               tree.Name == "tree2" or 
		    tree.Name == "tree3" or 
		    tree.Name == "tree4") then
			table.insert(trees, tree)
		end
	end	

	table.sort(trees, function(t1, t2) 
		return Player:DistanceFromCharacter(t1.Position) < Player:DistanceFromCharacter(t2.Position) end)

	return trees
end

function hitTree(tree)
	local args = {
		[1] = {
			["player_tracking_category"] = "join_from_web",
			["part"] = tree:FindFirstChild("trunk"),
			["block"] = tree,
			["norm"] = nil,
			["pos"] = nil
		}
	}
	return game.ReplicatedStorage.rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
end

function halloweenShop(itemNumber, amount)
local args = {
    [1] = {
        ["merchant"] = "halloweenMercenary",
        ["offerId"] = itemNumber,
        ["amount"] = amount
    }
}
game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))

end

Toggled1 = false Toggled2 = false Toggled3 = false Toggled4 = false Toggled5 = false Toggled6 = false Toggled7 = false Toggled8 = false Toggled9 = false Toggled10 = false Toggled11 = false Toggled12 = false Toggled13 = false Toggled14 = false Toggled15 = false Toggled16 = false Toggled17 = false Toggled18 = false Toggled19 = false Toggled20 = false Toggled21 = false Toggled22 = false Toggled23 = false Toggled24 = false Toggled25 = false Toggled26 = false Toggled27 = false Toggled28 = false Toggled29 = false Toggled30 = false Toggled31 = false Toggled32 = false Toggled33 = false Toggled34 = false Toggled35 = false Toggled36 = false Toggled37 = false Toggled38 = false Toggled39 = false Toggled40 = false Toggled41 = false Toggled42 = false Toggled43 = false Toggled44 = false Toggled45 = false Toggled46 = false Toggled47 = false Toggled48 = false Toggled49 = false Toggled50 = false Toggled51 = false Toggled52 = false Toggled53 = false Toggled54 = false Toggled55 = false Toggled56 = false Toggled57 = false Toggled58 = false Toggled59 = false Toggled60 = false Toggled61 = false Toggled62 = false Toggled63 = false Toggled64 = false Toggled65 = false Toggled66 = false Toggled67 = false Toggled68 = false Toggled69 = false Toggled70 = false Toggled71 = false Toggled72 = false Toggled73 = false Toggled74 = false Toggled75 = false Toggled76 = false Toggled77 = false Toggled78 = false Toggled79 = false Toggled80 = false Toggled81 = false Toggled82 = false Toggled83 = false Toggled84 = false
Toggled85 = false Toggled86 = false Toggled87 = false KA = false pickingPlants = false RUN = false
backpackVisible = false -- i've forgotten to add a lot here and idk if its really that nessicary

   --destroy old gui if still active
   if game:GetService("CoreGui"):FindFirstChild("IGUI") then
       game.CoreGui.IGUI:Destroy()
   end

   CmdGui.Name = "IGUI"
   CmdGui.Parent = game:GetService("CoreGui")


Background.Name = "Background"
Background.Parent = CmdGui
Background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background.BorderSizePixel = 0
Background.BorderColor3 = Color3.new(1,0,1)
Background.Position = UDim2.new(0.06, 0, 0.20, 0)
Background.Size = UDim2.new(0, 120, 0, 275)
Background.Active = true

Background2 = Instance.new("Frame")
Background2.Name = "Background2"
Background2.Parent = Background
Background2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background2.BorderSizePixel = 0
Background2.BorderColor3 = Color3.new(1,0,1)
Background2.Position = UDim2.new(1, 0, 0.1, 0)
Background2.Size = UDim2.new(0, 150, 0, 165)
Background2.Active = true
Background2.Visible = false

Background4 = Instance.new("Frame")
Background4.Name = "Background4"
Background4.Parent = Background
Background4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background4.BorderSizePixel = 0
Background4.BorderColor3 = Color3.new(1,0,1)
Background4.Position = UDim2.new(1, 0, 0.1, 0)
Background4.Size = UDim2.new(0, 150, 0, 170)
Background4.Active = true
Background4.Visible = false

Background5 = Instance.new("Frame")
Background5.Name = "Background5"
Background5.Parent = Background
Background5.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background5.BorderSizePixel = 0
Background5.BorderColor3 = Color3.new(1,0,1)
Background5.Position = UDim2.new(1, 0, 0.3, 0)
Background5.Size = UDim2.new(0, 150, 0, 125)
Background5.Active = true
Background5.Visible = false

Background8 = Instance.new("Frame")
Background8.Name = "Players"
Background8.Parent = Background
Background8.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background8.BorderSizePixel = 0
Background8.BorderColor3 = Color3.new(1,0,1)
Background8.Position = UDim2.new(1, 0, 0.1, 0)
Background8.Size = UDim2.new(0, 150, 0, 190)
Background8.Active = true
Background8.Visible = false

Background7 = Instance.new("Frame")
Background7.Name = "Background"
Background7.Parent = Background8
Background7.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background7.BorderSizePixel = 0
Background7.BorderColor3 = Color3.new(1,0,1)
Background7.Position = UDim2.new(1, 0, 0.1, 0)
Background7.Size = UDim2.new(0, 120, 0, 190)
Background7.Active = true
Background7.Visible = false

Background9 = Instance.new("Frame")
Background9.Name = "Background9"
Background9.Parent = Background4
Background9.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background9.BorderSizePixel = 0
Background9.BorderColor3 = Color3.new(1,0,1)
Background9.Position = UDim2.new(1, 0, 0.1, 0)
Background9.Size = UDim2.new(0, 105, 0, 150)
Background9.Active = true
Background9.Visible = false

Background10 = Instance.new("Frame")
Background10.Name = "Background10"
Background10.Parent = Background
Background10.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background10.BorderSizePixel = 0
Background10.BorderColor3 = Color3.new(1,0,1)
Background10.Position = UDim2.new(1, 0, 0.05, 0)
Background10.Size = UDim2.new(0, 150, 0, 200)
Background10.Active = true
Background10.Visible = false

Background11 = Instance.new("Frame")
Background11.Name = "Background11"
Background11.Parent = Background
Background11.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background11.BorderSizePixel = 0
Background11.BorderColor3 = Color3.new(1,0,1)
Background11.Position = UDim2.new(1, 0, 0.05, 0)
Background11.Size = UDim2.new(0, 150, 0, 200)
Background11.Active = true
Background11.Visible = false

Background12 = Instance.new("Frame")
Background12.Name = "Background12"
Background12.Parent = Background
Background12.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background12.BorderSizePixel = 0
Background12.BorderColor3 = Color3.new(1,0,1)
Background12.Position = UDim2.new(1, 0, 0.05, 0)
Background12.Size = UDim2.new(0, 150, 0, 200)
Background12.Active = true
Background12.Visible = false

Playerz = Instance.new("TextLabel")
Playerz.Name = "Playrz"
Playerz.Parent = Background7
Playerz.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Playerz.BorderSizePixel = 0
Playerz.Size = UDim2.new(0, 120, 0, 15)
Playerz.Font = Enum.Font.GothamBlack
Playerz.Text = "Players"
Playerz.TextColor3 = Color3.fromRGB(255, 255, 255)
Playerz.TextScaled = true
Playerz.TextSize = 14.000
Playerz.TextWrapped = true

PlrCmdHandler = Instance.new("ScrollingFrame")
PlrCmdHandler.Name = "CmdHandler"
PlrCmdHandler.Parent = Background7
PlrCmdHandler.Active = true
PlrCmdHandler.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
PlrCmdHandler.BackgroundTransparency = 1.000
PlrCmdHandler.BorderSizePixel = 0
PlrCmdHandler.AutomaticCanvasSize = "Y"
PlrCmdHandler.Position = UDim2.new(0.05, 0, 0.08, 0)
PlrCmdHandler.Size = UDim2.new(0, 113, 0, 170)
PlrCmdHandler.ScrollBarThickness = 4

MachineHandler = Instance.new("ScrollingFrame")
MachineHandler.Name = "MachineHandler"
MachineHandler.Parent = Background8
MachineHandler.Active = true
MachineHandler.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
MachineHandler.BackgroundTransparency = 1.000
MachineHandler.BorderSizePixel = 0
MachineHandler.AutomaticCanvasSize = "Y"
MachineHandler.Position = UDim2.new(0, 0, 0, 0)
MachineHandler.Size = UDim2.new(0, 150, 0, 170)
MachineHandler.ScrollBarThickness = 6

CmdName.Name = "CmdName"
CmdName.AutoButtonColor = false
CmdName.Parent = Background
CmdName.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CmdName.BorderSizePixel = 0
CmdName.Size = UDim2.new(0, 87, 0, 15)
CmdName.Font = Enum.Font.GothamBlack
CmdName.Text = "Islands GUI"
CmdName.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdName.TextScaled = true
CmdName.TextSize = 14.000
CmdName.TextWrapped = true
Dragg = false

CmdName.MouseButton1Down:Connect(function()Dragg = true while Dragg do game.TweenService:Create(Background, TweenInfo.new(.06), {Position = UDim2.new(0,mouse.X-40,0,mouse.Y-5)}):Play()wait()end end)
CmdName.MouseButton1Up:Connect(function()Dragg = false end)

CmdHandler.Name = "CmdHandler"
CmdHandler.Parent = Background
CmdHandler.Active = true
CmdHandler.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler.BackgroundTransparency = 1.000
CmdHandler.BorderSizePixel = 0
CmdHandler.AutomaticCanvasSize = "Y"
CmdHandler.Position = UDim2.new(0, 5, 0, 19)
CmdHandler.Size = UDim2.new(0, 113, 0, 250)
CmdHandler.ScrollBarThickness = 4

local Grid = Instance.new("UIGridLayout")
Grid.CellSize = UDim2.new(0.95,0,0.095,0)
Grid.CellPadding = UDim2.new(0,1,0,5)
Grid.SortOrder = "LayoutOrder"
Grid.Parent = CmdGui.Background.CmdHandler

Close.Name = "Close"
Close.Parent = Background
Close.BackgroundColor3 = Color3.fromRGB(155, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.87, 0, 0.0001, 0)
Close.Size = UDim2.new(0, 15, 0, 15)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 14.000
Close.MouseButton1Click:Connect(function() Toggled1 = false Toggled2 = false Toggled3 = false Toggled4 = false Toggled5 = false Toggled6 = false Toggled7 = false Toggled8 = false Toggled9 = false Toggled10 = false Toggled11 = false Toggled12 = false Toggled13 = false Toggled14 = false Toggled15 = false Toggled16 = false Toggled17 = false Toggled18 = false Toggled19 = false Toggled20 = false Toggled21 = false Toggled22 = false Toggled23 = false Toggled24 = false Toggled25 = false Toggled26 = false Toggled27 = false Toggled28 = false Toggled29 = false Toggled30 = false Toggled31 = false Toggled32 = false Toggled33 = false Toggled34 = false Toggled35 = false Toggled36 = false Toggled37 = false Toggled38 = false Toggled39 = false Toggled40 = false Toggled41 = false Toggled42 = false Toggled43 = false Toggled44 = false Toggled45 = false Toggled46 = false Toggled47 = false Toggled48 = false Toggled49 = false Toggled50 = false Toggled51 = false Toggled52 = false Toggled53 = false Toggled54 = false Toggled55 = false Toggled56 = false Toggled57 = false Toggled58 = false Toggled59 = false Toggled60 = false Toggled61 = false Toggled62 = false Toggled63 = false Toggled64 = false Toggled65 = false Toggled66 = false Toggled67 = false Toggled68 = false Toggled69 = false Toggled70 = false Toggled71 = false Toggled72 = false Toggled73 = false Toggled74 = false Toggled75 = false Toggled76 = false Toggled77 = false Toggled78 = false Toggled79 = false Toggled80 = false Toggled81 = false Toggled82 = false Toggled83 = false Toggled84 = false
Toggled85 = false Toggled86 = false Toggled87 = false KA = false
fly = false
destroyOrbs = false
pickingPlants = false
backpackVisible = false
CmdGui:Destroy()
end)

Minimum.Name = "Minimum"
Minimum.Parent = Background
Minimum.BackgroundColor3 = Color3.fromRGB(0, 155, 155)
Minimum.BorderSizePixel = 0
Minimum.Position = UDim2.new(0.74, 0, 0.0001, 0)
Minimum.Size = UDim2.new(0, 15, 0, 14)
Minimum.Font = Enum.Font.SourceSans
Minimum.Text = "-"
Minimum.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimum.TextSize = 14.000
Minimum.MouseButton1Click:Connect(function()
	if Background.BackgroundTransparency == 0 then
		Background.BackgroundTransparency = 1
		Background2.Visible = false
		Background4.Visible = false
		Background5.Visible = false
		playersBackground.Visible = false
		Background7.Visible = false
		Background8.Visible = false
		Background9.Visible = false
		Background10.Visible = false
		Background11.Visible = false
		Background12.Visible = false
		Background.Size = UDim2.new(0, 120, 0, 25)
		CmdHandler.Visible = false
        Toggled8 = false
        Toggled5 = false
        Toggled6 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = false
        Toggled73 = false
	elseif Background.BackgroundTransparency == 1 then
		Background.BackgroundTransparency = 0
		Background.Size = UDim2.new(0, 120, 0, 275)
		CmdHandler.Visible = true
	end
end)

local v2Debounce = false
Item3 = Instance.new("TextButton")
Item3.Position = UDim2.new(0,1,0,341)
Item3.Size = UDim2.new(0,100,0,20)
Item3.BackgroundColor3 = Color3.new(0,0,1)
Item3.BorderColor3 = Color3.new(1,1,1)
Item3.ZIndex = 2
Item3.Text = "Islands GUI V2"
Item3.TextColor3 = Color3.fromRGB(250,250,250)
Item3.TextScaled = true
Item3.LayoutOrder = 10
Item3.Parent = CmdHandler
Item3.MouseButton1Click:Connect(function()
    if v2Debounce == false then
        v2Debounce = true
        Item3.Text = "Loading V2"
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ashlux/roblox-islands/main/roblox-islands-ui-v2.lua'))()
        task.wait()
        Item3.Text = "Islands GUI V2"
        v2Debounce = false
    end
end)

Copypaste = Instance.new("TextButton")
Copypaste.Position = UDim2.new(0,1,0,341)
Copypaste.Size = UDim2.new(0,100,0,20)
Copypaste.BackgroundColor3 = Color3.new(0,0,1)
Copypaste.BorderColor3 = Color3.new(1,1,1)
Copypaste.ZIndex = 2
Copypaste.Text = "Copy/Paste (Beta)"
Copypaste.TextColor3 = Color3.fromRGB(250,250,250)
Copypaste.TextScaled = true
Copypaste.LayoutOrder = 10
Copypaste.Parent = CmdHandler
Copypaste.MouseButton1Click:Connect(function()
    Copypaste.Text = "Loading"
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ashlux/roblox-islands/main/Useless-maybe/copyPasteBuilds.lua'))()
    task.wait()
    Copypaste.Text = "Copy/Paste (Beta)"
end)

Title = Instance.new("TextButton")
Title.Position = UDim2.new(0,1,0,101)
Title.Size = UDim2.new(0,100,0,20)
Title.BackgroundColor3 = Color3.new(0,0,1)
Title.BorderColor3 = Color3.new(1,1,1)
Title.ZIndex = 2
Title.LayoutOrder = 4
Title.Parent = CmdHandler
Title.Text = "Mob Farms >"
Title.TextColor3 = Color3.fromRGB(250,250,250)
Title.TextScaled = true

local BowBoss = Instance.new("TextButton") -- not bowboss anymore. now Trees
BowBoss.Position = UDim2.new(0,1,0,76)
BowBoss.Size = UDim2.new(0,100,0,20)
BowBoss.BackgroundColor3 = Color3.new(0,0,1)
BowBoss.BorderColor3 = Color3.new(1,1,1)
BowBoss.ZIndex = 2
BowBoss.LayoutOrder = 3
BowBoss.Parent = CmdHandler
BowBoss.Text = "Wood >"
BowBoss.TextColor3 = Color3.fromRGB(250,250,250)
BowBoss.TextScaled = true

local GUIs = Instance.new("TextButton")
GUIs.Position = UDim2.new(0,1,0,51)
GUIs.Size = UDim2.new(0,100,0,20)
GUIs.BackgroundColor3 = Color3.new(0,0,1)
GUIs.BorderColor3 = Color3.new(1,1,1)
GUIs.ZIndex = 2
GUIs.LayoutOrder = 2
GUIs.Parent = CmdHandler
GUIs.Text = "Players >"
GUIs.TextColor3 = Color3.fromRGB(250,250,250)
GUIs.TextScaled = true

playersBackground = Instance.new("Frame")
playersBackground.Name = "playersBackground"
playersBackground.Parent = Background
playersBackground.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
playersBackground.BorderSizePixel = 0
playersBackground.BorderColor3 = Color3.new(1,0,1)
playersBackground.Position = UDim2.new(1, 0, 0.1, 0)
playersBackground.Size = UDim2.new(0, 180, 0, 200)
playersBackground.Transparency = 0.5
playersBackground.Active = true
playersBackground.Visible = false

Hndl = Instance.new("ScrollingFrame")
Hndl.Name = "Hndl"
Hndl.Parent = playersBackground
Hndl.Active = true
Hndl.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Hndl.BackgroundTransparency = 1.000
Hndl.BorderSizePixel = 0
Hndl.AutomaticCanvasSize = "Y"
Hndl.Position = UDim2.new(0, 0, 0, 0)
Hndl.Size = UDim2.new(0, 180, 0, 200)
Hndl.ScrollBarThickness = 6

local plrGrid = Instance.new("UIGridLayout")
plrGrid.CellSize = UDim2.new(0.95,0,0,20)
plrGrid.CellPadding = UDim2.new(0,5,0,5)
plrGrid.SortOrder = "LayoutOrder"
plrGrid.Parent = Hndl

playersBackground2 = Instance.new("Frame")
playersBackground2.Name = "playersBackground2"
playersBackground2.Parent = playersBackground
playersBackground2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
playersBackground2.BorderSizePixel = 0
playersBackground2.BorderColor3 = Color3.new(1,0,1)
playersBackground2.Position = UDim2.new(1, 0, 0.1, 0)
playersBackground2.Size = UDim2.new(0, 200, 0, 250)
playersBackground2.Transparency = 0.5
playersBackground2.Active = true
playersBackground2.Visible = false

Hndl2 = Instance.new("ScrollingFrame")
Hndl2.Name = "Hndl2"
Hndl2.Parent = playersBackground2
Hndl2.Active = true
Hndl2.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Hndl2.BackgroundTransparency = 1.000
Hndl2.BorderSizePixel = 0
Hndl2.AutomaticCanvasSize = "Y"
Hndl2.Position = UDim2.new(0, 0, 0, 0)
Hndl2.Size = UDim2.new(0, 200, 0, 240)
Hndl2.ScrollBarThickness = 6

plrGrid2 = Instance.new("UIGridLayout")
plrGrid2.CellSize = UDim2.new(0.95,0,0,20)
plrGrid2.CellPadding = UDim2.new(0,5,0,5)
plrGrid2.SortOrder = "LayoutOrder"
plrGrid2.Parent = Hndl2

playersBackground3 = Instance.new("Frame")
playersBackground3.Name = "playersBackground3"
playersBackground3.Parent = playersBackground2
playersBackground3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
playersBackground3.BorderSizePixel = 0
playersBackground3.BorderColor3 = Color3.new(1,0,1)
playersBackground3.Position = UDim2.new(1, 0, 0, 0)
playersBackground3.Size = UDim2.new(0, 200, 0, 250)
playersBackground3.Transparency = 0.5
playersBackground3.Active = true
playersBackground3.Visible = false

searchBackpack = Instance.new("TextBox")
searchBackpack.Size = UDim2.new(1,0,0,20)
searchBackpack.BackgroundColor3 = Color3.fromRGB(50,50,50)
searchBackpack.Position = UDim2.new(0,0,0,-21)
searchBackpack.BorderColor3 = Color3.new(1,1,1)
searchBackpack.ZIndex = 2
searchBackpack.Parent = playersBackground3
searchBackpack.Text = ""
searchBackpack.PlaceholderText = "Search"
searchBackpack.TextColor3 = Color3.new(1,1,1)
searchBackpack.TextScaled = true
searchBackpack.BackgroundTransparency = 0.3

function updateBackpack()
    local inputText = string.upper(searchBackpack.Text)
    for _,button in pairs(Hndl3:GetChildren()) do
        if button:IsA("TextLabel") then
            if inputText == "" or string.find(string.upper(button.Name),inputText) ~= nil then
                button.Visible = true
            else
                button.Visible = false
            end
        end
    end
end
searchBackpack.Changed:Connect(updateBackpack)

Hndl3 = Instance.new("ScrollingFrame")
Hndl3.Name = "Hndl3"
Hndl3.Parent = playersBackground3
Hndl3.Active = true
Hndl3.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Hndl3.BackgroundTransparency = 1.000
Hndl3.BorderSizePixel = 0
Hndl3.AutomaticCanvasSize = "Y"
Hndl3.Position = UDim2.new(0, 0, 0, 0)
Hndl3.Size = UDim2.new(0, 200, 0, 240)
Hndl3.ScrollBarThickness = 6

plrGrid3 = Instance.new("UIGridLayout")
plrGrid3.CellSize = UDim2.new(0.95,0,0,20)
plrGrid3.CellPadding = UDim2.new(0,5,0,5)
plrGrid3.SortOrder = "Name"
plrGrid3.Parent = Hndl3

function fillBackpackBackground(player) -- Background = Hndl3
    for i,v in pairs(player.Backpack:GetChildren()) do
        local personBackpackLabel = Instance.new("TextLabel")
        personBackpackLabel.Name = tostring(v.DisplayName.Value)
        personBackpackLabel.BackgroundColor3 = Color3.fromRGB(50,50,50)
        personBackpackLabel.BorderColor3 = Color3.new(1,1,1)
        personBackpackLabel.ZIndex = 2
        personBackpackLabel.Parent = Hndl3
        personBackpackLabel.Text = tostring(v.DisplayName.Value).." - "..tostring(v.Amount.Value)
        personBackpackLabel.TextColor3 = Color3.new(1,1,1)
        personBackpackLabel.TextScaled = true
        personBackpackLabel.BackgroundTransparency = 0.6
    end
end

function ClearBackpackBackground()
    for i,v in pairs(Hndl3:GetChildren()) do
        if v:IsA("TextButton") or v:IsA("TextLabel") then
            v:Destroy()
        end
    end
end

local function clearList()
    ClearBackpackBackground()
    for i,v in pairs(Hndl2:GetChildren()) do
        if v:IsA("TextButton") or v:IsA("TextLabel") then
            v:Destroy()
        end
    end
end

local function removeName(person)
    for i,v in pairs(Hndl:GetChildren()) do
        if v:IsA("TextButton") and v.Text == person.Name then
            v:Destroy()
        end
    end
end

local function createPlayerInfoMenu(person)
	local function getPlayer(name)
		return Players:findFirstChild(name)
	end

	local function getPlayerXp(name)
		local xp = {}
		local player = getPlayer(name)
		for _, xpDetails in pairs(name and player:GetChildren() or {}) do
			local xpGained = xpDetails:FindFirstChild("ExperienceGained")
			local xpLevel = xpDetails:FindFirstChild("StartLevel")
			
			if xpGained and xpLevel then
				table.insert(xp, {name = xpLevel.Parent.Name, points = xpGained.Value, level = xpLevel.Value})
			end
		end
		return xp
	end

	local function getPlayerCoins(name)
		local player = getPlayer(name)
		--local coins = player and player.leaderstats and player.leaderstats.Coins
		return coins and coins.Value or 0
	end

	local function getPlayerMetaInfo(name)
		local player = getPlayer(name)
		local metaInfo = {}
		for k,v in pairs(Players.LocalPlayer:GetChildren()) do
			if (v:IsA("BoolValue") or v:IsA("IntValue") or v:isA("StringValue")) then
				table.insert(metaInfo, {name = v.Name, value = v.Value})
			end
		end
		return metaInfo
	end

    for i,v in pairs(Players:GetPlayers()) do
        if v.Name == person then
            local tradePerson = Instance.new("TextButton")
            tradePerson.Size = UDim2.new(0,100,0,20)
            tradePerson.BackgroundColor3 = Color3.fromRGB(50,50,50)
            tradePerson.BorderColor3 = Color3.new(1,1,1)
            tradePerson.ZIndex = 2
            tradePerson.Parent = Hndl2
            tradePerson.Text = "Send trade to - "..v.Name
            tradePerson.TextColor3 = Color3.new(1,1,1)
            tradePerson.TextScaled = true
            tradePerson.BackgroundTransparency = 0.3
            tradePerson.MouseButton1Click:Connect(function()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["targetUserId"] = v.UserId
                }
                }
                }
                sendTrade:FireServer(unpack(args))
            end)
            
            backpackShower = Instance.new("TextButton")
            backpackShower.Size = UDim2.new(0,100,0,20)
            backpackShower.BackgroundColor3 = Color3.fromRGB(50,50,50)
            backpackShower.BorderColor3 = Color3.new(1,1,1)
            backpackShower.ZIndex = 2
            backpackShower.Parent = Hndl2
            backpackShower.Text = "Show Backpack >"
            backpackShower.TextColor3 = Color3.new(1,1,1)
            backpackShower.TextScaled = true
            backpackShower.BackgroundTransparency = 0.3
            backpackShower.MouseButton1Click:Connect(function()
                if backpackVisible == true then
                    backpackVisible = false
                    playersBackground3.Visible = false
                    backpackShower.Text = "Show Backpack >"
                    ClearBackpackBackground()
                else
                    backpackVisible = true
                    playersBackground3.Visible = true
                    backpackShower.Text = "Hide Backpack <"
                    fillBackpackBackground(v)
                end
            end)

			local playerCoins = getPlayerCoins(person)
			local personCoinsLabel = Instance.new("TextLabel")
            personCoinsLabel.BackgroundColor3 = Color3.fromRGB(50,60,50)
            personCoinsLabel.BorderColor3 = Color3.new(1,1,1)
            personCoinsLabel.ZIndex = 2
            personCoinsLabel.Parent = Hndl2
            personCoinsLabel.Text = "Coins - N/A"-- .. tostring(addComma(playerCoins))
            personCoinsLabel.TextColor3 = Color3.new(1,1,1)
            personCoinsLabel.TextScaled = true
            personCoinsLabel.BackgroundTransparency = 0.6
			
			local playerMetaInfo = getPlayerMetaInfo(person)
			for _,metaInfo in pairs(playerMetaInfo) do
				if metaInfo.name ~= "MountedAnimalUUID" or 
				   metaInfo.Name ~= "UnlockedRecipies" then
				   
					local personInfoLabel = Instance.new("TextLabel")
                    personInfoLabel.BackgroundColor3 = Color3.fromRGB(50,50,50)
                    personInfoLabel.BorderColor3 = Color3.new(1,1,1)
                    personInfoLabel.ZIndex = 2
                    personInfoLabel.Parent = Hndl2
                    personInfoLabel.Text = metaInfo.name .. " - " .. tostring(metaInfo.value)
                    personInfoLabel.TextColor3 = Color3.new(1,1,1)
                    personInfoLabel.TextScaled = true
                    personInfoLabel.BackgroundTransparency = 0.6
					
                end    
            end
			
			local playerXp = getPlayerXp(person)
			for _,xp in pairs(playerXp) do
				local personXpLabel = Instance.new("TextLabel")
				personXpLabel.BackgroundColor3 = Color3.fromRGB(50,50,60)
				personXpLabel.BorderColor3 = Color3.new(1,1,1)
				personXpLabel.ZIndex = 2
				personXpLabel.Parent = Hndl2
				personXpLabel.Text = xp.name .. " - " .. tostring(xp.level) .. " (" .. tostring(xp.points) .. ")"
				personXpLabel.TextColor3 = Color3.new(1,1,1)
				personXpLabel.TextScaled = true
				personXpLabel.BackgroundTransparency = 0.6
            end
		end
    end
end

local sameName = ""

Players.PlayerAdded:Connect(function(plr)
    local person = Instance.new("TextButton")
    person.Size = UDim2.new(0,100,0,20)
    person.BackgroundColor3 = Color3.fromRGB(50,50,50)
    person.BorderColor3 = Color3.new(1,1,1)
    person.ZIndex = 2
    person.Parent = Hndl
    person.Text = plr.Name
    person.TextColor3 = Color3.new(1,1,1)
    person.TextScaled = true
    person.BackgroundTransparency = 0.3
    person.MouseButton1Click:Connect(function()
        if sameName == plr.Name then
            playersBackground2.Visible = false
            playersBackground3.Visible = false
            backpackVisible = false
            sameName = ""
        else
            sameName = plr.Name
            clearList()
            createPlayerInfoMenu(plr.Name)
            playersBackground2.Visible = true
        end
    end)
    
end)

for i,v in pairs(Players:GetPlayers()) do
    local person = Instance.new("TextButton")
    person.Position = UDim2.new(0,1,0,42)
    person.Size = UDim2.new(0,100,0,20)
    person.BackgroundColor3 = Color3.fromRGB(50,50,50)
    person.BorderColor3 = Color3.new(1,1,1)
    person.ZIndex = 2
    person.Parent = Hndl
    person.Text = v.Name
    person.TextColor3 = Color3.new(1,1,1)
    person.TextScaled = true
    person.BackgroundTransparency = 0.3
    person.MouseButton1Click:Connect(function()
        if sameName == v.Name then
            playersBackground2.Visible = false
            playersBackground3.Visible = false
            backpackVisible = false
            sameName = ""
        else
            sameName = v.Name
            clearList()
            createPlayerInfoMenu(v.Name)
            playersBackground2.Visible = true
        end
    end)
end

Players.PlayerRemoving:Connect(function(plr)
    removeName(plr)
end)


local Teleports = Instance.new("TextButton")
Teleports.Position = UDim2.new(0,1,0,243)
Teleports.Size = UDim2.new(0,100,0,20)
Teleports.BackgroundColor3 = Color3.new(0,0,1)
Teleports.BorderColor3 = Color3.new(1,1,1)
Teleports.ZIndex = 2
Teleports.Parent = CmdHandler
Teleports.Text = "Teleports >"
Teleports.TextColor3 = Color3.fromRGB(250,250,250)
Teleports.TextScaled = true
Teleports.Visible = false


local CmdHandler7 = Instance.new("ScrollingFrame")
CmdHandler7.Name = "CmdHandler7"
CmdHandler7.Parent = Background10
CmdHandler7.Active = true
CmdHandler7.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler7.BackgroundTransparency = 1.000
CmdHandler7.BorderSizePixel = 0
CmdHandler7.AutomaticCanvasSize = "Y"
CmdHandler7.Position = UDim2.new(0, 1, 0, 1)
CmdHandler7.Size = UDim2.new(0, 148, 0, 195)
CmdHandler7.ScrollBarThickness = 8

local CmdHandler8 = Instance.new("ScrollingFrame")
CmdHandler8.Name = "CmdHandler8"
CmdHandler8.Parent = Background11
CmdHandler8.Active = true
CmdHandler8.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler8.BackgroundTransparency = 1.000
CmdHandler8.BorderSizePixel = 0
CmdHandler8.AutomaticCanvasSize = "Y"
CmdHandler8.Position = UDim2.new(0, 1, 0, 1)
CmdHandler8.Size = UDim2.new(0, 148, 0, 195)
CmdHandler8.ScrollBarThickness = 8

local Lunar = Instance.new("Frame")
Lunar.Name = "Lunar"
Lunar.Parent = Background11
Lunar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Lunar.BorderSizePixel = 0
Lunar.BorderColor3 = Color3.new(1,0,1)
Lunar.Position = UDim2.new(1, 0, 0.05, 0)
Lunar.Size = UDim2.new(0, 150, 0, 200)
Lunar.Active = true
Lunar.Visible = false

local LunarScroll = Instance.new("ScrollingFrame")
LunarScroll.Name = "LunarScroll"
LunarScroll.Parent = Lunar
LunarScroll.Active = true
LunarScroll.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
LunarScroll.BackgroundTransparency = 1.000
LunarScroll.BorderSizePixel = 0
LunarScroll.AutomaticCanvasSize = "Y"
LunarScroll.Position = UDim2.new(0, 1, 0, 1)
LunarScroll.Size = UDim2.new(0, 148, 0, 195)
LunarScroll.ScrollBarThickness = 8

local Cletus = Instance.new("Frame")
Cletus.Name = "Tom"
Cletus.Parent = Background11
Cletus.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Cletus.BorderSizePixel = 0
Cletus.BorderColor3 = Color3.new(1,0,1)
Cletus.Position = UDim2.new(1, 0, 0.05, 0)
Cletus.Size = UDim2.new(0, 150, 0, 200)
Cletus.Active = true
Cletus.Visible = false

local CletusScroll = Instance.new("ScrollingFrame")
CletusScroll.Name = "CletusScroll"
CletusScroll.Parent = Cletus
CletusScroll.Active = true
CletusScroll.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CletusScroll.BackgroundTransparency = 1.000
CletusScroll.BorderSizePixel = 0
CletusScroll.AutomaticCanvasSize = "Y"
CletusScroll.Position = UDim2.new(0, 1, 0, 1)
CletusScroll.Size = UDim2.new(0, 148, 0, 195)
CletusScroll.ScrollBarThickness = 8

local CA = Instance.new("TextBox")
CA.Position = UDim2.new(0,20,0,0)
CA.Size = UDim2.new(0,100,0,20)
CA.BackgroundColor3 = Color3.fromRGB(50,50,50)
CA.BorderSizePixel = 1
CA.BorderColor3 = Color3.new(1,1,1)
CA.ZIndex = 2
CA.Parent = CletusScroll
CA.Text = ""
CA.PlaceholderText = "Enter Amount"
CA.TextColor3 = Color3.fromRGB(250,250,250)
CA.TextScaled = true

local C1 = Instance.new("TextButton")
C1.Position = UDim2.new(0,1,0,21)
C1.Size = UDim2.new(0,140,0,20)
C1.BackgroundColor3 = Color3.fromRGB(0,0,250)
C1.BorderSizePixel = 1
C1.BorderColor3 = Color3.new(1,1,1)
C1.ZIndex = 2
C1.Parent = CletusScroll
C1.Text = "Wheat Seeds"
C1.TextColor3 = Color3.fromRGB(250,250,250)
C1.TextScaled = true
C1.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 101,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C2 = Instance.new("TextButton")
C2.Position = UDim2.new(0,1,0,42)
C2.Size = UDim2.new(0,140,0,20)
C2.BackgroundColor3 = Color3.fromRGB(0,0,250)
C2.BorderSizePixel = 1
C2.BorderColor3 = Color3.new(1,1,1)
C2.ZIndex = 2
C2.Parent = CletusScroll
C2.Text = "Tomato Seeds"
C2.TextColor3 = Color3.fromRGB(250,250,250)
C2.TextScaled = true
C2.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 102,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C3 = Instance.new("TextButton")
C3.Position = UDim2.new(0,1,0,63)
C3.Size = UDim2.new(0,140,0,20)
C3.BackgroundColor3 = Color3.fromRGB(0,0,250)
C3.BorderSizePixel = 1
C3.BorderColor3 = Color3.new(1,1,1)
C3.ZIndex = 2
C3.Parent = CletusScroll
C3.Text = "Potato Seeds"
C3.TextColor3 = Color3.fromRGB(250,250,250)
C3.TextScaled = true
C3.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 103,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C4 = Instance.new("TextButton")
C4.Position = UDim2.new(0,1,0,84)
C4.Size = UDim2.new(0,140,0,20)
C4.BackgroundColor3 = Color3.fromRGB(0,0,250)
C4.BorderSizePixel = 1
C4.BorderColor3 = Color3.new(1,1,1)
C4.ZIndex = 2
C4.Parent = CletusScroll
C4.Text = "Carrot Seeds"
C4.TextColor3 = Color3.fromRGB(250,250,250)
C4.TextScaled = true
C4.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 104,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C5 = Instance.new("TextButton")
C5.Position = UDim2.new(0,1,0,105)
C5.Size = UDim2.new(0,140,0,20)
C5.BackgroundColor3 = Color3.fromRGB(0,0,250)
C5.BorderSizePixel = 1
C5.BorderColor3 = Color3.new(1,1,1)
C5.ZIndex = 2
C5.Parent = CletusScroll
C5.Text = "Spinach Seeds"
C5.TextColor3 = Color3.fromRGB(250,250,250)
C5.TextScaled = true
C5.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 105,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C6 = Instance.new("TextButton")
C6.Position = UDim2.new(0,1,0,126)
C6.Size = UDim2.new(0,140,0,20)
C6.BackgroundColor3 = Color3.fromRGB(0,0,250)
C6.BorderSizePixel = 1
C6.BorderColor3 = Color3.new(1,1,1)
C6.ZIndex = 2
C6.Parent = CletusScroll
C6.Text = "Onion Seeds"
C6.TextColor3 = Color3.fromRGB(250,250,250)
C6.TextScaled = true
C6.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 106,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C7 = Instance.new("TextButton")
C7.Position = UDim2.new(0,1,0,147)
C7.Size = UDim2.new(0,140,0,20)
C7.BackgroundColor3 = Color3.fromRGB(0,0,250)
C7.BorderSizePixel = 1
C7.BorderColor3 = Color3.new(1,1,1)
C7.ZIndex = 2
C7.Parent = CletusScroll
C7.Text = "Grape Seeds"
C7.TextColor3 = Color3.fromRGB(250,250,250)
C7.TextScaled = true
C7.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 107,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C8 = Instance.new("TextButton")
C8.Position = UDim2.new(0,1,0,168)
C8.Size = UDim2.new(0,140,0,20)
C8.BackgroundColor3 = Color3.fromRGB(0,0,250)
C8.BorderSizePixel = 1
C8.BorderColor3 = Color3.new(1,1,1)
C8.ZIndex = 2
C8.Parent = CletusScroll
C8.Text = "Cactus Seeds"
C8.TextColor3 = Color3.fromRGB(250,250,250)
C8.TextScaled = true
C8.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 108,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C9 = Instance.new("TextButton")
C9.Position = UDim2.new(0,1,0,189)
C9.Size = UDim2.new(0,140,0,20)
C9.BackgroundColor3 = Color3.fromRGB(0,0,250)
C9.BorderSizePixel = 1
C9.BorderColor3 = Color3.new(1,1,1)
C9.ZIndex = 2
C9.Parent = CletusScroll
C9.Text = "Rice Seeds"
C9.TextColor3 = Color3.fromRGB(250,250,250)
C9.TextScaled = true
C9.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 109,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C10 = Instance.new("TextButton")
C10.Position = UDim2.new(0,1,0,210)
C10.Size = UDim2.new(0,140,0,20)
C10.BackgroundColor3 = Color3.fromRGB(0,0,250)
C10.BorderSizePixel = 1
C10.BorderColor3 = Color3.new(1,1,1)
C10.ZIndex = 2
C10.Parent = CletusScroll
C10.Text = "Dragon Fruit Seeds"
C10.TextColor3 = Color3.fromRGB(250,250,250)
C10.TextScaled = true
C10.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 110,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C11 = Instance.new("TextButton")
C11.Position = UDim2.new(0,1,0,231)
C11.Size = UDim2.new(0,140,0,20)
C11.BackgroundColor3 = Color3.fromRGB(0,0,250)
C11.BorderSizePixel = 1
C11.BorderColor3 = Color3.new(1,1,1)
C11.ZIndex = 2
C11.Parent = CletusScroll
C11.Text = "Melon (3/Day)"
C11.TextColor3 = Color3.fromRGB(250,250,250)
C11.TextScaled = true
C11.MouseButton1Click:Connect(function()
    args = {
    [1] = {
    ["merchant"] = "melon_shop",
    ["offerId"] = 2,
    ["amount"] = 3
    }}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
end)

local C12 = Instance.new("TextButton")
C12.Position = UDim2.new(0,1,0,252)
C12.Size = UDim2.new(0,140,0,20)
C12.BackgroundColor3 = Color3.fromRGB(0,0,250)
C12.BorderSizePixel = 1
C12.BorderColor3 = Color3.new(1,1,1)
C12.ZIndex = 2
C12.Parent = CletusScroll
C12.Text = "Pineapple (6/Day)"
C12.TextColor3 = Color3.fromRGB(250,250,250)
C12.TextScaled = true
C12.MouseButton1Click:Connect(function()
    args = {
    [1] = {
    ["merchant"] = "spring_shop_pineapple",
    ["offerId"] = 2,
    ["amount"] = 6
    }}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
end)

local C13 = Instance.new("TextButton")
C13.Position = UDim2.new(0,1,0,273)
C13.Size = UDim2.new(0,140,0,20)
C13.BackgroundColor3 = Color3.fromRGB(0,0,250)
C13.BorderSizePixel = 1
C13.BorderColor3 = Color3.new(1,1,1)
C13.ZIndex = 2
C13.Parent = CletusScroll
C13.Text = "Radish (8/Day)"
C13.TextColor3 = Color3.fromRGB(250,250,250)
C13.TextScaled = true
C13.MouseButton1Click:Connect(function()
    args = {
    [1] = {
    ["merchant"] = "spring_shop_radish",
    ["offerId"] = 10,
    ["amount"] = 8
    }}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
end)

local C13 = Instance.new("TextButton")
C13.Position = UDim2.new(0,1,0,294)
C13.Size = UDim2.new(0,140,0,20)
C13.BackgroundColor3 = Color3.fromRGB(0,0,250)
C13.BorderSizePixel = 1
C13.BorderColor3 = Color3.new(1,1,1)
C13.ZIndex = 2
C13.Parent = CletusScroll
C13.Text = "Pumpkins (4/Day)"
C13.TextColor3 = Color3.fromRGB(250,250,250)
C13.TextScaled = true
C13.MouseButton1Click:Connect(function()
    args = {
    [1] = {
    ["merchant"] = "autumn_shop",
    ["offerId"] = 10,
    ["amount"] = 4
    }}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
end)

local Wholesaler = Instance.new("Frame")
Wholesaler.Name = "Wholesaler"
Wholesaler.Parent = Background11
Wholesaler.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Wholesaler.BorderSizePixel = 0
Wholesaler.BorderColor3 = Color3.new(1,0,1)
Wholesaler.Position = UDim2.new(1, 0, 0.05, 0)
Wholesaler.Size = UDim2.new(0, 150, 0, 200)
Wholesaler.Active = true
Wholesaler.Visible = false

local WholesalerScroll = Instance.new("ScrollingFrame")
WholesalerScroll.Name = "WholesalerScroll"
WholesalerScroll.Parent = Wholesaler
WholesalerScroll.Active = true
WholesalerScroll.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
WholesalerScroll.BackgroundTransparency = 1.000
WholesalerScroll.BorderSizePixel = 0
WholesalerScroll.AutomaticCanvasSize = "Y"
WholesalerScroll.Position = UDim2.new(0, 1, 0, 1)
WholesalerScroll.Size = UDim2.new(0, 148, 0, 195)
WholesalerScroll.ScrollBarThickness = 8

local WSA = Instance.new("TextBox")
WSA.Position = UDim2.new(0,20,0,0)
WSA.Size = UDim2.new(0,100,0,20)
WSA.BackgroundColor3 = Color3.fromRGB(50,50,50)
WSA.BorderSizePixel = 1
WSA.BorderColor3 = Color3.new(1,1,1)
WSA.ZIndex = 2
WSA.Parent = WholesalerScroll
WSA.Text = ""
WSA.PlaceholderText = "Enter Amount"
WSA.TextColor3 = Color3.fromRGB(250,250,250)
WSA.TextScaled = true

local WSWarning = Instance.new("TextLabel")
WSWarning.Position = UDim2.new(0,1,0,21)
WSWarning.Size = UDim2.new(0,140,0,20)
WSWarning.BackgroundColor3 = Color3.fromRGB(0,0,0)
WSWarning.BorderSizePixel = 0
WSWarning.BorderColor3 = Color3.new(1,1,1)
WSWarning.ZIndex = 2
WSWarning.Parent = WholesalerScroll
WSWarning.Text = "For SELLING crates"
WSWarning.TextColor3 = Color3.fromRGB(250,250,250)
WSWarning.TextScaled = true

local WS1 = Instance.new("TextButton")
WS1.Position = UDim2.new(0,1,0,42)
WS1.Size = UDim2.new(0,140,0,20)
WS1.BackgroundColor3 = Color3.fromRGB(0,0,250)
WS1.BorderSizePixel = 1
WS1.BorderColor3 = Color3.new(1,1,1)
WS1.ZIndex = 2
WS1.Parent = WholesalerScroll
WS1.Text = "Large Melon Crates"
WS1.TextColor3 = Color3.fromRGB(250,250,250)
WS1.TextScaled = true
WS1.MouseButton1Click:Connect(function()
    args = {
    [1] = {
    ["merchant"] = "autumn_shop",
    ["offerId"] = 170,
    ["amount"] = tonumber(WSA.Text)
    }}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
end)

local WS2 = Instance.new("TextButton")
WS2.Position = UDim2.new(0,1,0,64)
WS2.Size = UDim2.new(0,140,0,20)
WS2.BackgroundColor3 = Color3.fromRGB(0,0,250)
WS2.BorderSizePixel = 1
WS2.BorderColor3 = Color3.new(1,1,1)
WS2.ZIndex = 2
WS2.Parent = WholesalerScroll
WS2.Text = "Large Pineapple Crates"
WS2.TextColor3 = Color3.fromRGB(250,250,250)
WS2.TextScaled = true
WS2.MouseButton1Click:Connect(function()
    args = {
    [1] = {
    ["merchant"] = "autumn_shop",
    ["offerId"] = 171,
    ["amount"] = tonumber(WSA.Text)
    }}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
end)

local halloweenVendor = Instance.new("Frame")
halloweenVendor.Name = "halloweenVendor"
halloweenVendor.Parent = Background11
halloweenVendor.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
halloweenVendor.BorderSizePixel = 0
halloweenVendor.BorderColor3 = Color3.new(1,0,1)
halloweenVendor.Position = UDim2.new(1, 0, 0.05, 0)
halloweenVendor.Size = UDim2.new(0, 150, 0, 200)
halloweenVendor.Active = true
halloweenVendor.Visible = false

local halloweenVendorScroll = Instance.new("ScrollingFrame")
halloweenVendorScroll.Name = "WholesalerScroll"
halloweenVendorScroll.Parent = halloweenVendor
halloweenVendorScroll.Active = true
halloweenVendorScroll.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
halloweenVendorScroll.BackgroundTransparency = 1.000
halloweenVendorScroll.BorderSizePixel = 0
halloweenVendorScroll.AutomaticCanvasSize = "Y"
halloweenVendorScroll.Position = UDim2.new(0, 1, 0, 1)
halloweenVendorScroll.Size = UDim2.new(0, 148, 0, 195)
halloweenVendorScroll.ScrollBarThickness = 8

halloweenItems = {"Tall Fire Chalice", "Small Fire Chalice", "Skull Gate", "Standing Opened Coffin", "Standing Closed Coffin", "Lying Opened Coffin", "Lying Closed Coffin", "Gravestone", "Gravestone(2)", "Gravestone(3)", "Pumpkin Candle", "Pumpkin Happy", "Pumpkin Angry", "Long Crossbow Bolt", "Cauldron", "Green Eyed Scarecrow", "Yellow Eyed Scarecrow"}
NaMe = 0
YPos = 21
for i,v in pairs(halloweenItems) do
    Spoopy = Instance.new("TextButton")
    Spoopy.Name = v
    Spoopy.Position = UDim2.new(0,1,0,YPos)
    Spoopy.Size = UDim2.new(0,140,0,20)
    Spoopy.BackgroundColor3 = Color3.fromRGB(50,50,50)
    Spoopy.BorderColor3 = Color3.new(1,1,1)
    Spoopy.ZIndex = 2
    Spoopy.Parent = halloweenVendorScroll
    Spoopy.Text = v
    Spoopy.TextColor3 = Color3.fromRGB(0,250,0)
    Spoopy.TextScaled = true
    NaMe = NaMe + 1
    YPos = YPos + 20
end

local HWA = Instance.new("TextBox")
HWA.Position = UDim2.new(0,20,0,0)
HWA.Size = UDim2.new(0,100,0,20)
HWA.BackgroundColor3 = Color3.fromRGB(50,50,50)
HWA.BorderSizePixel = 1
HWA.BorderColor3 = Color3.new(1,1,1)
HWA.ZIndex = 2
HWA.Parent = halloweenVendorScroll
HWA.Text = ""
HWA.PlaceholderText = "Enter Amount"
HWA.TextColor3 = Color3.fromRGB(250,250,250)
HWA.TextScaled = true

for i,v in pairs(halloweenVendorScroll:GetChildren()) do
    if not v:IsA("TextBox") then
    v.MouseButton1Click:Connect(function()
        halloweenShop(i, tonumber(HWA.Text))
    end)
    end
end

local N0 = Instance.new("TextLabel")
N0.Position = UDim2.new(0,0,0,0)
N0.Size = UDim2.new(0,150,0,15)
N0.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
N0.BorderColor3 = Color3.fromRGB(25, 25, 25)
N0.ZIndex = 2
N0.Parent = CmdHandler7
N0.Text = "Sickle Farm"
N0.TextColor3 = Color3.fromRGB(2,2,2)
N0.TextScaled = true

local N3 = Instance.new("TextLabel")
N3.Position = UDim2.new(0,0,0,85)
N3.Size = UDim2.new(0,150,0,15)
N3.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
N3.BorderColor3 = Color3.fromRGB(25, 25, 25)
N3.ZIndex = 2
N3.Parent = CmdHandler7
N3.Text = "Fruit Farm"
N3.TextColor3 = Color3.fromRGB(2,2,2)
N3.TextScaled = true

local N1 = Instance.new("TextLabel")
N1.Position = UDim2.new(0,0,0,150)
N1.Size = UDim2.new(0,150,0,15)
N1.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
N1.BorderColor3 = Color3.fromRGB(25, 25, 25)
N1.ZIndex = 2
N1.Parent = CmdHandler7
N1.Text = "Farm Stuff"
N1.TextColor3 = Color3.fromRGB(2,2,2)
N1.TextScaled = true

local N2 = Instance.new("TextLabel")
N2.Position = UDim2.new(0,0,0,320)
N2.Size = UDim2.new(0,150,0,15)
N2.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
N2.BorderColor3 = Color3.fromRGB(25, 25, 25)
N2.ZIndex = 2
N2.Parent = CmdHandler7
N2.Text = "Wilderness Islands"
N2.TextColor3 = Color3.fromRGB(2,2,2)
N2.TextScaled = true

local CmdHandler3 = Instance.new("ScrollingFrame")
CmdHandler3.Name = "CmdHandler3"
CmdHandler3.Parent = Background4
CmdHandler3.Active = true
CmdHandler3.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler3.BackgroundTransparency = 1.000
CmdHandler3.BorderSizePixel = 0
CmdHandler3.AutomaticCanvasSize = "Y"
CmdHandler3.Position = UDim2.new(0, 1, 0, 1)
CmdHandler3.Size = UDim2.new(0, 148, 0, 165)
CmdHandler3.ScrollBarThickness = 8

local CmdHandler4 = Instance.new("ScrollingFrame")
CmdHandler4.Name = "CmdHandler4"
CmdHandler4.Parent = Background2
CmdHandler4.Active = true
CmdHandler4.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler4.BackgroundTransparency = 1.000
CmdHandler4.BorderSizePixel = 0
CmdHandler4.AutomaticCanvasSize = "Y"
CmdHandler4.Position = UDim2.new(0, 1, 0, 1)
CmdHandler4.Size = UDim2.new(0, 148, 0, 165)
CmdHandler4.ScrollBarThickness = 8

local CmdHandler5 = Instance.new("ScrollingFrame")
CmdHandler5.Name = "CmdHandler5"
CmdHandler5.Parent = Background5
CmdHandler5.Active = true
CmdHandler5.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler5.BackgroundTransparency = 1.000
CmdHandler5.BorderSizePixel = 0
CmdHandler5.AutomaticCanvasSize = "Y"
CmdHandler5.Position = UDim2.new(0, 1, 0, 1)
CmdHandler5.Size = UDim2.new(0, 148, 0, 165)
CmdHandler5.ScrollBarThickness = 8

local CmdHandler9 = Instance.new("ScrollingFrame")
CmdHandler9.Name = "CmdHandler9"
CmdHandler9.Parent = Background12
CmdHandler9.Active = true
CmdHandler9.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler9.BackgroundTransparency = 1.000
CmdHandler9.BorderSizePixel = 0
CmdHandler9.AutomaticCanvasSize = "Y"
CmdHandler9.Position = UDim2.new(0, 1, 0, 1)
CmdHandler9.Size = UDim2.new(0, 148, 0, 195)
CmdHandler9.ScrollBarThickness = 8

local Notification3 = Instance.new("TextLabel")
Notification3.Position = UDim2.new(0,0,0,0)
Notification3.Size = UDim2.new(0,150,0,15)
Notification3.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification3.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification3.ZIndex = 2
Notification3.Parent = CmdHandler3
Notification3.Text = "Other Things"
Notification3.TextColor3 = Color3.fromRGB(2,2,2)
Notification3.TextScaled = true

local Notification4 = Instance.new("TextLabel")
Notification4.Position = UDim2.new(0,0,0,550)
Notification4.Size = UDim2.new(0,150,0,15)
Notification4.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification4.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification4.ZIndex = 2
Notification4.Parent = CmdHandler3
Notification4.Text = "Flowers/Floral"
Notification4.TextColor3 = Color3.fromRGB(2,2,2)
Notification4.TextScaled = true

local Notification5 = Instance.new("TextLabel")
Notification5.Size = UDim2.new(0,150,0,15)
Notification5.Position = UDim2.new(0,0,0,300)
Notification5.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification5.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification5.ZIndex = 2
Notification5.Parent = CmdHandler3
Notification5.Text = "Shop Stuff"
Notification5.TextColor3 = Color3.fromRGB(2,2,2)
Notification5.TextScaled = true

local BottomOfMisc = Instance.new("TextLabel") -- Bottom of Misc
BottomOfMisc.Position = UDim2.new(0,0,0,700)
BottomOfMisc.Size = UDim2.new(0,120,0,15)
BottomOfMisc.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
BottomOfMisc.BorderColor3 = Color3.fromRGB(25, 25, 25)
BottomOfMisc.Parent = CmdHandler3
BottomOfMisc.ZIndex = 2
BottomOfMisc.Text = ""
BottomOfMisc.TextColor3 = Color3.fromRGB(2,2,2)
BottomOfMisc.TextScaled = true

local Notification6 = Instance.new("TextLabel")
Notification6.Position = UDim2.new(0,0,0,0)
Notification6.Size = UDim2.new(0,140,0,15)
Notification6.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification6.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification6.ZIndex = 2
Notification6.Parent = CmdHandler4
Notification6.Text = "Mob Farms"
Notification6.TextColor3 = Color3.fromRGB(2,2,2)
Notification6.TextScaled = true

local Notification8 = Instance.new("TextLabel")
Notification8.Position = UDim2.new(0,0,0,0)
Notification8.Size = UDim2.new(0,140,0,15)
Notification8.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification8.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification8.ZIndex = 2
Notification8.Parent = CmdHandler5
Notification8.Text = "Wood Chopper"
Notification8.TextColor3 = Color3.fromRGB(2,2,2)
Notification8.TextScaled = true

local Notification9 = Instance.new("TextLabel")
Notification9.Position = UDim2.new(0,0,0,0)
Notification9.Size = UDim2.new(0,140,0,50)
Notification9.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification9.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification9.ZIndex = 2
Notification9.Parent = MachineHandler
Notification9.Text = "Just use V2 for these things, im lazy"
Notification9.TextColor3 = Color3.fromRGB(2,2,2)
Notification9.TextScaled = true

Notification10 = Instance.new("TextLabel")
Notification10.Position = UDim2.new(0,0,0,100)
Notification10.Size = UDim2.new(0,140,0,15)
Notification10.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification10.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification10.ZIndex = 2
Notification10.Parent = MachineHandler
Notification10.Text = "Small Furnace"
Notification10.TextColor3 = Color3.fromRGB(2,2,2)
Notification10.TextScaled = true
Notification10.Visible = false

local Notification11 = Instance.new("TextLabel")
Notification11.Position = UDim2.new(0,0,0,0)
Notification11.Size = UDim2.new(0,140,0,15)
Notification11.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification11.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification11.ZIndex = 2
Notification11.Parent = CmdHandler9
Notification11.Text = "WildernessIslands"
Notification11.TextColor3 = Color3.fromRGB(2,2,2)
Notification11.TextScaled = true

local Item4 = Instance.new("TextButton")
Item4.Position = UDim2.new(0,0,1,1)
Item4.Size = UDim2.new(0,70,0,20)
Item4.BackgroundColor3 = Color3.fromRGB(63,165,63)
Item4.BorderSizePixel = 0
Item4.ZIndex = 2
Item4.Parent = Notification6
Item4.Text = "Slimes"
Item4.TextColor3 = Color3.fromRGB(250,250,250)
Item4.TextScaled = true

local Item5 = Instance.new("TextButton")
Item5.Position = UDim2.new(0,71,1,1)
Item5.Size = UDim2.new(0,69,0,20)
Item5.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
Item5.BorderSizePixel = 0
Item5.ZIndex = 2
Item5.Parent = Notification6
Item5.Text = "Buffalkor"
Item5.TextColor3 = Color3.fromRGB(1,1,1)
Item5.TextScaled = true

local Mob3 = Instance.new("TextButton")
Mob3.Position = UDim2.new(0,0,1,22)
Mob3.Size = UDim2.new(0,70,0,20)
Mob3.BackgroundColor3 = Color3.fromRGB(128, 0, 0)
Mob3.BorderSizePixel = 0
Mob3.ZIndex = 2
Mob3.Parent = Notification6
Mob3.Text = "Wizard"
Mob3.TextColor3 = Color3.fromRGB(250,250,250)
Mob3.TextScaled = true

local Mob4 = Instance.new("TextButton")
Mob4.Position = UDim2.new(0,71,1,22)
Mob4.Size = UDim2.new(0,69,0,20)
Mob4.BackgroundColor3 = Color3.fromRGB(194,178,128)
Mob4.BorderSizePixel = 0
Mob4.ZIndex = 2
Mob4.Parent = Notification6
Mob4.Text = "Skorps"
Mob4.TextColor3 = Color3.fromRGB(1,1,1)
Mob4.TextScaled = true

local Mob5 = Instance.new("TextButton")
Mob5.Position = UDim2.new(0,0,1,64)
Mob5.Size = UDim2.new(0,70,0,20)
Mob5.BackgroundColor3 = Color3.fromRGB(155,0,0)
Mob5.BorderSizePixel = 0
Mob5.ZIndex = 2
Mob5.Parent = Notification6
Mob5.Text = "magmaBlob"
Mob5.TextColor3 = Color3.fromRGB(255,200,1)
Mob5.TextScaled = true

local Mob6 = Instance.new("TextButton")
Mob6.Position = UDim2.new(0,0,1,43)
Mob6.Size = UDim2.new(0,70,0,20)
Mob6.BackgroundColor3 = Color3.fromRGB(200,200,200)
Mob6.BorderSizePixel = 0
Mob6.ZIndex = 2
Mob6.Parent = Notification6
Mob6.Text = "Skeleton Pirate"
Mob6.TextColor3 = Color3.new(0,0,0)
Mob6.TextScaled = true

local Mob7 = Instance.new("TextButton")
Mob7.Position = UDim2.new(0,70,1,43)
Mob7.Size = UDim2.new(0,70,0,20)
Mob7.BackgroundColor3 = Color3.fromRGB(200,50,50)
Mob7.BorderSizePixel = 0
Mob7.ZIndex = 2
Mob7.Parent = Notification6
Mob7.Text = "Crabs"
Mob7.TextColor3 = Color3.fromRGB(255,200,1)
Mob7.TextScaled = true

local Mob8 = Instance.new("TextButton")
Mob8.Position = UDim2.new(0,70,1,64)
Mob8.Size = UDim2.new(0,70,0,20)
Mob8.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
Mob8.BorderSizePixel = 0
Mob8.ZIndex = 2
Mob8.Parent = Notification6
Mob8.Text = "Rock Mimic"
Mob8.TextColor3 = Color3.fromRGB(0,0,0)
Mob8.TextScaled = true

local God = Instance.new("TextButton")
God.Position = UDim2.new(0,1,1,150)
God.Size = UDim2.new(0,138,0,20)
God.BackgroundColor3 = Color3.fromRGB(50,50,50)
God.BorderSizePixel = 1
God.BorderColor3 = Color3.fromRGB(200,100,100)
God.ZIndex = 2
God.Parent = Notification6
God.Text = "Enable God Mode"
God.TextColor3 = Color3.fromRGB(50,200,100)
God.TextScaled = true
God.Visible = false

local KillAura = Instance.new("TextButton")
KillAura.Position = UDim2.new(0,1,1,180)
KillAura.Size = UDim2.new(0,135,0,20)
KillAura.BackgroundColor3 = Color3.fromRGB(70,0,0)
KillAura.BorderSizePixel = 2
KillAura.BorderColor3 = Color3.new(1,0,0)
KillAura.ZIndex = 2
KillAura.Parent = Notification6
KillAura.Text = "Kill Aura"
KillAura.TextColor3 = Color3.fromRGB(250,50,50)
KillAura.TextScaled = true
KillAura.Modal = true
KillAura.MouseButton1Click:Connect(function()
    if KA then
        KA = false
        KillAura.BackgroundColor3 = Color3.fromRGB(63,63,63)
        KillAura.Text = "Kill Aura"
        KillAura.TextColor3 = Color3.fromRGB(250,250,250)
    else
        KA = true
        KillAura.BackgroundColor3 = Color3.new(0,255,255)
        KillAura.Text = "Killin"
        KillAura.TextColor3 = Color3.fromRGB(0,0,0)
        while KA do
            wait()
            killAura()
        end
    end
end)

local KillPlayersAura = Instance.new("TextButton")
KillPlayersAura.Position = UDim2.new(0,1,1,210)
KillPlayersAura.Size = UDim2.new(0,135,0,20)
KillPlayersAura.BackgroundColor3 = Color3.fromRGB(70,0,0)
KillPlayersAura.BorderSizePixel = 2
KillPlayersAura.BorderColor3 = Color3.new(1,0,0)
KillPlayersAura.ZIndex = 2
KillPlayersAura.Parent = Notification6
KillPlayersAura.Text = "Kill Players Aura"
KillPlayersAura.TextColor3 = Color3.fromRGB(250,50,50)
KillPlayersAura.TextScaled = true
KillPlayersAura.Modal = true
KillPlayersAura.MouseButton1Click:Connect(function()
    if KPA then
        KPA = false
        KillPlayersAura.BackgroundColor3 = Color3.fromRGB(63,63,63)
        KillPlayersAura.Text = "Kill Players Aura"
        KillPlayersAura.TextColor3 = Color3.fromRGB(250,250,250)
    else
        KPA = true
        KillPlayersAura.BackgroundColor3 = Color3.new(0,255,255)
        KillPlayersAura.Text = "Killin"
        KillPlayersAura.TextColor3 = Color3.fromRGB(0,0,0)
        while KPA do
            wait()
            killPlayersAura()
        end
    end
end)

local Item6 = Instance.new("TextButton")
Item6.Position = UDim2.new(0,1,1,240)
Item6.Size = UDim2.new(0,135,0,20)
Item6.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item6.BorderSizePixel = 2
Item6.BorderColor3 = Color3.new(0,1,0)
Item6.ZIndex = 2
Item6.Parent = Notification6
Item6.Text = "Fire ProximityPrompts"
Item6.TextColor3 = Color3.fromRGB(50,250,50)
Item6.TextScaled = true
Item6.Modal = true

local Tests = Instance.new("TextButton")
Tests.Position = UDim2.new(0,1,0,151)
Tests.Size = UDim2.new(0,100,0,20)
Tests.BackgroundColor3 = Color3.new(0,0,1)
Tests.BorderColor3 = Color3.new(1,1,1)
Tests.ZIndex = 2
Tests.LayoutOrder = 6
Tests.Parent = CmdHandler
Tests.Text = "Misc >"
Tests.TextColor3 = Color3.fromRGB(250,250,250)
Tests.TextScaled = true

local Item22 = Instance.new("TextButton")
Item22.Position = UDim2.new(0,0,1,1)
Item22.Size = UDim2.new(0,70,0,20)
Item22.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item22.BorderSizePixel = 0
Item22.ZIndex = 2
Item22.Parent = Notification4
Item22.Text = "Pick Useless Fertiles"
Item22.TextColor3 = Color3.fromRGB(250,250,250)
Item22.TextScaled = true

cropsBackground = Instance.new("Frame")
cropsBackground.Name = "cropsBackground"
cropsBackground.Parent = Background10
cropsBackground.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
cropsBackground.BorderSizePixel = 0
cropsBackground.BorderColor3 = Color3.new(1,0,1)
cropsBackground.Position = UDim2.new(1, 0, 0.05, 0)
cropsBackground.Size = UDim2.new(0, 115, 0, 195)
cropsBackground.Active = true
cropsBackground.Visible = false

cropsHandler = Instance.new("ScrollingFrame")
cropsHandler.Name = "cropsHandler"
cropsHandler.Parent = cropsBackground
cropsHandler.Active = true
cropsHandler.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
cropsHandler.BackgroundTransparency = 1.000
cropsHandler.BorderSizePixel = 0
cropsHandler.AutomaticCanvasSize = "Y"
cropsHandler.Position = UDim2.new(0, 1, 0, 1)
cropsHandler.Size = UDim2.new(0, 115, 0, 195)
cropsHandler.ScrollBarThickness = 8

--destroyOrbs = false
--game.Workspace.ChildAdded:Connect(function(part)
    --if destroyOrbs == true and part.Name == "Part" then -- ORBS ARE BACK BABY!
        --part:Destroy()
    --end
--end)

sickleButton = Instance.new("TextButton")
sickleButton.Position = UDim2.new(0,0,1,21)
sickleButton.Size = UDim2.new(0,140,0,20)
sickleButton.BackgroundColor3 = Color3.fromRGB(63,63,63)
sickleButton.BorderSizePixel = 1
sickleButton.ZIndex = 2
sickleButton.Parent = N0
sickleButton.Text = "Sickle Farm"
sickleButton.TextColor3 = Color3.fromRGB(250,250,250)
sickleButton.TextScaled = true
sickleButton.MouseButton1Click:Connect(function()
    if sickleFarming then
        sickleFarming = false
        sickleButton.Text = "Sickle Farm"
        sickleButton.BackgroundColor3 = Color3.fromRGB(63,63,63)
        cropModule.stopSicklingAndReplanting()
    else
        sickleFarming = true
        sickleButton.Text = "Sickling"
        sickleButton.BackgroundColor3 = Color3.fromRGB(150,150,150)
        cropModule.stopSicklingAndReplanting()
        local cropToHarvest = cropSection.Text
        if cropToHarvest then
            cropModule.startSicklingAndReplanting(cropToHarvest)
        end
    end
end)

fruitsBackground = Instance.new("Frame")
fruitsBackground.Name = "fruitsBackground"
fruitsBackground.Parent = Background10
fruitsBackground.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
fruitsBackground.BorderSizePixel = 0
fruitsBackground.BorderColor3 = Color3.new(1,0,1)
fruitsBackground.Position = UDim2.new(1, 0, 0.05, 0)
fruitsBackground.Size = UDim2.new(0, 115, 0, 195)
fruitsBackground.Active = true
fruitsBackground.Visible = false

local fruitsHandler = Instance.new("ScrollingFrame")
fruitsHandler.Name = "fruitsHandler"
fruitsHandler.Parent = fruitsBackground
fruitsHandler.Active = true
fruitsHandler.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
fruitsHandler.BackgroundTransparency = 1.000
fruitsHandler.BorderSizePixel = 0
fruitsHandler.AutomaticCanvasSize = "Y"
fruitsHandler.Position = UDim2.new(0, 1, 0, 1)
fruitsHandler.Size = UDim2.new(0, 115, 0, 195)
fruitsHandler.ScrollBarThickness = 8

fruitSection = Instance.new("TextButton")
fruitSection.Position = UDim2.new(0,0,1,1)
fruitSection.Size = UDim2.new(0,140,0,20)
fruitSection.BackgroundColor3 = Color3.fromRGB(63,63,63)
fruitSection.BorderSizePixel = 1
fruitSection.ZIndex = 2
fruitSection.Parent = N3
fruitSection.Text = "Choose Fruit >"
fruitSection.TextColor3 = Color3.fromRGB(250,250,250)
fruitSection.TextScaled = true
fruitSection.MouseButton1Click:Connect(function()
    if choosingFruit then
        choosingFruit = false
        fruitsBackground.Visible = false
        fruitSection.Text = "Choose Fruit >"
    else
        choosingFruit = true
        fruitsBackground.Visible = true
        fruitSection.Text = "Choose Fruit <"
        choosingCrop = false
        cropsBackground.Visible = false
        cropSection.Text = "Choose Crop >"
    end
end)

fruits = {"treeApple", "treeOrange", "treeAvocado", "treeKiwi", "treeCoconut", "treeLemon", "treePlum"}
NaMe = 0
YPos = 0
for i,v in pairs(fruits) do
    fruitz = Instance.new("TextButton")
    fruitz.Name = NaMe
    fruitz.Position = UDim2.new(0,1,0,YPos)
    fruitz.Size = UDim2.new(0,95,0,20)
    fruitz.BackgroundColor3 = Color3.fromRGB(70,70,70)
    fruitz.BorderColor3 = Color3.new(1,1,1)
    fruitz.ZIndex = 2
    fruitz.Parent = fruitsHandler
    fruitz.Text = v
    fruitz.TextColor3 = Color3.fromRGB(250,250,250)
    fruitz.TextScaled = true
    NaMe = NaMe + 1
    YPos = YPos + 20
end

for i,v in pairs(fruitsHandler:GetChildren()) do
    v.MouseButton1Click:Connect(function()
        CrOp = v.Text
        fruitSection.Text = CrOp
        fruitsBackground.Visible = false
        choosingFruit = false
    end)
end

fruitsButton = Instance.new("TextButton")
fruitsButton.Position = UDim2.new(0,0,1,21)
fruitsButton.Size = UDim2.new(0,140,0,20)
fruitsButton.BackgroundColor3 = Color3.fromRGB(63,63,63)
fruitsButton.BorderSizePixel = 1
fruitsButton.ZIndex = 2
fruitsButton.Parent = N3
fruitsButton.Text = "Farm Fruits"
fruitsButton.TextColor3 = Color3.fromRGB(250,250,250)
fruitsButton.TextScaled = true
fruitsButton.MouseButton1Click:Connect(function()
    if fruitFarming then
        fruitFarming = false
        fruitsButton.Text = "Farm Fruits"
        fruitsButton.BackgroundColor3 = Color3.fromRGB(63,63,63)
        fruitModule.stopCollectingFruit()
    else
        fruitFarming = true
        fruitsButton.Text = "Farming Fruits"
        fruitsButton.BackgroundColor3 = Color3.fromRGB(150,150,150)
        fruitModule.startCollectingFruit(fruitSection.Text)
    end
end)

cropSection = Instance.new("TextButton")
cropSection.Position = UDim2.new(0,0,1,1)
cropSection.Size = UDim2.new(0,140,0,20)
cropSection.BackgroundColor3 = Color3.fromRGB(63,63,63)
cropSection.BorderSizePixel = 1
cropSection.ZIndex = 2
cropSection.Parent = N0
cropSection.Text = "Choose Crop >"
cropSection.TextColor3 = Color3.fromRGB(250,250,250)
cropSection.TextScaled = true
cropSection.MouseButton1Click:Connect(function()
    if choosingCrop then
        choosingCrop = false
        cropsBackground.Visible = false
        cropSection.Text = "Choose Crop >"
    else
        choosingCrop = true
        cropsBackground.Visible = true
        cropSection.Text = "Choose Crop <"
        choosingFruit = false
        fruitsBackground.Visible = false
        fruitSection.Text = "Choose Fruit >"
    end
end)

crops = {"spiritCrop", "chiliPepper", "carrot", "onion", "potato", "spinach", "tomato", "wheat", "melon", "pineapple", "candyCaneVine", "grapeVine", "dragonfruit", "cactus", "pumpkin", "radish", "rice", "seaweed", "starfruit", "voidParasite"}
NaMe = 0
YPos = 0
for i,v in pairs(crops) do
    Cropz = Instance.new("TextButton")
    Cropz.Name = NaMe
    Cropz.Position = UDim2.new(0,1,0,YPos)
    Cropz.Size = UDim2.new(0,95,0,20)
    Cropz.BackgroundColor3 = Color3.fromRGB(70,70,70)
    Cropz.BorderColor3 = Color3.new(1,1,1)
    Cropz.ZIndex = 2
    Cropz.Parent = cropsHandler
    Cropz.Text = v
    Cropz.TextColor3 = Color3.fromRGB(250,250,250)
    Cropz.TextScaled = true
    NaMe = NaMe + 1
    YPos = YPos + 20
end

for i,v in pairs(cropsHandler:GetChildren()) do
    v.MouseButton1Click:Connect(function()
        CrOp = v.Text
        cropSection.Text = CrOp
        cropsBackground.Visible = false
        choosingCrop = false
    end)
end


plantCropButton = Instance.new("TextButton")
plantCropButton.Position = UDim2.new(0,0,1,42)
plantCropButton.Size = UDim2.new(0,140,0,20)
plantCropButton.BackgroundColor3 = Color3.fromRGB(63,63,63)
plantCropButton.BorderSizePixel = 1
plantCropButton.ZIndex = 2
plantCropButton.Parent = N0
plantCropButton.Text = "Plant on nearby dirt"
plantCropButton.TextColor3 = Color3.fromRGB(250,250,250)
plantCropButton.TextScaled = true
plantCropButton.MouseButton1Click:Connect(function()
    local cropToHarvest = cropSection.Text
    cropModule.stopSicklingAndReplanting()
	if (cropToHarvest) then
	    cropModule.plantCropsOnce(cropToHarvest)
	end
end)

local Item23 = Instance.new("TextButton")
Item23.Position = UDim2.new(0,0,1,1)
Item23.Size = UDim2.new(0,70,0,20)
Item23.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item23.BorderSizePixel = 1
Item23.ZIndex = 2
Item23.Parent = N1
Item23.Text = "Honeycomb"
Item23.TextColor3 = Color3.fromRGB(250,250,250)
Item23.TextScaled = true

local Item24 = Instance.new("TextButton")
Item24.Position = UDim2.new(0,71,1,1)
Item24.Size = UDim2.new(0,70,0,20)
Item24.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item24.BorderSizePixel = 1
Item24.ZIndex = 2
Item24.Parent = Notification3
Item24.Text = "Collect Nearby in/out"
Item24.TextColor3 = Color3.fromRGB(250,250,250)
Item24.TextScaled = true

local Item25 = Instance.new("TextButton")
Item25.Position = UDim2.new(0,0,1,22)
Item25.Size = UDim2.new(0,70,0,20)
Item25.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item25.BorderSizePixel = 1
Item25.ZIndex = 2
Item25.Parent = N1
Item25.Text = "Auto-Mayo"
Item25.TextColor3 = Color3.fromRGB(250,250,250)
Item25.TextScaled = true

local Item2 = Instance.new("TextButton")
Item2.Position = UDim2.new(0,0,1,1)
Item2.Size = UDim2.new(0,70,0,20)
Item2.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item2.BorderSizePixel = 1
Item2.ZIndex = 2
Item2.Parent = Notification3
Item2.Text = "Join/Invite"
Item2.TextColor3 = Color3.fromRGB(250,250,250)
Item2.TextScaled = true

infos = Instance.new("TextLabel")
infos.Position = UDim2.new(0,1,1,1)
infos.Size = UDim2.new(0,70,0,40)
infos.BackgroundColor3 = Color3.fromRGB(0,0,0)
infos.BorderSizePixel = 1
infos.ZIndex = 2
infos.Parent = Notification5
infos.Text = "Enter max--> PRICE to fill with coins"
infos.TextColor3 = Color3.fromRGB(250,250,250)
infos.TextScaled = true

fillAmount = Instance.new("TextBox")
fillAmount.Position = UDim2.new(0,71,1,1)
fillAmount.Size = UDim2.new(0,70,0,20)
fillAmount.BackgroundColor3 = Color3.fromRGB(50,50,50)
fillAmount.BorderSizePixel = 1
fillAmount.BorderColor3 = Color3.fromRGB(200,200,200)
fillAmount.ZIndex = 2
fillAmount.Parent = Notification5
fillAmount.PlaceholderText = "Enter Amount"
fillAmount.Text = ""
fillAmount.TextColor3 = Color3.fromRGB(250,250,250)
fillAmount.TextScaled = true

fillMachines = Instance.new("TextButton")
fillMachines.Position = UDim2.new(0,71,1,21)
fillMachines.Size = UDim2.new(0,70,0,20)
fillMachines.BackgroundColor3 = Color3.fromRGB(63,63,63)
fillMachines.BorderSizePixel = 1
fillMachines.ZIndex = 2
fillMachines.Parent = Notification5
fillMachines.Text = "Fill Machines"
fillMachines.TextColor3 = Color3.fromRGB(250,250,250)
fillMachines.TextScaled = true
fillMachines.MouseButton1Click:Connect(function()
for i,v in pairs(Island.Blocks:GetChildren()) do
    if (v.Name == "vendingMachine" or v.Name == "vendingMachine1") and v.Mode.Value == 1 and v.TransactionPrice.Value <= tonumber(fillAmount.Text) then
        if v.CoinBalance.Value < ((v.TransactionPrice.Value * 1.07) * 1000) then
        local args = {
        [1] = HttpService:GenerateGUID(false),
        [2] = {
        [1] = {
        ["vendingMachine"] = v
        }
        }
        }
        openVending:FireServer(unpack(args))
        local args = {
        [1] = HttpService:GenerateGUID(false),
        [2] = {
        [1] = {
        ["vendingMachine"] = v,
        ["player_tracking_category"] = "join_from_web",
        ["amount"] = v.CoinBalance.Value
        }
        }
        }
        takeCoins:FireServer(unpack(args))
        print((v.TransactionPrice.Value * 1.07) * 1000)
        local args = {
        [1] = HttpService:GenerateGUID(false),
        [2] = {
        [1] = {
        ["vendingMachine"] = v,
        ["player_tracking_category"] = "join_from_web",
        ["amount"] = (round(v.TransactionPrice.Value * 1.07)) * 1000
        }
        }
        }
        refillCoins:FireServer(unpack(args))
        
        local args = {
        [1] = {
        ["vendingMachine"] = v
        }
        }
        closeVending:FireServer(unpack(args))
        print("Finished")
        end
    end
end
end)

withdrawCoins = Instance.new("TextButton")
withdrawCoins.Position = UDim2.new(0,1,1,42)
withdrawCoins.Size = UDim2.new(0,140,0,20)
withdrawCoins.BackgroundColor3 = Color3.fromRGB(63,63,63)
withdrawCoins.BorderSizePixel = 1
withdrawCoins.ZIndex = 2
withdrawCoins.Parent = Notification5
withdrawCoins.Text = "Withdraw coins from BUY"
withdrawCoins.TextColor3 = Color3.fromRGB(250,250,250)
withdrawCoins.TextScaled = true
withdrawCoins.MouseButton1Click:Connect(function()
for i,v in pairs(Island.Blocks:GetChildren()) do
    if (v.Name == "vendingMachine" or v.Name == "vendingMachine1") and v.Mode.Value == 0 then
        if v.CoinBalance.Value > 0 then
            local args = {
            [1] = HttpService:GenerateGUID(false),
            [2] = {
            [1] = {
            ["vendingMachine"] = v
            }
            }
            }
            openVending:FireServer(unpack(args))
            local args = {
            [1] = HttpService:GenerateGUID(false),
            [2] = {
            [1] = {
            ["vendingMachine"] = v,
            ["player_tracking_category"] = "join_from_web",
            ["amount"] = v.CoinBalance.Value
            }
            }
            }
            takeCoins:FireServer(unpack(args))
            local args = {
            [1] = {
            ["vendingMachine"] = v
            }
            }
            closeVending:FireServer(unpack(args))
        end
    end
end
end)

fillVendings = Instance.new("TextButton")
fillVendings.Position = UDim2.new(0,1,1,63)
fillVendings.Size = UDim2.new(0,140,0,20)
fillVendings.BackgroundColor3 = Color3.fromRGB(63,63,63)
fillVendings.BorderSizePixel = 1
fillVendings.ZIndex = 2
fillVendings.Parent = Notification5
fillVendings.Text = "Fill BUY Vendings"
fillVendings.TextColor3 = Color3.fromRGB(250,250,250)
fillVendings.TextScaled = true
fillVendings.MouseButton1Click:Connect(function()
    for i,v in pairs(Island.Blocks:GetChildren()) do
    if (v.Name == "vendingMachine" or v.Name == "vendingMachine1") and v.Mode.Value == 0 then
        contents = v.SellingContents:GetChildren()[1]
        if contents ~= nil and contents.Amount.Value < 1000 and Player.Backpack:FindFirstChild(contents.Name) then
            local args = {
            [1] = HttpService:GenerateGUID(false),
            [2] = {
            [1] = {
            ["vendingMachine"] = v
            }
            }
            }
            openVending:FireServer(unpack(args))
            if Player.Backpack[contents.Name].Amount.Value < (1000 - contents.Amount.Value) then
            local args = {
            [1] = HttpService:GenerateGUID(false),
            [2] = {
            [1] = {
            ["player_tracking_category"] = "join_from_web",
            ["amount"] = Player.Backpack[contents.Name].Amount.Value,
            ["vendingMachine"] = v,
            ["tool"] = Player.Backpack[contents.Name],
            ["action"] = "deposit"
            }
            }
            }
            refillItem:FireServer(unpack(args))
            else
            local args = {
            [1] = HttpService:GenerateGUID(false),
            [2] = {
            [1] = {
            ["player_tracking_category"] = "join_from_web",
            ["amount"] = 1000 - contents.Amount.Value,
            ["vendingMachine"] = v,
            ["tool"] = Player.Backpack[contents.Name],
            ["action"] = "deposit"
            }
            }
            }
            refillItem:FireServer(unpack(args))
            end
            local args = {
            [1] = {
            ["vendingMachine"] = v
            }
            }
            closeVending:FireServer(unpack(args))
        
        end
    end
end
end)

collectItems = Instance.new("TextButton")
collectItems.Position = UDim2.new(0,1,1,84)
collectItems.Size = UDim2.new(0,140,0,20)
collectItems.BackgroundColor3 = Color3.fromRGB(63,63,63)
collectItems.BorderSizePixel = 1
collectItems.ZIndex = 2
collectItems.Parent = Notification5
collectItems.Text = "Collect SELL Vending items"
collectItems.TextColor3 = Color3.fromRGB(250,250,250)
collectItems.TextScaled = true
collectItems.MouseButton1Click:Connect(function()
    for i,v in pairs(Island.Blocks:GetChildren()) do
    if (v.Name == "vendingMachine" or v.Name == "vendingMachine1") and v.Mode.Value == 1 then
        contents = v.SellingContents:GetChildren()[1]
        if contents ~= nil and contents.Amount.Value > 1 then
            local args = {
            [1] = HttpService:GenerateGUID(false),
            [2] = {
            [1] = {
            ["vendingMachine"] = v
            }
            }
            }
            openVending:FireServer(unpack(args))
            
            local args = {
            [1] = HttpService:GenerateGUID(false),
            [2] = {
            [1] = {
            ["player_tracking_category"] = "join_from_web",
            ["amount"] = contents.Amount.Value - 1,
            ["vendingMachine"] = v,
            ["tool"] = v.SellingContents[contents.Name],
            ["action"] = "withdraw"
            }
            }
            }
            emptyItem:FireServer(unpack(args))

            local args = {
            [1] = {
            ["vendingMachine"] = v
            }
            }
            closeVending:FireServer(unpack(args))
        
        end
    end
end
end)

local Item26 = Instance.new("TextButton")
Item26.Position = UDim2.new(0,1,1,129)
Item26.Size = UDim2.new(0,140,0,20)
Item26.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item26.BorderSizePixel = 1
Item26.ZIndex = 2
Item26.Parent = Notification5
Item26.Text = "Find Held Item in Vending"
Item26.TextColor3 = Color3.fromRGB(250,250,250)
Item26.TextScaled = true
Item26.MouseButton1Click:Connect(function()
for _,esp in pairs(game.Workspace:GetChildren()) do
    if esp.Name == "vendingESP" or esp.Name == "vendingESP1" then
        esp:Destroy()
    end
end

for _,t in pairs(Character:GetChildren()) do
    if t:IsA("Tool") then
        tool = t
    end
end

for _,v in pairs(Island.Blocks:GetChildren()) do
    if v.Name == "vendingMachine" or v.Name == "vendingMachine1" then
        for _,t in pairs(v.SellingContents:GetChildren()) do
            if t.Name == tool.Name then
                if v.Mode.Value == 0 then
                buy = Instance.new("BoxHandleAdornment")
                buy.Name = "vendingESP"
            	buy.Parent = game.Workspace
    	        buy.Adornee = v
                buy.AlwaysOnTop = true
    	        buy.ZIndex = 0
                buy.Size = v.Size
    	        buy.Transparency = 0.3
                buy.Color3 = Color3.fromRGB(100,250,100)
                elseif v.Mode.Value == 1 then
                sell = Instance.new("BoxHandleAdornment")
                sell.Name = "vendingESP1"
    	        sell.Parent = game.Workspace
    	        sell.Adornee = v
                sell.AlwaysOnTop = true
    	        sell.ZIndex = 0
                sell.Size = v.Size
    	        sell.Transparency = 0.3
                sell.Color3 = Color3.fromRGB(250,100,100)
                else wait()
                end
            end
        end
	end
end
end)

local blockPrinter = Instance.new("TextButton")
blockPrinter.Position = UDim2.new(0,0,1,21)
blockPrinter.Size = UDim2.new(0,70,0,20)
blockPrinter.BackgroundColor3 = Color3.fromRGB(63,63,63)
blockPrinter.BorderSizePixel = 1
blockPrinter.ZIndex = 2
blockPrinter.Parent = Notification3
blockPrinter.Text = "Block Printer"
blockPrinter.TextColor3 = Color3.fromRGB(250,250,250)
blockPrinter.TextScaled = true
blockPrinter.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ashlux/roblox-islands/main/Useless-maybe/islands%20FillBlocks.lua'))()
end)

local Item32 = Instance.new("TextButton")
Item32.Position = UDim2.new(0,0,1,169)
Item32.Size = UDim2.new(0,70,0,20)
Item32.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item32.BorderSizePixel = 1
Item32.ZIndex = 2
Item32.Parent = Notification3
Item32.Text = "Send items to Click"
Item32.TextColor3 = Color3.fromRGB(250,250,250)
Item32.TextScaled = true

local Treasure = Instance.new("TextButton")
Treasure.Position = UDim2.new(0,71,1,22)
Treasure.Size = UDim2.new(0,70,0,20)
Treasure.BackgroundColor3 = Color3.fromRGB(63,63,63)
Treasure.BorderSizePixel = 1
Treasure.ZIndex = 2
Treasure.Parent = Notification3
Treasure.Text = "Dig Treasure"
Treasure.TextColor3 = Color3.fromRGB(250,250,250)
Treasure.TextScaled = true
Treasure.MouseButton1Click:Connect(function()
    if Treasure1 then
        Treasure1 = false
        Treasure.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Treasure.Text = "Dig Treasure"
        Treasure.TextColor3 = Color3.fromRGB(250,250,250)
        treasureModule.stopFarmingChests()
    else
        Treasure1 = true
        Treasure.BackgroundColor3 = Color3.fromRGB(0,255,255)
        Treasure.Text = "Digging Treasure"
        Treasure.TextColor3 = Color3.fromRGB(0,0,0)
        treasureModule.startFarmingChests()
    end
end)

local Item33 = Instance.new("TextButton")
Item33.Position = UDim2.new(0,72,1,1)
Item33.Size = UDim2.new(0,70,0,20)
Item33.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item33.BorderSizePixel = 1
Item33.ZIndex = 2
Item33.Parent = N1
Item33.Text = "Collect Truffles"
Item33.TextColor3 = Color3.fromRGB(250,250,250)
Item33.TextScaled = true

local wildCrops = Instance.new("TextButton")
wildCrops.Position = UDim2.new(0,72,1,22)
wildCrops.Size = UDim2.new(0,70,0,20)
wildCrops.BackgroundColor3 = Color3.fromRGB(63,63,63)
wildCrops.BorderSizePixel = 1
wildCrops.ZIndex = 2
wildCrops.Parent = N1
wildCrops.Text = "Wilderness Crops"
wildCrops.TextColor3 = Color3.fromRGB(250,250,250)
wildCrops.TextScaled = true
wildCrops.MouseButton1Click:Connect(function()
    if pickingWildCrops then
        pickingWildCrops = false
        wildCrops.Text = "Wilderness Crops"
        wildCrops.BackgroundColor3 = Color3.fromRGB(63,63,63)
        wildCropModule.stopHarvestingWild()
    else
        pickingWildCrops = true
        wildCrops.Text = "Picking!"
        wildCrops.BackgroundColor3 = Color3.fromRGB(0,200,200)
        wildCropModule.startHarvestingWild()
    end
end)

local Item34 = Instance.new("TextButton")
Item34.Position = UDim2.new(0,71,1,1)
Item34.Size = UDim2.new(0,70,0,20)
Item34.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item34.BorderSizePixel = 1
Item34.ZIndex = 2
Item34.Parent = Notification4
Item34.Text = "Pick Unfertile"
Item34.TextColor3 = Color3.fromRGB(250,250,250)
Item34.TextScaled = true

local Item35 = Instance.new("TextButton")
Item35.Position = UDim2.new(0,0,1,22)
Item35.Size = UDim2.new(0,70,0,20)
Item35.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item35.BorderSizePixel = 1
Item35.ZIndex = 2
Item35.Parent = Notification4
Item35.Text = "Water Flowers"
Item35.TextColor3 = Color3.fromRGB(250,250,250)
Item35.TextScaled = true

local Item36 = Instance.new("TextButton")
Item36.Position = UDim2.new(0,71,1,22)
Item36.Size = UDim2.new(0,70,0,20)
Item36.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item36.BorderSizePixel = 1
Item36.ZIndex = 2
Item36.Parent = Notification4
Item36.Text = "Clear Grass/Rocks"
Item36.TextColor3 = Color3.fromRGB(250,250,250)
Item36.TextScaled = true

local Item42 = Instance.new("TextButton")
Item42.Position = UDim2.new(0,1,0,199)
Item42.Size = UDim2.new(0,100,0,20)
Item42.BackgroundColor3 = Color3.fromRGB(0,0,250)
Item42.BorderSizePixel = 1
Item42.BorderColor3 = Color3.new(1,1,1)
Item42.ZIndex = 2
Item42.LayoutOrder = 8
Item42.Parent = CmdHandler
Item42.Text = "Machines >"
Item42.TextColor3 = Color3.fromRGB(250,250,250)
Item42.TextScaled = true

local Item43 = Instance.new("TextButton")
Item43.Position = UDim2.new(0,71,1,64)
Item43.Size = UDim2.new(0,70,0,20)
Item43.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item43.BorderSizePixel = 1
Item43.ZIndex = 2
Item43.Parent = Notification3
Item43.Text = "Put ALL items into trade"
Item43.TextColor3 = Color3.fromRGB(250,250,250)
Item43.TextScaled = true

local Item44 = Instance.new("TextButton")
Item44.Position = UDim2.new(0,0,1,43)
Item44.Size = UDim2.new(0,70,0,20)
Item44.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item44.BorderSizePixel = 1
Item44.ZIndex = 2
Item44.Parent = Notification3
Item44.Text = "Island Pickaxe Aura"
Item44.TextColor3 = Color3.fromRGB(250,250,250)
Item44.TextScaled = true

local Item45 = Instance.new("TextButton")
Item45.Position = UDim2.new(0,0,1,45)
Item45.Size = UDim2.new(0,140,0,20)
Item45.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item45.BorderSizePixel = 1
Item45.ZIndex = 2
Item45.Parent = Notification4
Item45.Text = "Water Nearby"
Item45.TextColor3 = Color3.fromRGB(250,250,250)
Item45.TextScaled = true
Item45.MouseButton1Click:Connect(function()
    flowerWaterModule.waterOnlyNearby()
end)

local Item46 = Instance.new("TextButton")
Item46.Position = UDim2.new(0,71,1,43)
Item46.Size = UDim2.new(0,70,0,20)
Item46.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item46.BorderSizePixel = 1
Item46.ZIndex = 2
Item46.Parent = Notification3
Item46.Text = "Pickup Drops Aura"
Item46.TextColor3 = Color3.fromRGB(250,250,250)
Item46.TextScaled = true

local Item48 = Instance.new("TextButton")
Item48.Position = UDim2.new(0,0,1,66)
Item48.Size = UDim2.new(0,140,0,20)
Item48.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item48.BorderSizePixel = 1
Item48.ZIndex = 2
Item48.Parent = Notification4
Item48.Text = "Clear Island Fertiles"
Item48.TextColor3 = Color3.fromRGB(250,250,250)
Item48.TextScaled = true

local Item50 = Instance.new("TextButton")
Item50.Position = UDim2.new(0,0,1,1)
Item50.Size = UDim2.new(0,70,0,20)
Item50.BackgroundColor3 = Color3.fromRGB(186,164,138)
Item50.BorderSizePixel = 1
Item50.ZIndex = 2
Item50.Parent = Notification8
Item50.Text = "Oak Wood"
Item50.TextColor3 = Color3.fromRGB(0,0,0)
Item50.TextScaled = true

local Item51 = Instance.new("TextButton")
Item51.Position = UDim2.new(0,71,1,1)
Item51.Size = UDim2.new(0,70,0,20)
Item51.BackgroundColor3 = Color3.fromRGB(248,223,161)
Item51.BorderSizePixel = 1
Item51.ZIndex = 2
Item51.Parent = Notification8
Item51.Text = "Birch Wood"
Item51.TextColor3 = Color3.fromRGB(0,0,0)
Item51.TextScaled = true

local Item52 = Instance.new("TextButton")
Item52.Position = UDim2.new(0,0,1,22)
Item52.Size = UDim2.new(0,70,0,20)
Item52.BackgroundColor3 = Color3.fromRGB(85,52,43)
Item52.BorderSizePixel = 1
Item52.ZIndex = 2
Item52.Parent = Notification8
Item52.Text = "Pine Wood"
Item52.TextColor3 = Color3.fromRGB(250,250,250)
Item52.TextScaled = true

local Item53 = Instance.new("TextButton")
Item53.Position = UDim2.new(0,71,1,22)
Item53.Size = UDim2.new(0,70,0,20)
Item53.BackgroundColor3 = Color3.fromRGB(200,111,87)
Item53.BorderSizePixel = 1
Item53.ZIndex = 2
Item53.Parent = Notification8
Item53.Text = "Maple Wood"
Item53.TextColor3 = Color3.fromRGB(0,0,0)
Item53.TextScaled = true

local Item54 = Instance.new("TextButton")
Item54.Position = UDim2.new(0,0,1,43)
Item54.Size = UDim2.new(0,70,0,20)
Item54.BackgroundColor3 = Color3.fromRGB(258,233,171)
Item54.BorderSizePixel = 1
Item54.ZIndex = 2
Item54.Parent = Notification8
Item54.Text = "Hickory Wood"
Item54.TextColor3 = Color3.fromRGB(0,0,0)
Item54.TextScaled = true

local Item55 = Instance.new("TextButton")
Item55.Position = UDim2.new(0,71,1,43)
Item55.Size = UDim2.new(0,69,0,20)
Item55.BackgroundColor3 = Color3.fromRGB(168,105,165)
Item55.BorderSizePixel = 1
Item55.ZIndex = 2
Item55.Parent = Notification8
Item55.Text = "Spirit Wood"
Item55.TextColor3 = Color3.fromRGB(0,0,0)
Item55.TextScaled = true

local cherryWood = Instance.new("TextButton")
cherryWood.Position = UDim2.new(0,0,1,64)
cherryWood.Size = UDim2.new(0,69,0,20)
cherryWood.BackgroundColor3 = Color3.fromRGB(250,150,150)
cherryWood.BorderSizePixel = 1
cherryWood.ZIndex = 2
cherryWood.Parent = Notification8
cherryWood.Text = "Cherry Wood"
cherryWood.TextColor3 = Color3.fromRGB(0,0,0)
cherryWood.TextScaled = true
cherryWood.MouseButton1Click:Connect(function()
    if Toggled38 then
        Toggled38 = false
        cherryWood.BackgroundColor3 = Color3.fromRGB(250,150,150)
        cherryWood.Text = "Cherry Wood"
        cherryWood.TextColor3 = Color3.fromRGB(0,0,0)
        cancelTween()
        unFloat()
    else
        Toggled38 = true
        cherryWood.BackgroundColor3 = Color3.new(200,0,0)
        cherryWood.Text = "Getting Cherry"
        cherryWood.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        while Toggled38 == true do
            wait()
            local trees = getTrees()
            for k,v in pairs(trees) do
                if v.Name == "treeCherryBlossom" then
                    tween, Time = goToPoint(v.Position, 12)
                    if Time then
                        wait(Time - 0.6)
                        cancelTween()
                    end
                    hitTree(v)
                break
                end
            end
        end
    end
end)

local allWoods = Instance.new("TextButton")
allWoods.Position = UDim2.new(0,0,1,85)
allWoods.Size = UDim2.new(0,140,0,20)
allWoods.BackgroundColor3 = Color3.fromRGB(175,175,175)
allWoods.BorderSizePixel = 1
allWoods.ZIndex = 2
allWoods.Parent = Notification8
allWoods.Text = "All Woods"
allWoods.TextColor3 = Color3.fromRGB(0,0,0)
allWoods.TextScaled = true
allWoods.MouseButton1Click:Connect(function()
    if allWoods1 then
        allWoods1 = false
        allWoods.BackgroundColor3 = Color3.fromRGB(175,175,175)
        allWoods.Text = "All Woods"
        allWoods.TextColor3 = Color3.fromRGB(0,0,0)
        cancelTween()
        unFloat()
    else
        allWoods1 = true
        allWoods.BackgroundColor3 = Color3.new(200,0,0)
        allWoods.Text = "Getting Wood"
        allWoods.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        while allWoods1 == true do
            wait()
            local trees = getTrees()
            for k,v in pairs(trees) do
                    tween, Time = goToPoint(v.Position, 12)
                    if Time then
                        wait(Time - 0.6)
                        cancelTween()
                    end
                    hitTree(v)
                break
            end
        end
    end
end)

local Item56 = Instance.new("TextButton")
Item56.Position = UDim2.new(0,0,1,43)
Item56.Size = UDim2.new(0,140,0,20)
Item56.BackgroundColor3 = Color3.fromRGB(50,250,150)
Item56.BorderSizePixel = 1
Item56.ZIndex = 2
Item56.Parent = Notification9
Item56.Text = "aquaBlock -> aquaCarved"
Item56.TextColor3 = Color3.fromRGB(0,0,0)
Item56.TextScaled = true
Item56.Visible = false

local Item57 = Instance.new("TextButton")
Item57.Position = UDim2.new(0,0,1,22)
Item57.Size = UDim2.new(0,140,0,20)
Item57.BackgroundColor3 = Color3.fromRGB(50,250,150)
Item57.BorderSizePixel = 1
Item57.ZIndex = 2
Item57.Parent = Notification9
Item57.Text = "aquaBlock -> aquaTiles"
Item57.TextColor3 = Color3.fromRGB(0,0,0)
Item57.TextScaled = true
Item57.Visible = false

local Item58 = Instance.new("TextButton")
Item58.Position = UDim2.new(0,0,1,1)
Item58.Size = UDim2.new(0,140,0,20)
Item58.BackgroundColor3 = Color3.fromRGB(50,250,150)
Item58.BorderSizePixel = 1
Item58.ZIndex = 2
Item58.Parent = Notification9
Item58.Text = "aquaBlock -> aquaBrick"
Item58.TextColor3 = Color3.fromRGB(0,0,0)
Item58.TextScaled = true
Item58.Visible = false

local Item59 = Instance.new("TextButton")
Item59.Position = UDim2.new(0,72,1,106)
Item59.Size = UDim2.new(0,70,0,20)
Item59.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item59.BorderSizePixel = 1
Item59.ZIndex = 2
Item59.Parent = N1
Item59.Text = "Cloth Loom"
Item59.TextColor3 = Color3.fromRGB(250,250,250)
Item59.TextScaled = true

local Item61 = Instance.new("TextButton")
Item61.Position = UDim2.new(0,0,1,64)
Item61.Size = UDim2.new(0,70,0,20)
Item61.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item61.BorderSizePixel = 1
Item61.ZIndex = 2
Item61.Parent = Notification3
Item61.Text = "Catch Entities"
Item61.TextColor3 = Color3.fromRGB(250,250,250)
Item61.TextScaled = true


local function onInputBegan(input, gp)
    
    if gp then return end -- if clicking chat
    
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        SMACKING = true
        while SMACKING do
            task.wait()
            if mouse.Target ~= nil then
                pcall(function()
                local args = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["part"] = mouse.Target,
                ["block"] = mouse.Target,
                ["norm"] = mouse.Target:FindFirstChild("Position"),
                ["pos"] = mouse.Target:FindFirstChild("Position")
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
                end)
            end
        end
    end
end

local function onInputEnd(input, gp)
    if gp then wait() end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        SMACKING = false
    end
end

local fastPick = Instance.new("TextButton")
fastPick.Position = UDim2.new(0,0,1,85)
fastPick.Size = UDim2.new(0,70,0,20)
fastPick.BackgroundColor3 = Color3.fromRGB(63,63,63)
fastPick.BorderSizePixel = 1
fastPick.ZIndex = 2
fastPick.Parent = Notification3
fastPick.Text = "Fast Mining"
fastPick.TextColor3 = Color3.fromRGB(250,250,250)
fastPick.TextScaled = true
fastPick.MouseButton1Click:Connect(function()
    if fastPickToggle then
        fastPickToggle = false
        fastPick.BackgroundColor3 = Color3.new(63,63,63)
        clicks:Disconnect()
        unclicks:Disconnect()
    else
        fastPickToggle = true
        fastPick.BackgroundColor3 = Color3.new(0,255,255)
        
        clicks = uis.InputBegan:Connect(onInputBegan)
        unclicks = uis.InputEnded:Connect(onInputEnd)
    end
end)

local Item63 = Instance.new("TextButton")
Item63.Position = UDim2.new(0,72,1,43)
Item63.Size = UDim2.new(0,70,0,20)
Item63.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item63.BorderSizePixel = 1
Item63.ZIndex = 2
Item63.Parent = N1
Item63.Text = "Animal Farm"
Item63.TextColor3 = Color3.fromRGB(250,250,250)
Item63.TextScaled = true

local UnPlow = Instance.new("TextButton")
UnPlow.Position = UDim2.new(0,1,1,43)
UnPlow.Size = UDim2.new(0,70,0,20)
UnPlow.BackgroundColor3 = Color3.fromRGB(63,63,63)
UnPlow.BorderSizePixel = 1
UnPlow.ZIndex = 2
UnPlow.Parent = N1
UnPlow.Text = "Unplow Nearby"
UnPlow.TextColor3 = Color3.fromRGB(250,250,250)
UnPlow.TextScaled = true

local Item64 = Instance.new("TextButton")
Item64.Position = UDim2.new(0,0,1,108)
Item64.Size = UDim2.new(0,70,0,20)
Item64.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item64.BorderSizePixel = 1
Item64.ZIndex = 2
Item64.Parent = Notification4
Item64.Text = "Leaf Collector"
Item64.TextColor3 = Color3.fromRGB(250,250,250)
Item64.TextScaled = true

local Item65 = Instance.new("TextButton")
Item65.Position = UDim2.new(0,71,1,85)
Item65.Size = UDim2.new(0,70,0,20)
Item65.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item65.BorderSizePixel = 1
Item65.ZIndex = 2
Item65.Parent = Notification3
Item65.Text = "Auto Eat >"
Item65.TextColor3 = Color3.fromRGB(250,250,250)
Item65.TextScaled = true

local CmdHandler6 = Instance.new("ScrollingFrame")
CmdHandler6.Name = "CmdHandler6"
CmdHandler6.Parent = Background9
CmdHandler6.Active = true
CmdHandler6.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler6.BackgroundTransparency = 1.000
CmdHandler6.BorderSizePixel = 0
CmdHandler6.AutomaticCanvasSize = "Y"
CmdHandler6.Position = UDim2.new(0, 1, 0, 1)
CmdHandler6.Size = UDim2.new(0, 100, 0, 149)
CmdHandler6.ScrollBarThickness = 8

local YPos = 1
local NaMe = 1
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:FindFirstChild("food") then
    Foodz = Instance.new("TextButton")
    Foodz.Name = NaMe
    Foodz.Position = UDim2.new(0,1,0,YPos)
    Foodz.Size = UDim2.new(0,95,0,15)
    Foodz.BackgroundColor3 = Color3.fromRGB(70,70,70)
    Foodz.BorderColor3 = Color3.new(1,1,1)
    Foodz.ZIndex = 2
    Foodz.Parent = CmdHandler6
    Foodz.Text = v.Name
    Foodz.TextColor3 = Color3.fromRGB(250,250,250)
    Foodz.TextScaled = true
    NaMe = NaMe + 1
    YPos = YPos + 15
    end
end

local Item67 = Instance.new("TextButton")
Item67.Position = UDim2.new(0,1,0,175)
Item67.Size = UDim2.new(0,100,0,20)
Item67.BackgroundColor3 = Color3.fromRGB(0,0,250)
Item67.BorderSizePixel = 1
Item67.BorderColor3 = Color3.new(1,1,1)
Item67.ZIndex = 2
Item67.LayoutOrder = 2
Item67.Parent = CmdHandler
Item67.Text = "Farming >"
Item67.TextColor3 = Color3.fromRGB(250,250,250)
Item67.TextScaled = true

local Item69 = Instance.new("TextButton")
Item69.Position = UDim2.new(0,72,1,85)
Item69.Size = UDim2.new(0,70,0,20)
Item69.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item69.BorderSizePixel = 1
Item69.ZIndex = 2
Item69.Parent = N1
Item69.Text = "Fertility Potion Aura"
Item69.TextColor3 = Color3.fromRGB(250,250,250)
Item69.TextScaled = true

local Item70 = Instance.new("TextButton")
Item70.Position = UDim2.new(0,0,1,106)
Item70.Size = UDim2.new(0,70,0,20)
Item70.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item70.BorderSizePixel = 1
Item70.ZIndex = 2
Item70.Parent = N1
Item70.Text = "Auto-Yak Butter"
Item70.TextColor3 = Color3.fromRGB(250,250,250)
Item70.TextScaled = true

local Item72 = Instance.new("TextButton")
Item72.Position = UDim2.new(0,0,1,1)
Item72.Size = UDim2.new(0,70,0,20)
Item72.BackgroundColor3 = Color3.fromRGB(161,157,148)
Item72.BorderSizePixel = 1
Item72.ZIndex = 2
Item72.Parent = Notification10
Item72.Text = "Iron"
Item72.TextColor3 = Color3.fromRGB(0,0,0)
Item72.TextScaled = true

local Item73 = Instance.new("TextButton")
Item73.Position = UDim2.new(0,71,1,1)
Item73.Size = UDim2.new(0,70,0,20)
Item73.BackgroundColor3 = Color3.fromRGB(255,215,0)
Item73.BorderSizePixel = 1
Item73.ZIndex = 2
Item73.Parent = Notification10
Item73.Text = "Gold"
Item73.TextColor3 = Color3.fromRGB(0,0,0)
Item73.TextScaled = true

local Item74 = Instance.new("TextButton")
Item74.Position = UDim2.new(0,0,1,64)
Item74.Size = UDim2.new(0,70,0,20)
Item74.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item74.BorderSizePixel = 1
Item74.ZIndex = 2
Item74.Parent = N1
Item74.Text = "Plow Nearby"
Item74.TextColor3 = Color3.fromRGB(250,250,250)
Item74.TextScaled = true

local Item75 = Instance.new("TextButton")
Item75.Position = UDim2.new(0,0,1,106)
Item75.Size = UDim2.new(0,70,0,20)
Item75.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item75.BorderSizePixel = 1
Item75.ZIndex = 2
Item75.Parent = Notification3
Item75.Text = "Auto-Fish"
Item75.TextColor3 = Color3.fromRGB(250,250,250)
Item75.TextScaled = true

local depositHeld = Instance.new("TextButton")
depositHeld.Position = UDim2.new(0,0,1,127)
depositHeld.Size = UDim2.new(0,140,0,20)
depositHeld.BackgroundColor3 = Color3.fromRGB(63,63,63)
depositHeld.BorderSizePixel = 1
depositHeld.ZIndex = 2
depositHeld.Parent = Notification3
depositHeld.Text = "Deposit held into chests"
depositHeld.TextColor3 = Color3.fromRGB(250,250,250)
depositHeld.TextScaled = true
depositHeld.MouseButton1Click:Connect(function()
    if depositingHeld then
        depositingHeld = false
        depositHeld.BackgroundColor3 = Color3.fromRGB(63,63,63)
        depositHeld.TextColor3 = Color3.fromRGB(250,250,250)
        depositHeld.Text = "Deposit held into chests"
        chestModule.stopFillingChests()
    else
        depositingHeld = true
        depositHeld.BackgroundColor3 = Color3.fromRGB(250,250,250)
        depositHeld.TextColor3 = Color3.fromRGB(0,0,0)
        depositHeld.Text = "Depositing held item"
        chestModule.startFillingChests()
    end
end)

local presentOpener = Instance.new("TextButton")
presentOpener.Position = UDim2.new(0,71,1,106)
presentOpener.Size = UDim2.new(0,70,0,20)
presentOpener.BackgroundColor3 = Color3.fromRGB(63,63,63)
presentOpener.BorderSizePixel = 1
presentOpener.ZIndex = 2
presentOpener.Parent = Notification3
presentOpener.Text = "Open Presents"
presentOpener.TextColor3 = Color3.fromRGB(250,250,250)
presentOpener.TextScaled = true
presentOpener.MouseButton1Click:Connect(function()
    if openingPresents then
        openingPresents = false
        presentOpener.BackgroundColor3 = Color3.fromRGB(63,63,63)
        presentOpener.Text = "Open Presents"
        presentOpener.TextColor3 = Color3.fromRGB(250,250,250)
    else
        openingPresents = true
        presentOpener.BackgroundColor3 = Color3.fromRGB(250,250,250)
        presentOpener.Text = "Opening"
        presentOpener.TextColor3 = Color3.fromRGB(0,0,0)
        while openingPresents and task.wait() do
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_22:InvokeServer()
        end
    end
end)

local presentBreaker = Instance.new("TextButton")
presentBreaker.Position = UDim2.new(0,0,1,253)
presentBreaker.Size = UDim2.new(0,140,0,20)
presentBreaker.BackgroundColor3 = Color3.fromRGB(63,63,63)
presentBreaker.BorderSizePixel = 1
presentBreaker.ZIndex = 2
presentBreaker.Parent = Notification3
presentBreaker.Text = "Present Breaker"
presentBreaker.TextColor3 = Color3.fromRGB(250,250,250)
presentBreaker.TextScaled = true
presentBreaker.MouseButton1Click:Connect(function()
    if breakingPresents then
        breakingPresents = false
        presentBreaker.BackgroundColor3 = Color3.fromRGB(63,63,63)
        presentBreaker.Text = "Present Breaker"
        presentBreaker.TextColor3 = Color3.fromRGB(250,250,250)
        breakModule.stopBreaking()
    else
        breakingPresents = true
        presentBreaker.BackgroundColor3 = Color3.fromRGB(250,250,250)
        presentBreaker.Text = "Breaking Presents"
        presentBreaker.TextColor3 = Color3.fromRGB(0,0,0)
        breakModule.breakThisBlock("christmasPresent3")
    end
end)

local Item76 = Instance.new("TextButton")
Item76.Position = UDim2.new(0,0,1,21)
Item76.Size = UDim2.new(0,141,0,20)
Item76.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item76.BorderSizePixel = 1
Item76.ZIndex = 2
Item76.Parent = Notification10
Item76.Text = "Clear Small Furnace"
Item76.TextColor3 = Color3.new(1,1,1)
Item76.TextScaled = true
Item76.Visible = false

local Item78 = Instance.new("TextButton")
Item78.Position = UDim2.new(0,72,1,64)
Item78.Size = UDim2.new(0,70,0,20)
Item78.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item78.BorderSizePixel = 1
Item78.ZIndex = 2
Item78.Parent = N1
Item78.Text = "Give Fertility Potions"
Item78.TextColor3 = Color3.fromRGB(250,250,250)
Item78.TextScaled = true

local Item79 = Instance.new("TextButton")
Item79.Position = UDim2.new(0,0,1,148)
Item79.Size = UDim2.new(0,70,0,20)
Item79.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item79.BorderSizePixel = 1
Item79.ZIndex = 2
Item79.Parent = Notification3
Item79.Text = "Catch Spirits"
Item79.TextColor3 = Color3.fromRGB(250,250,250)
Item79.TextScaled = true

local Item80 = Instance.new("TextButton")
Item80.Position = UDim2.new(0,1,0,222)
Item80.Size = UDim2.new(0,100,0,20)
Item80.BackgroundColor3 = Color3.fromRGB(0,0,250)
Item80.BorderSizePixel = 1
Item80.BorderColor3 = Color3.new(1,1,1)
Item80.ZIndex = 2
Item80.LayoutOrder = 9
Item80.Parent = CmdHandler
Item80.Text = "Hub Shops >"
Item80.TextColor3 = Color3.fromRGB(250,250,250)
Item80.TextScaled = true
Item80.Visible = false

local Item81 = Instance.new("TextButton")
Item81.Position = UDim2.new(0,1,0,1)
Item81.Size = UDim2.new(0,100,0,20)
Item81.BackgroundColor3 = Color3.fromRGB(0,0,250)
Item81.BorderSizePixel = 1
Item81.BorderColor3 = Color3.new(1,1,1)
Item81.ZIndex = 2
Item81.Parent = CmdHandler8
Item81.Text = "Lunar >"
Item81.TextColor3 = Color3.fromRGB(250,250,250)
Item81.TextScaled = true

local LA = Instance.new("TextBox")
LA.Position = UDim2.new(0,20,0,0)
LA.Size = UDim2.new(0,100,0,20)
LA.BackgroundColor3 = Color3.fromRGB(50,50,50)
LA.BorderSizePixel = 1
LA.BorderColor3 = Color3.new(1,1,1)
LA.ZIndex = 2
LA.Parent = LunarScroll
LA.Text = ""
LA.PlaceholderText = "Enter Amount"
LA.TextColor3 = Color3.fromRGB(250,250,250)
LA.TextScaled = true

local L1 = Instance.new("TextButton")
L1.Position = UDim2.new(0,1,0,21)
L1.Size = UDim2.new(0,140,0,20)
L1.BackgroundColor3 = Color3.fromRGB(0,0,250)
L1.BorderSizePixel = 1
L1.BorderColor3 = Color3.new(1,1,1)
L1.ZIndex = 2
L1.Parent = LunarScroll
L1.Text = "Fortune Cookies"
L1.TextColor3 = Color3.fromRGB(250,250,250)
L1.TextScaled = true
L1.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 2,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local L2 = Instance.new("TextButton")
L2.Position = UDim2.new(0,1,0,42)
L2.Size = UDim2.new(0,140,0,20)
L2.BackgroundColor3 = Color3.fromRGB(0,0,250)
L2.BorderSizePixel = 1
L2.BorderColor3 = Color3.new(1,1,1)
L2.ZIndex = 2
L2.Parent = LunarScroll
L2.Text = "Lion Lounge"
L2.TextColor3 = Color3.fromRGB(250,250,250)
L2.TextScaled = true
L2.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 20,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local L3 = Instance.new("TextButton")
L3.Position = UDim2.new(0,1,0,63)
L3.Size = UDim2.new(0,140,0,20)
L3.BackgroundColor3 = Color3.fromRGB(0,0,250)
L3.BorderSizePixel = 1
L3.BorderColor3 = Color3.new(1,1,1)
L3.ZIndex = 2
L3.Parent = LunarScroll
L3.Text = "Lunar Banner"
L3.TextColor3 = Color3.fromRGB(250,250,250)
L3.TextScaled = true
L3.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 30,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local L4 = Instance.new("TextButton")
L4.Position = UDim2.new(0,1,0,84)
L4.Size = UDim2.new(0,140,0,20)
L4.BackgroundColor3 = Color3.fromRGB(0,0,250)
L4.BorderSizePixel = 1
L4.BorderColor3 = Color3.new(1,1,1)
L4.ZIndex = 2
L4.Parent = LunarScroll
L4.Text = "Lunar Drum"
L4.TextColor3 = Color3.fromRGB(250,250,250)
L4.TextScaled = true
L4.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 40,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L5 = Instance.new("TextButton")
L5.Position = UDim2.new(0,1,0,105)
L5.Size = UDim2.new(0,140,0,20)
L5.BackgroundColor3 = Color3.fromRGB(0,0,250)
L5.BorderSizePixel = 1
L5.BorderColor3 = Color3.new(1,1,1)
L5.ZIndex = 2
L5.Parent = LunarScroll
L5.Text = "Lunar Gate"
L5.TextColor3 = Color3.fromRGB(250,250,250)
L5.TextScaled = true
L5.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 50,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L6 = Instance.new("TextButton")
L6.Position = UDim2.new(0,1,0,126)
L6.Size = UDim2.new(0,140,0,20)
L6.BackgroundColor3 = Color3.fromRGB(0,0,250)
L6.BorderSizePixel = 1
L6.BorderColor3 = Color3.new(1,1,1)
L6.ZIndex = 2
L6.Parent = LunarScroll
L6.Text = "Lunar Lamp"
L6.TextColor3 = Color3.fromRGB(250,250,250)
L6.TextScaled = true
L6.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 60,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L7 = Instance.new("TextButton")
L7.Position = UDim2.new(0,1,0,147)
L7.Size = UDim2.new(0,140,0,20)
L7.BackgroundColor3 = Color3.fromRGB(0,0,250)
L7.BorderSizePixel = 1
L7.BorderColor3 = Color3.new(1,1,1)
L7.ZIndex = 2
L7.Parent = LunarScroll
L7.Text = "Stacked Star Lunar Lantern"
L7.TextColor3 = Color3.fromRGB(250,250,250)
L7.TextScaled = true
L7.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 70,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L8 = Instance.new("TextButton")
L8.Position = UDim2.new(0,1,0,168)
L8.Size = UDim2.new(0,140,0,20)
L8.BackgroundColor3 = Color3.fromRGB(0,0,250)
L8.BorderSizePixel = 1
L8.BorderColor3 = Color3.new(1,1,1)
L8.ZIndex = 2
L8.Parent = LunarScroll
L8.Text = "Star Lunar Lantern"
L8.TextColor3 = Color3.fromRGB(250,250,250)
L8.TextScaled = true
L8.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 80,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L9 = Instance.new("TextButton")
L9.Position = UDim2.new(0,1,0,189)
L9.Size = UDim2.new(0,140,0,20)
L9.BackgroundColor3 = Color3.fromRGB(0,0,250)
L9.BorderSizePixel = 1
L9.BorderColor3 = Color3.new(1,1,1)
L9.ZIndex = 2
L9.Parent = LunarScroll
L9.Text = "Stacked Lunar Lantern"
L9.TextColor3 = Color3.fromRGB(250,250,250)
L9.TextScaled = true
L9.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 90,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L10 = Instance.new("TextButton")
L10.Position = UDim2.new(0,1,0,210)
L10.Size = UDim2.new(0,140,0,20)
L10.BackgroundColor3 = Color3.fromRGB(0,0,250)
L10.BorderSizePixel = 1
L10.BorderColor3 = Color3.new(1,1,1)
L10.ZIndex = 2
L10.Parent = LunarScroll
L10.Text = "Lunar Lantern Small"
L10.TextColor3 = Color3.fromRGB(250,250,250)
L10.TextScaled = true
L10.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 100,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L11 = Instance.new("TextButton")
L11.Position = UDim2.new(0,1,0,231)
L11.Size = UDim2.new(0,140,0,20)
L11.BackgroundColor3 = Color3.fromRGB(0,0,250)
L11.BorderSizePixel = 1
L11.BorderColor3 = Color3.new(1,1,1)
L11.ZIndex = 2
L11.Parent = LunarScroll
L11.Text = "Tiger Bean Bag"
L11.TextColor3 = Color3.fromRGB(250,250,250)
L11.TextScaled = true
L11.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 110,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L12 = Instance.new("TextButton")
L12.Position = UDim2.new(0,1,0,252)
L12.Size = UDim2.new(0,140,0,20)
L12.BackgroundColor3 = Color3.fromRGB(0,0,250)
L12.BorderSizePixel = 1
L12.BorderColor3 = Color3.new(1,1,1)
L12.ZIndex = 2
L12.Parent = LunarScroll
L12.Text = "Tiger Coin Bag"
L12.TextColor3 = Color3.fromRGB(250,250,250)
L12.TextScaled = true
L12.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 120,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L13 = Instance.new("TextButton")
L13.Position = UDim2.new(0,1,0,273)
L13.Size = UDim2.new(0,140,0,20)
L13.BackgroundColor3 = Color3.fromRGB(0,0,250)
L13.BorderSizePixel = 1
L13.BorderColor3 = Color3.new(1,1,1)
L13.ZIndex = 2
L13.Parent = LunarScroll
L13.Text = "Tiger Fridge"
L13.TextColor3 = Color3.fromRGB(250,250,250)
L13.TextScaled = true
L13.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 130,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L14 = Instance.new("TextButton")
L14.Position = UDim2.new(0,1,0,294)
L14.Size = UDim2.new(0,140,0,20)
L14.BackgroundColor3 = Color3.fromRGB(0,0,250)
L14.BorderSizePixel = 1
L14.BorderColor3 = Color3.new(1,1,1)
L14.ZIndex = 2
L14.Parent = LunarScroll
L14.Text = "Tiger Jacuzzi"
L14.TextColor3 = Color3.fromRGB(250,250,250)
L14.TextScaled = true
L14.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 140,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L14 = Instance.new("TextButton")
L14.Position = UDim2.new(0,1,0,315)
L14.Size = UDim2.new(0,140,0,20)
L14.BackgroundColor3 = Color3.fromRGB(0,0,250)
L14.BorderSizePixel = 1
L14.BorderColor3 = Color3.new(1,1,1)
L14.ZIndex = 2
L14.Parent = LunarScroll
L14.Text = "Red Envelope (1 per day)"
L14.TextColor3 = Color3.fromRGB(250,250,250)
L14.TextScaled = true
L14.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 1,
	["amount"] = 1
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local Item82 = Instance.new("TextButton")
Item82.Position = UDim2.new(0,1,0,21)
Item82.Size = UDim2.new(0,100,0,20)
Item82.BackgroundColor3 = Color3.fromRGB(0,0,250)
Item82.BorderSizePixel = 1
Item82.BorderColor3 = Color3.new(1,1,1)
Item82.ZIndex = 2
Item82.Parent = CmdHandler8
Item82.Text = "Cletus >"
Item82.TextColor3 = Color3.fromRGB(250,250,250)
Item82.TextScaled = true

local Item83 = Instance.new("TextButton")
Item83.Position = UDim2.new(0,1,0,42)
Item83.Size = UDim2.new(0,100,0,20)
Item83.BackgroundColor3 = Color3.fromRGB(0,0,250)
Item83.BorderSizePixel = 1
Item83.BorderColor3 = Color3.new(1,1,1)
Item83.ZIndex = 2
Item83.Parent = CmdHandler8
Item83.Text = "Wholesaler >"
Item83.TextColor3 = Color3.fromRGB(250,250,250)
Item83.TextScaled = true

local HWV = Instance.new("TextButton")
HWV.Position = UDim2.new(0,1,0,63)
HWV.Size = UDim2.new(0,100,0,20)
HWV.BackgroundColor3 = Color3.fromRGB(0,0,250)
HWV.BorderSizePixel = 1
HWV.BorderColor3 = Color3.new(1,1,1)
HWV.ZIndex = 2
HWV.Parent = CmdHandler8
HWV.Text = "Halloween >"
HWV.TextColor3 = Color3.fromRGB(250,250,250)
HWV.TextScaled = true

local Item84 = Instance.new("TextButton")
Item84.Position = UDim2.new(0,1,0,126)
Item84.Size = UDim2.new(0,100,0,20)
Item84.BackgroundColor3 = Color3.fromRGB(0,0,250)
Item84.BorderSizePixel = 1
Item84.BorderColor3 = Color3.new(1,1,1)
Item84.ZIndex = 2
Item84.LayoutOrder = 5
Item84.Parent = CmdHandler
Item84.Text = "Mining >"
Item84.TextColor3 = Color3.fromRGB(250,250,250)
Item84.TextScaled = true

local Item85 = Instance.new("TextButton")
Item85.Position = UDim2.new(0,0,1,1)
Item85.Size = UDim2.new(0,70,0,20)
Item85.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item85.BorderSizePixel = 1
Item85.ZIndex = 2
Item85.Parent = Notification11
Item85.Text = "Buffalkor Island"
Item85.TextColor3 = Color3.fromRGB(250,250,250)
Item85.TextScaled = true

local Item86 = Instance.new("TextButton")
Item86.Position = UDim2.new(0,72,1,1)
Item86.Size = UDim2.new(0,70,0,20)
Item86.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item86.BorderSizePixel = 1
Item86.ZIndex = 2
Item86.Parent = Notification11
Item86.Text = "Diamond Island"
Item86.TextColor3 = Color3.fromRGB(250,250,250)
Item86.TextScaled = true

local Item87 = Instance.new("TextButton")
Item87.Position = UDim2.new(0,71,1,127)
Item87.Size = UDim2.new(0,70,0,20)
Item87.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item87.BorderSizePixel = 1
Item87.ZIndex = 2
Item87.Parent = N1
Item87.Text = "Pick Berries"
Item87.TextColor3 = Color3.fromRGB(250,250,250)
Item87.TextScaled = true

local kiwiPicker = Instance.new("TextButton")
kiwiPicker.Position = UDim2.new(0,1,1,85)
kiwiPicker.Size = UDim2.new(0,70,0,20)
kiwiPicker.BackgroundColor3 = Color3.fromRGB(63,63,63)
kiwiPicker.BorderSizePixel = 1
kiwiPicker.ZIndex = 2
kiwiPicker.Parent = N1
kiwiPicker.Text = "Pirate Kiwi"
kiwiPicker.TextColor3 = Color3.fromRGB(250,250,250)
kiwiPicker.TextScaled = true
kiwiPicker.MouseButton1Click:Connect(function()
    if pickingKiwis then
        pickingKiwis = false
        kiwiPicker.BackgroundColor3 = Color3.fromRGB(63,63,63)
        kiwiPicker.Text = "Pirate Kiwi"
        wildFruitModule.stopPickingWildFruit()
    else
        pickingKiwis = true
        kiwiPicker.BackgroundColor3 = Color3.fromRGB(0,200,200)
        kiwiPicker.Text = "Picking!"
        wildFruitModule.startPickingWildFruit()
    end
end)

local Item88 = Instance.new("TextButton")
Item88.Position = UDim2.new(0,1,1,127)
Item88.Size = UDim2.new(0,70,0,20)
Item88.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item88.BorderSizePixel = 1
Item88.ZIndex = 2
Item88.Parent = N1
Item88.Text = "Composter"
Item88.TextColor3 = Color3.fromRGB(250,250,250)
Item88.TextScaled = true

local function NoclipLoop()
    if noClip == true and Player.Character ~= nil then
        for _, child in pairs(Player.Character:GetDescendants()) do
            if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                child.CanCollide = false
            end
        end
    end
end

local VoidParasite = Instance.new("TextButton")
VoidParasite.Position = UDim2.new(0,0,1,1)
VoidParasite.Size = UDim2.new(0,140,0,40)
VoidParasite.BackgroundColor3 = Color3.fromRGB(150,63,150)
VoidParasite.BorderSizePixel = 1
VoidParasite.ZIndex = 2
VoidParasite.Parent = N2
VoidParasite.Text = "Use Void Rocks under mining for VoidParasite"
VoidParasite.TextColor3 = Color3.fromRGB(250,250,250)
VoidParasite.TextScaled = true


Title.MouseButton1Click:Connect(function()
    if Toggled5 then
        Toggled5 = false
        Title.BackgroundColor3 = Color3.new(0,0,1)
        Title.Text = "Mob Farms >"
        Title.TextColor3 = Color3.fromRGB(250,250,250)
        Background2.Visible = false
    else
        Toggled5 = true
        Toggled6 = false
        Toggled8 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = false
        Background10.Visible = false
        Item67.Text = "Farming >"
        Title.Text = "Mob Farms <"
        Background4.Visible = false
        Background5.Visible = false
        playersBackground.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background9.Visible = false
        Background11.Visible = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Tests.Text = "Misc >"
        BowBoss.Text = "Wood >"
        Teleports.Text = "Teleports >"
        GUIs.Text = "Players >"
        Item42.Text = "Machines >"
        Item65.Text = "Auto Eat >"
        Item80.Text = "Hub Shops >"
        Background2.Visible = true
    end
end)

BowBoss.MouseButton1Click:Connect(function()
    if Toggled13 then
        Toggled13 = false
        BowBoss.BackgroundColor3 = Color3.new(0,0,1)
        BowBoss.Text = "Wood >"
        BowBoss.TextColor3 = Color3.fromRGB(250,250,250)
        Background5.Visible = false
    else
        Toggled13 = true
        Toggled6 = false
        Toggled5 = false
        Toggled8 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = false
        Background10.Visible = false
        Item67.Text = "Farming >"
        BowBoss.Text = "Wood <"
        Title.Text = "Mob Farms >"
        Background4.Visible = false
        Background2.Visible = false
        playersBackground.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background9.Visible = false
        Background11.Visible = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Tests.Text = "Misc >"
        Teleports.Text = "Teleports >"
        GUIs.Text = "Players >"
        Item42.Text = "Machines >"
        Item65.Text = "Auto Eat >"
        Item80.Text = "Hub Shops >"
        Background5.Visible = true
    end
end)

GUIs.MouseButton1Click:Connect(function()
    if Toggled22 then
        Toggled22 = false
        GUIs.BackgroundColor3 = Color3.new(0,0,1)
        GUIs.Text = "Players >"
        GUIs.TextColor3 = Color3.fromRGB(250,250,250)
        playersBackground.Visible = false
    else
        Toggled22 = true
        Toggled13 = false
        Toggled6 = false
        Toggled5 = false
        Toggled8 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = false
        Background10.Visible = false
        Item67.Text = "Farming >"
        BowBoss.Text = "Wood >"
        Title.Text = "Mob Farms >"
        Background4.Visible = false
        Background2.Visible = false
        Background5.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background9.Visible = false
        Background11.Visible = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Tests.Text = "Misc >"
        Teleports.Text = "Teleports >"
        Item42.Text = "Machines >"
        Item65.Text = "Auto Eat >"
        GUIs.Text = "Players <"
        Item80.Text = "Hub Shops >"
        playersBackground.Visible = true
    end
end)

Tests.MouseButton1Click:Connect(function()
    if Toggled8 then
        Toggled8 = false
        Tests.BackgroundColor3 = Color3.new(0,0,1)
        Tests.Text = "Misc >"
        Tests.TextColor3 = Color3.fromRGB(250,250,250)
        Background4.Visible = false
    else
        Toggled8 = true
        Toggled5 = false
        Toggled6 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = false
        Background10.Visible = false
        Item67.Text = "Farming >"
        Tests.Text = "Misc <"
        Background2.Visible = false
        Background5.Visible = false
        playersBackground.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background9.Visible = false
        Background11.Visible = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Title.Text = "Mob Farms >"
        Teleports.Text = "Teleports >"
        BowBoss.Text = "Wood >"
        GUIs.Text = "Players >"
        Item42.Text = "Machines >"
        Item65.Text = "Auto Eat >"
        Item80.Text = "Hub Shops >"
        Background4.Visible = true
    end
end)

Item65.MouseButton1Click:Connect(function()
    if Toggled47 then
        Toggled47 = false
        Item65.Text = "Auto Eat >"
        Background9.Visible = false
    else
        Toggled47 = true
        Toggled5 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled50 = false
        Toggled70 = false
        Background10.Visible = false
        Item67.Text = "Farming >"
        Item65.Text = "Auto Eat <"
        Item80.Text = "Hub Shops >"
        Background2.Visible = false
        Background5.Visible = false
        playersBackground.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background11.Visible = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Title.Text = "Mob Farms >"
        Teleports.Text = "Teleports >"
        BowBoss.Text = "Wood >"
        Item42.Text = "Machines >"
        Background9.Visible = true
    end
end)

Item67.MouseButton1Click:Connect(function()
    if Toggled50 then
        Toggled50 = false
        Background10.Visible = false
        Item67.Text = "Farming >"
        Item67.BackgroundColor3 = Color3.new(0,0,1)
        Item67.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled8 = false
        Toggled5 = false
        Toggled6 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = true
        Toggled70 = false
        Item67.Text = "Farming <"
        Background10.Visible = true
        Background2.Visible = false
        Background4.Visible = false
        Background5.Visible = false
        playersBackground.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background9.Visible = false
        Background11.Visible = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Title.Text = "Mob Farms >"
        Teleports.Text = "Teleports >"
        BowBoss.Text = "Wood >"
        GUIs.Text = "Players >"
        Item42.Text = "Machines >"
        Item65.Text = "Auto Eat >"
        Tests.Text = "Misc >"
        Item80.Text = "Hub Shops >"
    end
end)

Item80.MouseButton1Click:Connect(function()
    if Toggled70 then
        Toggled70 = false
        Background11.Visible = false
        Item80.Text = "Hub Shops >"
        Item80.BackgroundColor3 = Color3.new(0,0,1)
        Item80.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled8 = false
        Toggled5 = false
        Toggled6 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = true
        Item80.Text = "Hub Shops <"
        Item67.Text = "Farming >"
        Background10.Visible = false
        Background2.Visible = false
        Background4.Visible = false
        Background5.Visible = false
        playersBackground.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background9.Visible = false
        Background11.Visible = true
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Title.Text = "Mob Farms >"
        Teleports.Text = "Teleports >"
        BowBoss.Text = "Wood >"
        GUIs.Text = "Players >"
        Item42.Text = "Machines >"
        Item65.Text = "Auto Eat >"
        Tests.Text = "Misc >"
    end
end)

Item81.MouseButton1Click:Connect(function() -- lunar
    if Toggled71 then
        Toggled71 = false
        Lunar.Visible = false
        Item81.Text = "Lunar >"
        Item81.BackgroundColor3 = Color3.new(0,0,1)
        Item81.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled71 = true
        Item81.Text = "Lunar <"
        Lunar.Visible = true
        Toggled72 = false
        Item82.Text = "Cletus >"
        Cletus.Visible = false
        Toggled73 = false
        Wholesaler.Visible = false
        Item83.Text = "Wholesaler >"
        HWToggle = false
        HWV.Text = "Halloween >"
        halloweenVendor.Visible = false
    end
end)

Item82.MouseButton1Click:Connect(function() -- lunar
    if Toggled72 then
        Toggled72 = false
        Cletus.Visible = false
        Item82.Text = "Cletus >"
        Item82.BackgroundColor3 = Color3.new(0,0,1)
        Item82.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled72 = true
        Item82.Text = "Cletus <"
        Cletus.Visible = true
        Lunar.Visible = false
        Item81.Text = "Lunar >"
        Toggled71 = false
        Toggled73 = false
        Wholesaler.Visible = false
        Item83.Text = "Wholesaler >"
        HWToggle = false
        HWV.Text = "Halloween >"
        halloweenVendor.Visible = false
    end
end)

Item83.MouseButton1Click:Connect(function() -- wholesaler
    if Toggled73 then
        Toggled73 = false
        Wholesaler.Visible = false
        Item83.Text = "Wholesaler >"
        Item83.BackgroundColor3 = Color3.new(0,0,1)
        Item83.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled73 = true
        Item83.Text = "Wholesaler <"
        Wholesaler.Visible = true
        Lunar.Visible = false
        Cletus.Visible = false
        Item81.Text = "Lunar >"
        Item82.Text = "Cletus >"
        Toggled71 = false
        Toggled72 = false
        HWToggle = false
        HWV.Text = "Halloween >"
        halloweenVendor.Visible = false
    end
end)

HWV.MouseButton1Click:Connect(function() -- Halloween
    if HWToggle then
        HWToggle = false
        halloweenVendor.Visible = false
        HWV.Text = "Halloween >"
        HWV.BackgroundColor3 = Color3.new(0,0,1)
        HWV.TextColor3 = Color3.fromRGB(250,250,250)
    else
        HWToggle = true
        HWV.Text = "Halloween <"
        Wholesaler.Visible = false
        Lunar.Visible = false
        Cletus.Visible = false
        halloweenVendor.Visible = true
        Item81.Text = "Lunar >"
        Item82.Text = "Cletus >"
        Item83.Text = "Wholesaler >"
        Toggled71 = false
        Toggled72 = false
        Toggled73 = false
    end
end)

Item84.MouseButton1Click:Connect(function()
    if Toggled73 then
        Toggled73 = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Item84.BackgroundColor3 = Color3.new(0,0,1)
        Item84.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled8 = false
        Toggled5 = false
        Toggled6 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = false
        Toggled73 = true
        Item80.Text = "Hub Shops >"
        Item67.Text = "Farming >"
        Item84.Text = "Mining <"
        Background10.Visible = false
        Background2.Visible = false
        Background4.Visible = false
        Background5.Visible = false
        playersBackground.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background9.Visible = false
        Background11.Visible = false
        Background12.Visible = true
        Title.Text = "Mob Farms >"
        Teleports.Text = "Teleports >"
        BowBoss.Text = "Wood >"
        GUIs.Text = "Players >"
        Item42.Text = "Machines >"
        Item65.Text = "Auto Eat >"
        Tests.Text = "Misc >"
    end
end)


Item2.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ashlux/roblox-islands/main/join-invite-player-gui.lua'))()
end)

Item4.MouseButton1Click:Connect(function()
    if Toggled1 then
        Toggled1 = false
        Item4.BackgroundColor3 = Color3.fromRGB(63,165,63)
        Item4.Text = "Slimes"
        Item4.TextColor3 = Color3.fromRGB(250,250,250)
        Noclipping:Disconnect()
        noClip = false
        unFloat()
        killEverything:Disconnect()
        cancelTween()
    else
        Toggled1 = true
        Item4.BackgroundColor3 = Color3.new(1,0,0)
        Item4.Text = "KILL!"
        Item4.TextColor3 = Color3.fromRGB(0,0,0)
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        noClip = true
        Float()
        killEverything = game:GetService('RunService').Stepped:Connect(killAura)
        local enemy = "slime"
        local weapon = getEquipped()
        while Toggled1 == true do
            wait()
            local mobs = getMobs()
            if #mobs == 0 then
                wait()
            else
                for k,v in pairs(mobs) do
                    if v.Name == enemy then
                    local mob = v
                    tween, distance, speed = moveToMobs(mob, weapon)
                    wait(distance/speed - 1)
                    break
                    end
                end
            end
        end
    end
end)

Item5.MouseButton1Click:Connect(function()
    if Toggled2 then
        Toggled2 = false
        Item5.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
        Item5.Text = "Buffalkor"
        Item5.TextColor3 = Color3.fromRGB(1,1,1)
        unFloat()
        Noclipping:Disconnect()
        killEverything:Disconnect()
        noClip = false
        cancelTween()
    else
        Toggled2 = true
        Item5.BackgroundColor3 = Color3.new(1,0,0)
        Item5.Text = "KILL"
        Item5.TextColor3 = Color3.fromRGB(0,0,0)
        local enemy = "buffalkor"
        local weapon = getEquipped()
        Float()
        killEverything = game:GetService('RunService').Stepped:Connect(killAura)
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        noClip = true
        while Toggled2 == true do
            wait()
            local mobs = getMobs()
            if #mobs == 0 then
                wait()
            else
                for k,v in pairs(mobs) do
                    if v.Name == enemy then
                    local mob = v
                    tween, distance, speed = moveToMobs(mob, weapon)
                    wait(distance/speed - 1)
                    break
                    end
                end
            end
        end
    end
end)

Mob3.MouseButton1Click:Connect(function()
    if Toggled3 then
        Toggled3 = false
        Mob3.BackgroundColor3 = Color3.fromRGB(128,0,0)
        Mob3.Text = "Wizard"
        Mob3.TextColor3 = Color3.fromRGB(250,250,250)
        Noclipping:Disconnect()
        noClip = false
        unFloat()
        killEverything:Disconnect()
        cancelTween()
    else
        Toggled3 = true
        Mob3.BackgroundColor3 = Color3.new(1,0,0)
        Mob3.Text = "KILL!"
        Mob3.TextColor3 = Color3.fromRGB(0,0,0)
        local enemy = "wizardLizard"
        local weapon = getEquipped()
        Float()
        killEverything = game:GetService('RunService').Stepped:Connect(killAura)
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        noClip = true
        while Toggled3 == true do
            local mobs = getMobs()
            if #mobs == 0 then
                wait()
            else
                for k,v in pairs(mobs) do
                    if v.Name == enemy then
                    local mob = v
                    tween, distance, speed = moveToMobs(mob, weapon)
                    wait(distance/speed - 1)
                    break
                    end
                end
            end
        end
    end
end)

Mob4.MouseButton1Click:Connect(function()
    if Toggled4 then
        Toggled4 = false
        Mob4.BackgroundColor3 = Color3.fromRGB(194,178,128)
        Mob4.Text = "Skorps"
        Mob4.TextColor3 = Color3.fromRGB(1,1,1)
        unFloat()
        killEverything:Disconnect()
        cancelTween()
        Noclipping:Disconnect()
        noClip = false
    else
        Toggled4 = true
        Mob4.BackgroundColor3 = Color3.new(1,0,0)
        Mob4.Text = "KILL!"
        Mob4.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        killEverything = game:GetService('RunService').Stepped:Connect(killAura)
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        noClip = true
        enemy = "skorpRuby"
        enemy2 = "skorpGold"
        enemy3 = "skorpIron"
        while Toggled4 == true do
            wait()
            local mobs = getMobs()
            if #mobs == 0 then
                wait()
            else
                for k,v in pairs(mobs) do
                    if v.Name == enemy3 or v.Name == enemy2 or v.Name == enemy then
                    local mob = v
                    tween, distance, speed = moveToMobs(mob)
                    wait(distance/speed - 1)
                    break
                    end
                end
            end
        end
    end
end)

Item6.MouseButton1Click:Connect(function()
 _G.prox = {}
local c = 0
for i, v in pairs(workspace:GetDescendants()) do
    if v.Name == "ProximityPrompt" then
        if v.Parent:IsA("Model") then
            if (v.Parent.PrimaryPart.Position - HR.Position).Magnitude < 25 then
                table.insert(_G.prox, v)
            end
        elseif (v.Parent.Position - HR.Position).Magnitude < 25 then
            table.insert(_G.prox, v)
        end
    end
end
for i, v in pairs(_G.prox) do
    fireproximityprompt(v)
end
end)

mouse.Button1Down:connect(function()
    if Toggled7 == true then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = mouse.Hit
    end
end)
    
Item22.MouseButton1Click:Connect(function()
    if Toggled9 then
        Toggled9 = false
        Item22.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item22.Text = "Pick Useless Fertiles"
        Item22.TextColor3 = Color3.fromRGB(250,250,250)
        Pickem:Disconnect()
    else
        Toggled9 = true
        Item22.BackgroundColor3 = Color3.new(0,255,255)
        Item22.Text = "Pickin"
        Item22.TextColor3 = Color3.fromRGB(0,0,0)
    end
end)

if Island == "" then wait() else
Island.Blocks.ChildAdded:Connect(function(flower)
    if Toggled9 == true and (flower.Name == "flowerHibiscusPinkFertile" or flower.Name == "flowerHibiscusLightGreenFertile" or flower.Name == "flowerHibiscusBlueFertile" or flower.Name == "flowerHibiscusWhiteFertile" or flower.Name == "flowerHibiscusPurpleFertile" or flower.Name == "flowerHibiscusOrangeFertile" or flower.Name == "flowerHibiscusBlackFertile" or flower.Name == "flowerHyacinthRedFertile" or flower.Name == "flowerHyacinthYellowFertile" or flower.Name == "flowerHyacinthBlueFertile" or flower.Name == "flowerHyacinthCyanFertile"  or flower.Name == "flowerHyacinthLightGreenFertile" or flower.Name == "flowerHyacinthOrangeFertile" or flower.Name == "flowerHyacinthRedFertile" or flower.Name == "flowerLilyCyanFertile" or flower.Name == "flowerLilyBlueFertile" or flower.Name == "flowerLilyBlackFertile" or flower.Name == "flowerLilyYellowFertile" or flower.Name == "flowerLilyDarkGreenFertile" or flower.Name == "flowerLilyRedFertile" or flower.Name == "flowerDaisyWhiteFertile" or flower.Name == "flowerDaisyRedFertile" or flower.Name == "flowerDaisyLightGreenFertile" or flower.Name == "flowerDaisyCyanFertile" or flower.Name == "flowerDaisyDarkGreenFertile" or flower.Name == "flowerDaisyYellowFertile" or flower.Name == "flowerTulipYellowFertile" or flower.Name == "flowerTulipLightGreenFertile" or flower.Name == "flowerTulipRedFertile" or flower.Name == "flowerTulipPinkFertile" or flower.Name == "flowerTulipOrangeFertile" or flower.Name == "flowerTulipDarkGreenFertile" or flower.Name == "flowerTulipWhiteFertile" or flower.Name == "flowerMumWhiteFertile" or flower.Name == "flowerMumRedFertile" or flower.Name == "flowerMumCyanFertile" or flower.Name == "flowerMumLightGreenFertile" or flower.Name == "flowerMumBlueFertile" or flower.Name == "flowerMumBlackFertile" or flower.Name == "flowerMumPurpleFertile" or flower.Name == "flowerMumPinkFertile" or flower.Name == "flowerMumChromeFertile" or flower.Name == "flowerDaffodilYellowFertile" or flower.Name == "flowerDaffodilOrangeFertile" or flower.Name == "flowerDaffodilLightGreenFertile" or flower.Name == "flowerDaffodilPinkFertile" or flower.Name == "flowerDaffodilWhiteFertile" or flower.Name == "flowerDaffodilDarkGreenFertile" or flower.Name == "flowerRosePurpleFertile" or flower.Name == "flowerRosePinkFertile" or flower.Name == "flowerYellowHyacinthFertile") then
        local args = {
        [1] = {
        ["flower"] = flower
        }}game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
    end
end)
end

Item34.MouseButton1Click:Connect(function()
    if Toggled23 then
        Toggled23 = false
        Item34.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item34.Text = "Pick Unfertile"
        Item34.TextColor3 = Color3.fromRGB(250,250,250)
        flowerWaterModule.stopPickUnfertiles()
    else
        Toggled23 = true
        Item34.BackgroundColor3 = Color3.new(0,255,255)
        Item34.Text = "Pickin"
        Item34.TextColor3 = Color3.fromRGB(0,0,0)
        flowerWaterModule.startPickUnfertiles()
    end
end)

Item35.MouseButton1Click:Connect(function()
    if Toggled24 then
        Toggled24 = false
        Item35.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item35.Text = "Water Flowers"
        Item35.TextColor3 = Color3.fromRGB(250,250,250)
        flowerWaterModule.stopWaterClosestFlower()
    else
        Toggled24 = true
        Item35.BackgroundColor3 = Color3.new(0,255,255)
        Item35.Text = "Waterin"
        Item35.TextColor3 = Color3.fromRGB(0,0,0)
        flowerWaterModule.startWaterClosestFlower()
    end
end)

Item36.MouseButton1Click:Connect(function()
    if Toggled25 then
        Toggled25 = false
        Item36.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item36.Text = "Clear Grass/Rocks"
        Item36.TextColor3 = Color3.fromRGB(250,250,250)
        unFloat()
        cancelTween()
    else
        Toggled25 = true
        Item36.BackgroundColor3 = Color3.new(0,255,255)
        Item36.Text = "clearing spawnables"
        Item36.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        while Toggled25 == true do
            wait()
			spawnables = getSpawnables()
            for i,v in pairs(spawnables) do
                local tween, Time = goToPoint(v.Position, 24)
                if Time ~= nil then
                wait(Time - 2)
                end
                equipPick()
                hitBlock(v)
                break
            end
        end
    end
end)


function getHiveTrees()
    local trees = {}
    for _,tree in pairs(Island.Blocks:GetChildren()) do
        if tree:FindFirstChild("HiveLocations") then
            table.insert(trees, tree)
        end
    end
    return trees
end
    
function findHives()
    local trees = getHiveTrees()
    local beeHives = {}
    for i,t in pairs(trees) do
        for _,h in pairs(t.HiveLocations:GetChildren()) do
            if h:FindFirstChild("beeHive") then
                table.insert(beeHives, h.Parent.Parent)
            end
        end
    end
    return beeHives
end

Item23.MouseButton1Click:Connect(function()
    if Toggled10 then
        Toggled10 = false
        Item23.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item23.Text = "Honeycomb"
        Item23.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled10 = true
        Item23.BackgroundColor3 = Color3.new(0,255,255)
        Item23.Text = "Gettn HC"
        Item23.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled10 do
            wait()
            local tree = findHives()
            for _,hive in pairs(tree) do
                local args = {
                [1] = {
                ["tree"] = hive
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_COLLECT_HONEY:InvokeServer(unpack(args))
            end
        end
    end
end)

Item24.MouseButton1Click:Connect(function()
    if Toggled11 then
        Toggled11 = false
        Item24.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item24.Text = "Collect Nearby in/out"
        Item24.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled11 = true
        Item24.BackgroundColor3 = Color3.new(0,255,255)
        Item24.Text = "Collecting"
        Item24.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled11 == true do
            wait()
            Chests = getChests()
            for i,v in pairs(Chests) do
                if (v.Name == "chestLargeIndustrialIO" or v.Name == "chestMediumIndustrialIO" or v.Name == "chestMediumIndustrial") and #v.Contents:GetChildren() > 0 and Player:DistanceFromCharacter(v.Position) < 24 then
                    withdrawFromChest(v)
                end
            end
        end
    end
end)

Item25.MouseButton1Click:Connect(function()
    if Toggled12 then
        Toggled12 = false
        Item25.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item25.Text = "Auto-Mayo"
        Item25.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled12 = true
        Item25.BackgroundColor3 = Color3.new(0,255,255)
        Item25.Text = "Makin' the mayo"
        Item25.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled12 == true do
            wait()
			for _,MayoSpinner in pairs(Island.Blocks:GetChildren()) do
				if (MayoSpinner:IsA("Part")) and MayoSpinner.Name == "churner" then
					wait()

					local args = {
						[1] = {
						["amount"] = 1,
						["block"] = MayoSpinner,
						["player_tracking_category"] = "join_from_web",
						["toolName"] = "egg"
						}
					}

					game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))

					if MayoSpinner.WorkerContents:FindFirstChild("jarMayonnaise") then
	
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(MayoSpinner.Position + Vector3.new(0,5,0))
						wait()
						local args = {
							[1] = {
								["tool"] = MayoSpinner.WorkerContents.jarMayonnaise,
								["player_tracking_category"] = "join_from_web"
							}
						}

						game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
						else
					end
				end
			end
        end
    end
end)

Mob5.MouseButton1Click:Connect(function()
    if Toggled19 then
        Toggled19 = false
        Mob5.BackgroundColor3 = Color3.fromRGB(155,0,0)
        Mob5.Text = "magmaBlob"
        Mob5.TextColor3 = Color3.fromRGB(255,200,1)
        Noclipping:Disconnect()
        noClip = false
        unFloat()
        cancelTween()
        killEverything:Disconnect()
    else
        Toggled19 = true
        Mob5.BackgroundColor3 = Color3.new(1,0,0)
        Mob5.Text = "KILL"
        Mob5.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        noClip = true
        killEverything = game:GetService('RunService').Stepped:Connect(killAura)
        local enemy, enemy2, enemy3 = "magmaBlob", "magmaGolem", "magmaGolemite"
        local weapon = getEquipped()
        while Toggled19 == true do
            wait()
            local mobs = getMobs()
            if #mobs == 0 then
                wait()
            else
                for k,v in pairs(mobs) do
                    if v.Name == enemy or v.Name == enemy2 or v.Name == enemy3 then
                    local mob = v
                    tween, distance, speed = moveToMobs(mob, weapon)
                    wait(distance/speed - 1)
                    break
                    end
                end
            end
        end
    end
end)

Mob6.MouseButton1Click:Connect(function()
    if Toggled48 then
        Toggled48 = false
        Mob6.BackgroundColor3 = Color3.fromRGB(200,200,200)
        Mob6.Text = "Skeleton Pirate"
        Mob6.TextColor3 = Color3.new(0,0,0)
        Noclipping:Disconnect()
        noClip = false
        unFloat()
        killEverything:Disconnect()
        cancelTween()
    else
        Toggled48 = true
        Mob6.BackgroundColor3 = Color3.new(1,0,0)
        Mob6.Text = "KILL"
        Mob6.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        killEverything = game:GetService('RunService').Stepped:Connect(killAura)
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        noClip = true
        local enemy = "skeletonPirate"
        local weapon = getEquipped()
        while Toggled48 == true do
            wait()
            local mobs = getMobs()
            if #mobs == 0 then
                wait()
            else
                for k,v in pairs(mobs) do
                    if v.Name == enemy then
                    local mob = v
                    tween, distance, speed = moveToMobs(mob, weapon)
                    wait(distance/speed - 1)
                    break
                    end
                end
            end
        end
    end
end)

Mob7.MouseButton1Click:Connect(function()
    if Toggled49 then
        Toggled49 = false
        Mob7.BackgroundColor3 = Color3.fromRGB(200,50,50)
        Mob7.Text = "Crabs"
        Mob7.TextColor3 = Color3.fromRGB(255,200,1)
        Noclipping:Disconnect()
        noClip = false
        unFloat()
        killEverything:Disconnect()
        cancelTween()
    else
        Toggled49 = true
        Mob7.BackgroundColor3 = Color3.new(1,0,0)
        Mob7.Text = "KILL"
        Mob7.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        noClip = true
        killEverything = game:GetService('RunService').Stepped:Connect(killAura)
        local enemy = "hostileCrab"
        local weapon = getEquipped()
        while Toggled49 == true do
            wait()
            local mobs = getMobs()
            if #mobs == 0 then
                wait()
            else
                for k,v in pairs(mobs) do
                    if v.Name == enemy then
                    local mob = v
                    tween, distance, speed = moveToMobs(mob, weapon)
                    wait(distance/speed - 1)
                    break
                    end
                end
            end
        end
    end
end)

Mob8.MouseButton1Click:Connect(function()
    if Toggled60 then
        Toggled60 = false
        Mob8.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
        Mob8.Text = "Rock Mimic"
        Noclipping:Disconnect()
        noClip = false
        unFloat()
        killEverything:Disconnect()
        cancelTween()
    else
        Toggled60 = true
        Mob8.BackgroundColor3 = Color3.new(1,0,0)
        Mob8.Text = "KILL"
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        noClip = true
        Float()
        killEverything = game:GetService('RunService').Stepped:Connect(killAura)
        local enemy = "rockMimicGold"
        local enemy2 = "rockMimicIron"
        local enemy3 = "rockMimicCoal"
        local weapon = getEquipped()
        while Toggled60 == true do
            wait()
            local mobs = getMobs()
            if #mobs == 0 then
                wait()
            else
                for k,v in pairs(mobs) do
                    if v.Name == enemy or v.Name == enemy2 or v.Name == enemy3 then
                    local mob = v
                    tween, distance, speed = moveToMobs(mob, weapon)
                    wait(distance/speed - 1)
                    break
                    end
                end
            end
        end
    end
end)

local Mob9 = Instance.new("TextButton")
Mob9.Position = UDim2.new(0,1,1,85)
Mob9.Size = UDim2.new(0,70,0,20)
Mob9.BackgroundColor3 = Color3.fromRGB(150,0,150)
Mob9.BorderSizePixel = 0
Mob9.ZIndex = 2
Mob9.Parent = Notification6
Mob9.Text = "Void Dog"
Mob9.TextColor3 = Color3.fromRGB(0,0,0)
Mob9.TextScaled = true
Mob9.MouseButton1Click:Connect(function()
    if Toggled49 then
        Toggled49 = false
        Mob9.BackgroundColor3 = Color3.fromRGB(150,0,150)
        Mob9.Text = "Void Dog"
        Mob9.TextColor3 = Color3.fromRGB(255,200,1)
        Noclipping:Disconnect()
        noClip = false
        unFloat()
        killEverything:Disconnect()
        cancelTween()
    else
        Toggled49 = true
        Mob9.BackgroundColor3 = Color3.new(1,0,0)
        Mob9.Text = "KILL"
        Mob9.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        noClip = true
        killEverything = game:GetService('RunService').Stepped:Connect(killAura)
        local enemy = "voidDog"
        local weapon = getEquipped()
        while Toggled49 == true do
            wait()
            local mobs = getMobs()
            if #mobs == 0 then
                wait()
            else
                for k,v in pairs(mobs) do
                    if v.Name == enemy then
                    local mob = v
                    tween, distance, speed = moveToMobs(mob, weapon)
                    wait(distance/speed - 1)
                    break
                    end
                end
            end
        end
    end
end)

local Mob10 = Instance.new("TextButton")
Mob10.Position = UDim2.new(0,70,1,85)
Mob10.Size = UDim2.new(0,70,0,20)
Mob10.BackgroundColor3 = Color3.fromRGB(250,150,150)
Mob10.BorderSizePixel = 0
Mob10.ZIndex = 2
Mob10.Parent = Notification6
Mob10.Text = "Slime Queen"
Mob10.TextColor3 = Color3.fromRGB(0,0,0)
Mob10.TextScaled = true
Mob10.MouseButton1Click:Connect(function()
    if Toggled90 then
        Toggled90 = false
        Mob10.BackgroundColor3 = Color3.fromRGB(250,150,150)
        Mob10.Text = "Slime Queen"
        Mob10.TextColor3 = Color3.fromRGB(255,200,1)
        Noclipping:Disconnect()
        noClip = false
        unFloat()
        killEverything:Disconnect()
        cancelTween()
    else
        Toggled90 = true
        Mob10.BackgroundColor3 = Color3.new(1,0,0)
        Mob10.Text = "KILL"
        Mob10.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        noClip = true
        killEverything = game:GetService('RunService').Stepped:Connect(killAura)
        local enemy = "slimeQueen"
        local weapon = getEquipped()
        while Toggled90 == true do
            wait()
            local mobs = getMobs()
            if #mobs == 0 then
                wait()
            else
                for k,v in pairs(mobs) do
                    if v.Name == enemy then
                    local mob = v
                    tween, distance, speed = moveToMobs(mob, weapon)
                    wait(distance/speed - 1)
                    break
                    end
                end
            end
        end
    end
end)

local Mob11 = Instance.new("TextButton")
Mob11.Position = UDim2.new(0,0,1,106)
Mob11.Size = UDim2.new(0,70,0,20)
Mob11.BackgroundColor3 = Color3.fromRGB(0,150,0)
Mob11.BorderSizePixel = 0
Mob11.ZIndex = 2
Mob11.Parent = Notification6
Mob11.Text = "Slime King"
Mob11.TextColor3 = Color3.fromRGB(0,0,0)
Mob11.TextScaled = true
Mob11.MouseButton1Click:Connect(function()
    if Toggled91 then
        Toggled91 = false
        Mob11.BackgroundColor3 = Color3.fromRGB(0,150,0)
        Mob11.Text = "Slime King"
        Mob11.TextColor3 = Color3.fromRGB(255,200,1)
        Noclipping:Disconnect()
        noClip = false
        unFloat()
        killEverything:Disconnect()
        cancelTween()
    else
        Toggled91 = true
        Mob11.BackgroundColor3 = Color3.new(1,0,0)
        Mob11.Text = "KILL"
        Mob11.TextColor3 = Color3.fromRGB(0,0,0)
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        noClip = true
        Float()
        killEverything = game:GetService('RunService').Stepped:Connect(killAura)
        local enemy = "slimeKing"
        local weapon = getEquipped()
        while Toggled91 == true do
            wait()
            local mobs = getMobs()
            if #mobs == 0 then
                wait()
            else
                for k,v in pairs(mobs) do
                    if v.Name == enemy then
                    local mob = v
                    tween, distance, speed = moveToMobs(mob, weapon)
                    wait(distance/speed - 1)
                    break
                    end
                end
            end
        end
    end
end)

Item32.MouseButton1Click:Connect(function()
    if Toggled20 then
        Toggled20 = false
        Item32.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item32.Text = "Send items to Click"
        Item32.TextColor3 = Color3.fromRGB(250,250,250)
        reallyOwning:Disconnect()
        owning = false
    else
        Toggled20 = true
        Item32.BackgroundColor3 = Color3.new(1,0,0)
        Item32.Text = "Click Away"
        Item32.TextColor3 = Color3.fromRGB(0,255,255)
        reallyOwning = game:GetService('RunService').Stepped:Connect(iOwnTheWorld)
        owning = true
        mouse.Button1Down:connect(function()
            for i, tool in pairs(Island.Drops:GetChildren()) do
                if (tool:IsA("Tool")) then
                    if Toggled20 and tool:FindFirstChild("HandleDisabled") then
                        tool.HandleDisabled.Position = mouse.Hit.Position + Vector3.new(0,5,0)
                    end
                end
            end
        end)
    end
end)

Item33.MouseButton1Click:Connect(function()
    if Toggled21 then
        Toggled21 = false
        Item33.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item33.Text = "Collect Truffles"
        Item33.TextColor3 = Color3.fromRGB(250,250,250)
        cancelTween()
    else
        Toggled21 = true
        Item33.BackgroundColor3 = Color3.fromRGB(0,255,255)
        Item33.Text = "Collecting"
        Item33.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled21 == true do
            wait()
            for _,TruffleBarrel in pairs(Island.Blocks:GetChildren()) do
                if (TruffleBarrel:IsA("Part")) and TruffleBarrel.Name == "barrelTruffle" then
                    if TruffleBarrel.Contents:FindFirstChild("truffleBlack") then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TruffleBarrel.Position).magnitude > 24 then
                            Point = TruffleBarrel.Position
                            Distance = (HR.Position - Point).Magnitude
                            Speed = 20
                            Time = Distance/Speed
                            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                            tween:Play()
                            wait(Time - 2)
                        end
                        local args = {
                        [1] = {
                            ["chest"] = TruffleBarrel,
                            ["player_tracking_category"] = "join_from_web",
                            ["amount"] = 1,
                            ["tool"] = TruffleBarrel.Contents.truffleBlack,
                            ["action"] = "withdraw"
                        }
                        }

                        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_CHEST_TRANSACTION:InvokeServer(unpack(args))
                    elseif TruffleBarrel.Contents:FindFirstChild("truffleWhite") then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TruffleBarrel.Position).magnitude > 24 then
                            Point = TruffleBarrel.Position
                            Distance = (HR.Position - Point).Magnitude
                            Speed = 20
                            Time = Distance/Speed
                            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                            tween:Play()
                            wait(Time - 2)
                        end
                        local args = {
                            [1] = {
                                ["chest"] = TruffleBarrel,
                                ["player_tracking_category"] = "join_from_web",
                                ["amount"] = 1,
                                ["tool"] = TruffleBarrel.Contents.truffleWhite,
                                ["action"] = "withdraw"
                            }
                        }

                        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_CHEST_TRANSACTION:InvokeServer(unpack(args))

                        wait()
                    else
                        wait()
                    end
                end
            end
        end
    end
end)

Item42.MouseButton1Click:Connect(function()
    if Toggled27 then
        Toggled27 = false
        Item42.BackgroundColor3 = Color3.new(0,0,1)
        Item42.Text = "Machines >"
        Item42.TextColor3 = Color3.fromRGB(250,250,250)
        Background8.Visible = false
    else
        Toggled27 = true
        Toggled5 = false
        Toggled6 = false
        Toggled8 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = false
        Background10.Visible = false
        Item67.Text = "Farming >"
        Item42.Text = "Machines <"
        Background2.Visible = false
        Background4.Visible = false
        Background5.Visible = false
        playersBackground.Visible = false
        Background7.Visible = false
        Background9.Visible = false
        Background11.Visible = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Tests.Text = "Misc >"
        BowBoss.Text = "Wood >"
        Teleports.Text = "Teleports >"
        GUIs.Text = "Players >"
        Title.Text = "Mob Farms >"
        Item65.Text = "Auto Eat >"
        Item80.Text = "Hub Shops >"
        Background8.Visible = true
    end
end)

Item43.MouseButton1Click:Connect(function()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v.Name == "net" or v.Name == "voidMattock" or v.name == "plow" or v.Name == "grass" or v.name == "shovel" or v.Name == "rageblade" or v.Name == "arrow1" or v.Name == "bow3" or v.Name == "wateringCan" or v.Name == "sickleDiamond" or v.Name == "diamondPickaxe" or v.Name == "opalPickaxe" or v.Name == "opalAxe" or v.Name == "shears" or v.Name == "diamondAxe" or v.Name == "shovelStone" or v.Name == "fishingRodIron" or v.Name == "pizzaTruffle" or v.Name == "avocadoToastTruffle" or v.Name == "clippers" then wait() else
        -- add item to trade
        local args = {
        [1] = HttpService:GenerateGUID(false),
        [2] = {
        [1] = {
        ["quantity"] = v.Amount.Value,
        ["toolName"] = v.Name
        }
        }
        }
        addTrade:FireServer(unpack(args))
    end
end
wait()
-- accept trade
local args = {
    [1] = HttpService:GenerateGUID(false),
    [2] = {[1] = {["accepted"] = true}}}
tradeAccept:FireServer(unpack(args))
end)

Item44.MouseButton1Click:Connect(function()
    if Toggled28 then
        Toggled28 = false
        Item44.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Item44.Text = "Island Pickaxe Aura"
        Item44.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled28 = true
        Item44.BackgroundColor3 = Color3.new(0,0,1)
        Item44.Text = "Breaking Rocks!"
        Item44.TextColor3 = Color3.fromRGB(250,250,0)
        while Toggled28 == true do
            wait()
        if Island ~= "" then
        for i,v in pairs(Island.Blocks:GetChildren()) do
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude < 23 and v:FindFirstChild("CollisionBoxes") and v:FindFirstChild("1") then
            local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = v:FindFirstChild("1"),
                    ["block"] = v,
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
            end
        end
        else
        for i,v in pairs(game.Workspace.WildernessBlocks:GetChildren()) do
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude < 23 and v:FindFirstChild("RockStage") and v:FindFirstChild("1") then
            local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = v:FindFirstChild("1"),
                    ["block"] = v,
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
            end
        end
        end
        end
    end
end)

Item46.MouseButton1Click:Connect(function()
    if Toggled30 then
        Toggled30 = false
        Item46.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item46.Text = "Pickup Drops Aura"
        Item46.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled30 = true
        Item46.BackgroundColor3 = Color3.new(0,255,255)
        Item46.Text = "Picking up nearby items"
        Item46.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled30 == true do
            wait()
        for i,v in pairs(Island.Drops:GetChildren()) do
            if v:FindFirstChild("HandleDisabled") and (v:IsA("Tool")) and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HandleDisabled.Position).magnitude < 24 then
                task.spawn(function()
                local Pickup = {
                    [1] = {
                        ["tool"] = v,
                        ["player_tracking_category"] = "join_from_web"
                    }
                }

                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(Pickup))
                end)
            end
        end
        end
    end
end)

Item48.MouseButton1Click:Connect(function()
    if Toggled32 then
        Toggled32 = false
        Item48.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item48.Text = "Clear Island Fertiles"
        Item48.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled32 = true
        Item48.BackgroundColor3 = Color3.new(0,255,255)
        Item48.Text = "Picking"
        Item48.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled32 == true do
            if Island.Blocks:FindFirstChild("flowerHyacinthRedFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHyacinthRedFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerMumBlackFertile") then
            local args = {
            [1] = {
            ["flower"] = Island.Blocks.flowerMumBlackFertile
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerMumRedFertile") then
            local args = {
            [1] = {
            ["flower"] = Island.Blocks.flowerMumRedFertile
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHyacinthYellowFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHyacinthYellowFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerTulipYellowFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerTulipYellowFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerTulipRedFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerTulipRedFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHyacinthBlueFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHyacinthBlueFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerDaisyRedFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaisyRedFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerDaisyYellowFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaisyYellowFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerLilyRedFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerLilyRedFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerLilyYellowFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerLilyYellowFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerLilyBlueFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerLilyBlueFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHibiscusBlueFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusBlueFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHibiscusLightGreenFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusLightGreenFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHibiscusLightGreenFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusLightGreenFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            else
                wait()
            end
            wait()
        end
    end
end)

Item50.MouseButton1Click:Connect(function()
    if Toggled33 then
        Toggled33 = false
        Item50.BackgroundColor3 = Color3.fromRGB(186,164,138)
        Item50.Text = "Oak Wood"
        Item50.TextColor3 = Color3.fromRGB(0,0,0)
        unFloat()
        cancelTween()
    else
        Toggled33 = true
        Item50.BackgroundColor3 = Color3.new(200,0,0)
        Item50.Text = "Getting Oak"
        Item50.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        while Toggled33 == true do
            wait()
            local trees = getTrees()
            for k,v in pairs(trees) do
                if v.Name == "tree1" or v.Name == "tree2" or v.Name == "tree3" or v.Name == "tree4" then
                    tween, Time = goToPoint(v.Position, 12)
                    if Time then
                        wait(Time - 0.6)
                        cancelTween()
                    end
                    hitTree(v)
                break
                end
            end
        end
    end
end)

Item51.MouseButton1Click:Connect(function()
    if Toggled34 then
        Toggled34 = false
        Item51.BackgroundColor3 = Color3.fromRGB(248,223,161)
        Item51.Text = "Birch Wood"
        Item51.TextColor3 = Color3.fromRGB(0,0,0)
        cancelTween()
        unFloat()
    else
        Toggled34 = true
        Item51.BackgroundColor3 = Color3.new(200,0,0)
        Item51.Text = "Getting Birch"
        Item51.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        while Toggled34 == true do
            wait()
            local trees = getTrees()
            for k,v in pairs(trees) do
                if v.Name:find("treeBirch") then
                    tween, Time = goToPoint(v.Position, 12)
                    if Time then
                        wait(Time - 0.6)
                        cancelTween()
                    end
                    hitTree(v)
                break
                end
            end
        end
    end
end)

Item52.MouseButton1Click:Connect(function()
    if Toggled35 then
        Toggled35 = false
        Item52.BackgroundColor3 = Color3.fromRGB(85,52,43)
        Item52.Text = "Pine Wood"
        Item52.TextColor3 = Color3.fromRGB(250,250,250)
        cancelTween()
        unFloat()
    else
        Toggled35 = true
        Item52.BackgroundColor3 = Color3.new(200,0,0)
        Item52.Text = "Getting Pine"
        Item52.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        while Toggled35 == true do
            wait()
            local trees = getTrees()
            for k,v in pairs(trees) do
                if v.Name:find("treePine") then
                    tween, Time = goToPoint(v.Position, 12)
                    if Time then
                        wait(Time - 0.6)
                        cancelTween()
                    end
                    hitTree(v)
                break
                end
            end
        end
    end
end)

Item53.MouseButton1Click:Connect(function()
    if Toggled36 then
        Toggled36 = false
        Item53.BackgroundColor3 = Color3.fromRGB(200,111,87)
        Item53.Text = "Maple Wood"
        Item53.TextColor3 = Color3.fromRGB(0,0,0)
        cancelTween()
        unFloat()
    else
        Toggled36 = true
        Item53.BackgroundColor3 = Color3.new(200,0,0)
        Item53.Text = "Getting Maple"
        Item53.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        while Toggled36 == true do
            wait()
            local trees = getTrees()
            for k,v in pairs(trees) do
                if v.Name:find("treeMaple") then
                    tween, Time = goToPoint(v.Position, 12)
                    if Time then
                        wait(Time - 0.6)
                        cancelTween()
                    end
                    hitTree(v)
                break
                end
            end
        end
    end
end)

Item54.MouseButton1Click:Connect(function()
    if Toggled37 then
        Toggled37 = false
        Item54.BackgroundColor3 = Color3.fromRGB(258,233,171)
        Item54.Text = "Hickory Wood"
        Item54.TextColor3 = Color3.fromRGB(0,0,0)
        cancelTween()
        unFloat()
    else
        Toggled37 = true
        Item54.BackgroundColor3 = Color3.new(200,0,0)
        Item54.Text = "Getting Hickory"
        Item54.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        while Toggled37 == true do
            wait()
            local trees = getTrees()
            for k,v in pairs(trees) do
                if v.Name:find("treeHickory") then
                    tween, Time = goToPoint(v.Position, 12)
                    if Time then
                        wait(Time - 0.6)
                        cancelTween()
                    end
                    hitTree(v)
                break
                end
            end
        end
    end
end)

Item55.MouseButton1Click:Connect(function()
    if Toggled38 then
        Toggled38 = false
        Item55.BackgroundColor3 = Color3.fromRGB(168,105,165)
        Item55.Text = "Spirit Wood"
        Item55.TextColor3 = Color3.fromRGB(0,0,0)
        cancelTween()
        unFloat()
    else
        Toggled38 = true
        Item55.BackgroundColor3 = Color3.new(200,0,0)
        Item55.Text = "Getting Spirit"
        Item55.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        while Toggled38 == true do
            wait()
            local trees = getTrees()
            for k,v in pairs(trees) do
                if v.Name:find("treeSpirit") then
                    tween, Time = goToPoint(v.Position, 12)
                    if Time then
                        wait(Time - 0.6)
                        cancelTween()
                    end
                    hitTree(v)
                break
                end
            end
        end
    end
end)

Item56.MouseButton1Click:Connect(function()
    if Toggled39 then
        Toggled39 = false
        Item56.BackgroundColor3 = Color3.fromRGB(50,250,150)
        Item56.Text = "aquaBlock -> aquaCarved"
        Item56.TextColor3 = Color3.fromRGB(0,0,0)
    else
        Toggled39 = true
        Item56.BackgroundColor3 = Color3.new(200,0,0)
        Item56.Text = "Making Carved Aquamarine"
        Item56.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled39 == true do
            for i,StoneCutter in pairs(Island.Blocks:GetChildren()) do
    if StoneCutter.Name == "stonecutter" then
        if StoneCutter.Working.Value == true then
            if StoneCutter.WorkerContents:FindFirstChild("aquamarineCarved") then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - StoneCutter.Position).magnitude > 24 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(StoneCutter.Position + Vector3.new(0,5,0))
                    wait()
                    local args = {
                        [1] = {
                            ["tool"] = StoneCutter.WorkerContents.aquamarineCarved,
                            ["player_tracking_category"] = "join_from_web"
                        }
                    }
                    
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                else    
                    local args = {
                        [1] = {
                            ["tool"] = StoneCutter.WorkerContents.aquamarineCarved,
                            ["player_tracking_category"] = "join_from_web"
                        }
                    }
                    
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                end
            elseif #StoneCutter.WorkerContents:GetChildren() == 0 then
                local args = {
                    [1] = {
                        ["amount"] = 1,
                        ["block"] = StoneCutter,
                        ["player_tracking_category"] = "join_from_web",
                        ["toolName"] = "prismarineBlock"
                    }
                }
                    
                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
                
                local args = {
                    [1] = {
                        ["amount"] = 1,
                        ["block"] = StoneCutter,
                        ["player_tracking_category"] = "join_from_web",
                        ["toolName"] = "prismarineBlock"
                    }
                }
                    
                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
            else
                wait()
            end
        else
            local args = {
                [1] = {
                    ["amount"] = 1,
                    ["block"] = StoneCutter,
                    ["player_tracking_category"] = "join_from_web",
                    ["toolName"] = "coal"
                }
            }
            
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
        end
    end
end
end
end
end)

Item57.MouseButton1Click:Connect(function()
    if Toggled40 then
        Toggled40 = false
        Item57.BackgroundColor3 = Color3.fromRGB(50,250,150)
        Item57.Text = "aquaBlock -> aquaTiles"
        Item57.TextColor3 = Color3.fromRGB(0,0,0)
    else
        Toggled40 = true
        Item57.BackgroundColor3 = Color3.new(200,0,0)
        Item57.Text = "Making Aquamarine Tiles"
        Item57.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled40 == true do
            for i,StoneCutter in pairs(Island.Blocks:GetChildren()) do
                if StoneCutter.Name == "stonecutter" then
                    if StoneCutter.Working.Value == true then
                        if StoneCutter.WorkerContents:FindFirstChild("aquamarineTiles") then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - StoneCutter.Position).magnitude > 24 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(StoneCutter.Position + Vector3.new(0,5,0))
                    wait()
                    local args = {
                        [1] = {
                            ["tool"] = StoneCutter.WorkerContents.aquamarineTiles,
                            ["player_tracking_category"] = "join_from_web"
                        }
                    }
                    
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                else    
                    local args = {
                        [1] = {
                            ["tool"] = StoneCutter.WorkerContents.aquamarineTiles,
                            ["player_tracking_category"] = "join_from_web"
                        }
                    }
                    
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                end
            elseif #StoneCutter.WorkerContents:GetChildren() == 0 then
                local args = {
                    [1] = {
                        ["amount"] = 1,
                        ["block"] = StoneCutter,
                        ["player_tracking_category"] = "join_from_web",
                        ["toolName"] = "prismarineBlock"
                    }
                }
                    
                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
                
                local args = {
                    [1] = {
                        ["amount"] = 1,
                        ["block"] = StoneCutter,
                        ["player_tracking_category"] = "join_from_web",
                        ["toolName"] = "prismarineBlock"
                    }
                }
                    
                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
            else
                wait()
            end
        else
            local args = {
                [1] = {
                    ["amount"] = 1,
                    ["block"] = StoneCutter,
                    ["player_tracking_category"] = "join_from_web",
                    ["toolName"] = "coal"
                }
            }
            
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
        end
    end
end
end
end
end)

Item58.MouseButton1Click:Connect(function()
    if Toggled41 then
        Toggled41 = false
        Item58.BackgroundColor3 = Color3.fromRGB(50,250,150)
        Item58.Text = "aquaBlock -> aquaBrick"
        Item58.TextColor3 = Color3.fromRGB(0,0,0)
    else
        Toggled41 = true
        Item58.BackgroundColor3 = Color3.new(200,0,0)
        Item58.Text = "Making Aquamarine Brick"
        Item58.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled41 == true do
            for i,StoneCutter in pairs(Island.Blocks:GetChildren()) do
                if StoneCutter.Name == "stonecutter" then
                    if StoneCutter.Working.Value == true then
                        if StoneCutter.WorkerContents:FindFirstChild("aquamarineTiles") or StoneCutter.WorkerContents:FindFirstChild("aquamarineCarved") then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - StoneCutter.Position).magnitude > 24 then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(StoneCutter.Position + Vector3.new(0,5,0))
                                    wait()
                                    local args = {
                                        [1] = {
                                            ["tool"] = StoneCutter.WorkerContents.aquamarineTiles,
                                            ["player_tracking_category"] = "join_from_web"
                                        }
                                    }
                    
                                    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                                else    
                                    local args = {
                                        [1] = {
                                            ["tool"] = StoneCutter.WorkerContents.aquamarineCarved,
                                            ["player_tracking_category"] = "join_from_web"
                                        }
                                    }
                                    
                                    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                                end
                        elseif StoneCutter.WorkerContents:FindFirstChild("prismarineBrick") then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - StoneCutter.Position).magnitude > 24 then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(StoneCutter.Position + Vector3.new(0,5,0))
                                    wait()
                                    local args = {
                                        [1] = {
                                            ["tool"] = StoneCutter.WorkerContents.prismarineBrick,
                                            ["player_tracking_category"] = "join_from_web"
                                        }
                                    }
                    
                                    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                                else    
                                    local args = {
                                        [1] = {
                                            ["tool"] = StoneCutter.WorkerContents.prismarineBrick,
                                            ["player_tracking_category"] = "join_from_web"
                                        }
                                    }
                                    
                                    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                                end
                            elseif #StoneCutter.WorkerContents:GetChildren() == 0 then
                                local args = {
                                    [1] = {
                                        ["amount"] = 1,
                                        ["block"] = StoneCutter,
                                        ["player_tracking_category"] = "join_from_web",
                                        ["toolName"] = "prismarineBlock"
                                    }
                                }
                            
                                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
                
                                local args = {
                                    [1] = {
                                        ["amount"] = 1,
                                        ["block"] = StoneCutter,
                                        ["player_tracking_category"] = "join_from_web",
                                        ["toolName"] = "prismarineBlock"
                                    }
                                }
                    
                                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
                            else
                                wait()
                            end    
                        
                    else
                        local args = {
                            [1] = {
                                ["amount"] = 1,
                                ["block"] = StoneCutter,
                                ["player_tracking_category"] = "join_from_web",
                                ["toolName"] = "coal"
                            }
                        }
                    
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
                    
                    end
                end
            end
        end
    end
end)

Item59.MouseButton1Click:Connect(function()
    if Toggled42 then
        Toggled42 = false
        Item59.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item59.Text = "Cloth Loom"
        Item59.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled42 = true
        Item59.BackgroundColor3 = Color3.new(200,0,0)
        Item59.Text = "Making Cloth"
        Item59.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled42 == true do
            wait()
            for _,Loom in pairs(Island.Blocks:GetChildren()) do
                if Loom.Name == "circularLoom" then
                    if Loom.WorkerContents:FindFirstChild("cloth") then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Loom.Position).magnitude > 24 then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Loom.Position + Vector3.new(0,5,0))
                            wait(0.5)
                        end
                        local args = {
                        [1] = {
                        ["tool"] = Loom.WorkerContents.cloth,
                        ["player_tracking_category"] = "join_from_web"
                        }
                        }
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                    elseif Loom.WorkerContents:FindFirstChild("woolWhite") then
                        wait()
                    else    
                        local args = {
                            [1] = {
                            ["amount"] = 1,
                            ["block"] = Loom,
                            ["player_tracking_category"] = "join_from_web",
                            ["toolName"] = "woolWhite"
                            }
                            }
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
        
                    end
                end
            end
        end
    end
end)

Item61.MouseButton1Click:Connect(function()
    if Toggled44 then
        Toggled44 = false
        Item61.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item61.Text = "Catch Entities"
        Item61.TextColor3 = Color3.fromRGB(250,250,250)
        unFloat()
        cancelTween()
    else
        Toggled44 = true
        Item61.BackgroundColor3 = Color3.new(0,255,255)
        Item61.Text = "Catching stuff"
        Item61.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        while Toggled44 == true do
            Entities = getIslandEntities()
            wait()
            for i,v in pairs(Entities) do
                if v.Name ~= "villager" and v.Name ~= "bee" and v:FindFirstChild("Sleeping") == nil and v:FindFirstChild("HumanoidRootPart") then
                    if Toggled44 == true then
                    tween, Time = goToPoint(v.HumanoidRootPart.Position, 0)
                    wait(Time)
                    local args = {
                    [1] = HttpService:GenerateGUID(false),
                    [2] = {
                    [1] = {
                    ["entity"] = v
                    }
                    }
                    }
                    useNet:FireServer(unpack(args))
                    break
                    end
                end
            end
        end
    end
end)

Item63.MouseButton1Click:Connect(function()
    if Toggled46 then
        Toggled46 = false
        Item63.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item63.Text = "Animal Farm"
        Item63.TextColor3 = Color3.fromRGB(250,250,250)
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
    else
        Toggled46 = true
        Item63.BackgroundColor3 = Color3.new(0,255,255)
        Item63.Text = "feedn and harvestn"
        Item63.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        while Toggled46 == true do
            wait()
for i,insect in pairs(Island.Entities:GetChildren()) do
    if insect.Name == "duck" and insect.Sleeping.Value == false and insect.FoodLevel.Value < 900 then
        if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "bread" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
    elseif insect.Name == "cow" and insect.Sleeping.Value == false and (insect.FoodLevel.Value < 900 or insect.AnimalProductReady.Value > 0) then
		if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
		if insect.AnimalProductReady.Value > 0 then
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if v.Name == "bucketEmpty" then
                    v.Parent = game:GetService("Players").LocalPlayer.Character
                    wait()
                end
            end
            local args = {
                [1] = {
                ["animal"] = insect
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MILK_COW:InvokeServer(unpack(args))
		end
    if insect.FoodLevel.Value < 900 then
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "wheatHarvested" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
    end
    elseif insect.Name == "pig" and insect.Sleeping.Value == false and (insect.FoodLevel.Value < 900 or insect.AnimalProductReady.Value > 0) then
		if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
		if insect.AnimalProductReady.Value > 0 then
            local args = {
            [1] = {
            ["animal"] = insect
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_29:InvokeServer(unpack(args))
        end
    if insect.FoodLevel.Value < 900 then
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "carrotHarvested" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
    end
    elseif insect.Name == "sheep" and insect.Sleeping.Value == false and (insect.FoodLevel.Value < 900 or insect.AnimalProductReady.Value > 0) then
		if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
		if insect.AnimalProductReady.Value > 0 then
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if v.Name == "shears" then
                    v.Parent = game:GetService("Players").LocalPlayer.Character
                    wait()
                end
            end
            local args = {
                [1] = {
                ["animal"] = insect
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_24:InvokeServer(unpack(args))
        end
    if insect.FoodLevel.Value < 900 then
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "potatoHarvested" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
    end
    elseif insect.Name == "chicken" and insect.Sleeping.Value == false and insect.FoodLevel.Value < 900 then
        if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
    if insect.FoodLevel.Value < 900 then
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "berryHarvested" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
    end
    elseif insect.Name == "yak" and insect.Sleeping.Value == false and insect.FoodLevel.Value < 900 then
		if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
		if insect.AnimalProductReady.Value > 0 then
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if v.Name == "bucketEmpty" then
                    v.Parent = game:GetService("Players").LocalPlayer.Character
                    wait()
                end
            end
            local args = {
                [1] = {
                ["animal"] = insect
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_MILK_COW:InvokeServer(unpack(args))
		end
    if insect.FoodLevel.Value < 900 then
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "radishHarvested" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
    end
    elseif insect.Name == "horse" and insect.Sleeping.Value == false and insect.FoodLevel.Value < 900 then
        if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
    if insect.FoodLevel.Value < 900 then
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "carrotHarvested" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
    end
    elseif insect.Name == "turkey" and insect.Sleeping.Value == false and (insect.FoodLevel.Value < 900 or insect.AnimalProductReady.Value > 0) then
		if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
		if insect.AnimalProductReady.Value > 0 then
            local args = {
                [1] = insect
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.SpookTurkey:FireServer(unpack(args))
        end
    if insect.FoodLevel.Value < 900 then
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "berryHarvested" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
    end
    end
end
for i,nest in pairs(Island.Blocks:GetChildren()) do
    if nest.Name == "nest" and (nest.Contents:FindFirstChild("egg") or nest.Contents:FindFirstChild("duckEgg")) then
        if (HR.Position - nest.Position).magnitude > 24 then
            Point = nest.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
        for _,egg in pairs(nest.Contents:GetChildren()) do
        local args = {
            [1] = {
            ["chest"] = nest,
            ["player_tracking_category"] = "join_from_web",
            ["amount"] = 1,
            ["tool"] = egg,
            ["action"] = "withdraw"
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_CHEST_TRANSACTION:InvokeServer(unpack(args))
        end
    end
end
for _,itemport in pairs(Island.Blocks:GetChildren()) do
    if itemport.Name == "itemPort" then
        for _,eggs in pairs(itemport:GetChildren()) do
            if (eggs.Name == "egg" or eggs.Name == "duckEgg") then
                if (HR.Position - eggs.HandleDisabled.Position).magnitude > 24 then
                    Point = eggs.HandleDisabled.Position + Vector3.new(0,1.5,0)
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time)
                end
                local args = {
                    [1] = {
                    ["tool"] = eggs,
                    ["player_tracking_category"] = "join_from_web"
                    }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
            end
        end
    end
end
        end
    end
end)

Item64.MouseButton1Click:Connect(function()
    if Toggled47 then
        Toggled47 = false
        Item64.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item64.Text = "Leaf Collector"
        Item64.TextColor3 = Color3.fromRGB(250,250,250)
	-- TODO: stop moving tree to tree
        --if tween then
        --	tween:Cancel()
        --end
	treeModule.stopTrimIslandTreesAura()
    else
        Toggled47 = true
        Item64.BackgroundColor3 = Color3.new(0,255,255)
        Item64.Text = "Collecting Leaves"
        Item64.TextColor3 = Color3.fromRGB(0,0,0)
	
	treeModule.startTrimIslandTreesAura()
	-- TODO: put in moving to the next tree
    end
end)

for i,v in pairs(CmdHandler6:GetChildren()) do
    v.MouseButton1Click:Connect(function()
        if Toggled48 then
            Toggled48 = false
            v.BackgroundColor3 = Color3.new(0,0,0)
        else
            Toggled48 = true
            v.BackgroundColor3 = Color3.new(0,1,1)
            ToOl = v.Text
            while Toggled48  do
                
                if Player.Backpack:FindFirstChild(ToOl) then
                    Player.Backpack[ToOl].Parent = Player.Character
                end
                
                wait()
                args = {
                    [1] = {
                    ["tool"] = Player.Character[ToOl]
                    }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_EAT_FOOD:InvokeServer(unpack(args))
                wait(900)
            end
        end
    end)
end

Item69.MouseButton1Click:Connect(function()
    if Toggled52 then
        Toggled52 = false
        Item69.BackgroundColor3 = Color3.fromRGB(55,55,55)
        Item69.Text = "Fertility Potion Aura"
        Item69.TextColor3 = Color3.new(1,1,1)
        animalModule.stopFertilityLoop()
    else
        Toggled52 = true
        Item69.BackgroundColor3 = Color3.new(0,255,255)
        Item69.Text = "Giving Potions"
        Item69.TextColor3 = Color3.fromRGB(0,0,0)
        animalModule.fertilityAura()
    end
end)

Item70.MouseButton1Click:Connect(function()
    if Toggled53 then
        Toggled53 = false
        Item70.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item70.Text = "Auto-Yak Butter"
        Item70.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled53 = true
        Item70.BackgroundColor3 = Color3.new(0,255,255)
        Item70.Text = "Makin' the Butter"
        Item70.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled53 == true do
            wait()
			for _,MayoSpinner in pairs(Island.Blocks:GetChildren()) do
				if (MayoSpinner:IsA("Part")) and MayoSpinner.Name == "churner" then
					wait()

					local args = {
						[1] = {
						["amount"] = 1,
						["block"] = MayoSpinner,
						["player_tracking_category"] = "join_from_web",
						["toolName"] = "bucketYakMilk"
						}
					}

					game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))

					if MayoSpinner.WorkerContents:FindFirstChild("yakButter") then
	
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(MayoSpinner.Position + Vector3.new(0,5,0))
						wait()
						local args = {
							[1] = {
								["tool"] = MayoSpinner.WorkerContents.yakButter,
								["player_tracking_category"] = "join_from_web"
							}
						}

						game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
						else
					end
				end
			end
        end
    end
end)

Item72.MouseButton1Click:Connect(function()
    if Toggled55 then
        Toggled55 = false
        Item72.BackgroundColor3 = Color3.fromRGB(161,157,148)
        Item72.Text = "Iron"
        Item72.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled55 = true
        Item72.BackgroundColor3 = Color3.new(0,255,255)
        Item72.Text = "Smelting Iron"
        Item72.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled55 == true do
            wait()
			for i,b in pairs(Island.Blocks:GetChildren()) do
				if b.Name == "smallFurnace" then
					if b.WorkerFuel:FindFirstChild("coal") then
						if #b.WorkerContents:GetChildren() == 0 then
							local Repeat = 1
							if Toggled55 == true then
								local args = {
									[1] = {
									["amount"] = 50,
									["block"] = b,
									["player_tracking_category"] = "join_from_web",
									["toolName"] = "ironOre"
									}
								}
								game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
							end
						end
						if b.WorkerOutputContents:FindFirstChild("iron") then
						    if b.WorkerOutputContents:FindFirstChild("iron").Amount.Value == 50 then
						        if Toggled55 == true then
							            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - b.Position).magnitude > 24 then
						            		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(b.Position)
							            	wait(0.3)
							            end
					            	local args = {
							        [1] = {
							        ["tool"] = b.WorkerOutputContents.iron,
							        ["player_tracking_category"] = "join_from_web"
							        }
							        }
						            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
						        end
						    end
					    end
					else
						local Repeat = 1
						if Toggled55 == true then
							local args = {
							[1] = {
							["amount"] = 50,
							["block"] = b,
							["player_tracking_category"] = "join_from_web",
							["toolName"] = "coal"
							}
							}
							game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
						end
					end
				end
			end
        end
    end
end)

Item73.MouseButton1Click:Connect(function()
    if Toggled56 then
        Toggled56 = false
        Item73.BackgroundColor3 = Color3.fromRGB(255,215,0)
        Item73.Text = "Gold"
        Item73.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled56 = true
        Item73.BackgroundColor3 = Color3.new(0,255,255)
        Item73.Text = "Smelting Gold"
        Item73.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled56 == true do
            wait()
			for i,b in pairs(Island.Blocks:GetChildren()) do
				if b.Name == "smallFurnace" then
					if b.WorkerFuel:FindFirstChild("coal") then
						if #b.WorkerContents:GetChildren() == 0 then
							if Toggled56 == true then
								local args = {
									[1] = {
									["amount"] = 50,
									["block"] = b,
									["player_tracking_category"] = "join_from_web",
									["toolName"] = "goldOre"
									}
								}
								game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
							end
						else
							wait()
						end
						if b.WorkerOutputContents:FindFirstChild("gold") then
						    if b.WorkerOutputContents:FindFirstChild("gold").Amount.Value == 50 then
						        if Toggled56 == true then
							if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - b.Position).magnitude > 24 then
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(b.Position)
								wait(0.3)
							end
						local args = {
							[1] = {
							["tool"] = b.WorkerOutputContents.gold,
							["player_tracking_category"] = "join_from_web"
							}
							}
						game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
						    end
						    end
					    end
					else
						if Toggled56 == true then
							local args = {
							[1] = {
							["amount"] = 50,
							["block"] = b,
							["player_tracking_category"] = "join_from_web",
							["toolName"] = "coal"
							}
							}
							game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
						end
					end
				end
			end
        end
    end
end)

Item74.MouseButton1Click:Connect(function()
    if Toggled57 then
        Toggled57 = false
        Item74.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item74.Text = "Plow Nearby"
        Item74.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled57 = true
        Item74.BackgroundColor3 = Color3.new(0,255,255)
        Item74.Text = "Plowing"
        Item74.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled57 == true do
            wait()
            for i,Grass in pairs(Island.Blocks:GetChildren()) do
                if Grass.Name == "grass" and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Grass.Position).Magnitude < 10 then
                local args = {
                [1] = {
                ["block"] = Grass
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_PLOW_BLOCK_REQUEST:InvokeServer(unpack(args))
end
end
end
end
end)

UnPlow.MouseButton1Click:Connect(function()
    if Toggled77 then
        Toggled77 = false
        UnPlow.BackgroundColor3 = Color3.fromRGB(63,63,63)
        UnPlow.Text = "Unplow Nearby"
        UnPlow.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled77 = true
        UnPlow.BackgroundColor3 = Color3.new(0,255,255)
        UnPlow.Text = "Unplowing"
        UnPlow.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled77 == true do
            wait()
            for i,Grass in pairs(Island.Blocks:GetChildren()) do
                if Grass.Name == "soil" and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Grass.Position).Magnitude < 10 then
                local args = {
                [1] = {
                ["block"] = Grass
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_PLOW_BLOCK_REQUEST:InvokeServer(unpack(args))
end
end
end
end
end)

Item75.MouseButton1Click:Connect(function()
    if Toggled58 then
        Toggled58 = false
        Item75.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item75.Text = "Auto-Fish"
        Item75.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled58 = true
        Item75.BackgroundColor3 = Color3.new(0,255,255)
        Item75.Text = "Gon' Fishing"
        Item75.TextColor3 = Color3.fromRGB(0,0,0)
        local X,Y = 0,0
        local Player = game.Players.LocalPlayer
        while Toggled58 == true do
            v = 0
            VirtualInputManager:SendMouseButtonEvent(X, Y, 0, true, game, 1) -- click down
            wait(0.5)
            VirtualInputManager:SendMouseButtonEvent(X, Y, 0, false, game, 1) -- click up
            repeat wait() v = v + 1 until Player.PlayerGui.ActionBarScreenGui.ActionBar:FindFirstChild("RoactTree") or v == 200 -- waiting for bite
            wait(0.5)
            v = 0
            repeat
                wait() v = v + 1
                if Player.PlayerGui.ActionBarScreenGui.ActionBar:FindFirstChild("RoactTree") then
                    if Player.PlayerGui.ActionBarScreenGui.ActionBar.RoactTree:FindFirstChild(3) then
                        fish = Player.PlayerGui.ActionBarScreenGui.ActionBar.RoactTree[3].Minigame.FishZone
                        bobber = Player.PlayerGui.ActionBarScreenGui.ActionBar.RoactTree[3].Minigame.Marker
                        if bobber.AbsolutePosition.X - fish.AbsolutePosition.X < 35 then
                            VirtualInputManager:SendMouseButtonEvent(X, Y, 0, true, game, 1)
                            wait()
                        --print("click down")
                        elseif bobber.AbsolutePosition.X - fish.AbsolutePosition.X > 35 then
                            VirtualInputManager:SendMouseButtonEvent(X, Y, 0, false, game, 1)
                            --print("Click UP")
                            wait()
                        elseif bobber.AbsolutePosition.X - fish.AbsolutePosition.X == 35 then
                        wait()
                        --print("waiting")
                        end
                    end
                end
                --print("waiting for game over screen")
            until Player.PlayerGui.ActionBarScreenGui.ActionBar:FindFirstChild("GameOverScreen") or v == 150
            wait(0.5)
        end
    end
end)

Item76.MouseButton1Click:Connect(function()
    
    for i,smelter in pairs(Island.Blocks:GetChildren()) do
        if smelter.Name == "smallFurnace" then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - smelter.Position).magnitude > 23 then
                Point = smelter.Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                tween:Play()
                wait(Time - 2)
            end
            for i,content in pairs(smelter.WorkerOutputContents:GetChildren()) do
                local args = {
                [1] = {
                ["tool"] = content,
                ["player_tracking_category"] = "join_from_web"
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
            end
            for i,content in pairs(smelter.WorkerContents:GetChildren()) do
                local args = {
                [1] = {
                ["tool"] = content,
                ["player_tracking_category"] = "join_from_web"
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
            end
        end
    end
end)

Item78.MouseButton1Click:Connect(function()
    if Toggled60 then
        Toggled60 = false
        Item78.BackgroundColor3 = Color3.fromRGB(55,55,55)
        Item78.Text = "Give Fertility Potions"
        Item78.TextColor3 = Color3.new(1,1,1)
        animalModule.stopFertilityLoop()
    else
        Toggled60 = true
        Item78.BackgroundColor3 = Color3.new(0,255,255)
        Item78.Text = "Breeding Animals!"
        Item78.TextColor3 = Color3.fromRGB(0,0,0)
        animalModule.startFertilityLoop()
    end
end)

Item79.MouseButton1Click:Connect(function()
    if Toggled61 then
        Toggled61 = false
        Item79.BackgroundColor3 = Color3.fromRGB(55,55,55)
        Item79.Text = "Catch Spirits"
        Item79.TextColor3 = Color3.new(1,1,1)
        HR:FindFirstChild("BodyVelocity"):Destroy()
        Noclipping:Disconnect()
        noClip = false
    else
        Toggled61 = true
        Item79.BackgroundColor3 = Color3.new(0,255,255)
        Item79.Text = "Catching spirits"
        Item79.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = HR
        BV.MaxForce = Vector3.new(0,math.huge,0)
        for i,v in pairs(game:GetService("Workspace").spawnPrefabs.WildIslands:GetChildren()) do
            v:Destroy()
        end
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        noClip = true
        Times = 0
        while Toggled61 == true do
            wait()
            if workspace.WildernessIsland.Entities:FindFirstChild("spirit") then
                if workspace.WildernessIsland.Entities.spirit:FindFirstChild("HumanoidRootPart") then
                HR.CFrame = CFrame.new(workspace.WildernessIsland.Entities.spirit:FindFirstChild("HumanoidRootPart").Position)
                    local args = {
                    [1] = HttpService:GenerateGUID(false),
                    [2] = {
                    [1] = {
                    ["entity"] = workspace.WildernessIsland.Entities.spirit
                    }
                    }
                    }
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged:FindFirstChild("iazhmspkp/knlDDbuzwMzaerl"):FireServer(unpack(args))
                    wait()
                end
            end
        end
    end
end)

God.MouseButton1Click:Connect(function()
    if Toggled69 then
        Toggled69 = false
        RUN = false
        God.BackgroundColor3 = Color3.fromRGB(0,255,255)
        God.Text = "God Mode Still Enabled"
        God.TextColor3 = Color3.fromRGB(50,200,100)
    else
        Toggled69 = true
        RUN = true
        Humanoid.WalkSpeed = 0
        God.BackgroundColor3 = Color3.new(0,255,255)
        God.Text = "God Mode Enabled"
        God.TextColor3 = Color3.fromRGB(0,0,0)
		Character.CurrentHealth:Destroy()
    end
end)

Item85.MouseButton1Click:Connect(function()
    if Toggled74 then
        Toggled74 = false
        Item85.BackgroundColor3 = Color3.fromRGB(55,55,55)
        Item85.Text = "Buffalkor Island"
        Item85.TextColor3 = Color3.new(1,1,1)
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        cancelTween()
    else
        Toggled74 = true
        Item85.BackgroundColor3 = Color3.new(0,255,255)
        Item85.Text = "Mining!"
        Item85.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        POs = Vector3.new(1584, 384, 107)
        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(1211, 385, 115))
        wait(1)
        while Toggled74 == true do
            wait()
Blocks = game.Workspace.WildernessBlocks
for i,v in pairs(Blocks:GetChildren()) do
if (POs - v.Position).magnitude < 600 and v:FindFirstChild("1") then
    if Toggled74 == true then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude > 23 then
        Point = v.Position
        Distance = (HR.Position - Point).Magnitude
        Speed = 20
        Time = Distance/Speed
        tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
        tween:Play()
        wait(Time - 2)
    end
    repeat
    local args = {[1] = {
    ["player_tracking_category"] = "join_from_web",
    ["part"] = v:FindFirstChild("1"),
    ["block"] = v,
    ["norm"] = nil --[[Vector3]],
    ["pos"] = nil --[[Vector3]]
    }}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
    until
    v:FindFirstChild("1") == nil
    end
end
end
        end
    end
end)

Item86.MouseButton1Click:Connect(function()
    if Toggled75 then
        Toggled75 = false
        Item86.BackgroundColor3 = Color3.fromRGB(55,55,55)
        Item86.Text = "Diamond Island"
        Item86.TextColor3 = Color3.new(1,1,1)
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        cancelTween()
    else
        Toggled75 = true
        Item86.BackgroundColor3 = Color3.new(0,255,255)
        Item86.Text = "Mining!"
        Item86.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        POs = Vector3.new(2752, 285, 1196)
        wait(1)
        while Toggled75 == true do
            wait()
Blocks = game.Workspace.WildernessBlocks
for i,v in pairs(Blocks:GetChildren()) do
if (POs - v.Position).magnitude < 600 and v:FindFirstChild("1") then
    if Toggled75 == true then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude > 23 then
        Point = v.Position
        Distance = (HR.Position - Point).Magnitude
        Speed = 20
        Time = Distance/Speed
        tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
        tween:Play()
        wait(Time - 2)
    end
    repeat
    local args = {[1] = {
    ["player_tracking_category"] = "join_from_web",
    ["part"] = v:FindFirstChild("1"),
    ["block"] = v,
    ["norm"] = nil --[[Vector3]],
    ["pos"] = nil --[[Vector3]]
    }}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
    until
    v:FindFirstChild("1") == nil
    end
end
end
        end
    end
end)

local VoidMining = Instance.new("TextButton")
VoidMining.Position = UDim2.new(0,0,1,21)
VoidMining.Size = UDim2.new(0,70,0,20)
VoidMining.BackgroundColor3 = Color3.fromRGB(63,63,63)
VoidMining.BorderSizePixel = 1
VoidMining.ZIndex = 2
VoidMining.Parent = Notification11
VoidMining.Text = "Void Rocks"
VoidMining.TextColor3 = Color3.fromRGB(250,250,250)
VoidMining.TextScaled = true
VoidMining.MouseButton1Click:Connect(function()
    if Toggled83 then
        Toggled83 = false
        VoidMining.BackgroundColor3 = Color3.fromRGB(55,55,55)
        VoidMining.Text = "Void Rocks"
        VoidMining.TextColor3 = Color3.new(1,1,1)
        unFloat()
        cancelTween()
    else
        Toggled83 = true
        VoidMining.BackgroundColor3 = Color3.new(0,255,255)
        VoidMining.Text = "Mining!"
        VoidMining.TextColor3 = Color3.fromRGB(0,0,0)
        Float()
        local Continue = 0
        pickingPlants = true
        coroutine.wrap(function()
            while pickingPlants do
                task.wait()
                pickWildernessPlantAura("voidParasite")
            end
        end)()
        while Toggled83 == true do
            wait()
            local Rocks = getVoidRocks()
            for i,v in pairs(Rocks) do
                if Toggled83 == true then
                    tween, Time = goToPoint(v.Position, 0)
                    if Time then
                        wait(Time - 2)
                    end
                    if v:FindFirstChild("1") then
                        equipPick()
                        hitBlock(v)
                    else
                        equipShovel()
                        digSpot(v)
                    end
                end
                break
            end
        end
    end
end)

local ElectriteMining = Instance.new("TextButton")
ElectriteMining.Position = UDim2.new(0,71,1,21)
ElectriteMining.Size = UDim2.new(0,70,0,20)
ElectriteMining.BackgroundColor3 = Color3.fromRGB(63,63,63)
ElectriteMining.BorderSizePixel = 1
ElectriteMining.ZIndex = 2
ElectriteMining.Parent = Notification11
ElectriteMining.Text = "Electrite"
ElectriteMining.TextColor3 = Color3.fromRGB(250,250,250)
ElectriteMining.TextScaled = true
ElectriteMining.MouseButton1Click:Connect(function()
    if Toggled85 then
        Toggled85 = false
        ElectriteMining.BackgroundColor3 = Color3.fromRGB(55,55,55)
        ElectriteMining.Text = "Electrite"
        ElectriteMining.TextColor3 = Color3.new(1,1,1)
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        cancelTween()
    else
        Toggled85 = true
        ElectriteMining.BackgroundColor3 = Color3.new(0,255,255)
        ElectriteMining.Text = "Mining!"
        ElectriteMining.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local Pickaxe = Player.Backpack:FindFirstChild("opalPickaxe")
        local AltPickaxe = Player.Backpack:FindFirstChild("diamondPickaxe")
        local Shovel = Player.Backpack:FindFirstChild("shovelStone")
        local Continue = 0
        wait(1)
        while Toggled85 == true do
            wait()
            Blocks = game.Workspace.WildernessBlocks
            for i,v in pairs(Blocks:GetChildren()) do
                if v.Name == "rockElectrite" and v:FindFirstChild("1") then
                    if Toggled85 == true then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude > 23 then
                            Point = v.Position
                            Distance = (HR.Position - Point).Magnitude
                            Speed = 20
                            Time = Distance/Speed
                            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                            tween:Play()
                            wait(Time - 2)
                        end
                        repeat
                        if Pickaxe then
                            Pickaxe.Parent = Character
                            elseif  AltPickaxe then
                            AltPickaxe.Parent = Character
                        end
                        local args = {[1] = {
                        ["player_tracking_category"] = "join_from_web",
                        ["part"] = v:FindFirstChild("1"),
                        ["block"] = v,
                        ["norm"] = nil --[[Vector3]],
                        ["pos"] = nil --[[Vector3]]
                        }}
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
                        Continue = Continue + 1
                        until
                        v:FindFirstChild("1") == nil or Continue > 20 or Toggled85 == false
                    end
                    Continue = 0
                end
            end
        end
    end
end)

local SnowMining = Instance.new("TextButton")
SnowMining.Position = UDim2.new(0,0,1,42)
SnowMining.Size = UDim2.new(0,70,0,20)
SnowMining.BackgroundColor3 = Color3.fromRGB(63,63,63)
SnowMining.BorderSizePixel = 1
SnowMining.ZIndex = 2
SnowMining.Parent = Notification11
SnowMining.Text = "Snow"
SnowMining.TextColor3 = Color3.fromRGB(250,250,250)
SnowMining.TextScaled = true
SnowMining.MouseButton1Click:Connect(function()
    if Toggled86 then
        Toggled86 = false
        SnowMining.BackgroundColor3 = Color3.fromRGB(55,55,55)
        SnowMining.Text = "Snow"
        SnowMining.TextColor3 = Color3.new(1,1,1)
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        cancelTween()
    else
        Toggled86 = true
        SnowMining.BackgroundColor3 = Color3.new(0,255,255)
        SnowMining.Text = "Mining!"
        SnowMining.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local Continue = 0
        wait(1)
        while Toggled86 == true do
            wait()
            Blocks = game.Workspace.WildernessBlocks
            for i,v in pairs(Blocks:GetChildren()) do
                if v.Name == "pileSnow" then
                    if Toggled86 == true then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude > 23 then
                            Point = v.Position - Vector3.new(0,3,0)
                            Distance = (HR.Position - Point).Magnitude
                            Speed = 20
                            Time = Distance/Speed
                            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                            tween:Play()
                            wait(Time - 2)
                        end
                        repeat
                            local args = {
                            [1] = {
                            ["shovelType"] = "shovelStone",
                            ["block"] = v
                            }}
                            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.client_request_21:InvokeServer(unpack(args))
                            Continue = Continue + 1
                        until
                        v:FindFirstChild("Targettable") == nil or Continue == 20 or Toggled86 == false
                        end
                    Continue = 0
                end
            end
        end
    end
end)

Item87.MouseButton1Click:Connect(function()
    if Toggled78 then
        Toggled78 = false
        Item87.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item87.Text = "Pick Berries"
        Item87.TextColor3 = Color3.fromRGB(250,250,250)
        cancelTween()
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, false, game, 1)
    else
        Toggled78 = true
        Item87.BackgroundColor3 = Color3.new(0,255,255)
        Item87.Text = "Picking Berries"
        Item87.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, true, game, 1)
        while Toggled78 == true do
            wait()
            for i,Bush in pairs(Island.Blocks:GetDescendants()) do
                if  Bush.Name == "berryBush" and Bush.stage.Value == 2 then
                    if Toggled78 then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Bush.Position).magnitude > 24 then
                        Point = Bush.Position
                        Distance = (HR.Position - Point).Magnitude
                        Speed = 20
                        Time = Distance/Speed
                        tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                        tween:Play()
                        wait(Time - 1)
                    end
                    local args = {[1] = {
                    ["player"] = game:GetService("Players").LocalPlayer,
                    ["player_tracking_category"] = "join_from_web",
                    ["model"] = Bush}}
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_HARVEST_CROP_REQUEST:InvokeServer(unpack(args))
                    end
                end
            end
        end
    end
end)

Item88.MouseButton1Click:Connect(function()
    if Toggled79 then
        Toggled79 = false
        Item88.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item88.Text = "Composter"
        Item88.TextColor3 = Color3.fromRGB(250,250,250)
        cancelTween()
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        NoClipping:Disconnect()
        noClip = false
    else
        Toggled79 = true
        Item88.BackgroundColor3 = Color3.new(0,255,255)
        Item88.Text = "Composting"
        Item88.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local Fish = ""
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = HR
        BV.MaxForce = Vector3.new(0,math.huge,0)
        noClip = true
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        while Toggled79 do
            wait()
            for i,Composter in pairs(Island.Blocks:GetChildren()) do
                if Composter.Name == "composter" then
                    if Player.Backpack:FindFirstChild("fishCarp") then Fish = "fishCarp"
                    elseif Player.Backpack:FindFirstChild("fishTrout") then Fish = "fishTrout"
                    end
                    if Composter.WorkerContents:FindFirstChild(Fish) == nil then
                        local args = {
                        [1] = {
                        ["amount"] = 20,
                        ["block"] = Composter,
                        ["player_tracking_category"] = "join_from_web",
                        ["toolName"] = Fish
                        }}
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
                    end
                    if Composter.WorkerOutputContents:FindFirstChild("fertilizerBasic") and Composter.WorkerOutputContents:FindFirstChild("fertilizerBasic").Amount.Value == 20 then
                        if (HR.Position - Composter.Position).magnitude > 24 then
                            Point = Composter.Position + Vector3.new(0,3,0)
                            Distance = (HR.Position - Point).Magnitude
                            Speed = 20
                            Time = Distance/Speed
                            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                            tween:Play()
                            wait(Time - 2)
                        end
                        local args = {
                        [1] = {
                        ["tool"] = Composter.WorkerOutputContents.fertilizerBasic,
                        ["player_tracking_category"] = "join_from_web"
                        }}
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                    end
                end
            end
        end
    end
end)

local BFly = Instance.new("TextButton")
BFly.Position = UDim2.new(0,71,1,148)
BFly.Size = UDim2.new(0,70,0,20)
BFly.BackgroundColor3 = Color3.fromRGB(63,63,63)
BFly.BorderSizePixel = 1
BFly.ZIndex = 2
BFly.Parent = Notification3
BFly.Text = "Catch Butterflies"
BFly.TextColor3 = Color3.fromRGB(250,250,250)
BFly.TextScaled = true
BFly.MouseButton1Click:Connect(function()
    if Toggled89 then
        Toggled89 = false
        BFly.BackgroundColor3 = Color3.fromRGB(63,63,63)
        BFly.Text = "Catch Butterfly"
        BFly.TextColor3 = Color3.new(1,1,1)
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        Noclipping:Disconnect()
        noClip = false
        cancelTween()
    else
        Toggled89 = true
        BFly.BackgroundColor3 = Color3.new(0,255,255)
        BFly.Text = "Catching"
        BFly.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        noClip = true
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        while Toggled89 == true do
        wait()
for i,v in pairs(game.Workspace.WildernessIsland.Entities:GetChildren()) do
    if v.Name == "butterfly" and Toggled89 == true then
        if v:FindFirstChild("HumanoidRootPart") ~= nil then
        if (v:FindFirstChild("HumanoidRootPart").Position - Vector3.new(-3694, 105, -2234)).Magnitude < 100 then
        HR.CFrame = CFrame.new(HR.Position + Vector3.new(0,1500,0))
        Tries = 0
        repeat
            if Toggled89 == true then
            Tries = Tries + 1
        wait()
        if v:FindFirstChild("HumanoidRootPart") ~= nil then
            Pointx = v.HumanoidRootPart.Position.X
            Pointz = v.HumanoidRootPart.Position.Z
            Distance = (HR.Position - Vector3.new(Pointx, HR.Position.Y, Pointz)).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Vector3.new(Pointx,HR.Position.Y,Pointz + 6))})
            tween:Play()
            wait(Time)
        end
        if v:FindFirstChild("HumanoidRootPart") ~= nil then
            pcall(function()
            VirtualInputManager:SendMouseButtonEvent(0,0, 0, true, game, 1)
            VirtualInputManager:SendMouseButtonEvent(0,0, 0, false, game, 1)
            wait(0.2)
            HR.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0,0,6))
            wait(0.5)
            HR.CFrame = CFrame.new(HR.Position + Vector3.new(0,1500,0))
            wait(0.7)
            end)
        end
        end
        until v:FindFirstChild("HumanoidRootPart") == nil or Toggled89 == false or Tries >= 3
        end
        end
end
end
end
end
end)
