local amount = 0

island = ""
for i,v in pairs(game.Workspace.Islands:GetChildren()) do
    island = v
end


for i,v in pairs(island.Blocks:GetChildren()) do
    if v.Name == "vendingMachine" or v.Name == "vendingMachine1" then
        amount = amount + 1
        print(amount)
    end
end