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

function trimTree(tree)
  if (tree) then
	  local args = {[1] = {["tree"] = tree}}
  	game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TRIM_TREE_REQUEST:InvokeServer(unpack(args))
  end
end


function trimTrees(blocks)
  local trees = getAllTrees(blocks or getIslandBlocks())
  for _,tree in pairs(trees) do
    trimTree(tree)
  end
end

function trimIslandTreesAura()
  local player = game.Players.LocalPlayer
  while wait() do
	  if (player:GetAttribute("trimTrees") == false) then return nil end
	  trimTrees()
  end
end

return {
  trimIslandTreesAura = trimIslandTreesAura
}
