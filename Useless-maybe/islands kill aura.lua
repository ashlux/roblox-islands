_G.active = true -- true for on, false for off
local Remote = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("vqp/ahgzcStyrpwwygky")

local HttpService = game:GetService("HttpService")
local Player = game.Players.LocalPlayer
local Character = Player.Character
local HR = Character.HumanoidRootPart

while _G.active do
    wait()
    for i,v in pairs(workspace.WildernessIsland.Entities:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") then
        if (HR.Position - v.HumanoidRootPart.Position).magnitude < 30 then
    local args = {
    [1] = HttpService:GenerateGUID(false),
    [2] = {
        [1] = {
            ["crit"] = true,
            ["hitUnit"] = v
        }
    }
}

Remote:FireServer(unpack(args))
    end
    end
end
end