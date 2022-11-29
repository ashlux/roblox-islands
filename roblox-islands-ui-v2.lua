local Atlas = loadstring(game:HttpGet("https://rd2glory.com/Atlas.lua"))()

local Player = game.Players.LocalPlayer
local Island = game.Workspace.Islands:GetChildren()[1]
local Character = game.Players.LocalPlayer.Character
local Humanoid = Character.Humanoid
local stopstopstop = false

function loadModule(url)
	return loadstring(game:HttpGet(url))()
end

local treesModule = loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/roblox-islands-trees.lua")
local fruitsModule = loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/Collect-Fruits")

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
	
	leavesSection:CreateToggle({
		Name = "Cut Leaves";
		Flag = "cutLeaves";
		Default = false;
		CallbackOnCreation = false;
		Callback = function(newValue)
		    if newValue == true and stopstopstop == false then
		        treesModule.startTrimIslandTreesAura()
		    else
		        treesModule.stopTrimIslandTreesAura()
		    end
      end
	})
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
					["toolName"] = furnaceFuel
					}
				}
		
			game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged
				.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
		end
	end
	
	local function collectFromFurnace(furnace)
		if Player:DistanceFromCharacter(furnace.Position) < 24 then
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
	
	furnaceSection:CreateDropdown({
    Name = "Fuel to use"; -- required: name of element
    Callback = function(item) -- required: function to be called an item in the dropdown is activated
        furnaceFuel = item
    end;
    Options = {"coal","petrifiedPetroleum","wood","woodHickory","woodMaple","woodPine","woodBirch","woodSpirit"}; -- required: dropdown options
    ItemSelecting = true; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default
    DefaultItemSelected = ""; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
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
	
	furnaceSection:CreateDropdown({
    Name = "item to cook"; -- required: name of element
    Callback = function(item) -- required: function to be called an item in the dropdown is activated
        itemToCook = item
    end;
    Options = {"ironOre","goldOre","copperOre","clay","grass","bamboo"}; -- required: dropdown options
    ItemSelecting = true; -- optional: whether to control item selecting behavior in dropdowns (see showcase video), is false by default
    DefaultItemSelected = ""; -- optional: default item selected, will not run the callback and does not need to be from options table. This will be ignored if ItemSelecting is not true.
    })

	
	furnaceSection:CreateButton({
		Name = "Fill with selected";
		Callback = function()
			for _,furnace in pairs(Island.Blocks:GetChildren()) do
				if (furnace.Name == "smallFurnace") then
					fillFurnaceWith(furnace, itemToCook)
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

-- BUILD PLAYER PAGE --
function buildPlayerPage()
	local Page = UI:CreatePage("Player")
	
	local modifyStats = Page:CreateSection("LocalPlayer")
	
	--gravity modifier--
	modifyStats:CreateSlider({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Gravity"; -- required: name of element
    Flag = "MySlider"; -- required: unique flag name to use
    Min = 0; -- required: slider minimum drag
    Max = 1000; -- required: slider maximum drag (Max>Min or else script will error)
    AllowOutOfRange = true; -- optional: determines whether the player can enter values outside of range Min:Max when typing in the TextBox. If left nil, this is false
    Digits = 0; -- optional: digits for rounding when dragging or entering values, default is 0 (whole numbers)
    Default = 5; -- optional: default value for slider, will be used if config saving is disabled and there is no saved data, will be the Min value if left nil
    Callback = function(newValue) -- optional: function that will be called whenever slider flag is changed
        game.Workspace.Gravity = newValue
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
    })


    --WalkSpeed--
    modifyStats:CreateSlider({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Walk Speed"; -- required: name of element
    Flag = "WSSlider"; -- required: unique flag name to use
    Min = 0; -- required: slider minimum drag
    Max = 30; -- required: slider maximum drag (Max>Min or else script will error)
    AllowOutOfRange = true; -- optional: determines whether the player can enter values outside of range Min:Max when typing in the TextBox. If left nil, this is false
    Digits = 0; -- optional: digits for rounding when dragging or entering values, default is 0 (whole numbers)
    Default = 20; -- optional: default value for slider, will be used if config saving is disabled and there is no saved data, will be the Min value if left nil
    Callback = function(newValue) -- optional: function that will be called whenever slider flag is changed
        if RUN == nil or RUN == false then RUN = true end
        WS = newValue
        Humanoid.WalkSpeed = newValue
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
    })

    --only activates when you're speed changes and RUN is true
    Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
        if RUN and stopstopstop == false then
            Humanoid.WalkSpeed = WS
        end
    end)

    --Camera Zoom Distance --
    modifyStats:CreateSlider({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Max Zoom Distance"; -- required: name of element
    Flag = "MaxZoom"; -- required: unique flag name to use
    Min = 0; -- required: slider minimum drag
    Max = 1000; -- required: slider maximum drag (Max>Min or else script will error)
    AllowOutOfRange = true; -- optional: determines whether the player can enter values outside of range Min:Max when typing in the TextBox. If left nil, this is false
    Digits = 0; -- optional: digits for rounding when dragging or entering values, default is 0 (whole numbers)
    Default = 30; -- optional: default value for slider, will be used if config saving is disabled and there is no saved data, will be the Min value if left nil
    Callback = function(newValue) -- optional: function that will be called whenever slider flag is changed
        Player.CameraMaxZoomDistance = newValue
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning" -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345;
    })


    -- FOV --
    modifyStats:CreateSlider({
    Name = "FOV (default:70)";
    Flag = "FOV";
    Min = 0;
    Max = 120;
    AllowOutOfRange = true;
    Digits = 0;
    Default = 70;
    Callback = function(newValue)
        game.Workspace.Camera.FieldOfView = newValue
    end;
    })


    --setting time of day
    local function setTime()
        if stopstopstop == false then
            game.Lighting.ClockTime = timeDesired
        end
    end

    modifyStats:CreateToggle({
		Name = "Set time of day";
		Flag = "SetToD";
		Default = false;
		CallbackOnCreation = false;
		Callback = function(newValue)
    		if newValue == true and stopstopstop == false then
    		    settingTime = game:GetService('RunService').Stepped:Connect(setTime)
    		else
    		    settingTime:Disconnect()
    		end
    	end;
	})

    -- Time of day --
    modifyStats:CreateSlider({
    Name = "Time";
    Flag = "ToD";
    Min = 0;
    Max = 24;
    AllowOutOfRange = true;
    Digits = 0;
    Default = 0;
    Callback = function(newValue)
        timeDesired = newValue
        local number = tonumber(newValue)
        if number < 7 and number > 18 then
            game.Lighting.Brightness = 12
        else
            game.Lighting.Brightness = 2.7
        end
    end;
    })
end

buildMain()
buildTreePage()
buildMiningPage()
buildPlayerPage()
