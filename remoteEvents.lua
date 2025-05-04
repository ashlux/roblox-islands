local StarterGui = game:GetService("StarterGui")

local function AntiAFK() -- keeps you from going afk by clicking corner of screen when player goes "Idled"
    game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController();
    wait();
    game:GetService('VirtualUser'):ClickButton2(Vector2.new(0,0))
    end)
end
task.spawn(AntiAFK)

--- these items change all the dang time!
--hitMobEvent = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("eicpsr/qqsFOc")
sendTrade = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("bqerxgRefYxPwecbaoqkgspusaqorboqwgmgtdpbfg/keytivbetdssmuqjkflfwUnttoslreebv")
addTrade = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("bqerxgRefYxPwecbaoqkgspusaqorboqwgmgtdpbfg/Qhbna")
tradeAccept = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("bqerxgRefYxPwecbaoqkgspusaqorboqwgmgtdpbfg/vogszaifsyIdiqdrIbgwbigFolbK")
openVending = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("vgvigLycuBykEisGk/JjddhzhzqeZivADimaohvbSzef")
emptyItem = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("vgvigLycuBykEisGk/alXozkllttScuqorgdwnhQMTscsgRgg")
refillItem = emptyItem
refillCoins = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("vgvigLycuBykEisGk/cuvpgbjalvx")
takeCoins = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("vgvigLycuBykEisGk/thdheckjectsj")
changeSettings = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("vgvigLycuBykEisGk/hgqlenpacdGwgilKbq")
closeVending = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("vgvigLycuBykEisGk/rgcydxOfeiiwrhdqfdvvEiviibRulezdEq")
useNet = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("eleJiJefvlrMfnbzonoFz/pnIprccqlQdwqjmlx")

if emptyItem then
    updates = "⚠️ Test stuff on alts first!  Vendings and trading are fine right now though."
    StarterGui:SetCore("ChatMakeSystemMessage", {Color = Color3.fromRGB(150,150,255), Font = Enum.Font.SourceSansBold, TextSize = 20, Text = updates})
elseif sendTrade then
     updates = "⚠️ Test stuff on alts first!! Trading should work, but vendings are broken!"
    StarterGui:SetCore("ChatMakeSystemMessage", {Color = Color3.fromRGB(200,200,255), Font = Enum.Font.SourceSansBold, TextSize = 20, Text = updates})
else
    updates = "⚠️ Test stuff on alts first!! Trading and vendings are broken!"
    StarterGui:SetCore("ChatMakeSystemMessage", {Color = Color3.fromRGB(255,150,150), Font = Enum.Font.SourceSansBold, TextSize = 20, Text = updates})
end
