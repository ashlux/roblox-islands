local island = workspace.Islands:GetChildren()[1]
local replicatedStorage = game:GetService("ReplicatedStorage")
local tweenService = game:GetService("TweenService")
local RS = game:GetService("ReplicatedStorage")

local player = game.Players.LocalPlayer
local Character = player.Character
local HR = Character.HumanoidRootPart

function enhanceLocalPlayerVelocity()
	-- keep from falling into the void
	local bv = Instance.new("BodyVelocity", torso) 
	local BV = Instance.new("BodyVelocity", HR)
	BV.Velocity = Vector3.new(0,0,0)
	BV.MaxForce = Vector3.new(0,math.huge,0)
end

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

function closeEnoughToCutTree(tree)
	return player:DistanceFromCharacter(tree.Position) <= 20
end

function treeStillhealthy(tree)
	return tree and tree:FindFirstChild("Health") and tree:FindFirstChild("Health").Value > 0
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
	return RS.rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
end

function moveToTree(tree)
	local distance = player:DistanceFromCharacter(tree.Position)
	local speed = 40
	local tweenInfo = TweenInfo.new(distance / speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
	local tween = tweenService:Create(player.Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(tree .Position)})
	tween:Play()
	return tween, distance, speed
end


function cutTrees()
  enhanceLocalPlayerVelocity()
  
  while wait() do
	if (player:GetAttribute("harvestTrees") == false) then return nil end

	local trees = getTrees()

	if (#trees == 0) then
		print("No trees found.")
		wait()	
	else
		for k,v in pairs(trees) do
			local tree = v;
			if (closeEnoughToCutTree(tree)) then
				hitTree(tree)
			else
				local _, distance, speed = moveToTree(tree)
				wait(distance/speed - 2)
				break				
			end
		end
	end
  end
end

player:SetAttribute("harvestTrees", false)
wait(5)
player:SetAttribute("harvestTrees", true)
cutTrees()
