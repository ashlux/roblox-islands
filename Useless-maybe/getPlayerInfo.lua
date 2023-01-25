if not game:IsLoaded() then
game.Loaded:Wait()
end

if not isfile("Player Info.csv") then
    writefile("Player Info.csv", "")
end

local contents = readfile("Player Info.csv")
local Players = game:GetService("Players")

local function csvToTable()
    local start = 1
    local NumName = 1
    local AlreadyCopied = {}
    
    for i = 1, #contents do
        if string.sub(contents, i, i) == "," then
            local NAME = contents:sub(start,(i-1))
            AlreadyCopied[NumName] = NAME
            start = i + 8
            NumName = NumName + 1
        end
    end
    
    return AlreadyCopied
end

local function writeInfo(player)
    local AlreadyCopied = csvToTable()
    local Saved = false
    for _,v in ipairs(AlreadyCopied) do
        if player.Name == v then
            Saved = true
	    end
    end 
    if not Saved then
        local joinCode = player:WaitForChild("JoinCode").Value
        local name = player.Name
        appendfile("Player Info.csv",(name..","..joinCode.."\n"))
    end
end

repeat wait() until game.Players.LocalPlayer

for i,Playr in pairs(Players:GetChildren()) do
    writeInfo(Playr)
end

Players.PlayerAdded:Connect(writeInfo)