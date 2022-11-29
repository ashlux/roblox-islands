local Atlas = loadstring(game:HttpGet("https://rd2glory.com/Atlas.lua"))()

local Player = game.Players.LocalPlayer
local Island = game.Workspace.Islands:GetChildren()[1]
local Character = game.Players.LocalPlayer.Character
local Humanoid = Character.Humanoid


local UI = Atlas.new({
    Name = "Roblox Islands";
    ConfigFolder = "RobloxIslandsAtlasConfig-" .. game.Players.LocalPlayer.Name;
    Color = Color3.fromRGB(255, 124, 25);
    Bind = "BackSlash";
});

-- BUILD MAIN PAGE --
function buildMain()
	local page = UI:CreatePage("Main")

	local infoSection = page:CreateSection("Info")
	infoSection:CreateParagraph("NaN")
	-- TODO: pull useful information from here: https://api.github.com/repos/ashlux/roblox-islands/branches/main
	-- TODO: Add ability to switch versions based on tags and branches and commit sha
	
	local performanceSection = page:CreateSection("Performance")

	-- TODO: Show count of drops and blocks on the island
	
	performanceSection:CreateToggle({
		Name = "Render 3D";
		Flag = "render3D";
		Default = true;
		CallbackOnCreation = true;
		Callback = function(newValue) game.RunService:Set3dRenderingEnabled(newValue) end;
	})

	performanceSection:CreateToggle({
		Name = "Render XP Orbs";
		Flag = "renderXpOrbs";
		Default = true;
		CallbackOnCreation = true;
		Callback = function(newValue) print("renderXpOrbs new value:",newValue) end;
		-- TODO Actually do this duh
	})
	
	local developmentSection = page:CreateSection("Development")
	
	developmentSection:CreateInteractable({
    Name = "destroyUi";
    ActionText = "Destroy UI";
    Callback = function() UI:Destroy() end;
    Warning = "Do not unless you know what you're doing.";
	-- TODO: Somehow need to tell executing process to stop?
})
end

--BUILD TREE PAGE--
function buildTreePage()
	local page = UI:CreatePage("Trees")
	
	local leavesSection = page:CreateSection("Leaves")
end

-- BUILD MINING PAGE --
function buildMiningPage()
	local page = UI:CreatePage("Mining")
	
	local furnaceSection = page:CreateSection("Furnaces")
	
	local function refuelFurnace(furnace)
		local existingFuelCount = #furnace.WorkerFuel:GetChildren()
		local refuelAmount = 50 - existingFuelCount
	
		if refuelAmount > 0 then
			local args = {
				[1] = {
					["amount"] = refuelAmount,
					["block"] = furnace,
					["player_tracking_category"] = "join_from_web",
					["toolName"] = "coal"
					}
				}
		
			game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged
				.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
		end
	end
	
	local function collectFromFurnace(furnace)
		local itemToCollect = furnace.WorkerOutputContents and furnace.WorkerOutputContents:GetChildren()[1]
		if itemToCollect then
			local args = {
							[1] = {
								["tool"] = itemToCollect,
								["player_tracking_category"] = "join_from_web"
							}
						}
			game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged
				.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
		end
	end
	
	local function fillFurnaceWith(furnace, itemName)
		local itemToCollect = #furnace.WorkerOutputContents:GetChildren()
		if itemsToCollect and itemsToCollect > 0 then
			return;
		end

		local existingItemCount = #furnace.WorkerContents:GetChildren()
		local refillAmount = 50 - existingItemCount
		
		if refillAmount > 0 then
			local args = {
				[1] = {
					["amount"] = refillAmount,
					["block"] = furnace,
					["player_tracking_category"] = "join_from_web",
					["toolName"] = itemName
					}
				}
			
			game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged
				.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
		end
	end

	furnaceSection:CreateButton({
		Name = "Collect Nearby";
		Callback = function()
			for _,furnace in pairs(Island.Blocks:GetChildren()) do
				if (furnace.Name == "smallFurnace" or furnace.Name == "blastFurnace") then
					collectFromFurnace(furnace)
				end
			end
		end
	})
	
	furnaceSection:CreateButton({
		Name = "Fuel Furnaces";
		Callback = function()
			for _,furnace in pairs(Island.Blocks:GetChildren()) do
				if (furnace.Name == "smallFurnace" or furnace.Name == "blastFurnace") then
					refuelFurnace(furnace)
				end
			end
		end
	})

	
	furnaceSection:CreateButton({
		Name = "Fill with Iron Ore";
		Callback = function()
			for _,furnace in pairs(Island.Blocks:GetChildren()) do
				if (furnace.Name == "smallFurnace") then
					fillFurnaceWith(furnace, "ironOre")
				end
			end
		end
	})
	
	furnaceSection:CreateButton({
		Name = "Fill with Gold Ore";
		Callback = function()
			for _,furnace in pairs(Island.Blocks:GetChildren()) do
				if (furnace.Name == "smallFurnace") then
					fillFurnaceWith(furnace, "goldOre")
				end
			end
		end
	})
	
	furnaceSection:CreateButton({
		Name = "Fill with Iron Ingots";
		Callback = function()
			for _,furnace in pairs(Island.Blocks:GetChildren()) do
				if (furnace.Name == "blastFurnace") then
					fillFurnaceWith(furnace, "iron")
				end
			end
		end
	})
end

buildMain()
buildTreePage()
buildMiningPage()
