local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local errors = 0

local function getHeldItem()
    if Character:FindFirstChildWhichIsA("Tool") then
        return Character:FindFirstChildWhichIsA("Tool")
    elseif Player.Backpack:FindFirstChildWhichIsA("Tool") and Player.Backpack:FindFirstChildWhichIsA("Tool").Name ~= "woodAxe" then
        return Player.Backpack:FindFirstChildWhichIsA("Tool")
    else
        errors = errors + 1
        task.wait()
        return "Error"
    end
end

local function dropItem()
    local item = getHeldItem()
    if item ~= "Error" then
        
        local args = {
        [1] = {
        ["player_tracking_category"] = "join_from_web",
        ["tool"] = item,
        ["amount"] = 1
        }
        }

        game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("CLIENT_DROP_TOOL_REQUEST"):InvokeServer(unpack(args))
    
    end
end

while true and errors < 50 do
    dropItem()
end
