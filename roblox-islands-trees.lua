local TS = game:GetService("TweenService")
local tween
local Player = game.Players.LocalPlayer
local Character = Player.Character
local HR = Character:FindFirstChild('HumanoidRootPart') or Character:FindFirstChild('Torso') or Character:FindFirstChild('UpperTorso')


local function isBlockATree(block)
    if (block and block.Name and
        (block.Name:find("treePine") or 
        block.Name:find("treeMaple") or
        block.Name:find("treeOak") or 
        block.Name:find("treeHickory") or
        block.Name:find("treeBirch") or
        block.Name == "tree1" or 
        block.Name == "tree2" or 
        block.Name == "tree3" or 
        block.Name == "tree4")) then
        return true
    else
        return false
    end
end

local function falsePredicate()
		return false
end

local function getBlocksBy(blocks, maybePredicate)
    local predicate = maybePredicate or falsePredicate
    local foundBlocks = {}
    for _,block in pairs(blocks or {}) do
        if predicate(block) then
            table.insert(foundBlocks, block)
        end
    end
    return foundBlocks
end

local function goToPoint(Point, distance)
    local tween, Time = nil, 0
    if (HR.Position - Point).magnitude > distance then
        Distance = (HR.Position - Point).Magnitude
        Speed = 25
        Time = Distance/Speed
        tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
        --print("Going to", Point, " (speed =", Speed, ", time=", Time, ", distance", Distance, ")")
        tween:Play()

    end
    return tween, Time
end

local function getIsland()
    return game.Workspace.Islands:GetChildren()[1]
end

local function getIslandBlocks(island)
    local island = island or getIsland() 
    return (island and island.Blocks:GetChildren()) or {}
end

local function getAllTrees(blocks)
    local blocks = blocks or getIslandBlocks()
    return getBlocksBy(blocks, isBlockATree)
end

local function leavesReady(tree)
    if tree:FindFirstChild("LastTrimmed") then
        if os.time() - tree.LastTrimmed.Value >= 180 then
            return true
        end
    else
        return true
    end
end

local function equipTool(toolName)
    if Character:FindFirstChild(toolName) then
        return
    else
        local tool = Player.Backpack:FindFirstChild(toolName)
        if tool then
	    --print("Equipping "..tool.Name)
            tool.Parent = Character
        end
        wait()
    end
end

local function trimTree(tree)
    if (tree) then
        --print("trimming", tree, "at", tree.Position, "player is at", HR.Position, "distance", (HR.Position - tree.Position).magnitude)
        equipTool("clippers")
        local args = {[1] = {["tree"] = tree}}
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TRIM_TREE_REQUEST:InvokeServer(unpack(args))
    end
end


local function trimTrees(blocks)
    local trees = getAllTrees(blocks or getIslandBlocks())
    for _,tree in pairs(trees) do
	local Player = game.Players.LocalPlayer
	if (Player:GetAttribute("trimTrees") == false) then return nil end
        if leavesReady(tree) then
            tween, Time = goToPoint(tree.Position, 24)
            if tween then
                wait(Time - .5)
	    end
        if tween then
            tween:Cancel()
        end
            trimTree(tree)
        end
    end
end

local function setTrimIslandTrees(value)
    Player:SetAttribute("trimTrees", value or false)	
end

local function stopTrimIslandTreesAura()
    setTrimIslandTrees(false)
    if tween then
        tween:Cancel()
    end
    wait()
end

local function startTrimIslandTreesAura()
    stopTrimIslandTreesAura()
    setTrimIslandTrees(true)
  
    while wait() do
        if (Player:GetAttribute("trimTrees") == false) then return nil end
        trimTrees()
    end
end

return {
    startTrimIslandTreesAura = startTrimIslandTreesAura,
    stopTrimIslandTreesAura = stopTrimIslandTreesAura,
}
