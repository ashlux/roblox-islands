local Island = game.Workspace.Islands:GetChildren()[1]

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

return {
  getTotalVendingMonies = getTotalVendingMonies
}
