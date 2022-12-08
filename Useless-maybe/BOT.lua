if not game:IsLoaded() then
game.Loaded:Wait()
end

Players = game:GetService("Players")
Player = Players.LocalPlayer
mouse = Player:GetMouse()

repeat wait() 
until Players and Player.Character and Player.Character:FindFirstChild("Head") and Player.Character:FindFirstChild("Humanoid") 
repeat wait() until mouse

print("loaded")

HttpService = game:GetService("HttpService")
sendTrade = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("sOnqvsemSisPnsouPitua/xcawRyyRkStrIqevEykl")
botName = "T1CKETmaster"
Character = Player.Character
HR = Character.HumanoidRootPart
RS = game:GetService("ReplicatedStorage")
Island = game.Workspace.Islands:GetChildren()[1]
waitingForName = false
playerToCheck = ""
foundOne = false

function Time()
	local HOUR = math.floor((tick() % 86400) / 3600)
	local MINUTE = math.floor((tick() % 3600) / 60)
	local SECOND = math.floor(tick() % 60)
	local AP = HOUR > 11 and 'PM' or 'AM'
	HOUR = (HOUR % 12 == 0 and 12 or HOUR % 12)
	HOUR = HOUR < 10 and '0' .. HOUR or HOUR
	MINUTE = MINUTE < 10 and '0' .. MINUTE or MINUTE
	SECOND = SECOND < 10 and '0' .. SECOND or SECOND
	return HOUR .. ':' .. MINUTE .. ':' .. SECOND .. ' ' .. AP
end

local cache = {}
function getUserIdFromUsername(name)
    if cache[name] then return cache[name] end
    local id
    pcall(function()
        id = Players:getUserIdFromNameAsync(name)
    end)
    cache[name] = id
    return id
end

function getPlayerFromDisplayName(displayName) -- Call this function with the beginning of the name to get the player from displayname
	local Players = game:GetService('Players')
	for i, Player in pairs(Players:GetPlayers()) do
		if Player.DisplayName:lower(displayName):sub(1, #displayName) == displayName:lower() then
		    playerFound = true
			return Player
		end
	end
	return nil
end

--for inviting person who makes bot join someone
if not isfolder("Bot Info") then
    makefolder("Bot Info")
end

if isfile("Bot Info/Who To Invite.txt") and game.Players.LocalPlayer.Name == botName then
    task.spawn(function()
        for i = 1,10 do
            task.wait(2)
            NAME = readfile("Bot Info/Who To Invite.txt")
            local args = {
            [1] = {
            ["userId"] = (getUserIdFromUsername(NAME)),
            ["name"] = NAME
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_8:InvokeServer(unpack(args))
        end
        writefile("Bot Info/Who To Invite.txt", "")
    end)
end

--this returns {IsFilterResult, MessageLength, SpeakerUserId, SpeakerDisplayName, OriginalChannel, Message, FromSpeaker, Time, MessageLengthUtf8, ID, IsFiltered, ExtraData(table), MessageType}
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(data)
    local message = string.lower(data.Message)
    
    if game.Players.LocalPlayer.Name == botName then
        print(message)
        if message == "^help" then
            local args = {
            [1] = "Commands: ^rps, ^flip, ^joke, ^insult, ^joinme, ^bp [player] [item], ^leavemealone, ^pricecheck [item], ^invite [player], ^help2",
            [2] = "All"
            }
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        elseif message == "^help2" or "^help 2" then
            local args = {
            [1] = "Commands: ^countdrops, ^countvendings, ^countblocks,  ^submitjoke [joke], ^join [player], ^rpg step, more to come",
            [2] = "All"
            }
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        
        
        elseif message:sub(0,6) == "^roll " then-- 1d6,  2d20
            for i = 1,#message do
                if string.sub(message, i, i) == " " then
                    start = i
                end
                if string.sub(message, i, i) == "d" then
                    numberOfDice = string.sub(message, start, i-1)
                    numberOfSides = string.sub(message, i+1, -1)
                end
            end
            if tonumber(numberOfDice) >= 6 then
                local args = {
                [1] = "Sorry, I can only handle 6 dice max",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            else
                for i = 1,numberOfDice do
                    local args = {
                    [1] = "Die number "..i.." landed on "..math.random(1,numberOfSides),
                    [2] = "All"
                    }
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                wait()
                end
            end
        
        elseif message == "^mytickets" then
            contents = readfile("Ticket Keeper/"..data.FromSpeaker..".txt")
            local args = {
            [1] = data.FromSpeaker.." has "..contents.." tickets",
            [2] = "All"
            }
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        
        elseif message == "^bp osu friends" then
            local args = {
            [1] = "Osuwizzard has no friends.",
            [2] = "All"
            }
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            
        elseif message == "^rps" then
            local args = {
            [1] = "Choose ^rps rock, ^rps paper, or ^rps scissors",
            [2] = "All"
            }
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            
        elseif message == "^rps rock" or data.Message == "^rps r" then
            number = math.random(1,3)
            if number == 1 then
                local args = {
                [1] = data.FromSpeaker.." chose rock.  I choose rock.  Its a tie!",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            elseif number == 2 then 
                local args = {
                [1] = data.FromSpeaker.." chose rock.  I choose paper.  I win!",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            elseif number == 3 then
                local args = {
                [1] = data.FromSpeaker.." chose rock.  I choose scissors.  You win!",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            end
        
        elseif message == "^rps paper" or data.Message == "^rps p" then
            number = math.random(1,3)
            if number == 1 then
                local args = {
                [1] = data.FromSpeaker.." chose paper.  I choose rock.  You win!",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            elseif number == 2 then 
                local args = {
                [1] = data.FromSpeaker.." chose paper.  I choose paper.  Its a tie!",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            elseif number == 3 then
                local args = {
                [1] = data.FromSpeaker.." chose paper.  I choose scissors.  I win!",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            end
        
        elseif message == "^rps scissors" or data.Message == "^rps s" then
            number = math.random(1,3)
            if number == 1 then
                local args = {
                [1] = data.FromSpeaker.." chose scissors.  I choose rock.  I win!",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            elseif number == 2 then 
                local args = {
                [1] = data.FromSpeaker.." chose scissors.  I choose paper.  You win!",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            elseif number == 3 then
                local args = {
                [1] = data.FromSpeaker.." chose scissors.  I choose scissors.  Its a tie!",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            end
        
        elseif message == "^flip" then
            number = math.random(1,2)
            if number == 1 then
                local args = {
                [1] = data.FromSpeaker.." flipped a coin, and got HEADS",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            elseif number == 2 then 
                local args = {
                [1] = data.FromSpeaker.." flipped a coin, and got TAILS",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            end
        
        elseif message == "^trademe" then
            local args = {
            [1] = HttpService:GenerateGUID(false),
            [2] = {
            [1] = {
            ["targetUserId"] = data.SpeakerUserId
            }
            }
            }
            sendTrade:FireServer(unpack(args))
        
        elseif data.Message:sub(0,6) == "^kick " then
            Continue = false
            for _,owners in pairs(Island.Owners:GetChildren()) do
                if owners.Value == data.SpeakerUserId then
                    Continue = true
                end
            end
            for _,builders in pairs(Island.AccessBuild:GetChildren()) do
                if builders.Value == data.SpeakerUserId then
                    Continue = true
                end
            end
            if Continue then
                playerToKick = data.Message:sub(7,-1)
                for i,v in pairs(Players:GetPlayers()) do
                    if string.lower(playerToKick) == string.lower(v.Name) then
                        playerToKick = v.Name
                    end
                end
                local args = {[1] = {["accessRank"] = 1, ["player"] = Players[playerToKick]}}
			    RS.rbxts_include.node_modules.net.out._NetManaged.CLIENT_CHANGE_ISLAND_ACCESS_LEVEL:InvokeServer(unpack(args))
            end
        
        elseif message == "^countdrops" or message == "^count drops" then
            if Island:FindFirstChild("Drops") then
                local args = {
                [1] = "There are "..tostring(#Island.Drops:GetChildren()).." items dropped at this island",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            else
                local args = {
                [1] = "I cant find any drops",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            end
        
        elseif message == "^countvendings" or message == "^count vendings" or message == "^countvend" or message == "^countv" then
            amount = 0
            for i,v in pairs(Island.Blocks:GetChildren()) do
                if v.Name:find("vendingMachine") then
                    amount = amount + 1
                end
            end
            local args = {
            [1] = "There are "..tostring(amount).." vendings machines on this island",
            [2] = "All"
            }
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        
        elseif message == "^countblocks" or message == "^count blocks" or message == "^countb" then
            Blocks = #Island.Blocks:GetChildren() or 0
            if Blocks == 0 then
                local args = {
                [1] = "*Bleep Bloop* ERROR: getting 0 blocks",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            else
                local args = {
                [1] = "There are "..tostring(Blocks).." blocks on this island",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            end
            
        elseif message:sub(0,8) == "^insult " then
            local NAME = data.Message:sub(9,-1)
            print("this is before playertocheck is called")
            local playerToCheck = getPlayerFromDisplayName(NAME)
            print("generating insult")
            local insults = {
                "I hear "..playerToCheck.Name.." likes pineapple on their pizza",
                "WOW "..playerToCheck.Name..", have you gained a few pounds?",
                playerToCheck.Name.." has 0 friends, and it shows",
                "I looked up noob in the dictionary and found a picture of "..playerToCheck.Name,
                "If laughter is the best medicine, "..playerToCheck.Name.."'s face must be curing the world.",
                "It's better to let someone think you are an Idiot than to open your mouth and prove it.",
                "If I had a face like "..playerToCheck.Name"'s, I'd sue my parents.",
                "I guess "..playerToCheck.Name" proves that even god makes mistakes sometimes."
            }
            local insultInfo = math.random(1,#insults)
            for i,text in pairs(insults) do
                if i == insultInfo then
                    local args = {
                    [1] = text,
                    [2] = "All"
                    }
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                end
            end
        
        elseif message:sub(0,4) == "^bp "then
            --finds spaces to get player name and item
            local space = 0
            for i = 1,#message do
                if string.sub(message, i, i) == " " then
                    space = space + 1
                    if space == 1 then
                        start = i
                    elseif space == 2 then
                        playerName = string.sub(message, start+1, i-1)
                        itemToCheck = string.sub(message, i+1, -1)
                    end
                end
            end
            --convert player name into actual name
            playerToCheck = getPlayerFromDisplayName(playerName)
            
            if playerFound == false then
                local args = {
                [1] = "Sorry, I cant find "..playerName,
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            else
                for i,v in pairs(playerToCheck.Backpack:GetChildren()) do
                    if string.lower(tostring(v.DisplayName.Value)) == itemToCheck then
                        foundOne = true
                        local args = {
                        [1] = playerToCheck.Name.." has "..tostring(v.Amount.Value).." "..v.DisplayName.Value,
                        [2] = "All"
                        }
                        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                    end
                end
            
                if foundOne == false then
                    --check if item to even exsist
                    for i,v in pairs(game.ReplicatedStorage.Tools:GetChildren()) do
                        if v:FindFirstChild("DisplayName") and itemToCheck == string.lower(tostring(v.DisplayName.Value)) then
                            itemExists = true
                            itemToCheck = tostring(v.DisplayName.Value)
                        end
                    end
                    if not itemExists then
                        local args = {
                        [1] = "You may have misspelled "..itemToCheck,
                        [2] = "All"
                        }
                        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                    else
                        local args = {
                        [1] = playerToCheck.Name.." has no "..itemToCheck,
                        [2] = "All"
                        }
                        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                    end
                end
                playerFound = false
                foundOne = false
                itemExists = false
            end

        elseif message:sub(0,6) == "^join " then
            NAME = data.Message:sub(7,-1)
            
            writefile("Bot Info/Who To Invite.txt", data.FromSpeaker)
            
            local args = {
            [1] = {
            ["targetPlayerId"] = (getUserIdFromUsername(NAME))
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_2:InvokeServer(unpack(args))
        
        elseif message == "^joinme" or message == "^followme" then
            local args = {
            [1] = "Ok, I'll wait a moment and then try joining you! 😊",
            [2] = "All"
            }
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            
            NAME = data.FromSpeaker
            task.wait(15)
            
            for i = 1,400 do
                local args = {
                [1] = {
                ["targetPlayerId"] = (getUserIdFromUsername(NAME))
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_2:InvokeServer(unpack(args))
                task.wait()
            end
            local args = {
            [1] = "I have failed to join "..NAME,
            [2] = "All"
            }
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            
            
        elseif message == "^leavemealone" or message == "^gohome" then
            local args = {
            [1] = "Ok, I'll go home 😢",
            [2] = "All"
            }
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            
            task.wait(1)
            Player:Kick("Told to leave")
            task.wait()
            TeleportService:Teleport(4872321990, Players.LocalPlayer)
            writefile("Bot Info/Who To Invite.txt", "")
        
        elseif message:sub(0,12) == "^pricecheck " then
            checkPrice = data.Message:sub(13,-1)
            
            for i,v in pairs(game.ReplicatedStorage.Tools:GetChildren()) do
                if v:FindFirstChild("DisplayName") and string.lower(checkPrice) == string.lower(tostring(v.DisplayName.Value)) then
                    checkPrice = v.Name
                end
            end
            
            if isfile("Average Price Tester/"..checkPrice.." BUY.txt") and isfile("Average Price Tester/"..checkPrice.." SELL.txt") then
                contents1 = readfile("Average Price Tester/"..checkPrice.." BUY.txt")
                contents2 = readfile("Average Price Tester/"..checkPrice.." SELL.txt")
                local twoLines = {"Buy for "..contents2, "Sell for "..contents1}
                for i,v in pairs(twoLines) do
                    local args = {
                    [1] = v,
                    [2] = "All"
                    }
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                end
            else
                local args = {
                [1] = "I don't have any info on "..checkPrice,
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            end
        
        elseif message == "^ty" or message == "^tyy" or message == "^thanks" or message == "^thank you" then
            local args = {
            [1] = "You're welcome "..data.FromSpeaker,
            [2] = "All"
            }
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        
        elseif message == "^hi" or message == "^hello" or message == "^hey" then
            local args = {
            [1] = "Hello "..data.FromSpeaker,
            [2] = "All"
            }
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            
        elseif message == "^joke" then    
            local jokeTexts = {
                "A burger walks into a bar. The bartender says 'Sorry, we don't serve food here'",
                "Orion's Belt is a huge waist of space.",
                "Why is it always hot in the corner of a room? Because a corner is 90 degrees!",
                "Why can't you play poker on the African Savanna? There's too many cheetahs.",
                "What did the grape say when it was stepped on? Nothing, it just let out a little wine.",
                "When my son told me to stop impersonating a flamingo, I had to put my foot down.",
                "Atheism is a non-prophet organization.",
                "Why can't a bicycle stand on its own? It's two-tired.",
                "What's brown and sticky? A stick.",
                "Found out I was color blind the other day. That one came right out of the orange.",
                "I'm reading a book about anti-gravity. I can't put it down.",
                "Time flies like an arrow. Fruit flies like a banana.",
                "What’s more amazing than a talking dog? A spelling bee.",
                "I was up all night wondering where the sun went, but then it dawned on me.",
                "I'm thinking of reasons to go to Switzerland. The flag is a big plus.",
                "Once you've seen one shopping center, you've seen the mall.",
                "What did the shy pebble wish for?  That she was a little boulder.",
                "What do you call a pencil without lead?  Pointless.",
                "Never trust an atom...They make up everything!",
                "When I found out my toaster wasnt waterproof...I was shocked!",
                "My boss told me to attach two pieces of wood together...I totally nailed it.",
                "What do you call a fish without eyes? Fsh.",
                "Why did the scarecrow win an award? Because he was outstanding in his field.",
                "What did the policeman say to his bellybutton? You’re under a vest.",
                "Why do people say “break a leg” when you go on stage? Because every play has a cast.",
                "What do you call a pig that does karate? A pork chop.",
                "Why are there gates around cemeteries? Because people are dying to get in.",
                "Why do seagulls fly over the sea? Because if they flew over a bay, they would be bagels.",
                "When do computers overheat? When they need to vent.",
                "Why do bees have sticky hair? Because they use honeycombs.",
                "How do you tell if a vampire is sick? By how much he is coffin.",
                "How do you stop a bull from charging? Cancel its credit card.",
                "Why did the mushroom go to the party? Because he was a fungi.",
                "What do sea monsters eat? Fish and ships.",
                "Why can’t your nose be 12 inches long? Because then it would be a foot",
                "What did the ocean say to the shore? Nothing…It just waved.",
                "Why did the golfer bring two pairs of pants? In case he got a hole in one.",
                "What did the tomato say to the other tomato during a race? Ketchup!",
                "What has four wheels and flies? A garbage truck.",
                "What did one hat say to the other? You stay here. I’ll go on ahead.",
                "What do you do with a sick boat? Take it to the doc.",
                "Why did the picture go to jail? Because it was framed.",
                "Why did the robber jump in the shower? He wanted to make a clean getaway.",
                "What did the elevator say when it sneezed? I think I’m coming down with something.",
                "Why did the bicycle collapse? It was two tired.",
                "What do you call a bear with no teeth? A gummy bear.",
                "Why did the restaurant hire a pig? He was good at bacon.",
                "Did you hear about the man who got hit by the same bike every morning? It was a vicious cycle.",
                "Why did the invisible man turn down the job offer? He couldn’t see himself doing it.",
                "Did you hear about the kidnapping at school? It was fine, he woke up.",
                "A termite walks into the bar and asks, ”Is the bar tender here?” ",
                "I told my doctor that I broke my arm in two places.  He told me to stop going to those places.",
                "What do you call a priest that becomes a lawyer? A father-in-law."
            }
        
            local jokeInfo = math.random(1,#jokeTexts)
            for i,text in pairs(jokeTexts) do
                if i == jokeInfo then
                    local args = {
                    [1] = text,
                    [2] = "All"
                    }
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                end
            end
            
        elseif message:sub(0,12) == "^submitjoke " then
            if isfile("Bot Info/Joke submission.txt") then
                local Joke = data.Message:sub(12,-1)
                appendfile("Bot Info/Joke submission.txt", (Time().." "..data.FromSpeaker.." - "..Joke.."\n"))
                local args = {
                [1] = "*BLEEP BLOOP* I'll archive that to add later.",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            end
        
        elseif message:sub(0,12) == "^submitinsult " then
            if isfile("Bot Info/Insult submission.txt") then
                local Insult = data.Message:sub(12,-1)
                appendfile("Bot Info/Insult submission.txt", (Time().." "..data.FromSpeaker.." - "..Insult.."\n"))
                local args = {
                [1] = "*BLEEP BLOOP* I'll archive that to add later.",
                [2] = "All"
                }
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            end
        
        --rpg start
        elseif message == "^rpg step" then
            
            --making folder and files for each player
            if not isfolder("RPG") then
                makefolder("RPG")
            end
            if not isfolder("RPG/"..data.FromSpeaker) then
                makefolder("RPG/"..data.FromSpeaker)
            end
            if not isfile("RPG/"..data.FromSpeaker.."/coins.txt") then
                writefile("RPG/"..data.FromSpeaker.."/coins.txt", "0")
                writefile("RPG/"..data.FromSpeaker.."/items.txt", "")
                writefile("RPG/"..data.FromSpeaker.."/level.txt", "1")
                writefile("RPG/"..data.FromSpeaker.."/XP.txt", "0")
            end
            
            --gets coins for player
            local previousCoins = readfile("RPG/"..data.FromSpeaker.."/coins.txt")
            local previousLevel = readfile("RPG/"..data.FromSpeaker.."/level.txt")
            local previousXP = readfile("RPG/"..data.FromSpeaker.."/XP.txt")
            local itemList = readfile("RPG/"..data.FromSpeaker.."/items.txt")
            
            --creating step texts
            local travelTexts = {"You find yourself in a town.  A nearby guard is complaining about his knees",
                "You step in some bug guts.  Yuck!",
                "You wonder if this is really worth doing, but continue anyway!",
                "You found a sword!  But it seems to be stuck in a stone, so you keep walking",
                "You fall out of a hole",
                "You see a horse walking up a 90 degree incline.  Impressive!",
                "Oh look, a coin!  You pick it up, and it falls out of the hole in your pocket.  Oh look, a coin!",
                "You build a wooden home, but a wolf blows it down.",
                "You steal from the rich, and donate it all to the poor",
                "You trip over a small person.  They apologize to you, and continue walking",
                "You find a mysterious potion labled with a feather.  You drink it but it does nothing.  Lame!",
                "You find a pipe to go down.  It leads to a sewer, where you find square boxes floating in the air",
                "You travel through time to walk some more",
                "You stick a feather in your hat and call it macaroni"
            }

            --calculate xp/level gains
            local xpGained = (math.random(1,2) + (10 * 2 ^ math.sqrt(previousLevel) / 7))
            local toLevel = 10 * 2 ^ math.sqrt(previousLevel)
            previousXP = previousXP + xpGained
            if previousXP >= toLevel then
                previousLevel = previousLevel + 1
                previousXP = previousXP - toLevel
            end
       
            writefile("RPG/"..data.FromSpeaker.."/coins.txt", "0")
            writefile("RPG/"..data.FromSpeaker.."/items.txt", "")
            writefile("RPG/"..data.FromSpeaker.."/level.txt", previousLevel)
            writefile("RPG/"..data.FromSpeaker.."/XP.txt", previousXP)
            
            local stepinfo = math.random(1,#travelTexts)
            for i,text in pairs(travelTexts) do
                if i == stepinfo then
                    local args = {
                    [1] = text,
                    [2] = "All"
                    }
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                end
            end
            
        elseif message:sub(0,1) == "^" and waitingForName == false then
            local args = {
            [1] = "I didnt understand that command.  Type ^help if you need help",
            [2] = "All"
            }
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
            
        end
    end
end)
