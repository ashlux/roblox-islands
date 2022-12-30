local Players = game:GetService("Players")
island = game.Workspace.Islands:GetChildren()[1]

function getOwner()
    for i,number in pairs(island.Owners:GetChildren()) do
        return Players:GetNameFromUserIdAsync(number.Value)
    end
end

local name = getOwner()

function makeFolder()
    if not isfolder("Average Price Tester") then
        makefolder("Average Price Tester")
    end
    if not isfile("Average Price Tester/"..name..".txt") then
        writefile("Average Price Tester/"..name..".txt", (name.."'s Vendings:\n"))
    end
end

--Make folder for owner
makeFolder()



function Comma(amount) -- add commas to numbers
    while true do
        amount, k = string.gsub(amount, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k==0) then
            break
        end
    end
    return amount
end

function getVendings()
    local vendings = {}
    for i,v in pairs(island.Blocks:GetChildren()) do
        if v.Name:find("vendingMachine") and v.Mode.Value ~= 2 and #v.SellingContents:GetChildren() > 0 then
            print (i,v)
            table.insert(vendings,v)
        end
    end
    return vendings
end

function modeToWord(Mode) --Convert number to buy or sell
    if Mode.Value == 1 then
        return "SELL"
    elseif Mode.Value == 0 then
        return "BUY"
    end
end

local vendings = getVendings()
for i,v in pairs(vendings) do
    
    --Convert number to buy or sell
    local Mode = modeToWord(v.Mode)
        
    local sellingContents = v.SellingContents:GetChildren()[1]
    
    appendfile("Average Price Tester/"..name..".txt", (tostring(sellingContents.Name).." - "..Mode.." - "..Comma(v.TransactionPrice.Value).."\n"))
            
    --Checks that the items file exsists
    valid = isfile("Average Price Tester/"..tostring(sellingContents.Name).." BUY.txt")
    valid2 = isfile("Average Price Tester/"..tostring(sellingContents.Name).." SELL.txt")
        --Make files if dont exsists
    if valid == false then
        if tostring(sellingContents.Name):match("/") then
            sellingContents.Name = tostring(sellingContents.Name):gsub('/', " ")
        end
        writefile("Average Price Tester/"..tostring(sellingContents.Name).." BUY.txt", "")
    end
    if valid2 == false then
        if tostring(sellingContents.Name):match("/") then
            sellingContents.Name = tostring(sellingContents.Name):gsub('/', " ")
        end
        writefile("Average Price Tester/"..tostring(sellingContents.Name).." SELL.txt", "")
    end

    --Get Contents and check if anything is there
    if tostring(sellingContents.Name):match("/") then
        Name2 = tostring(sellingContents.Name):gsub('/', " ")
        contents = readfile("Average Price Tester/"..tostring(Name2).." "..Mode..".txt")
    else
        contents = readfile("Average Price Tester/"..tostring(sellingContents.Name).." "..Mode..".txt")
    end
    
    --check if you have been to shop before
    if ShopKeeper then wait() else
        if contents == "" then writefile("Average Price Tester/"..tostring(sellingContents.Name).." "..Mode..".txt", Comma(v.TransactionPrice.Value)) end
        contents = readfile("Average Price Tester/"..tostring(sellingContents.Name).." "..Mode..".txt")
            --Time to get the number, and average it with the new number!
        noCommas = contents:gsub("%p", "")
        if v.TransactionPrice.Value < 1000 then wait() else
            Average = math.floor((tonumber(noCommas) + v.TransactionPrice.Value) / 2)
            writefile("Average Price Tester/"..tostring(sellingContents.Name).." "..Mode..".txt", tostring(Comma(Average)))
        end
    end
end