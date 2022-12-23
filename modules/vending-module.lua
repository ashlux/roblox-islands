local HttpService = game:GetService("HttpService")
local Island = game.Workspace.Islands:GetChildren()[1]
local Player = game.Players.LocalPlayer
 
local openVending = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out
						._NetManaged:FindFirstChild("ynnopTkz/UsookoskklebhlgsmtbcvowsatVCLmwaomvznl")
local closeVending = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out
						._NetManaged:FindFirstChild("ynnopTkz/rzkoqszwxDkuxuozJfywlKrlbtvsxddUaf")
local addRemoveItem = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out
						._NetManaged:FindFirstChild("ynnopTkz/qCeyfdpaIevrt")
local addCoins = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out
						._NetManaged:FindFirstChild("ynnopTkz/nWjuqcbnk")
local removeCoins = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out
						._NetManaged:FindFirstChild("ynnopTkz/cgqmketicihkylwvuhdfeqcjqulcaQwstvcn")
local changeVendingMachinePrice =  game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out
						._NetManaged:FindFirstChild("ynnopTkz/ocsGtqjywesizfxlAszwh")
local changeVendingMachineMode = changeVendingMachinePrice

local function getVendingMachineBlocks()
  local vendingMachineBlocks = {}
  for k,vendingMachine in pairs(Island and Island.Blocks and Island.Blocks:GetChildren() or {}) do
    if (vendingMachine.Name:find("vending"))  then
      table.insert(vendingMachineBlocks, vendingMachine)
    end
  end
  return vendingMachineBlocks
end

local function getTotalVendingMonies()
  local amount = 0
  for k,vendingMachine in pairs(getVendingMachineBlocks()) do
    amount = amount + vendingMachine.CoinBalance.Value
  end
  return amount
end

local function openVendingMachine(vendingMachineBlock)
	local args = {
		[1] = HttpService:GenerateGUID(false),
		[2] = {
			[1] = { ["vendingMachine"] = vendingMachineBlock }
			}
		};
	openVending:FireServer(unpack(args));
end

local function closeVendingMachine(vendingMachineBlock)
	local args = {
		[1] = {
			["vendingMachine"] = vendingMachineBlock
			}
		};
	closeVending:FireServer(unpack(args))
end

local function removeCoinsFromVendingMachine(vendingMachineBlock)
	local args = {
		[1] = HttpService:GenerateGUID(false),
        [2] = {
			[1] = {
				["vendingMachine"] = vendingMachineBlock,
				["player_tracking_category"] = "join_from_web",
				["amount"] = vendingMachineBlock.CoinBalance.Value
				}
			}
		};
	removeCoins:FireServer(unpack(args))
end

local function addItemsToVendingMachine(vendingMachineBlock, itemName, amount)
	local args = {
		[1] = HttpService:GenerateGUID(false),
        [2] = {
			[1] = {
				["player_tracking_category"] = "join_from_web",
				["amount"] = amount,
				["vendingMachine"] = vendingMachineBlock,
				["tool"] = Player.Backpack[itemName],
				["action"] = "deposit"
				}
            }
		}
	addRemoveItem:FireServer(unpack(args))
end

local function removeItemsFromVendingMachine(vendingMachineBlock, itemName, amount)
	local args = {
		[1] = HttpService:GenerateGUID(false),
        [2] = {
			[1] = {
				["player_tracking_category"] = "join_from_web",
				["amount"] = amount,
				["vendingMachine"] = vendingMachineBlock,
				["tool"] = Player.Backpack[itemName],
				["action"] = "withdraw"
				}
            }
		}
	addRemoveItem:FireServer(unpack(args))
end

local function setVendingMachineModeAndPrice(vendingMachineBlock, modeId, price)
	local args = {
		[1] = HttpService:GenerateGUID(false),
		[2] = {
			[1] = {
				["player_tracking_category"] = "join_from_web",
				["vendingMachine"] = vendingMachineBlock,
				["transactionPrice"] = price,
				["mode"] = modeId
			}
		}
	}

	changeVendingMachineMode:FireServer(unpack(args))
end

local function changeVendingMachineSettings(vendingMachineBlock, settings)
	if not (vendingMachineBlock and settings and settings.itemName and settings.modeId and settings.price) then
		return nil;
	end
	
	openVendingMachine(vendingMachineBlock)
	local currentSellItem = vendingMachineBlock.SellingContents and vendingMachineBlock.SellingContents:GetChildren()[1]
	if currentSellItem then
		removeItemsFromVendingMachine(vendingMachineBlock, currentSellItem.Name, currentSellItem.Amount.Value)
	end
	setVendingMachineModeAndPrice(vendingMachineBlock, settings.modeId, settings.price)
	addItemsToVendingMachine(vendingMachineBlock, settings.itemName, 1000)
	closeVendingMachine(vendingMachineBlock)
end

return {
  getTotalVendingMonies = getTotalVendingMonies,
  changeVendingMachineSettings = changeVendingMachineSettings,
}
