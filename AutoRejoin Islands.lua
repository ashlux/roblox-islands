--wait for game to load
if not game:IsLoaded() then
game.Loaded:Wait()
end

--variables
seconds = 0
secondsToTryAgain = 60
Players = game:GetService("Players")
PlaceId = game.PlaceId
TeleportService = game:GetService("TeleportService")

--wait for sessionloading to be false, or 60 seconds
repeat task.wait(1) seconds = seconds + 1 
until game:GetService("Players").LocalPlayer.SessionLoading.Value == false or seconds == secondsToTryAgain

--if waited for 60 seconds then rejoins the game
if seconds >= secondsToTryAgain then
    Players.LocalPlayer:Kick("Attempting to join AGAIN")
    task.wait()
    TeleportService:Teleport(PlaceId, Players.LocalPlayer)
    
    --waits a while and tries again, just in case it failed
    task.wait(60)
    Players.LocalPlayer:Kick("Attempting to join AGAIN")
    task.wait()
    TeleportService:Teleport(PlaceId, Players.LocalPlayer)
end

--on screen notification so you know its on
game.StarterGui:SetCore("SendNotification",{
    Title = "Auto Rejoin Activated",
    Text = "Let's do this thing!",
    Duration = 10
})

--if Error message pops up, then activates function
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.DescendantAdded:Connect(function(prompt)
    
    --finds error message
    if prompt.Name == "ErrorTitle" then
        prompt:GetPropertyChangedSignal("Text"):Connect(function()
            
            --checks if message is a disconnected message
            if prompt.Text:sub(0,12) == "Disconnected" then
                print(prompt:GetFullName())
                Players.LocalPlayer:Kick("Attempting to rejoin")
                task.wait()
                TeleportService:Teleport(PlaceId, Players.LocalPlayer)
                
                --waits a little while and tries again just in case
                task.wait(60)
                Players.LocalPlayer:Kick("Trying to rejoin a second time")
                task.wait()
                TeleportService:Teleport(PlaceId, Players.LocalPlayer)
            end
            
        end)
    end
    
end)