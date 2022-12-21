local TS = game:GetService("TweenService")
local Player = game.Players.LocalPlayer
local Character = Player.Character
local Island = game.Workspace.Islands:GetChildren()[1]

function getRoot(char) -- find root part of character if they dont have HR
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

local HR = getRoot(Character)

function goToPoint(Point) -- go to "Point" (Vector3)
    if (HR.Position - Point).magnitude > 24 then
    Distance = (HR.Position - Point).Magnitude
    Speed = 25
    Time = Distance/Speed
    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
    tween:Play()
    return tween, Time
    end
end

local function setBreaking(value)
    Player:SetAttribute("breaking", value or false)
end

function Float() -- makes you float using BV
	BV = Instance.new("BodyVelocity", HR)
	BV.Velocity = Vector3.new(0,0,0)
	BV.MaxForce = Vector3.new(0,math.huge,0)
end

function unFloat() -- gets rid of BV so you dont float
    for i,v in pairs(HR:GetChildren()) do
        if v.Name == "BodyVelocity" then
            v:Destroy()
        end
    end
end

function getBlocks(block)
    local Blocks = {}
    for i,v in pairs(Island.Blocks:GetChildren()) do
        if v.Name == block then
         table.insert(Blocks, v)
        end
    end
    table.sort(Blocks, function(t1, t2) 
		return Player:DistanceFromCharacter(t1.Position) < Player:DistanceFromCharacter(t2.Position) end)
    return Blocks
end

local function breakThisBlock(Block)
    setBreaking(true)
    Float()
    while Player:GetAttribute("breaking") and wait() do
        local Blocks = getBlocks(Block)
        for i,v in pairs(Blocks) do
            tween, Time = goToPoint(v.Position)
            wait(Time)
            local tooMuch = 0
            repeat
                local args = {
                [1] = {
                ["player_tracking_category"] = "join_from_web",
                ["part"] = v,
                ["block"] = v,
                ["norm"] = v.Position,
                ["pos"] = Vector3.new(0, 1, 0)
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
                tooMuch = tooMuch + 1
            until v:FindFirstChild("Health") == nil or tooMuch == 20 or Player:GetAttribute("breaking") == false
        break
        end
    end
end

local function stopBreaking()
    setBreaking(false)
    unFloat()
    if tween then
        tween:Cancel()
    end
end

return {
    breakThisBlock = breakThisBlock,
    stopBreaking = stopBreaking
}
