local Player = game.Players.LocalPlayer
local WorkerBlockMeta = require(game:GetService("ReplicatedStorage").TS.crafting["worker-block-meta"]).WorkerBlockMeta

local MAX_FILL_AMOUNT = 50

local function refuel(machineBlock, fuelName)
	local existingFuelCount = #machineBlock.WorkerFuel:GetChildren()
	local refuelAmount = MAX_FILL_AMOUNT - existingFuelCount

	if refuelAmount > 0 then
		local args = {
			[1] = {
				["amount"] = refuelAmount,
				["block"] = machineBlock,
				["player_tracking_category"] = "join_from_web",
				["toolName"] = fuelName or "coal"
				}
			}
	
		game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged
			.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
	end
end

local function collect(machineBlock, inOrOut)
	local whatToCollect = inOrOut or "WorkerOutputContents" -- WorkerOutputContents or WorkerContents
	if Player:DistanceFromCharacter(machineBlock.Position) < 24 then
		task.spawn(function()
			local itemToCollect = machineBlock[inOrOut] and machineBlock[inOrOut]:GetChildren()[1]
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
		end)
	end
end

local function collectOutput(WorkerOutputContents)
	collect(WorkerOutputContents, "WorkerOutputContents")
end

local function collectInput(WorkerOutputContents)
	collect(WorkerOutputContents, "WorkerContents")
end

local function fillWith(machineBlock, itemName)
	local itemToCollect = #machineBlock.WorkerOutputContents:GetChildren()
	if itemsToCollect and itemsToCollect > 0 then
		return;
	end

	local existingItemCount = #machineBlock.WorkerContents:GetChildren()
	local refillAmount = MAX_FILL_AMOUNT - existingItemCount
	
	if refillAmount > 0 then
		local args = {
			[1] = {
				["amount"] = refillAmount,
				["block"] = machineBlock,
				["player_tracking_category"] = "join_from_web",
				["toolName"] = itemName
				}
			}
		
		game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged
			.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
	end
end

local function getIngredientNamesByMachineName(machineName)
	local MachineMeta = WorkerBlockMeta[machineName]
	local ingredients = MachineMeta.ingredients
	local ingredientNames = {}
	for _,ingredient in pairs(ingredients) do
		table.insert(ingredientNames, ingredient.toolName)
	end
	
	table.sort(ingredientNames)
	return ingredientNames
end

return {
	collectInput = collectInput,
	collectOutput = collectOutput,
	refuel = refuel,
	fillWith = fillWith,
	getIngredientNamesByMachineName = getIngredientNamesByMachineName,

}
