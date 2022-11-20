for i,v in pairs(game:GetService("Players"):GetChildren()) do
local Timestamp = v.SessionStartTime.Value
local Seconds = os.time()-Timestamp
local Minutes = Seconds / 60
local Hours = Minutes / 60
local Rounded = math.floor(Hours * 100) / 100
print(v.Name.." been in server for "..tostring(Rounded).." hours")
end