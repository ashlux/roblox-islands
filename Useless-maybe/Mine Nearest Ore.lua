Player = game.Players.LocalPlayer
Character = Player.Character
TS = game:GetService("TweenService")

function getRoot(char) -- find root part of character if they dont have HR
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

HR = getRoot(Character)

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

function getOres()
	local ores = {}
	for k,v in pairs(game.Workspace.WildernessBlocks:GetChildren()) do
        local ore = v
        if ore:FindFirstChild("1") then
            table.insert(ores, ore)
        end
	end	

	table.sort(ores, function(t1, t2) 
		return Player:DistanceFromCharacter(t1.Position) < Player:DistanceFromCharacter(t2.Position) end)
	return ores
end

function goToPoint(Point) -- go to "Point" (Vector3)
    HR = getRoot(Character)
    if (HR.Position - Point).magnitude > 24 then
    Distance = (HR.Position - Point).Magnitude
    Speed = 25
    Time = Distance/Speed
    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
    tween:Play()
    return tween, Time
    end
end

function closeEnoughToOre(ore)
	return Player:DistanceFromCharacter(ore.Position) <= 24
end

function oreStillThere(ore)
	return ore and ore:FindFirstChild("Health") and ore:FindFirstChild("Health").Value > 0
end

function hitOre(ore)
    local args = {
    [1] = {
    ["player_tracking_category"] = "join_from_web",
    ["part"] = ore:FindFirstChild("1"),
    ["block"] = ore,
    ["norm"] = nil --[[Vector3]],
    ["pos"] = nil --[[Vector3]]
    }
    }
    return game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
end

ores = getOres()
for i,v in pairs(ores) do
    tween, Time = goToPoint(v.Position)
    Float()
    goToPoint(v.Position)
    wait(Time)
    if closeEnoughToOre(v) then
        hits = 0
        repeat
            print(hits)
        hitOre(v)
        hits = hits + 1
        wait()
        oar = oreStillThere(ore)
        print(oar)
        until oar == nil or hits >= 10
        hits = 0
        unFloat()
        break
    end
end