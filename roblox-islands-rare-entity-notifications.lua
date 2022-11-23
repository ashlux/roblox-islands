local island = game.Workspace.Islands:GetChildren()[1] or ""

local function isSpecialEntity(entity)
    local color = entity:GetAttribute("color")
    local name = entity.Name
    
return (name == "frog" and color == "yellow") or
       (name == "rabbit" and color == "pink")
end


local function notifySpecialEntity(entity)
		print("Entity found!", entity, entity:GetAttribute("color"))
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://1788243907"
		sound.Looped = false
		sound.Parent = workspace
		sound:Play()
		wait(.5)
		sound:Play()
		wait(.5)
		sound:Play()
		wait(.5)

end

for k,entity in pairs(island.Entities:GetChildren()) do
		if (isSpecialEntity(entity)) then
			notifySpecialEntity(entity)
		end
end

island.Entities.ChildAdded:Connect(function(child)
		if (isSpecialEntity(child)) then
			notifySpecialEntity(entity)
		end
end)
