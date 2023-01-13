if not game:IsLoaded() then
game.Loaded:Wait()
end

local Players = game:GetService("Players")

repeat wait()
until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse

if getgenv().playerLeavingConnection then
	getgenv().playerLeavingConnection:Disconnect()
end

function getBackpackContents(backpack)
	local contents = {}
	for _,item in pairs(backpack:GetChildren()) do
		contents[item.Name] = item.Amount.Value
	end
	return contents
end

function getPlayerBackpackBeforeAndAfter(player)
	local beginningBackpack = getBackpackContents(player.StarterGear)
	local endingBackpack = getBackpackContents(player.Backpack)
	
	local contents = {}
	for itemName, startQuantity in pairs(beginningBackpack) do
		contents[itemName] = {startQuantity = startQuantity; endQuantity = 0}
	end
	
	for itemName, endQuantity in pairs(endingBackpack) do
		if contents[itemName] then
			contents[itemName].endQuantity = endQuantity
		else
			contents[itemName] = {startQuantity = 0; endQuantity = endQuantity}
		end
	end
	
	return contents
end

function getPlayerBackpackDiff(player)
	local backpackBeforeAfter = getPlayerBackpackBeforeAndAfter(player)
	local backpackDiffs = {}
	for itemName, quantities in pairs(backpackBeforeAfter) do
		if quantities.startQuantity ~= quantities.endQuantity then
			backpackDiffs[itemName] = quantities
		end
	end
	return backpackDiffs
end

local FOLDER_NAME = "Inventory Changes"
if not isfolder(FOLDER_NAME) then
	makefolder(FOLDER_NAME)
end

function createFileTxt(player)
	local filename = FOLDER_NAME .. "/" .. player.Name .. ".txt"
    if not isfile(filename) then
        writefile(filename, "")
    end
	return filename
end

function createFileCsv(player)
	local filename = FOLDER_NAME .. "/" .. player.Name .. ".csv"
    if not isfile(filename) then
        writefile(filename, "player,date,item,start,end\n")
    end
	return filename
end

function logPlayerBackpackChanges(player)
	local osTime = os.time()
	local txtFilename = createFileTxt(player)
	local csvFilename = createFileCsv(player)
	for itemName,quantities in pairs(getPlayerBackpackDiff(player)) do
		local quantityChanged = quantities.endQuantity - quantities.startQuantity
		appendfile(txtFilename, osTime .. " - " .. itemName .. " has changed " .. quantityChanged .. "\n")
		appendfile(csvFilename, player.Name .. "," .. osTime .. "," .. itemName .. "," .. quantities.startQuantity .. "," .. quantities.endQuantity .. "\n")
	end
end

getgenv().playerLeavingConnection = Players.PlayerRemoving:Connect(logPlayerBackpackChanges)
