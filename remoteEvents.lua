local StarterGui = game:GetService("StarterGui")

local function AntiAFK() -- keeps you from going afk by clicking corner of screen when player goes "Idled"
    game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController();
    wait();
    game:GetService('VirtualUser'):ClickButton2(Vector2.new(0,0))
    end)
end
task.spawn(AntiAFK)

--placeId are in this order.  Home, OnlineIsland, Hub, Wilderness Islands
if (game.PlaceId == 4872321990 and game.PlaceVersion ~= 1085) or (game.PlaceId == 5626342417 and game.PlaceVersion ~= 735) or (game.PlaceId == 5899156129 and game.PlaceVersion ~= 659) or (game.PlaceId == 9501318975 and game.PlaceVersion ~= 303) then
    updates = "⚠️ Script isnt checked anymore, please be careful. Test stuff on alts first!!"
    StarterGui:SetCore("ChatMakeSystemMessage", {Color = Color3.fromRGB(250,0,0), Font = Enum.Font.SourceSansBold, TextSize = 18, Text = updates})
else
    updates = "[Matt]: Updated and tested 5/1."
    StarterGui:SetCore("ChatMakeSystemMessage", {Color = Color3.fromRGB(0,255,255), Font = Enum.Font.SourceSansBold, TextSize = 18, Text = updates})
end

--- these items change all the dang time!
--hitMobEvent = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("eicpsr/qqsFOc")
sendTrade = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("penehnhMqldeyhmtskPiRObw/vxsgqkvgXh")
addTrade = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("penehnhMqldeyhmtskPiRObw/iipxsekygshvjo")
tradeAccept = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("penehnhMqldeyhmtskPiRObw/qemtjMnqktxpgiifrgykcsamOiiaWgjidTlNryF")
openVending = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("LylturJhykjGaKurttjsjz/sijbv")
emptyItem = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("LylturJhykjGaKurttjsjz/sufezzjaRue")
refillItem = emptyItem
refillCoins = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("LylturJhykjGaKurttjsjz/idyhtezwdoztbcphsWoErHiVu")
takeCoins = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("LylturJhykjGaKurttjsjz/hifvkDpabkiUhyBiAomkihhFszijjhQkli")
changeSettings = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("LylturJhykjGaKurttjsjz/lutrspjcIyehfitpgLpgLaRjfnndijyuhkchk")
closeVending = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("LylturJhykjGaKurttjsjz/tajQadfoxfGXbyMocrMskqep")
useNet = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("lqkdlmGmcfpvjCxeu/pdtgdNg")
