if not game:IsLoaded() then
game.Loaded:Wait()
end

local Players = game:GetService("Players")

repeat wait()
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse

function createFile(player) -- if no file or folder then makes file and folder
	if not isfile("Inventory Changes/"..player.Name..".txt") then
        if not isfolder("Inventory Changes") then
            makefolder("Inventory Changes")
        end
        writefile("Inventory Changes/"..player.Name..".txt", "")
    end
end

function playerLeaving(player)
local makeFile = true
    for _,v in pairs(player.StarterGear:GetChildren()) do
        for _,b in pairs(player.Backpack:GetChildren()) do
            if v.Name == b.Name then
                local change = b.Amount.Value - v.Amount.Value
                if change ~= 0 then
                    if makeFile then
                        makeFile = false
                        createFile(player)
                    end
                    appendfile("Inventory Changes/"..player.Name..".txt", os.time().." - "..v.Name.." has changed "..tostring(change).."\n")
                end
            end
        end
    end
end

Players.PlayerRemoving:Connect(playerLeaving)