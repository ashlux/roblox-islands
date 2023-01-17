local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ActionBar = Player.PlayerGui.ActionBarScreenGui.ActionBar
local Character = Player.Character
local HR = Character.HumanoidRootPart

local function castRod()
    local args = {
    [1] = HttpService:GenerateGUID(false),
    [2] = {
    [1] = {
    ["playerLocation"] = HR.Position,
    ["direction"] = HR.CFrame.LookVector,
    ["strength"] = 0.3
    }
    }
    }
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("qTocunidxjgogwwelioctimtO/cpseorneEdOlGancbCkmjsyz"):FireServer(unpack(args))
end

local function catchFish()
    local args = {
    [1] = {
    ["success"] = true
    }
    }
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("qTocunidxjgogwwelioctimtO/ccwCmtcxltrzaivyhCood"):FireServer(unpack(args))
end

local function setFishing(value)
    Player:SetAttribute("fishing", value or false)
end

local function startAutoFishing()
    setFishing(true)
    local maxWaitTime = 20
    while Player:GetAttribute("fishing") and wait() do
        local waitTime = 0
        castRod()
        repeat task.wait(0.5) waitTime = waitTime + 1 until ActionBar:FindFirstChild("RoactTree") or Player:GetAttribute("fishing") == false or waitTime == maxWaitTime
        task.wait()
        catchFish()
        if ActionBar:FindFirstChild("RoactTree") then
            ActionBar.RoactTree:Destroy()
        end
    end
end

local function stopAutoFishing()
    setFishing(false)
end

return {
    startAutoFishing = startAutoFishing,
    stopAutoFishing = stopAutoFishing
}
