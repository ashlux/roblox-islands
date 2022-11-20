local HttpService = game:GetService("HttpService")

local args = {
    [1] = HttpService:GenerateGUID(false),
    [2] = {
        [1] = {
            ["villagerModel"] = workspace.spawnPrefabs.merchants.artist,
            ["interactionKind"] = 0
        }
    }
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("mlsdxicepcqqpPprRkijaM/bPyqhuwutOoscluakUprbc"):FireServer(unpack(args))


--------

for i,v in pairs(game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.GetCurrentAuction:InvokeServer()) do

if i == "auctionDays" then
    for i,b in pairs(v) do
        print("auctionDays - "..b)
    end
else print(i,v)
end
end