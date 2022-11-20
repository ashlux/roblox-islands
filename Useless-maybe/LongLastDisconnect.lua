if not game:IsLoaded() then
game.Loaded:Wait()
end

repeat wait() until game.Players.LocalPlayer

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local v = Players.LocalPlayer

if isfile("How long until disconnect.txt") then wait() else writefile("How long until disconnect.txt", "") end
local Dir = CoreGui:FindFirstChild("RobloxPromptGui"):FindFirstChild("promptOverlay")

Dir.DescendantAdded:Connect(function(Error)
	if Error.Name == "ErrorTitle" then
		Error:GetPropertyChangedSignal("Text"):Connect(function()
			if Error.Text:sub(0, 12) == "Disconnected" then
				if #Players:GetPlayers() <= 1 then
					v:Kick("\nSaving Data")
					local Timestamp = v.SessionStartTime.Value
                    local Seconds = os.time()-Timestamp
                    local Minutes = Seconds / 60
                    local Hours = Minutes / 60
                    local Rounded = math.floor(Hours * 100) / 100
                    appendfile("How long until disconnect.txt", (v.Name.." been in server for "..tostring(Rounded).." hours"))
				end
			end
		end)
	end
end)