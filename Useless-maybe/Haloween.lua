local Player = game.Players.LocalPlayer
local Character = Player.Character
local HR = Character.HumanoidRootPart
local Entities = game.Workspace.WildernessIsland.Entities
local VirtualInputManager = game:GetService("VirtualInputManager")
local Humanoid = Character.Humanoid
local WS = 30
local Enemy = "cletusHalloween"
local Token = "cletusBossToken"
local TokensToSpawn = 500
local SpawnLocation = Vector3.new(706, 58, -492)
local Debounce = false
local HttpService = game:GetService("HttpService")

game.Players.LocalPlayer.Character.CurrentHealth:Destroy()

local killAura = coroutine.create(function()
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
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("vhwdjAricEepyzwbwobwDbrfe/nTpsvpqwmpaiUbl"):FireServer(unpack(args))
            end
        end
    end
end)

coroutine.resume(killAura)

Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
    Humanoid.WalkSpeed = WS
end)

Humanoid.WalkSpeed = WS

while wait() do
    
    if Entities:FindFirstChild(Enemy) then
        if (Entities[Enemy]:WaitForChild("HumanoidRootPart").Position - HR.Position).Magnitude > 10 then
            Humanoid:MoveTo(Entities[Enemy].HumanoidRootPart.Position + Vector3.new(math.random(0,5), 0, math.random(0,5)))
            VirtualInputManager:SendMouseButtonEvent(0,0, 0, true, game, 1)
            wait()
            VirtualInputManager:SendMouseButtonEvent(0,0, 0, false, game, 1)
        else
            VirtualInputManager:SendMouseButtonEvent(0,0, 0, true, game, 1)
            wait()
            VirtualInputManager:SendMouseButtonEvent(0,0, 0, false, game, 1)
        end
    elseif Player.Backpack:FindFirstChild(Token) then
        if Player.Backpack[Token].Amount.Value >= TokensToSpawn then
            Humanoid:MoveTo(SpawnLocation) -- moves to spawn area after enough tokens
            
            for i, v in pairs(workspace.spawnPrefabs.WildEventTriggers:GetDescendants()) do
                if v.Name == "ProximityPrompt" then
                    fireproximityprompt(v) -- fire boss spawners
                end
            end
            
        end
    else
        wait()
    end
    
end