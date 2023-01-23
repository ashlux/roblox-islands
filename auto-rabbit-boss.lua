--local farmingAlts = {"tryAnd_BanI", "anotherAlt"} -- capitalization doesn't matter.  Enter your alts here with commas between
--the farming alts will be set outside of the loadstring
if not game:IsLoaded() then
game.Loaded:Wait()
end

local Players = game:GetService("Players")

repeat wait()
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local HR = Character.HumanoidRootPart
local Humanoid = Character.Humanoid
local VirtualInputManager = game:GetService("VirtualInputManager")
local HttpService = game:GetService("HttpService")


local keepGoing = false
for _,v in pairs(farmingAlts) do
    if string.lower(v) == string.lower(Player.Name) then
        keepGoing = true
    end
end

if keepGoing == false then return end

local hitMobEvent =  game:GetService("ReplicatedStorage").rbxts_include.node_modules:FindFirstChild("@rbxts").net.out._NetManaged:FindFirstChild("whztaviICrqefnvqxsZkfdBT/vosxhmusipSuhrindifdzbnvBvheJn")

local function equipBane()
    local Bane = Player.Backpack:FindFirstChild("serpentsBane")
    if Bane then
        Bane.Parent = Character
    end
end

function getRoot(char) -- find root part of character if they dont have HR
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end
    
local function godMode()
    if Character:FindFirstChild("CurrentHealth") then
        Character.CurrentHealth:Destroy()
    end
end
    
local function killAura()
    HR = getRoot(Character)
    for i,v in pairs(workspace.WildernessIsland.Entities:GetChildren()) do
    if v:FindFirstChild("HumanoidRootPart") then
        if (HR.Position - v.HumanoidRootPart.Position).magnitude < 30 then
            local args = {
            [1] = HttpService:GenerateGUID(false),
            [2] = {
            [1] = {
            ["hitUnit"] = v
            }
            }
            }
            hitMobEvent:FireServer(unpack(args))
        end
    end
end
end

local function antiAFK()
    while wait(25) do
        game:GetService('VirtualUser'):CaptureController();
        wait();
        game:GetService('VirtualUser'):ClickButton2(Vector2.new(0,0))
    end
end


if game.PlaceId == 4872321990 then
    local Island = game.Workspace.Islands:GetChildren()[1]
    
    repeat wait() until Island.Blocks:FindFirstChild("portalToSpawn")
    local Portal = Island.Blocks.portalToSpawn
    task.wait(3)
    
    Portal.Frame.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

elseif game.PlaceId == 5899156129 then
	
	task.spawn(antiAFK)

    task.wait(3)
    
    Humanoid:MoveTo(Vector3.new(276, 25, -1038)) -- move to board
    Humanoid.MoveToFinished:wait()
    
    for i,v in pairs(game.Workspace.spawnPrefabs.QueueCenter["contract_board"]:GetChildren()) do
        if v.Name == "ProximityPrompt" then
            fireproximityprompt(v)
        end
    end

else

    task.wait(5)
    Humanoid:MoveTo(Vector3.new(14, 38, -290)) -- move to gate
    Humanoid.MoveToFinished:wait()

    repeat wait(0.5) until game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild("lunarRabbit")
    local rabbitBoss = game:GetService("Workspace").WildernessIsland.Entities.lunarRabbit
    Humanoid:MoveTo(Vector3.new(-19, 42, -204)) -- move inside after rabbitBoss
    Humanoid.MoveToFinished:wait()
    
    godMode()
    local killEverything = game:GetService('RunService').Stepped:Connect(killAura)
    
    repeat
        if rabbitBoss:FindFirstChild("HumanoidRootPart") then 
            Humanoid:MoveTo(rabbitBoss.HumanoidRootPart.Position)
            
            
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
            task.wait()
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
            
        end
    until rabbitBoss:FindFirstChild("HumanoidRootPart") == nil -- follow the dum dum
    
    task.wait(1)
    local playAgainButton = Player.PlayerGui.MatchCompleted["28"]["1"]
    
    firesignal(playAgainButton.MouseButton1Click)
    
end
