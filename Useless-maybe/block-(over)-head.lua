local Player = game.Players.LocalPlayer
local HR = Player.Character.HumanoidRootPart

local x,y,z = HR.Position.X,HR.Position.Y + 6,HR.Position.Z

--local x,y,z = -2834, 5370, -4087

local args = {
    [1] = {
        ["upperBlock"] = false,
        ["cframe"] = CFrame.new(Vector3.new(x,y,z), Vector3.new(x, y,z+3)),
        ["player_tracking_category"] = "join_from_web",
        ["blockType"] = "coalBlock"
    }
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_PLACE_REQUEST:InvokeServer(unpack(args))
