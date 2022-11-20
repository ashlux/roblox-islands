X, Y, Z = -3698, 360, -3494

for l = 1,15 do
    Z = Z + 3
for e = 1,15 do
    X = X + 3
for i = 1,15 do
    Y = Y + 3

local args = {
    [1] = {
        ["upperBlock"] = false,
        ["cframe"] = CFrame.new(Vector3.new(X,Y,Z), Vector3.new(1, -0, 4.371138828673793e-08)),
        ["player_tracking_category"] = "join_from_web",
        ["blockType"] = "spiritCrop"
    }
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_PLACE_REQUEST:InvokeServer(unpack(args))
end
Y = 360
end
X = -3698
end