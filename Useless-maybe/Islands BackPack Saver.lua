local Players = game:GetService("Players")

for i,p in pairs(Players:GetChildren()) do
    writefile("Island Players Inventories/"..p.Name..".txt", (p.Name..":\n"))
    for i,v in pairs(p.Backpack:GetChildren()) do
        appendfile("Island Players Inventories/"..p.Name..".txt",tostring(v.DisplayName.Value).." - "..v.Amount.Value.."\n")
    end
end