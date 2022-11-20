island = game.Workspace.Islands:GetChildren()[1]

local playerName = "Lhander_XY"
local playerCharacter = game.Players[playerName].Character
playerCharacter.Archivable = true
local clone = playerCharacter:Clone()
print(clone)
clone.HumanoidRootPart.CFrame = playerCharacter.HumanoidRootPart.CFrame
clone.Parent = game.Workspace

while wait() do
    for i,v in pairs(island.Blocks:GetChildren()) do
        if v.Name == "vendingMachine" or v.Name == "vendingMachine1" then
            wait(0.5)
            clone.HumanoidRootPart.CFrame = CFrame.new(v.Position + Vector3.new(0,5,0))
        end
    end
end