local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character
local Island = game.Workspace.Islands:GetChildren()[1]

local function setFillChests(value)
    Player:SetAttribute("fillChests", value or false)
end

local function openChest(chest, bool)
    local args = {
    [1] = {
    ["chest"] = chest,
    ["open"] = bool or false
    }
    }
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CHEST_TOGGLE:InvokeServer(unpack(args))
end

local function depositToChest(chest, amount, tool)
    openChest(chest, true)
    
    local args = {
    [1] = {
    ["chest"] = chest,
    ["player_tracking_category"] = "join_from_web",
    ["amount"] = amount,
    ["tool"] = tool, -- in backpack or character
    ["action"] = "deposit"
    }
    }
    game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.CLIENT_CHEST_TRANSACTION:InvokeServer(unpack(args))
    
    openChest(chest, false)
end

local function getNearbyChests()
    local chests = {}
    for i,v in pairs(Island.Blocks:GetChildren()) do
        if v.Name:find("chest") and Player:DistanceFromCharacter(v.Position) < 24 then
            table.insert(chests, v)
        end
    end
    return chests
end

local function getHeldItem()
    return Character:FindFirstChildWhichIsA("Tool")
end

local function startFillingChests()
    setFillChests(true)
    local tool = getHeldItem()
    
    while Player:GetAttribute("fillChests") and task.wait() do
        local amount = tool.Amount.Value
        local chests = getNearbyChests()
        for _,chest in pairs(chests) do
            if Player:GetAttribute("fillChests") and chest:FindFirstChild("Contents") and #chest.Contents:GetChildren() < chest.MaxContentSlots.Value + 1 then
                task.spawn(depositToChest, chest, amount, tool)
            end
        end
    end
    
end

local function stopFillingChests()
    setFillChests(false)
end

return {
	startFillingChests = startFillingChests,
	stopFillingChests = stopFillingChests
}
