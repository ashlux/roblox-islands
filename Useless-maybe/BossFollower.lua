local Player = game.Players.LocalPlayer
local Character = Player.Character
local HR = Character.HumanoidRootPart
local Entities = game.Workspace.WildernessIsland.Entities
local VirtualInputManager = game:GetService("VirtualInputManager")
local Humanoid = Character.Humanoid
local WS = 30
local Enemy = "slimeQueen"
local Debounce = false

Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
    Humanoid.WalkSpeed = WS
end)

Humanoid.WalkSpeed = WS

while wait() do
if Entities:FindFirstChild(Enemy) then
    Entities[Enemy].ChildAdded:Connect(function(child)
        if child.Name == "MattOwnsTheWorld" and Debounce == false then
            Debounce = true
            oldpos = HR.CFrame
            HR.CFrame = CFrame.new(HR.Position + Vector3.new(0,100,0))
            wait(5)
            HR.CFrame = CFrame.new(oldpos)
            Debounce = false
        end
    end)
    if (Entities[Enemy].HumanoidRootPart.Position - HR.Position).Magnitude > 5 then
        Humanoid:MoveTo(Entities[Enemy].HumanoidRootPart.Position + Vector3.new(math.random(0,5), 0, math.random(0,5)))
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, true, game, 1)
        wait()
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, false, game, 1)
    else
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, true, game, 1)
        wait()
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, false, game, 1)
    end
else 
    wait()
end
end