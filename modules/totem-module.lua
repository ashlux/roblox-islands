local cropTotemNames = {
	"totemPineapple",
	"totemStarfruit",
	"totemGrape",
	"totemOnion",
	"totemMelon",
	"totemRedBerryBush",
	"totemBlackberryBush",
	"totemBlueberryBush",
	"totemCarrot",
	"totemTomato",
	"totemWheat",
	"totemDragonfruit",
	"totemSpinach",
	"totemRadish",
	"totemPumpkin",
	"totemPotato",
}
table.sort(cropTotemNames)

local rockTotemNames = {
	"totemTest",
	"totemObsidian",
	"totemGranite",
	"totemClay",
	"totemStone",
	"totemSlate",
	"totemAquamarine",
	"totemMarble",
	"totemSandstoneRed",
	"totemIron",
	"totemDiorite",
	"totemAndesite",
	"totemSandstone",
	"totemCoal",
}
table.sort(rockTotemNames)

local allTotemNames = {}
for _,cropTotemName in pairs(cropTotemNames) do table.insert(allTotemNames, cropTotemName) end
for _,rockTotemName in pairs(rockTotemNames) do table.insert(allTotemNames, rockTotemName) end
table.sort(allTotemNames)

local function getRockTotemNames() return rockTotemNames; end
local function getCropTotemNames() return cropTotemNames; end
local function getAllTotemNames() return allTotemNames; end

local function getTotemTypeByName(totemName)
	for _, cropTotemName in pairs(cropTotemNames) do
		if (totemName == cropTotemName)
			return "totem_crop"
		end
	end
	return "totem_rock"
end

local function upgradeTotemBlock(totemBlock, upgradeType)
	local totemType = getTotemTypeByName(totemBlock.Name)
	local args = {
		[1] = totemBlock,
		[2] = totemType,
		[3] = upgradeType,
	}
	game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"]
		.net.out._NetManaged.UpgradeBlock:InvokeServer(unpack(args))
end

local function upgradeTotemBlockEfficiency(totemBlock)
	upgradeTotemBlock(totemBlock, "efficiency")
end

local function upgradeTotemBlockQuality(totemBlock)
	upgradeTotemBlock(totemBlock, "quality")
end

local function upgradeTotemBlockUtility(totemBlock)
	upgradeTotemBlock(totemBlock, "utility")
end

local function getTotemBlocksByName(totemName)
	local island = game.Workspace.Islands:GetChildren()[1]
	local totemBlocks = {}
	for _, totemBlock in pairs(island.Blocks:GetChildren()) do
		if (totemBlock.Name == totemName) then
			table.insert(totemBlocks, totemBlock)
		end
	end
	return totemBlocks
end

local function upgradeTotems(totemName, efficiency, quality, utility)
	local totemBlocks = getTotemBlocksByName(totemName)

	for currentUpgradeAmount = 1,53 do
		for _,totemBlock in pairs(totemBlocks) do
			local upgradeProgress = totemBlock.UpgradeProgress
			if upgradeProgress.efficiency.Value < efficiency then
				upgradeTotemBlockEfficiency(totemBlock)
			end
			if upgradeProgress.quality.Value < quality then
				upgradeTotemBlockQuality(totemBlock)
			end
			if upgradeProgress.utility.Value < utility then
				upgradeTotemBlockUtility(totemBlock)
			end
		end
	end
end

return {
	getRockTotemNames = getRockTotemNames,
	getCropTotemNames = getCropTotemNames,
	getAllTotemNames = getAllTotemNames,
	getTotemBlocksByName = getTotemBlocksByName,
	upgradeTotems = upgradeTotems,
	upgradeTotemBlockUtility = upgradeTotemBlockUtility,
	upgradeTotemBlockQuality = upgradeTotemBlockQuality,
	upgradeTotemBlockEfficiency = upgradeTotemBlockEfficiency,
}
