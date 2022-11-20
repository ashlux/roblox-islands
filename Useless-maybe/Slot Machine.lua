local HttpService = game:GetService("HttpService")
local Island = game.Workspace.Islands:GetChildren()[1]
local Players = game.Players
local Player = game.Players.LocalPlayer
local HR = Player.Character.HumanoidRootPart

local openVending = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("owbuiGQSzeSbdrq/arvmkmbpeihybCuwivhvaqGbspnzrlbjsbecaptd")
local closeVending = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("owbuiGQSzeSbdrq/cftuvfhFUcyguekjhvumjIpNXfaxdDucqrxpgsXxk")
local emptyItem = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("owbuiGQSzeSbdrq/wnigzimrzxnAIIisufyxnqj")
local refillItem = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("owbuiGQSzeSbdrq/wnigzimrzxnAIIisufyxnqj")
local refillCoins = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("owbuiGQSzeSbdrq/hdpNgsqHrbovfZGfmmw")
local takeCoins = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("owbuiGQSzeSbdrq/mkjfWpNbrojqbkVuQlmb")

howManyLoops = 5
firstTime = true
debounce = false

Player.Experience.economy.Value = 999999999999

function ticketKeeper(player, tickets, winner)
        closeBottom()
    ticketInfo = isfile("Ticket Keeper/"..player.Name..".txt")

    if ticketInfo == false then
        writefile("Ticket Keeper/"..player.Name..".txt", "0")
    end

    contents = readfile("Ticket Keeper/"..player.Name..".txt")
    newNumber = tonumber(contents) + tickets

    writefile("Ticket Keeper/"..player.Name..".txt", tostring(newNumber))
    
    contents = readfile("Ticket Keeper/"..player.Name..".txt")
    
    if winner == "yes" then
        local args = {
        [1] = "CONGRATS "..player.Name.." gets 20 tickets, for a total of "..contents.." tickets",
        [2] = "All"
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
    elseif winner == "no" then
        local args = {
        [1] = player.Name.." gets a ticket, for a total of "..contents.." tickets",
        [2] = "All"
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
    elseif winner == "kinda" then
        local args = {
        [1] = player.Name.." gets 5 tickets, for a total of "..contents.." tickets",
        [2] = "All"
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
    end
end

function getVendings()
    vendings = {}
    otherBlocks = {}
    for i,v in pairs(Island.Blocks:GetChildren()) do
        if (v.Name == "vendingMachine" or v.Name == "vendingMachine1") and (HR.Position - v.Position).Magnitude < 200 then
            table.insert(vendings, v)
        else
            table.insert(otherBlocks, v)
        end
    end
    return vendings, otherBlocks
end

function findSlots(item)
    slotVendings = {}
vendings, otherBlocks = getVendings()
for i,v in pairs(vendings) do
    if v.SellingContents:FindFirstChild(item) then
        table.insert(slotVendings, v)
    end
end
return slotVendings
end

bottomVending = findSlots("coal")
topVendings = findSlots("clay")

function closeBottom()
for i,v in pairs(bottomVending) do
    local args = {
    [1] = {
    ["vendingMachine"] = v
    }
    }
    closeVending:FireServer(unpack(args))
end
end


function ticketKeeper(player, tickets, winner)
    ticketInfo = isfile("Ticket Keeper/"..player.Name..".txt")

    if ticketInfo == false then
        writefile("Ticket Keeper/"..player.Name..".txt", "0")
    end

    contents = readfile("Ticket Keeper/"..player.Name..".txt")
    newNumber = tonumber(contents) + tickets

    writefile("Ticket Keeper/"..player.Name..".txt", tostring(newNumber))
    
    contents = readfile("Ticket Keeper/"..player.Name..".txt")
    
    if winner == "yes" then
        local args = {
        [1] = "CONGRATS "..player.Name.." gets 20 tickets, for a total of "..contents.." tickets",
        [2] = "All"
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
    elseif winner == "no" then
        local args = {
        [1] = player.Name.." gets a ticket, for a total of "..contents.." tickets",
        [2] = "All"
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
    elseif winner == "kinda" then
        local args = {
        [1] = player.Name.." gets 5 ticket, for a total of "..contents.." tickets",
        [2] = "All"
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
    end
    closeBottom()
end

function getRandomClay()
    clays = {"clayCyan", "clayPurple", "clayYellow"}
    randomNumber = math.random(1,3)
    for i,v in pairs(clays) do
        if i == randomNumber then
            randomClay = v
        end
    end
    return randomClay
end

function randomizeTopMachines(playr)
    if debounce == false then
    debounce = true
    for i,v in pairs(bottomVending) do
        BottomVending = v
        print("opening",BottomVending,v)
    local args = {
    [1] = HttpService:GenerateGUID(false),
    [2] = {
    [1] = {
    ["vendingMachine"] = BottomVending
    }
    }
    }
    openVending:FireServer(unpack(args))
    end
    print("Starting randomization for "..playr.Name)
    for T = 1,howManyLoops do
        for i,v in pairs(topVendings) do
            wait()
            if T == 1 then -- open vending
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["vendingMachine"] = v
                }
                }
                }
                openVending:FireServer(unpack(args))
            elseif T == howManyLoops then
                if firstTime == true then
                    firstTime = false
                    wait(2)
                    for i,v in pairs(topVendings) do
                        if i == 1 then vending1 = v.SellingContents:GetChildren()[1]
                        elseif i == 2 then vending2 = v.SellingContents:GetChildren()[1]
                        elseif i == 3 then vending3 = v.SellingContents:GetChildren()[1]
                    end
                    end
                    print(vending1.Name,vending2.Name,vending3.Name)
                    if vending1.Name == vending2.Name and vending1.Name == vending3.Name then
                        ticketKeeper(playr, 20, "yes")
                    elseif vending1.Name == vending2.Name or vending1.Name == vending3.Name or vending2.Name == vending3.Name then
                        ticketKeeper(playr, 5, "kinda")
                    else
                        ticketKeeper(playr, 1, "no")
                    end
                end
                --Take item
                item = v.SellingContents:GetChildren()[1]
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["amount"] = 1,
                ["vendingMachine"] = v,
                ["tool"] = item,
                ["action"] = "withdraw"
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("owbuiGQSzeSbdrq/wnigzimrzxnAIIisufyxnqj"):FireServer(unpack(args))
                
                --put clay back in
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["amount"] = 1,
                ["vendingMachine"] = v,
                ["tool"] = game:GetService("Players").LocalPlayer.Backpack.clay,
                ["action"] = "deposit"
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("owbuiGQSzeSbdrq/wnigzimrzxnAIIisufyxnqj"):FireServer(unpack(args))
                
                --close vendings
                local args = {
                [1] = {
                ["vendingMachine"] = v
                }
                }
                closeVending:FireServer(unpack(args))
            elseif T > 1 and T < howManyLoops then
                --take item
                wait()
                item = v.SellingContents:GetChildren()[1]
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["amount"] = 1,
                ["vendingMachine"] = v,
                ["tool"] = item,
                ["action"] = "withdraw"
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("owbuiGQSzeSbdrq/wnigzimrzxnAIIisufyxnqj"):FireServer(unpack(args))
                -- deposit Random clay
                randomClay = getRandomClay()
                print(randomClay)
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["amount"] = 1,
                ["vendingMachine"] = v,
                ["tool"] = game:GetService("Players").LocalPlayer.Backpack[randomClay],
                ["action"] = "deposit"
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("owbuiGQSzeSbdrq/wnigzimrzxnAIIisufyxnqj"):FireServer(unpack(args))
            end
        end
    end
    firstTime = true
    debounce = false
    end
end

function addEvent(Player)
waitTime = 0
repeat wait(0.5) print("waiting for "..Player.Name.." to load")
    until Player:FindFirstChild("Backpack")
    repeat wait(0.5) print("waiting for coal") waitTime = waitTime + 1
    until Player.Backpack:FindFirstChild("coal") or waitTime == 20
    print("Got coal maybe!")
    if Player.Backpack:FindFirstChild("coal") == nil then
        Player.Backpack.ChildAdded:Connect(function(coal)
            if coal.Name == "coal" then
            print(Player.Name.." Bought some coal for the first time")
            --local args = {
            --[1] = Player.Name.." is spinning the slot.  Good luck!",
            --[2] = "All"
            --}
            --game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            
            randomizeTopMachines(Player)
            end
            Player.Backpack:FindFirstChild("coal").Amount.Value:GetPropertyChangedSignal("Value"):Connect(function()
                
                print(Player.Name.." Bought some more coal")
                --local args = {
                --[1] = Player.Name.." is spinning the slot.  Good luck!",
                --[2] = "All"
                --}
                --game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            
                randomizeTopMachines(Player)
            end)
        end)
    else
        local oldCoins = Instance.new("IntValue")
        oldCoins.Value = Player.leaderstats.Coins.Value
        oldCoins.Name = "oldCoins"
        oldCoins.Parent = Player
        
        Player.Backpack:FindFirstChild("coal").Amount.Changed:Connect(function(new)
            if Player.oldCoins.Value > Player.leaderstats.Coins.Value then
            print(Player.Name.." Bought some coal")
            --local args = {
            -- = Player.Name.." is spinning the slot.  Good luck!",
            --[2] = "All"
            --}
            --game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            print(Player)
            randomizeTopMachines(Player)
            end
            Player.oldCoins.Value = Player.leaderstats.Coins.Value
        end)
    end
end

Players.PlayerAdded:Connect(function(plr)
    addEvent(plr)
end)

for i,v in pairs(game.Players:GetChildren()) do
    print("adding event to",v)
    addEvent(v)
end