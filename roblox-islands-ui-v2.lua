local Atlas = loadstring(game:HttpGet("https://rd2glory.com/Atlas.lua"))()

local Player = game.Players.LocalPlayer
local Island = game.Workspace.Islands:GetChildren()[1]
local Character = game.Players.LocalPlayer.Character
local Humanoid = Character.Humanoid
local stopstopstop = false

local function loadModule(url)
	return loadstring(game:HttpGet(url))()
end

local treeModule = loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/modules/tree-module.lua")
local fruitModule = loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/modules/fruit-module.lua")
local machineModule = loadModule("https://raw.githubusercontent.com/ashlux/roblox-islands/main/modules/machine-module.lua")

local UI = Atlas.new({
	Name = "Roblox Islands";
	ConfigFolder = "RobloxIslandsAtlasConfig-" .. game.Players.LocalPlayer.Name;
	Color = Color3.fromRGB(255, 124, 25);
	Bind = "BackSlash";
});

-- BUILD MAIN PAGE --
local function buildMain()
	local page = UI:CreatePage("Main")
	
	-- TODO: pull useful information from here: https://api.github.com/repos/ashlux/roblox-islands/branches/main
	-- TODO: Add ability to switch versions based on tags and branches and commit sha
	
	local performanceSection = page:CreateSection("Performance")
	
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
	
	local serverSection = page:CreateSection("Server")
	serverSection:CreateParagraph("Game ID: " .. game.GameId)
	serverSection:CreateParagraph("Job ID: " .. game.JobId)
	serverSection:CreateParagraph("Place ID: " .. game.PlaceId)
	serverSection:CreateParagraph("Place Version: " .. game.PlaceVersion)
	
	
	local blockCounter = serverSection:CreateParagraph("Island blocks: " .. tostring(Island and #Island.Blocks:GetChildren() or 0))
	local dropCounter = serverSection:CreateParagraph("Island Drops: ")
	
	task.spawn(function()
	    while wait(5) do
        dropCount = #Island.Drops:GetChildren() or 0
        dropCounter.Set("Drops: "..tostring(dropCount))

        blockCount = #Island.Blocks:GetChildren() or 0
        blockCounter.Set("Blocks: "..tostring(blockCount))
        end
    end)
	
end

--BUILD TREE PAGE--
local function buildTreePage()
	local page = UI:CreatePage("Trees")
	
	local leavesSection = page:CreateSection("Leaves")
	
	leavesSection:CreateToggle({
		Name = "Cut Leaves";
		Flag = "cutLeaves";
		Default = false;
		CallbackOnCreation = false;
		Callback = function(newValue)
			if newValue == true and stopstopstop == false then
				treeModule.startTrimIslandTreesAura()
			else
				treeModule.stopTrimIslandTreesAura()
			end
	  end
	})
end

-- BUILD Machine PAGE --
local function buildMachinePage()

	local page = UI:CreatePage("Machines")

	local allMachinesSection = page:CreateSection("Machines")
	allMachinesSection:CreateButton({
		Name = "Collect Nearby";
		Callback = function()
			for _,machine in pairs(Island.Blocks:GetChildren()) do
				if (machine.Name == "smallFurnace" or machine.Name == "blastFurnace" or
					machine.Name == "sawmill" or machine.Name == "stonecutter") then
					machineModule.collectOutput(machine)
				end
			end
		end
	})

	allMachinesSection:CreateButton({
		Name = "Empty Inputs";
		Callback = function()
			for _,machine in pairs(Island.Blocks:GetChildren()) do
				if (machine.Name == "smallFurnace" or machine.Name == "blastFurnace" or
					machine.Name == "sawmill" or machine.Name == "stonecutter") then
					machineModule.collectInput(machine)
				end
			end
		end
	})

	local fuelOptions = {"coal","petrifiedPetroleum"}

	local function createMachineSection(options)
		local machineName = options.machineName
		local displayName = options.displayName
		local pluralDisplayName = options.pluralDisplayName
		local selectedFuelName = "coal"
		local selectIngredientName = nil or options.defaultIngredient
		local machineSection = page:CreateSection(pluralDisplayName)
		machineSection:CreateDropdown({
			Name = "Select Fuel";
			Callback = function(item) selectedFuelName = item end;
			Options = fuelOptions;
			ItemSelecting = true;
			DefaultItemSelected = selectedFuelName;
		})
		machineSection:CreateDropdown({
			Name = "Select Ingredient";
			Callback = function(item) selectIngredientName = item end;
			Options = machineModule.getIngredientNamesByMachineName(machineName);
			ItemSelecting = true;
			DefaultItemSelected = selectIngredientName 
		})
		machineSection:CreateButton({
			Name = "Fuel";
			Callback = function()
				for _,machine in pairs(Island.Blocks:GetChildren()) do
					if (machine.Name == machineName) then
						machineModule.refuel(machine, selectedFuelName)
					end
				end
			end
		})
		machineSection:CreateButton({
			Name = "Fill";
			Callback = function()
				for _,machine in pairs(Island.Blocks:GetChildren()) do
					if (machine.Name == machineName) then
						machineModule.fillWith(machine, selectIngredientName)
					end
				end
			end
		})
	end

	createMachineSection({machineName = "smallFurnace", displayName = "Furnace", pluralDisplayName = "Furnaces", defaultIngredient = "ironOre"})
	createMachineSection({machineName = "blastFurnace", displayName = "Blast Furnace", pluralDisplayName = "Blast Furnaces", defaultIngredient = "iron"})
	createMachineSection({machineName = "stonecutter", displayName = "Stonecutter", pluralDisplayName = "Stonecutters"})
	createMachineSection({machineName = "sawmill", displayName = "Sawmill", pluralDisplayName = "Sawmills"})
end

-- BUILD PLAYER PAGE --
local function buildPlayerPage()
	local Page = UI:CreatePage("Player")
	
	local modifyStats = Page:CreateSection("LocalPlayer")
	
	--gravity modifier--
	modifyStats:CreateSlider({
		Name = "Gravity";
		Flag = "MySlider";
		Min = 0;
		Max = 1000;
		AllowOutOfRange = true;
		Digits = 0;
		Default = 5;
		Callback = function(newValue) game.Workspace.Gravity = newValue end;
		Warning = "This has a warning";
		WarningIcon = 12345;
	})


	--WalkSpeed--
	modifyStats:CreateSlider({
		Name = "Walk Speed";
		Flag = "WSSlider";
		Min = 0;
		Max = 30;
		AllowOutOfRange = true;
		Digits = 0;
		Default = 20;
		Callback = function(newValue)
			if RUN == nil or RUN == false then RUN = true end
			WS = newValue
			Humanoid.WalkSpeed = newValue
		end;
		Warning = "This has a warning";
		WarningIcon = 12345;
	})

	--only activates when you're speed changes and RUN is true
	Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if RUN and stopstopstop == false then
			Humanoid.WalkSpeed = WS
		end
	end)

	--Camera Zoom Distance --
	modifyStats:CreateSlider({
		Name = "Max Zoom Distance";
		Flag = "MaxZoom";Min = 0;
		Max = 1000;
		AllowOutOfRange = true;
		Digits = 0;
		Default = 30;
		Callback = function(newValue) Player.CameraMaxZoomDistance = newValue end;
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
		Callback = function(newValue) game.Workspace.Camera.FieldOfView = newValue end;
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
buildMachinePage()
buildPlayerPage()
