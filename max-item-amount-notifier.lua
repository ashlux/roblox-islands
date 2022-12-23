function waitUntilLoaded()
	repeat wait()
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
	local mouse = game.Players.LocalPlayer:GetMouse() 
	repeat wait() until mouse
end
waitUntilLoaded()

local StarterGui = game:GetService("StarterGui")
local Player = game.Players.LocalPlayer

-- TODO: CHeck coins too!

local MAX_ITEM_MAP = {
-- TODO: DV, Legacy Food Processor, Fish Trophy, Arrows
-- washing station or industrial is 1000?
	["cactusSeeds"] = 2000,
	["pearl"] = 5000,
	["berryBushSeeds"] = 10000,
	["bucketWater"] = 2000,
	["stickyGearPink"] = 10000,
	["smelterIndustrial"] = 10000,
	--["washingStationIndustrial"] = 1000, -- or just regular washign machine?
	["propeller"] = 1000,
	["ironCrystal"] = 5000,
	["baitT2"] = 2000,
	["crystalizedGold"] = 2000,
	["crystalizedAquamarine"] = 2000,
	["bucketMilk"] = 10000,
	["bucketYakMilk"] = 2000,
	["melonSeeds"] = 10000
}
while wait(5) do
	for _,item in pairs(Player.Backpack:GetChildren()) do
		local amount = item.Amount.Value
		local maxAmount = MAX_ITEM_MAP[item.Name] or 1000000
		if amount >= maxAmount then	
			local warningMsg = "[!!!]: " .. item.Name .. " is over the limit of " .. maxAmount .. " (you have " .. amount .. ")!";	
			StarterGui:SetCore("ChatMakeSystemMessage", {
				Color = Color3.fromRGB(255,0,0), 
				Font = Enum.Font.SourceSansBold,
				TextSize = 18,
				Text = warningMsg
			});
		end
	end
end
