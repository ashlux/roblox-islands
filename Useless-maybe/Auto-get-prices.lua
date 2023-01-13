if not game:IsLoaded() then
game.Loaded:Wait()
end

local Players = game:GetService("Players")

repeat wait()
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse

local Island = game.Workspace.Islands:GetChildren()[1]

local function notification(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {Title=title; Text=text; Duration=duration;})
    local Player = game.Players.LocalPlayer
end

local cache = {}

function getUserIdFromUsername(name)
    if cache[name] then return cache[name] end
    local id
    pcall(function()
        id = Players:getUserIdFromNameAsync(name)
    end)
    cache[name] = id
    return id
end

local function joinUser(NAME)

    local args = {
    [1] = {
        ["targetPlayerId"] = (getUserIdFromUsername(NAME))
    }
    }
 
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_2:InvokeServer(unpack(args))
end

local function loadingCounter(value)
    local CmdGui = Instance.new("ScreenGui")
    CmdGui.Name = "Countdown"
    CmdGui.Parent = game:GetService("CoreGui")

    local Background = Instance.new("Frame")
    Background.Name = "Background"
    Background.Parent = CmdGui
    Background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Background.BorderSizePixel = 0
    Background.BorderColor3 = Color3.new(1,0,1)
    Background.Position = UDim2.new(0.2, 0, 0.70, 0)
    Background.Size = UDim2.new(0.1, 0, 0.1, 0)
    Background.Active = true
    
    local N0 = Instance.new("TextLabel")
    N0.Position = UDim2.new(0,0,0,0)
    N0.Size = UDim2.new(1,0,1,0)
    N0.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
    N0.BorderColor3 = Color3.fromRGB(25, 25, 25)
    N0.ZIndex = 2
    N0.Parent = Background
    N0.Text = "Waiting"
    N0.TextColor3 = Color3.fromRGB(2,2,2)
    N0.TextScaled = true
    
    local N1 = Instance.new("TextLabel")
    N1.Position = UDim2.new(0,0,01,0)
    N1.Size = UDim2.new(1,0,1,0)
    N1.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
    N1.BorderColor3 = Color3.fromRGB(25, 25, 25)
    N1.ZIndex = 2
    N1.Parent = Background
    N1.Text = value
    N1.TextColor3 = Color3.fromRGB(2,2,2)
    N1.TextScaled = true
    
    for i = 1,value do
        task.wait(1)
        N1.Text = value - i
    end
    
    CmdGui:Destroy()
end

if game.Players.LocalPlayer.Name ~= "wasted_ManDude" then return end

notification("Loaded", "Finished loading", 3)

loadingCounter(5)

local dt = os.date("*t", os.time())

local joinCodes = ""
for k,player in pairs(game.Players:GetChildren()) do
	for _, ownerUserId in pairs(Island.Owners:GetChildren()) do
		if (player.UserId == ownerUserId.Value) then
			joinCodes = joinCodes .. " " .. player.JoinCode.Value
		end
	end
end
--print(joinCodes)

local filename = dt.year .. "-" .. dt.month .. "-" .. dt.day .. ".csv"
local foldername = "Average prices"
print(foldername, filename)
if not isfolder(foldername) then
    makefolder(foldername)
end
if (not isfile(foldername.."/"..filename)) then
	writefile(foldername.."/"..filename, "")
end

local function nameToDisplay(name)
    for i,v in pairs(game.ReplicatedStorage.Tools:GetChildren()) do
        if v.Name == name and v:FindFirstChild("DisplayName") then
            return v.DisplayName.Value
        end
    end
    return name
end

local function getOwner()
    for i,number in pairs(Island.Owners:GetChildren()) do
        return Players:GetNameFromUserIdAsync(number.Value)
    end
end

local OWNER = getOwner() -- WHERE IS OWNER???

local filename2 = getOwner()..".txt"
local foldername2 = "temp"
if not isfolder(foldername2) then
    makefolder(foldername2)
end
if (not isfile(foldername2.."/"..filename2)) then
	writefile(foldername2.."/"..filename2, "")

for k,vm in pairs(Island.Blocks:GetChildren()) do
	if (vm.Name:find("vendingMachine") and vm.SellingContents and #vm.SellingContents:GetChildren() == 1) then	
		local item = vm.SellingContents:GetChildren()[1]
		local amount = item.Amount.Value
		local price = vm.TransactionPrice.Value
		local mode = vm.Mode.Value
		if mode == 0 then
			--print("SELLING " .. amount .. " " .. item.Name .. " for " .. price)
			appendfile(foldername.."/"..filename, OWNER .. ",selling,"  .. amount .. "," .. nameToDisplay(item.Name) .. "," .. price .. "," .. joinCodes .. "\n")
		elseif mode == 1 then
			--print("BUYING " .. item.Name .. " for " .. price)
			appendfile(foldername.."/"..filename, OWNER .. ",buying," .. amount .. "," .. nameToDisplay(item.Name) .. "," .. price .. "," .. joinCodes ..  "\n")
		end
	end
end
else end

notification("Finished!", "Prices have been copied.", 5)

local shopInfos = game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.FETCH_ONLINE_ISLANDS:InvokeServer()


for i = 1,10 do
    for i,v in pairs(shopInfos.islands) do -- server[jobId, placeId, privateServerId, accessCode], displayName, player[username, userId], time, maxVisitors, visitorCount, joinCode, china
    
        filename2 = v.player.username..".txt"
    
        if (not isfile(foldername2.."/"..filename2)) then
            
            notification("Joining...", "attempting to join "..v.player.username)
            for i = 1,30 do
                joinUser(v.player.username)
                task.wait()
                print(v.visitorCount)
            end
        end
    end
end
