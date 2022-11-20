if not game:IsLoaded() then
game.Loaded:Wait()
end


HttpService = game:GetService("HttpService")
sendTrade = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("rmjNjauluOvtgtixa/XFmalxDm")
botName = "T1CKETmaster"
Players = game:GetService("Players")
Player = Players.LocalPlayer
Character = Player.Character
HR = Character.HumanoidRootPart
mouse = Player:GetMouse() 
RS = game:GetService("ReplicatedStorage")
Island = game.Workspace.Islands:GetChildren()[1]

repeat wait() 
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
repeat wait() until mouse


--this returns {IsFilterResult, MessageLength, SpeakerUserId, SpeakerDisplayName, OriginalChannel, Message, FromSpeaker, Time, MessageLengthUtf8, ID, IsFiltered, ExtraData(table), MessageType}
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(data)
    if game.Players.LocalPlayer.Name == botName then
        if data.Message == "^help" then
            local args = {
            [1] = "Commands: ^rps, ^flip, ^mytickets, ^countdrops",
            [2] = "All"
            }
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        elseif data.Message == "^mytickets" then
            contents = readfile("Ticket Keeper/"..data.FromSpeaker..".txt")
            local args = {
            [1] = data.FromSpeaker.." has "..contents.." tickets",
            [2] = "All"
            }
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        elseif data.Message == "^rps rock" then
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
        elseif data.Message == "^rps paper" then
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
        elseif data.Message == "^rps scissors" then
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
        elseif data.Message == "^flip" then
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
        elseif data.Message == "^trade me" then
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
                local args = {[1] = {["accessRank"] = 1, ["player"] = Players[playerToKick]}}
			    RS.rbxts_include.node_modules.net.out._NetManaged.CLIENT_CHANGE_ISLAND_ACCESS_LEVEL:InvokeServer(unpack(args))
            end
        elseif data.Message == "^countdrops" then
            if Island:FindfirstChild("Drops") then
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
        end
    end
end)