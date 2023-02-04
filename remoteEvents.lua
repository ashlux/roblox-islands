local StarterGui = game:GetService("StarterGui")

--placeId are in this order.  Home, OnlineIsland, Hub, Wilderness Islands
if (game.PlaceId == 4872321990 and game.PlaceVersion ~= 1059) or (game.PlaceId == 5626342417 and game.PlaceVersion ~= 709) or (game.PlaceId == 5899156129 and game.PlaceVersion ~= 633) or (game.PlaceId == 9501318975 and game.PlaceVersion ~= 277) then
    updates = "😲 GUI might not function in this server 😲"
    StarterGui:SetCore("ChatMakeSystemMessage", {Color = Color3.fromRGB(250,0,0), Font = Enum.Font.SourceSansBold, TextSize = 18, Text = updates})
end

updates = "[Matt]: GUI Updated 2/4"

StarterGui:SetCore("ChatMakeSystemMessage", {Color = Color3.fromRGB(0,255,255), Font = Enum.Font.SourceSansBold, TextSize = 18, Text = updates})

--- these items change all the dang time!
--hitMobEvent = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("eicpsr/qqsFOc")
sendTrade = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("ympmbetdrnkpkcoolapmqrzoVwLigzXscThF/zbVpiqjuMbjbqkh")
addTrade = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("ympmbetdrnkpkcoolapmqrzoVwLigzXscThF/wnbgNfnmfaemsfufvi")
tradeAccept = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("ympmbetdrnkpkcoolapmqrzoVwLigzXscThF/xmwaRtffojkjfRbYgydLyuxwjigcbkqbYpfqVustmoJ")
openVending = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("klegauU/pAyfzrfiluW")
emptyItem = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("klegauU/jlwlrxpuzfogbeUpazjajpwsg")
refillItem = emptyItem
refillCoins = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("klegauU/nxaxjHvhmxmmhmtbmztjjdldfrxwhusaJkveqkQefs")
takeCoins = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("klegauU/mkfWigolaKoiN")
changeSettings = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("klegauU/uinwixboldltgzpeFteydyufzbzAxVuiw")
closeVending = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("klegauU/xzhYiervjkhyqaIphroahIlsKfkmtiftJHpIjGdivxjxn")
useNet = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("yvkjiyUhaycdcctkbAeZpi/camzxljbdhefjozt")
