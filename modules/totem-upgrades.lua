local cropTotems = {
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
table.sort(cropTotems)

local rockTotems = {
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
table.sort(rockTotems)

local function getRockTotems() return rockTotems; end
local function getCropTotems() return cropTotems; end

local function getTotemTypeByName(totemName)
	if cropTotems[totemName] then
		return "totem_crop"
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

	for currentUpgradeAmount = 1,52 do
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
	getRockTotems = getRockTotems,
	getCropTotems = getCropTotems,
	getTotemBlocksByName = getTotemBlocksByName,
	upgradeTotems = upgradeTotems,
	upgradeTotemBlockUtility = upgradeTotemBlockUtility,
	upgradeTotemBlockQuality = upgradeTotemBlockQuality,
	upgradeTotemBlockEfficiency = upgradeTotemBlockEfficiency,
}
