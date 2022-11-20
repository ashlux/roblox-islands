--Who you want to join and drop the seeds at
local USERNAME = "MattSavesTheDay"
local USERID = "3259817680"
--wait for game to load
if not game:IsLoaded() then
    game.Loaded:Wait()
end
print("game loaded")
--wait for character and mouse
repeat wait() 
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse
print("Character loaded")
--some more variables
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Player = Players.LocalPlayer
local Backpack = Player.Backpack
local X, Y = 0,0
local str = 0
Dropped = false
-- get island name
local Island = ""
for _,island in pairs(game.Workspace.Islands:GetChildren()) do
    if (island:IsA("Model")) then
        Island = island
    end
end
-- get click position
for i,v in pairs(Player.PlayerGui:GetDescendants()) do
	if (v:IsA("ImageButton")) and v.Image == "rbxassetid://7352421935" then
		X = v.AbsolutePosition.X+5
		Y = v.AbsolutePosition.Y+40
	end
end
--loop the rest
while wait() do
    if Dropped == true then
        print("already dropped")
		--make profile
		local args = {
		[1] = false
		}
		game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CreateProfile:FireServer(unpack(args))
		wait(1)
		--Make sure clicking in right spot
		if X == 0 then
			for i,v in pairs(Player.PlayerGui:GetDescendants()) do
				if (v:IsA("ImageButton")) and v.Image == "rbxassetid://7352421935" then
					X = v.AbsolutePosition.X+5
					Y = v.AbsolutePosition.Y+50
				end
			end
		else
			--Open Profile Page
			VirtualInputManager:SendMouseButtonEvent(X, Y, 0, true, game, 1)
			VirtualInputManager:SendMouseButtonEvent(X, Y, 0, false, game, 1)
		end
		if Player.PlayerGui:FindFirstChild("roact_profiles") then
			if Player.PlayerGui["roact_profiles"]["1"]["2"]:FindFirstChild("2") then
				if Player.PlayerGui["roact_profiles"]["1"]["2"]["2"]["1"]["1"]["1"]["3"]:FindFirstChild("2") then
					for i,v in pairs(Player.PlayerGui["roact_profiles"]["1"]["2"]["2"]["1"]["1"]["1"]["3"]["2"]:GetDescendants()) do
						if (v:IsA("TextButton")) then
							str = string.match(v.Text,"%d+")
						end
					end
				end
			end
		print("attempting to delete save "..(str-1).." and "..str)
		local args = {
		[1] = str - 1
		}
		game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.ResetProfile:InvokeServer(unpack(args))
		wait()
		local args = {
		[1] = str
		}
		game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.ResetProfile:InvokeServer(unpack(args))
		wait()
		end
    else
        print("havent dropped yet")
        if Backpack:FindFirstChild("melonSeeds") then
            print("found melon seeds")
            local LOOP = 3
            for i = 1,LOOP do
                local DropSeed = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["tool"] = Backpack.melonSeeds,
                ["amount"] = 1
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_DROP_TOOL_REQUEST:InvokeServer(unpack(DropSeed))
                wait()
            end
			if Backpack:FindFirstChild("pineappleSeeds") then
            print("found pineapple seeds")
            local LOOP = 6
            for i = 1,LOOP do
                local DropSeed = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["tool"] = Backpack.pineappleSeeds,
                ["amount"] = 1
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_DROP_TOOL_REQUEST:InvokeServer(unpack(DropSeed))
                wait()
            end
            end
            if Backpack:FindFirstChild("radishSeeds") then
            print("found radish seeds")
            local LOOP = 8
            for i = 1,LOOP do
                local DropSeed = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["tool"] = Backpack.radishSeeds,
                ["amount"] = 1
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_DROP_TOOL_REQUEST:InvokeServer(unpack(DropSeed))
                wait()
            end
            end
			if Backpack:FindFirstChild("pumpkinSeeds") then
            print("found pumpkin seeds")
            local LOOP = 4
            for i = 1,LOOP do
                local DropSeed = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["tool"] = Backpack.pumpkinSeeds,
                ["amount"] = 1
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_DROP_TOOL_REQUEST:InvokeServer(unpack(DropSeed))
                wait()
            end
            end
			if Backpack:FindFirstChild("flowerRoseRedFertile") then
            print("found red rose")
            local LOOP = 2
            for i = 1,LOOP do
                local DropSeed = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["tool"] = Backpack.flowerRoseRedFertile,
                ["amount"] = 1
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_DROP_TOOL_REQUEST:InvokeServer(unpack(DropSeed))
                wait()
            end
            end
			if Backpack:FindFirstChild("flowerRoseBlueFertile") then
            print("found blue rose")
            local LOOP = 2
            for i = 1,LOOP do
                local DropSeed = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["tool"] = Backpack.flowerRoseBlueFertile,
                ["amount"] = 1
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_DROP_TOOL_REQUEST:InvokeServer(unpack(DropSeed))
                wait()
            end
            end
			if Backpack:FindFirstChild("flowerRoseWhiteFertile") then
            print("found White rose")
            local LOOP = 2
            for i = 1,LOOP do
                local DropSeed = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["tool"] = Backpack.flowerRoseWhiteFertile,
                ["amount"] = 1
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_DROP_TOOL_REQUEST:InvokeServer(unpack(DropSeed))
                wait()
            end
			end
            if Backpack:FindFirstChild("redEnvelope") then
                local DropEnvelope = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["tool"] = Backpack.redEnvelope,
                ["amount"] = 1
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_DROP_TOOL_REQUEST:InvokeServer(unpack(DropEnvelope))
                wait()
            end
            if Backpack:FindFirstChild("potionFertility") then
                for i = 1,2 do
                local DropPotion = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["tool"] = Backpack.potionFertility,
                ["amount"] = 1
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_DROP_TOOL_REQUEST:InvokeServer(unpack(DropPotion))
                wait()
                end
            end
            if Backpack:FindFirstChild("instrumentPanFlute") then
                local DropPotion = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["tool"] = Backpack.instrumentPanFlute,
                ["amount"] = 1
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_DROP_TOOL_REQUEST:InvokeServer(unpack(DropPotion))
                wait()
            end
            if Backpack:FindFirstChild("instrumentKalimba") then
                local DropPotion = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["tool"] = Backpack.instrumentKalimba,
                ["amount"] = 1
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_DROP_TOOL_REQUEST:InvokeServer(unpack(DropPotion))
                wait()
                Dropped = true
            end
        else
            if Players:FindFirstChild(USERNAME) then
		        print("at "..USERNAME)
		        --wait for chest
                repeat wait() print("waiting for chest") until Island.Blocks:WaitForChild("chestLarge") and Island.Blocks.chestLarge.Contents:FindFirstChild("crateMetalMelon")
        		local Envelope = {
                [1] = {
                ["merchant"] = "lunar", -- getting lunar envelope thingy
                ["offerId"] = 1,
                ["amount"] = 1
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Envelope))
                wait()
        	    print("got envelope")
        	    --get crates
        	    if Dropped == true then wait() else
        	    local args = {
                [1] = {
                ["chest"] = Island.Blocks.chestLarge,
                ["player_tracking_category"] = "join_from_web",
                ["amount"] = 150,
                ["tool"] = Island.Blocks.chestLarge.Contents.crateMetalMelon,
                ["action"] = "withdraw"
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_CHEST_TRANSACTION:InvokeServer(unpack(args))
                end
                --sell crates (costs 43,190 coins)
                local args = {[1] = {["merchant"] = "wholesaler",["offerId"] = 170,
                ["amount"] = 2}}
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))

                local args = {[1] = {
                ["merchant"] = "wholesaler",
                ["offerId"] = 170,
                ["amount"] = 1
                }}
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
                --deposit leftovers
                for i = 1,5 do
                    wait()
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("crateMetalMelon") then
                local args = {
                [1] = {
                ["chest"] = workspace.Islands:FindFirstChild("5df69162-592d-44fb-93d7-b39b161de737-island").Blocks.chestLarge,
                ["player_tracking_category"] = "join_from_web",
                ["amount"] = game.Players.LocalPlayer.Backpack.crateMetalMelon.Amount.Value,
                ["tool"] = game:GetService("Players").LocalPlayer.Backpack.crateMetalMelon,
                ["action"] = "deposit"
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_CHEST_TRANSACTION:InvokeServer(unpack(args))
                    end
                end
                --Buy melons
                print("buying melons")
	        	local args = {
                [1] = {
                ["merchant"] = "melon_shop",
                ["offerId"] = 2,
                ["amount"] = 3
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
            wait()
			--Buy pineapples
            print("buying pineapples")
			local args = {
				[1] = {
				["merchant"] = "spring_shop_pineapple",
				["offerId"] = 2,
				["amount"] = 6
				}
			}

			game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
			wait()
            --buy radishes
            local args = {
                [1] = {
                ["merchant"] = "spring_shop_radish",
                ["offerId"] = 10,
                ["amount"] = 8
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
        	wait(0.3)
			--buy pumpkins
            local args = {
                [1] = {
                ["merchant"] = "autumn_shop",
                ["offerId"] = 10,
                ["amount"] = 4
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
        	wait(0.3)
			--buy red rose
            local args = {
                [1] = {
                ["merchant"] = "flower_red_rose",
                ["offerId"] = 1,
                ["amount"] = 2
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
        	wait(0.3)
			--buy blue rose
            local args = {
                [1] = {
                ["merchant"] = "flower_blue_rose",
                ["offerId"] = 1,
                ["amount"] = 2
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
        	wait(0.3)
			--buy white rose
            local args = {
                [1] = {
                ["merchant"] = "flower_white_rose",
                ["offerId"] = 1,
                ["amount"] = 2
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
        	wait(0.3)
        	--buy Fertility potion
        	local args = {
            [1] = {
            ["merchant"] = "animal",
            ["offerId"] = 40,
            ["amount"] = 2
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
            --buy yellow daffodil
            local args = {
            [1] = {
            ["merchant"] = "florist",
            ["offerId"] = 1,
            ["amount"] = 1
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
            wait(0.3)
            --buy red daffodil
            local args = {
            [1] = {
            ["merchant"] = "florist",
            ["offerId"] = 2,
            ["amount"] = 1
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
            wait(0.3)
            --reedeem free Instruments
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.RedeemFreeInstruments:FireServer()
        		if Backpack:FindFirstChild("melonSeeds") then
        		    wait()
        		else
        		    Dropped = true
        		end
        	else
        	    local args = {
                [1] = {
                ["targetPlayerId"] = (USERID)
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_2:InvokeServer(unpack(args))
        		wait(0.5)
        	end
        end
    end
end