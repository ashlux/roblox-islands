writefile("Average Prices.txt", "")

for i,v in pairs(game.ReplicatedStorage.Tools:GetChildren()) do

    if isfile("Average Price Tester/"..tostring(v.Name).." BUY.txt") and isfile("Average Price Tester/"..tostring(v.Name).." SELL.txt") then
        contents1 = readfile("Average Price Tester/"..tostring(v.Name).." BUY.txt")
        contents2 = readfile("Average Price Tester/"..tostring(v.Name).." SELL.txt")
        print(contents1,contents2)
        appendfile("Average Prices.txt", tostring(v.DisplayName.Value).."-----BUY-----"..contents1.."\n"..tostring(v.DisplayName.Value).."-----SELL-----"..contents2.."\n\n")
    end
end