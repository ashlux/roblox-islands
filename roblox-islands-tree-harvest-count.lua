local island = workspace.Islands:GetChildren()[1]
local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local tweenService = game:GetService("TweenService")


local startOak = 0

local startBirch = 0

local startPine = 0

local startMaple = 0

local startHickory = 0


for k,v in pairs(player.Backpack:getChildren()) do

		if v.Name == "woodBirch" then

				startBirch = v.Amount.Value

		elseif v.Name == "wood" then

				startOak = v.Amount.Value

		elseif v.Name == "woodPine" then

				startPine = v.Amount.Value

		elseif v.Name == "woodMaple" then

				startMaple = v.Amount.Value

		elseif v.name == "woodHickory" then

				startHickory = v.Amount.Value

		end

end


local waitRes = wait(60)


local endOak = 0
local endBirch = 0
local endPine = 0
local endMaple = 0
local endHickory = 0

for k,v in pairs(player.Backpack:getChildren()) do
		if v.Name == "woodBirch" then
				endBirch = v.Amount.Value
		elseif v.Name == "wood" then
				endOak = v.Amount.Value
		elseif v.Name == "woodPine" then
				endPine = v.Amount.Value
		elseif v.Name == "woodMaple" then
				endMaple = v.Amount.Value
		elseif v.name == "woodHickory" then
				endHickory = v.Amount.Value
		end
end


print("Wait time", waitRes)

print("START >> oak:", startOak, "birch:", startBirch, "pine:", startPine, "hickory:", startHickory, "maple:", startMaple)
print("END     >> oak:", endOak, "birch:", endBirch, "pine:", endPine, "hickory:", endHickory, "maple:", endMaple)
print("CUT     >> oak:", endOak - startOak, "birch:", endBirch - startBirch, "pine:", endPine - startPine, "hickory:", endHickory - startHickory, "maple:", endMaple - startMaple)
print("TOTAL   >>", endOak - startOak + endBirch - startBirch + endPine - startPine + endHickory - startHickory + endMaple - startMaple)
