local TS = game:GetService("TweenService")
local tween
local Player = game.Players.LocalPlayer
local Character = Player.Character
local HR = Character:FindFirstChild('HumanoidRootPart') or Character:FindFirstChild('Torso') or Character:FindFirstChild('UpperTorso')


function isBlockATree(block)
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

function falsePredicate()
		return false
end

function getBlocksBy(blocks, maybePredicate)
    local predicate = maybePredicate or falsePredicate
    local foundBlocks = {}
    for _,block in pairs(blocks or {}) do
        if predicate(block) then
            table.insert(foundBlocks, block)
        end
    end
    return foundBlocks
end

function goToPoint(Point, distance)
    local tween, Time = nil, 0
    if (HR.Position - Point).magnitude > distance then
        Distance = (HR.Position - Point).Magnitude
        Speed = 25
        Time = Distance/Speed
        tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
        tween:Play()
    end
    return tween, Time
end

function getIsland()
    return game.Workspace.Islands:GetChildren()[1]
end

function getIslandBlocks(island)
    local island = island or getIsland() 
    return (island and island.Blocks:GetChildren()) or {}
end

function getAllTrees(blocks)
    local blocks = blocks or getIslandBlocks()
    return getBlocksBy(blocks, isBlockATree)
end

function leavesReady(tree)
    if tree:FindFirstChild("LastTrimmed") then
        if os.time() - tree.LastTrimmed.Value <= 180 then
            return false
        end
    else
        return true
    end
end

function equipTool(tool)
    if Character:FindFirstChild(tool) then
        return
    else
        local Tool = Player.Backpack:FindFirstChild(tool)
        if Tool then
		print("Equipping "..Tool.Name)
            Tool.Parent = Character
        end
        wait()
    end
end

function trimTree(tree)
    if (tree) then
        equipTool("clippers")
        local args = {[1] = {["tree"] = tree}}
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TRIM_TREE_REQUEST:InvokeServer(unpack(args))
    end
end


function trimTrees(blocks)
    local trees = getAllTrees(blocks or getIslandBlocks())
    for _,tree in pairs(trees) do
        if leavesReady(tree) then
            tween, Time = goToPoint(tree.Position, 24)
            if tween then
                wait(Time - 2)
            end
            trimTree(tree)
        end
    end
end

function setTrimIslandTrees(value)
    local player = game.Players.LocalPlayer
    player:SetAttribute("trimTrees", value or false)	
end

function stopTrimIslandTreesAura()
    setTrimIslandTrees(false)
    if tween then
        tween:Cancel()
    end
    wait()
end

function startTrimIslandTreesAura()
    stopTrimIslandTreesAura()
    setTrimIslandTrees(true)
  
    local player = game.Players.LocalPlayer
    while wait() do
        if (player:GetAttribute("trimTrees") == false) then return nil end
        trimTrees()
    end
end

return {
    startTrimIslandTreesAura = startTrimIslandTreesAura,
    stopTrimIslandTreesAura = stopTrimIslandTreesAura,
}
