local Atlas = loadstring(game:HttpGet("https://rd2glory.com/Atlas.lua"))()

local Player = game.Players.LocalPlayer
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
function bulidMiningPage()
	local page = UI:CreatePage("Mining")
	local furnaceSection = Page:CreateSection("Furnaces")
	
end


buildMain()
buildTreePage()
buildMiningPage()
