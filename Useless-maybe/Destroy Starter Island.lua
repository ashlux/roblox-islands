_G.active = true -- set to false if you want it to stop

local TS = game:GetService("TweenService")
local Player = game.Players.LocalPlayer
local Character = Player.Character
local island = game.Workspace.Islands:GetChildren()[1]

function getRoot(char) -- find root part of character if they dont have HR
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

HR = getRoot(Character)

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

function Float() -- makes you float using BV
	BV = Instance.new("BodyVelocity", HR)
	BV.Velocity = Vector3.new(0,0,0)
	BV.MaxForce = Vector3.new(0,math.huge,0)
end

function unFloat() -- gets rid of BV so you dont float
    if HR:FindFirstChild("BodyVelocity") then
        HR.BodyVelocity:Destroy()
    end
end

for i,v in pairs(island.Blocks:GetChildren()) do
    if (v.Name == "stone" or v.Name == "grass") and _G.active then
        tween, Time = goToPoint(v.Position)
        Float()
        goToPoint(v.Position)
        wait(Time)
        repeat
            print("Hitting Block")
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
        until v:FindFirstChild("Health") == nil or _G.active == false
    end
end

unFloat()