local island = workspace.Islands:GetChildren()[1]
local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local tweenService = game:GetService("TweenService")

function getTrees()
	local trees = {}
	for k,v in pairs(island.Blocks:GetChildren()) do
		local tree = v
		if (tree.Name:find("treePine") or 
	    	    tree.Name:find("treeMaple") or
		    tree.Name:find("treeOak") or 
		    tree.Name:find("treeHickory") or
		    tree.Name:find("treeBirch") or
		    tree.Name == "tree1" or 
               tree.Name == "tree2" or 
		    tree.Name == "tree3" or 
		    tree.Name == "tree4") then
			table.insert(trees, tree)
		end
	end	

	table.sort(trees, function(t1, t2) 
		return player:DistanceFromCharacter(t1.Position) < player:DistanceFromCharacter(t2.Position) end)

	return trees
end


function cutTrees()

  while true do

	wait()

	local trees = getTrees()
	local closestTree = trees[1]

	if (#trees == 0) then
		print("No trees found.")
		wait(1)	
	elseif (player:DistanceFromCharacter(closestTree.Position) > 24) then
		print("Moving to closest tree")
		local distance = player:DistanceFromCharacter(closestTree.Position)
		local speed = 
		local tweenInfo = TweenInfo.new(distance / speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
		local tween = tweenService:Create(player.Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(closestTree.Position)})
		print("play")
		tween:Play()
		print("start waiting...")
		tween.Completed:Wait()
		print("finished moving")
	else
		print("Cutting tree")
		
		for k,v in pairs(trees) do
			local tree = v;
			if (player:DistanceFromCharacter(tree.Position) <= 24) then
				local args = {
					[1] = {
				   		["player_tracking_category"] = "join_from_web",
				           ["part"] = tree:WaitForChild("trunk"),
				           ["block"] = tree,
				           ["norm"] = nil,
				           ["pos"] = nil
					}
				}
						
				game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out
					._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
			else
				break
			end
		end
	end
  end
end

cutTrees()
