local Atlas = loadstring(game:HttpGet("https://rd2glory.com/Atlas.lua"))()

local Player = game.Players.LocalPlayer
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
		    print(newValueA)
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
	local Page = UI:CreatePage("Mining")
	local furnaceSection = Page:CreateSection("Furnaces")
	
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
        print(RUN, WS, newValue)
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
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
    })


    -- FOV --
    modifyStats:CreateSlider({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "FOV (default:70)"; -- required: name of element
    Flag = "FOV"; -- required: unique flag name to use
    Min = 0; -- required: slider minimum drag
    Max = 120; -- required: slider maximum drag (Max>Min or else script will error)
    AllowOutOfRange = true; -- optional: determines whether the player can enter values outside of range Min:Max when typing in the TextBox. If left nil, this is false
    Digits = 0; -- optional: digits for rounding when dragging or entering values, default is 0 (whole numbers)
    Default = 70; -- optional: default value for slider, will be used if config saving is disabled and there is no saved data, will be the Min value if left nil
    Callback = function(newValue) -- optional: function that will be called whenever slider flag is changed
        game.Workspace.Camera.FieldOfView = newValue
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
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
    modifyStats:CreateSlider({ -- IMPORTANT: This function does not return anything, please modify flags directly in order to read or update toggle values. SCROLL TO BOTTOM OF PAGE TO SEE HOW TO MODIFY FLAGS
    Name = "Time"; -- required: name of element
    Flag = "ToD"; -- required: unique flag name to use
    Min = 0; -- required: slider minimum drag
    Max = 24; -- required: slider maximum drag (Max>Min or else script will error)
    AllowOutOfRange = true; -- optional: determines whether the player can enter values outside of range Min:Max when typing in the TextBox. If left nil, this is false
    Digits = 0; -- optional: digits for rounding when dragging or entering values, default is 0 (whole numbers)
    Default = 0; -- optional: default value for slider, will be used if config saving is disabled and there is no saved data, will be the Min value if left nil
    Callback = function(newValue) -- optional: function that will be called whenever slider flag is changed
        timeDesired = newValue
        local number = tonumber(newValue)
        if number > 7 and number > 18 then
            game.Lighting.Brightness = 12
        elseif number >= 7 and number <= 18 then
            game.Lighting.Brightness = 2.7
        end
    end;
    -- Scroll to the bottom of the page to read more about the following two:
    Warning = "This has a warning"; -- optional: this argument is used in all elements (except for Body) and will indicate text that will appear when the player hovers over the warning icon
    WarningIcon = 12345; -- optional: ImageAssetId for warning icon, will only be used if Warning is not nil, default is yellow warning icon.
    })
end

buildMain()
buildTreePage()
buildMiningPage()
buildPlayerPage()
