local island = game.Workspace.Islands:GetChildren()[1] or ""

local function isSpecialEntity(entity)
    local color = entity:GetAttribute("color")
    local name = entity.Name
    
	-- yes there are case differences in the color depending on the critter...
	return (name == "frog" and color == "yellow") or
           (name == "rabbit" and color == "pink") or
	   (name == "firefly" and color == "Purple") or
	   (name == "firefly" and color == "Red") or
	   (name == "firefly" and color == "Blue") or 
	   (name == "firefly" and color == "Green")
end


local function notifySpecialEntity(entity)
	print("Entity found!", entity, entity:GetAttribute("color"))
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://1788243907"
	sound.Looped = false
	sound.Parent = workspace
	sound:Play()
	game.StarterGui:SetCore("SendNotification",{
    Title = "Found rare entity!",
    Text = entity:GetAttribute("color").." "..entity.Name,
    Duration = 7
    })
end

island.Entities.ChildAdded:Connect(function(child)
	if (isSpecialEntity(child)) then
		notifySpecialEntity(entity)
	end
end)

-- Notify about existing critters
for k,entity in pairs(island.Entities:GetChildren()) do
	if (isSpecialEntity(entity)) then
		notifySpecialEntity(entity)
	end
end
