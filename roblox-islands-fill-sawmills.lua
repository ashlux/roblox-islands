local island = workspace.Islands:GetChildren()[1]


for k,v in pairs(island.Blocks:GetChildren()) do


if v.Name and v.Name == "sawmill" then


local args = {
    [1] = {
        ["amount"] = 40,
        ["block"] = v,
        ["player_tracking_category"] = "join_from_web",
        ["toolName"] = "coal" -- or "woodMaple" or whatever
    }
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))

end

end
