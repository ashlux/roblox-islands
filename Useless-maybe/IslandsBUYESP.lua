local HttpService = game:GetService("HttpService")
local player = game.Players.LocalPlayer
local island = game:GetService("Workspace").Islands:GetChildren()[1]

for i,v in pairs(island.Blocks:GetChildren()) do
    if (v.Name == "vendingMachine" or v.Name == "vendingMachine1") and v:FindFirstChild("Mode") and v.Mode.Value == 0 and v.CoinBalance.Value > 0 then
        if v:FindFirstChild("HasCoins") then v.HasCoins:Destroy() end
        local a = Instance.new("BoxHandleAdornment")
		a.Name = "HasCoins"
		a.Parent = v
		a.Adornee = v
		a.AlwaysOnTop = true
		a.ZIndex = 0
		a.Size = v.Size
		a.Transparency = 0.3
		a.Color3 = Color3.fromRGB(100,250,100)
    elseif (v.Name == "vendingMachine" or v.Name == "vendingMachine1") and v:FindFirstChild("HasCoins") then
        v.HasCoins:Destroy()
    end
end