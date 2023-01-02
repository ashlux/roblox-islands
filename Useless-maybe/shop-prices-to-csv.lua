Island = game.Workspace.Islands:GetChildren()[1]

local dt = os.date("*t", os.time())

local joinCodes = ""
for k,player in pairs(game.Players:GetChildren()) do
	for _, ownerUserId in pairs(Island.Owners:GetChildren()) do
		if (player.UserId == ownerUserId.Value) then
			joinCodes = joinCodes .. " " .. player.JoinCode.Value
		end
	end
end
--print(joinCodes)


local filename = dt.year .. "-" .. dt.month .. "-" .. dt.day .. ".csv"
print(filename)
if (not isfile(filename)) then
	writefile(filename, "")
end

local function nameToDisplay(name)
    for i,v in pairs(game.ReplicatedStorage.Tools:GetChildren()) do
        if v.Name == name and v:FindFirstChild("DisplayName") then
            return v.DisplayName.Value
        end
    end
    return name
end

for k,vm in pairs(Island.Blocks:GetChildren()) do
	if (vm.Name:find("vendingMachine") and vm.SellingContents and #vm.SellingContents:GetChildren() == 1) then	
		local item = vm.SellingContents:GetChildren()[1]
		local amount = item.Amount.Value
		local price = vm.TransactionPrice.Value
		local mode = vm.Mode.Value
		if mode == 0 then
			--print("SELLING " .. amount .. " " .. item.Name .. " for " .. price)
			appendfile(filename, "sell," .. joinCodes .. "," .. amount	 .. "," .. item.Name .. "," .. nameToDisplay(item.Name) .. "," .. price .. "\n")
		elseif mode == 1 then
			--print("BUYING " .. item.Name .. " for " .. price)
			appendfile(filename, "buy," .. joinCodes .. "," .. amount .. "," .. item.Name .. "," .. nameToDisplay(item.Name) .. "," .. price .. "\n")
		end
	end
end
