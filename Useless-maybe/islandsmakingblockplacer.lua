local Player = game.Players.LocalPlayer
local island = game.Workspace.Islands:GetChildren()[1]
local RS = game:GetService("ReplicatedStorage")
local BlocktoPlace = "Tier 2 Vending Machine"
local PlaceUnder = "Bone Block"

local function changeFromDisplayName(displayName)
    for _,item in pairs(RS.Tools:GetChildren()) do
        if item:FindFirstChild("DisplayName") and item:IsA("Tool") and tostring(item.DisplayName.Value) == displayName then
            trueName = item.Name
        end
    end
    return trueName
end

BlocktoPlace = changeFromDisplayName(BlocktoPlace)
print(PlaceUnder)
PlaceUnder = changeFromDisplayName(PlaceUnder)
print(BlocktoPlace, PlaceUnder)


for i,v in pairs(island.Blocks:GetChildren()) do
    if v.Name == PlaceUnder and Player:DistanceFromCharacter(v.Position) <= 50 then
        print(v:GetFullName())
        print(v.Position)
        local args = {
        [1] = {
        ["upperBlock"] = false,
        ["cframe"] = CFrame.new(Vector3.new(v.Position + Vector3.new(0,-9,0)), Vector3.new(v.Position + Vector3.new(0,0,1))),
        ["player_tracking_category"] = "join_from_web",
        ["blockType"] = BlocktoPlace
        }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_PLACE_REQUEST:InvokeServer(unpack(args))
    end
end