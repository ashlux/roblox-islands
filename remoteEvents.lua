local StarterGui = game:GetService("StarterGui")

--placeId are in this order.  Home, OnlineIsland, Hub, Wilderness Islands
if (game.PlaceId == 4872321990 and game.PlaceVersion ~= 1060) or (game.PlaceId == 5626342417 and game.PlaceVersion ~= 710) or (game.PlaceId == 5899156129 and game.PlaceVersion ~= 634) or (game.PlaceId == 9501318975 and game.PlaceVersion ~= 278) then
    updates = "😲 GUI might not function in this server 😲"
    StarterGui:SetCore("ChatMakeSystemMessage", {Color = Color3.fromRGB(250,0,0), Font = Enum.Font.SourceSansBold, TextSize = 18, Text = updates})
end

updates = "[Matt]: GUI Updated 2/5"

StarterGui:SetCore("ChatMakeSystemMessage", {Color = Color3.fromRGB(0,255,255), Font = Enum.Font.SourceSansBold, TextSize = 18, Text = updates})

--- these items change all the dang time!
--hitMobEvent = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("eicpsr/qqsFOc")
sendTrade = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("NpngyrzzzcFsuiaii/jMpWoepnEoqtbyfKj")
addTrade = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("NpngyrzzzcFsuiaii/ldbuCilfHPomXcywseKoJfb")
tradeAccept = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("NpngyrzzzcFsuiaii/uuDokijiGgUlmephlexrUTnm")
openVending = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("ptacwbLkOfeMhuhfsrzhidbsdefojnohtLkLxvofNe/vUOnteiapbynsjplh")
emptyItem = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("ptacwbLkOfeMhuhfsrzhidbsdefojnohtLkLxvofNe/RjrkkeqoymwrttpOatdjZhzC")
refillItem = emptyItem
refillCoins = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):FindFirstChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("ptacwbLkOfeMhuhfsrzhidbsdefojnohtLkLxvofNe/WxiJcrpdzgvreZjxhNuwiDffcftqj")
takeCoins = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):FindFirstChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("ptacwbLkOfeMhuhfsrzhidbsdefojnohtLkLxvofNe/ezroHnfHzJwrm")
changeSettings = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):FindFirstChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("ptacwbLkOfeMhuhfsrzhidbsdefojnohtLkLxvofNe/zeqxhjfbqbwfYcbb")
closeVending = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):FindFirstChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("ptacwbLkOfeMhuhfsrzhidbsdefojnohtLkLxvofNe/DgktPOgvltjAcls")
useNet = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):FindFirstChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("XrRFuc/afkalmpoyqsGjpnsquCdszqvcr")
