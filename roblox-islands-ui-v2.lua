local MAIN_VERSION = table.pack(...)[1] or "main"

local function loadModule(moduleFile, desiredVersion)
	local version = desiredVersion or MAIN_VERSION
	local url = "https://raw.githubusercontent.com/ashlux/roblox-islands/" .. version .. "/" .. moduleFile
	return loadstring(game:HttpGet(url))(version)
end

-- Needs to be loaded FIRST THING for disabling XP orbs to work
local animationModule = loadModule("modules/animation-module.lua")

local Atlas = loadstring(game:HttpGet("https://siegehub.net/Atlas.lua"))()

function waitUntilLoaded()
	repeat wait()
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
	local mouse = game.Players.LocalPlayer:GetMouse() 
	repeat wait() until mouse
end
waitUntilLoaded()

local Player = game.Players.LocalPlayer
local Island = game.Workspace.Islands:GetChildren()[1]
local Character = game.Players.LocalPlayer.Character
local Humanoid = Character.Humanoid

local stopstopstop = false

local treeModule = loadModule("modules/tree-module.lua")
local fruitModule = loadModule("modules/fruit-module.lua")
local machineModule = loadModule("modules/machine-module.lua")
local stringUtils = loadModule("modules/string-utils.lua")
local vendingModule = loadModule("modules/vending-module.lua")
local cropModule = loadModule("modules/crop-module.lua")

local UI = Atlas.new({
	Name = "Roblox Islands";
	ConfigFolder = "RobloxIslandsAtlasConfig-" .. game.Players.LocalPlayer.Name;
	Color = Color3.fromRGB(255, 124, 25);
	Bind = "RightShift";
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
		Callback = function(render3D) animationModule.render3D(render3D) end;
	})

	performanceSection:CreateToggle({
		Name = "Render Tool Animations";
		Flag = "renderToolAnimations";
		Default = true;
		Warning = "Experimental";
		CallbackOnCreation = true;
		Callback = function(renderToolAnimations)
			if (renderToolAnimations) then
				animationModule.restoreToolAnimations()
			else
				animationModule.disableToolAnimations()
			end
		end;
	})

	performanceSection:CreateToggle({
		Name = "Render XP Orbs";
		Flag = "renderXpOrbs";
		Default = true;
		Warning = "EXTREMELY Experimental!";
		CallbackOnCreation = true;
		Callback = function(renderXpOrbs)
			if (renderXpOrbs) then
				animationModule.enableXpOrbs()
			else
				animationModule.disableXpOrbs()
			end
		end
	})
	
	local developmentSection = page:CreateSection("Development")
	
	local selectedVersionNumber = MAIN_VERSION
	local selectVersionDropdown = developmentSection:CreateDropdown({
		Name = "Select Version";
		Callback = function(item) selectedVersionNumber = item end;
		Options = {MAIN_VERSION};
		ItemSelecting = true;
		DefaultItemSelected = selectedVersionNumber
	})
	
	task.spawn(function()
		local function updateVersions()
			local HttpService = game:GetService("HttpService")
			local branches = HttpService:JSONDecode(game:HttpGet("https://api.github.com/repos/ashlux/roblox-islands/branches"))
			local branchNames = {}
			for _,branch in pairs(branches) do
				table.insert(branchNames, branch.name)
			end
			selectVersionDropdown:Update(branchNames)
		end
		
		updateVersions()
		while wait(60) do pcall(updateVersions) end
	end)
	
	function destroyUI()
		restoreToolAnimations()
		UI:Destroy()
	end
	
	developmentSection:CreateInteractable({
		Name = "Load Version";
		ActionText = "Load Version";
		Callback = function()
			loadModule("roblox-islands-ui-v2.lua", selectedVersionNumber)
			destroyUI()
		end;
		Warning = "Do not unless you know what you're doing.";
		-- TODO: Somehow need to tell executing process to stop?
	})
	
	developmentSection:CreateInteractable({
		Name = "XXX - Destroy UI";
		ActionText = "Destroy UI";
		Callback = destroyUI;
		Warning = "Do not unless you know what you're doing.";
		-- TODO: Somehow need to tell executing process to stop?
	})
	
	local serverSection = page:CreateSection("Server")
	serverSection:CreateParagraph("Game ID: " .. game.GameId)
	serverSection:CreateParagraph("Job ID: " .. game.JobId)
	serverSection:CreateParagraph("Place ID: " .. game.PlaceId)
	serverSection:CreateParagraph("Place Version: " .. game.PlaceVersion)
	
	
	local blockCount = serverSection:CreateParagraph("")
	local dropCount = serverSection:CreateParagraph("")
	local vendingMonies = serverSection:CreateParagraph("")
	
	function updateDropCount(paragraph)
		count = Island and Island:WaitForChild("Drops") and #Island.Drops:GetChildren() or 0
		paragraph.Set("Drops: " .. stringUtils.formatInt(count))
	end
	
	function updateBlockCount(paragraph)
		local count = Island and Island:WaitForChild("Blocks") and #Island.Blocks:GetChildren() or 0
		paragraph.Set("Blocks: " .. stringUtils.formatInt(count))
	end
	
	task.spawn(function()
		updateBlockCount(blockCount)
		updateDropCount(dropCount)
		
		while wait(5) do
			updateBlockCount(blockCount)
			updateDropCount(dropCount)
        	end
    end)
	
	function updateVendingMonies(paragraph)
		local count = vendingModule.getTotalVendingMonies()
		paragraph.Set("Vending: $" .. stringUtils.formatInt(count))
	end
	
	task.spawn(function()
		updateVendingMonies(vendingMonies)
		while wait(30) do
			updateVendingMonies(vendingMonies)
		end
	end)
	
	serverSection:CreateParagraph("") -- fixes Atlas cutting off part of the last part of the page00
end

local function buildVendingPage()
	local page = UI:CreatePage("Vending")
	
	local page
end

--BUILD CROP PAGE--
local function buildCropPage()
	local page = UI:CreatePage("Crop")
	
	local cropFarmSection = page:CreateSection("Crop Farming")
	
	local selectedCropName = nil
	cropFarmSection:CreateDropdown({
		Name = "Select Crop";
		Callback = function(item) selectedCropName = item end;
		Options = {"spiritCrop", "chiliPepper", "carrot", "onion", "potato", "spinach", "tomato", "wheat", "melon", "pineapple", "candyCaneVine", "grapeVine", "dragonfruit", "cactus", "pumpkin", "radish", "rice", "seaweed", "starfruit", "voidParasite"};
		ItemSelecting = true;
		DefaultItemSelected = selectedCropName;
	})
	
	cropFarmSection:CreateToggle({
		Name = "Autofarm Crop";
		Flag = "autofarm";
		Default = false;
		CallbackOnCreation = false;
		SavingDisabled = true;
		Callback = function(shouldAutofarm)
			cropModule.stopSicklingAndReplanting()
			if shouldAutofarm and selectedCropName then
				cropModule.startSicklingAndReplanting(selectedCropName)
			end
	  end
	})
	
	cropFarmSection:CreateButton({
		Name = "Sickle Crop (No Replant)";
		Callback = function()
			if (selectedCropName) then
				cropModule.sicklingAndDoNotReplant(selectedCropName)
			end
		end
	})
	
	cropFarmSection:CreateButton({
		Name = "Plant Crop (No Sickling)";
		Callback = function()
			if (selectedCropName) then
				cropModule.plantCropsOnce(selectedCropName)
			end
		end
	})
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
		SavingDisabled = true;
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
		SavingDisabled = true;
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
buildCropPage()
buildTreePage()
buildMachinePage()
buildPlayerPage()
