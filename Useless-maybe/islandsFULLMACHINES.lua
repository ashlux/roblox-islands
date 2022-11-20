local HttpService = game:GetService("HttpService")
local player = game.Players.LocalPlayer
local island = game:GetService("Workspace").Islands:GetChildren()[1]

for i,v in pairs(island.Blocks:GetChildren()) do
    if (v.Name == "vendingMachine" or v.Name == "vendingMachine1") and v.Mode.Value == 1 and v.CoinBalance.Value < (v.TransactionPrice.Value * 1.0699999) then
        if v:FindFirstChild("NeedsFilling") then v.NeedsFilling:Destroy() end
        local a = Instance.new("BoxHandleAdornment")
		a.Name = "NeedsFilling"
		a.Parent = v
		a.Adornee = v
		a.AlwaysOnTop = true
		a.ZIndex = 0
		a.Size = v.Size
		a.Transparency = 0.3
		a.Color3 = Color3.fromRGB(250,50,50)
    elseif (v.Name == "vendingMachine" or v.Name == "vendingMachine1") and v:FindFirstChild("NeedsFilling") then
        v.NeedsFilling:Destroy()
    end
end