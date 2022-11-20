local slimeScepterBlock = game.Workspace.WildernessBlocks:FindFirstChild("slimeScepterBlock")
local Player = game.Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character.Humanoid
local HumanoidRootPart = Character.HumanoidRootPart
local WS = 30

Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
    Humanoid.WalkSpeed = WS
end)

Humanoid.WalkSpeed = WS

while wait() do
    if game.Workspace.WildernessBlocks:FindFirstChild("slimeScepterBlock") then
        repeat wait()
            if game.Workspace.WildernessBlocks:FindFirstChild("slimeScepterBlock") then
                if (game.Workspace.WildernessBlocks:FindFirstChild("slimeScepterBlock").Position - HumanoidRootPart.Position).Magnitude > 10 then
                    Humanoid:MoveTo(game.Workspace.WildernessBlocks:FindFirstChild("slimeScepterBlock").Position + Vector3.new(math.random(0,5), 0, math.random(0,5)))
                end
            end
            if game.Workspace.WildernessBlocks:FindFirstChild("slimeScepterBlock") then
                local args = {
                [1] = {["player_tracking_category"] = "join_from_web",
                ["part"] = game.Workspace.WildernessBlocks:FindFirstChild("slimeScepterBlock"):FindFirstChild("neon"),
                ["block"] = game.Workspace.WildernessBlocks:FindFirstChild("slimeScepterBlock"),
                ["norm"] = game.Workspace.WildernessBlocks:FindFirstChild("slimeScepterBlock"):FindFirstChild("Position"),
                ["pos"] = Vector3.new(0.5, 0.5, 0.5)
                }}
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
            end
        until game.Workspace.WildernessBlocks:FindFirstChild("slimeScepterBlock") == nil
    end
    if (Vector3.new(711, 217, 528) - HumanoidRootPart.Position).Magnitude > 10 then
        Humanoid:MoveTo(Vector3.new(711, 217, 528))
    end
end