local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local mouse = Player:GetMouse()
local uis = game:GetService("UserInputService")
local SMACKING = false

local function onInputBegan(input, gp)
    
    if gp then return end -- if clicking chat
    
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        SMACKING = true
        while SMACKING do
            task.wait()
            if mouse.Target ~= nil then
                pcall(function()
                local args = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["part"] = mouse.Target,
                ["block"] = mouse.Target,
                ["norm"] = mouse.Target:FindFirstChild("Position"),
                ["pos"] = mouse.Target:FindFirstChild("Position")
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
                end)
            end
        end
    end
end

local function onInputEnd(input, gp)
    if gp then wait() end
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        SMACKING = false
    end
end

uis.InputBegan:Connect(onInputBegan)
uis.InputEnded:Connect(onInputEnd)
