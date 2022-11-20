local Players = game:GetService("Players")
local Player = game.Players.LocalPlayer
local Character = Player.Character

local test = Instance.new("Model")
local hum  = Instance.new("Humanoid")
local animation = Instance.new("Model")
local humanoidanimation = Instance.new("Humanoid")
test.Parent = workspace
hum.Parent = test
animation.Parent = workspace
humanoidanimation.Parent = animation

Player.Character = test
wait()
Character:FindFirstChildOfClass('Humanoid').Animator.Parent = humanoidanimation
Character:FindFirstChildOfClass('Humanoid'):Destroy()
Players.LocalPlayer.Character = Character

local hum2 = Instance.new("Humanoid")
hum2.Parent = Character
Character:FindFirstChildOfClass("Humanoid").Jump = true

humanoidanimation.Animator.Parent = hum2
Character.Animate.Disabled = true
wait()
Character.Animate.Disabled = false
wait()

hum2.HipHeight = 2.19

wait()

Character:BreakJoints()