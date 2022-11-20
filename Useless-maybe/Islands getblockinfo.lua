local island = game.Workspace.Islands:GetChildren()[1]
local UserID = ""
local Players = game:GetService("Players")

for i,v in pairs(island.Owners:GetChildren()) do
    UserID = v.Value
end

writefile((Players:GetNameFromUserIdAsync(UserID).."'s Island.txt"),"") -- This will create/overwrite the text document
for i,v in pairs(island.Blocks:GetChildren()) do
    if v.Name ~= "naturalRock1" or v.Name ~= "tallGrass" then
        appendfile((Players:GetNameFromUserIdAsync(UserID).."'s Island.txt"),(v.Name.." "..tostring(v.CFrame)..", ")) -- appendfile will write to the file, without overwriting stuff (write file above is deleting everything)
    end
end