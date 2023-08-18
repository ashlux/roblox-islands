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
sendTrade = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("vIlkbwmxWwptiy/qdbrvhcccgIlmCswzktxtqtxomP")
addTrade = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("vIlkbwmxWwptiy/rqalgvufznvmpeffajyaakCNritlaktky")
tradeAccept = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("vIlkbwmxWwptiy/msmaZhgtabQfdQqiExDIpfoOad")
openVending = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("emrjnjscmbwbyNxtpSnwliry/cbvuncakgoBWVeg")
emptyItem = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("emrjnjscmbwbyNxtpSnwliry/opqdfqL")
refillItem = emptyItem
refillCoins = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("emrjnjscmbwbyNxtpSnwliry/UiAlchjenGoUrzfpcusammkRbihyzxbstcVjodF")
takeCoins = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("emrjnjscmbwbyNxtpSnwliry/ekC")
changeSettings = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("emrjnjscmbwbyNxtpSnwliry/tafzshmaaozcqbaknzhyoietummcPwiH")
closeVending = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):FindFirstChild("emrjnjscmbwbyNxtpSnwliry/xhGKzudKWdiz")
useNet = game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out["_NetManaged"] -- sorry im too lazy to update this one

if emptyItem then
    updates = "⚠️ Test stuff on alts first!  Trading and vendings is fine right now though."
    StarterGui:SetCore("ChatMakeSystemMessage", {Color = Color3.fromRGB(150,150,255), Font = Enum.Font.SourceSansBold, TextSize = 20, Text = updates})
else
    updates = "⚠️ Test stuff on alts first!!"
    StarterGui:SetCore("ChatMakeSystemMessage", {Color = Color3.fromRGB(255,150,150), Font = Enum.Font.SourceSansBold, TextSize = 20, Text = updates})
end
