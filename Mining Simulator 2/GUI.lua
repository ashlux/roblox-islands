repeat wait() 
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
	local mouse = game.Players.LocalPlayer:GetMouse() 
	repeat wait() until mouse
	print("Loading")
	
local Item9Disabled = true
	
local Player = game.Players.LocalPlayer
local Character = Player.Character
local Humanoid = Character.Humanoid
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse
local plr = game.Players.LocalPlayer
local torso = plr.Character.LowerTorso
local flying = false
local deb = true 
local ctrl = {f = 0, b = 0, l = 0, r = 0} 
local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
local maxspeed = 25
local speed = 0 
local fly = true
function Fly() 
	local bg = Instance.new("BodyGyro", torso) 
	bg.P = 9e4
	bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
		bg.cframe = torso.CFrame 
		local bv = Instance.new("BodyVelocity", torso) 
		bv.velocity = Vector3.new(0,0.1,0) 
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
		repeat wait() 
			plr.Character.Humanoid.PlatformStand = true 
			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
				speed = speed + 2
				if speed > maxspeed then 
					speed = maxspeed 
				end 
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
				speed = 0
				if speed < 0 then 
					speed = 0 
				end 
			end 
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
			else 
				bv.velocity = Vector3.new(0,0.1,0) 
			end 
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame
		until not flying 
		ctrl = {f = 0, b = 0, l = 0, r = 0} 
		lastctrl = {f = 0, b = 0, l = 0, r = 0} 
		speed = 0 
		bg:Destroy() 
		bv:Destroy() 
		plr.Character.Humanoid.PlatformStand = false 
end 
	mouse.KeyDown:connect(function(key) 
		if key:lower() == "v" and fly == true then 
			if flying then flying = false 
			else 
				flying = true 
				Fly() 
			end 
		elseif key:lower() == "w" then 
			ctrl.f = 1 
		elseif key:lower() == "s" then 
			ctrl.b = -1 
		elseif key:lower() == "a" then 
			ctrl.l = -1 
		elseif key:lower() == "d" then 
			ctrl.r = 1 
		end 
	end)
	mouse.KeyUp:connect(function(key) 
		if key:lower() == "w" then 
			ctrl.f = 0 
		elseif key:lower() == "s" then 
			ctrl.b = 0 
		elseif key:lower() == "a" then 
			ctrl.l = 0 
		elseif key:lower() == "d" then 
			ctrl.r = 0 
		end 
	end)
	Fly()

local CmdGui = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local CmdHandler = Instance.new("ScrollingFrame")
local Close = Instance.new("TextButton")
local Minimum = Instance.new("TextButton")
local CmdName = Instance.new("TextButton")
local Plr = game.Players.LocalPlayer
local GetM = Plr:GetMouse()
local HR = Plr.Character.HumanoidRootPart
local tween
local oreList = game:GetService("ReplicatedStorage").Assets.ViewportItems:GetChildren()
local ChunkUtil = require(game.ReplicatedStorage.SharedModules.ChunkUtil)
local pets = game:GetService("ReplicatedStorage").Assets.Pets:GetChildren()


Toggled1 = false Toggled2 = false Toggled3 = false Toggled4 = false Toggled5 = false Toggled6 = false
Toggled7 = false Toggled8 = false Toggled9 = false Toggled10 = false Toggled11 = false Toggled12 = false
Toggled13 = false Toggled14 = false Toggled15 = false Toggled16 = false Eggies = false
Toggled17 = false Toggled18 = false Toggled19 = false Toggled20 = false Toggled21 = false
Toggled22 = false Toggled23 = false Toggled24 = false Toggled25 = false Toggled26 = false Toggled27 = false Toggled28 = false Toggled29 = false Toggled30 = false Toggled31 = false 
Toggled32 = false


function autofillOre(text)
    local matches = {}
	for i, texty in ipairs(oreList) do
		if string.match(string.lower(texty.Name), "^"..string.lower(text)) then
			table.insert(matches, texty)
		end
		if i == #oreList then
			if #matches == 1 then
				return matches[1].Name
			end
		end
	end
end

function autofill(text)
	local matches = {}
	for i, texty in ipairs(pets) do
		if string.match(string.lower(texty.Name), "^"..string.lower(text)) then
			table.insert(matches, texty)
		end
		if i == #pets then
			if #matches == 1 then
				return matches[1].Name
			end
		end
	end
end


if game:GetService("CoreGui"):findFirstChild("MSGUI") then
    game:GetService("CoreGui"):findFirstChild("MSGUI"):Destroy()
end


CmdGui.Name = "MSGUI"
CmdGui.Parent = game:GetService("CoreGui")

Background.Name = "Background"
Background.Parent = CmdGui
Background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background.BorderSizePixel = 0
Background.BorderColor3 = Color3.new(1,0,1)
Background.Position = UDim2.new(0.05, 0, 0.64, 0)
Background.Size = UDim2.new(0, 120, 0, 220)
Background.Active = true

local Background2 = Instance.new("Frame")
Background2.Name = "Background2"
Background2.Parent = Background
Background2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background2.BorderSizePixel = 0
Background2.BorderColor3 = Color3.new(1,0,1)
Background2.Position = UDim2.new(1, 0, 0.1, 0)
Background2.Size = UDim2.new(0, 200, 1, 0)
Background2.Active = true
Background2.Visible = false

local Background3 = Instance.new("Frame")
Background3.Name = "Background3"
Background3.Parent = Background
Background3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background3.BorderSizePixel = 0
Background3.BorderColor3 = Color3.new(1,0,1)
Background3.Position = UDim2.new(1, 0, 0.1, 0)
Background3.Size = UDim2.new(0, 150, 0, 190)
Background3.Active = true
Background3.Visible = false

local Background4 = Instance.new("Frame")
Background4.Name = "Background4"
Background4.Parent = Background
Background4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background4.BorderSizePixel = 0
Background4.BorderColor3 = Color3.new(1,0,1)
Background4.Position = UDim2.new(1, 0, 0.1, 0)
Background4.Size = UDim2.new(0, 150, 0, 165)
Background4.Active = true
Background4.Visible = false

local Background5 = Instance.new("Frame")
Background5.Name = "Background5"
Background5.Parent = Background
Background5.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background5.BorderSizePixel = 0
Background5.BorderColor3 = Color3.new(1,0,1)
Background5.Position = UDim2.new(1, 0, 0.1, 0)
Background5.Size = UDim2.new(0, 150, 0, 165)
Background5.Active = true
Background5.Visible = false

local Background6 = Instance.new("Frame")
Background6.Name = "Background6"
Background6.Parent = Background
Background6.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background6.BorderSizePixel = 0
Background6.BorderColor3 = Color3.new(1,0,1)
Background6.Position = UDim2.new(1, 0, 0.1, 0)
Background6.Size = UDim2.new(0, 150, 0, 165)
Background6.Active = true
Background6.Visible = false

local Background7 = Instance.new("Frame")
Background7.Name = "Background7"
Background7.Parent = Background
Background7.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background7.BorderSizePixel = 0
Background7.BorderColor3 = Color3.new(1,0,1)
Background7.Position = UDim2.new(1, 0, 0, 0)
Background7.Size = UDim2.new(0, 150, 0, 200)
Background7.Active = true
Background7.Visible = false

local Background8 = Instance.new("Frame")
Background8.Name = "Background8"
Background8.Parent = Background
Background8.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background8.BorderSizePixel = 0
Background8.BorderColor3 = Color3.new(1,0,1)
Background8.Position = UDim2.new(1, 0, 0, 0)
Background8.Size = UDim2.new(0, 150, 0, 200)
Background8.Active = true
Background8.Visible = false

local Background9 = Instance.new("Frame")
Background9.Name = "Background9"
Background9.Parent = Background3
Background9.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background9.BorderSizePixel = 0
Background9.BorderColor3 = Color3.new(1,0,1)
Background9.Position = UDim2.new(1, 0, 0, 0)
Background9.Size = UDim2.new(0, 150, 0, 150)
Background9.Active = true
Background9.Visible = false

CmdName.Name = "CmdName"
CmdName.AutoButtonColor = false
CmdName.Parent = Background
CmdName.BackgroundColor3 = Color3.fromRGB(10, 80, 180)
CmdName.BorderSizePixel = 0
CmdName.Size = UDim2.new(0, 87, 0, 15)
CmdName.Font = Enum.Font.GothamBlack
CmdName.Text = "Mining Sim GUI"
CmdName.TextColor3 = Color3.fromRGB(255, 255, 255)
CmdName.TextScaled = true
CmdName.TextSize = 14.000
CmdName.TextWrapped = true
Dragg = false

CmdName.MouseButton1Down:Connect(function()Dragg = true while Dragg do game.TweenService:Create(Background, TweenInfo.new(.06), {Position = UDim2.new(0,GetM.X-40,0,GetM.Y-5)}):Play()wait()end end)
CmdName.MouseButton1Up:Connect(function()Dragg = false end)

CmdHandler.Name = "CmdHandler"
CmdHandler.Parent = Background
CmdHandler.Active = true
CmdHandler.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler.BackgroundTransparency = 1.000
CmdHandler.BorderSizePixel = 0
CmdHandler.AutomaticCanvasSize = "Y"
CmdHandler.Position = UDim2.new(0.05, 0, 0.08, 0)
CmdHandler.Size = UDim2.new(0, 113, 0, 200)
CmdHandler.ScrollBarThickness = 4

local CmdHandler2 = Instance.new("ScrollingFrame")
CmdHandler2.Name = "CmdHandler2"
CmdHandler2.Parent = Background2
CmdHandler2.Active = true
CmdHandler2.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler2.BackgroundTransparency = 1.000
CmdHandler2.BorderSizePixel = 0
CmdHandler2.AutomaticCanvasSize = "Y"
CmdHandler2.Position = UDim2.new(0, 0, 0, 0)
CmdHandler2.Size = UDim2.new(1, 0, 1, 0)
CmdHandler2.ScrollBarThickness = 8

local CmdHandler3 = Instance.new("ScrollingFrame")
CmdHandler3.Name = "CmdHandler3"
CmdHandler3.Parent = Background3
CmdHandler3.Active = true
CmdHandler3.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler3.BackgroundTransparency = 1.000
CmdHandler3.BorderSizePixel = 0
CmdHandler3.AutomaticCanvasSize = "Y"
CmdHandler3.Position = UDim2.new(0, 1, 0, 1)
CmdHandler3.Size = UDim2.new(0, 148, 0, 190)
CmdHandler3.ScrollBarThickness = 8

local CmdHandler4 = Instance.new("ScrollingFrame")
CmdHandler4.Name = "CmdHandler4"
CmdHandler4.Parent = Background4
CmdHandler4.Active = true
CmdHandler4.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler4.BackgroundTransparency = 1.000
CmdHandler4.BorderSizePixel = 0
CmdHandler4.AutomaticCanvasSize = "Y"
CmdHandler4.Position = UDim2.new(0, 1, 0, 1)
CmdHandler4.Size = UDim2.new(0, 148, 0, 165)
CmdHandler4.ScrollBarThickness = 8

local CmdHandler5 = Instance.new("ScrollingFrame")
CmdHandler5.Name = "CmdHandler5"
CmdHandler5.Parent = Background5
CmdHandler5.Active = true
CmdHandler5.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler5.BackgroundTransparency = 1.000
CmdHandler5.BorderSizePixel = 0
CmdHandler5.AutomaticCanvasSize = "Y"
CmdHandler5.Position = UDim2.new(0, 1, 0, 1)
CmdHandler5.Size = UDim2.new(0, 148, 0, 165)
CmdHandler5.ScrollBarThickness = 8

local CmdHandler6 = Instance.new("ScrollingFrame")
CmdHandler6.Name = "CmdHandler6"
CmdHandler6.Parent = Background6
CmdHandler6.Active = true
CmdHandler6.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler6.BackgroundTransparency = 1.000
CmdHandler6.BorderSizePixel = 0
CmdHandler6.AutomaticCanvasSize = "Y"
CmdHandler6.Position = UDim2.new(0, 1, 0, 1)
CmdHandler6.Size = UDim2.new(0, 148, 0, 165)
CmdHandler6.ScrollBarThickness = 8

local CmdHandler7 = Instance.new("ScrollingFrame")
CmdHandler7.Name = "CmdHandler7"
CmdHandler7.Parent = Background7
CmdHandler7.Active = true
CmdHandler7.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler7.BackgroundTransparency = 1.000
CmdHandler7.BorderSizePixel = 0
CmdHandler7.AutomaticCanvasSize = "Y"
CmdHandler7.Position = UDim2.new(0, 1, 0, 1)
CmdHandler7.Size = UDim2.new(0, 148, 0, 200)
CmdHandler7.ScrollBarThickness = 8

local CmdHandler8 = Instance.new("ScrollingFrame")
CmdHandler8.Name = "CmdHandler8"
CmdHandler8.Parent = Background8
CmdHandler8.Active = true
CmdHandler8.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler8.BackgroundTransparency = 1.000
CmdHandler8.BorderSizePixel = 0
CmdHandler8.AutomaticCanvasSize = "Y"
CmdHandler8.Position = UDim2.new(0, 1, 0, 1)
CmdHandler8.Size = UDim2.new(0, 148, 0, 200)
CmdHandler8.ScrollBarThickness = 8

local CmdHandler9 = Instance.new("ScrollingFrame")
CmdHandler9.Name = "CmdHandler9"
CmdHandler9.Parent = Background9
CmdHandler9.Active = true
CmdHandler9.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler9.BackgroundTransparency = 1.000
CmdHandler9.BorderSizePixel = 0
CmdHandler9.AutomaticCanvasSize = "Y"
CmdHandler9.Position = UDim2.new(0, 1, 0, 1)
CmdHandler9.Size = UDim2.new(0, 148, 0, 250)
CmdHandler9.ScrollBarThickness = 8

Minimum.Name = "Minimum"
Minimum.Parent = Background
Minimum.BackgroundColor3 = Color3.fromRGB(0, 155, 155)
Minimum.BorderSizePixel = 0
Minimum.Position = UDim2.new(0.74, 0, 0.0001, 0)
Minimum.Size = UDim2.new(0, 15, 0, 14)
Minimum.Font = Enum.Font.SourceSans
Minimum.Text = "-"
Minimum.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimum.TextSize = 14.000
Minimum.MouseButton1Click:Connect(function()
	if Background.BackgroundTransparency == 0 then
		Background.BackgroundTransparency = 1
		Background2.Visible = false
		Background3.Visible = false
		Background4.Visible = false
		Background5.Visible = false
		Background6.Visible = false
		Background7.Visible = false
		Background.Size = UDim2.new(0, 120, 0, 25)
		CmdHandler.Visible = false
		Toggled1 = false
        Toggled2 = false
        Toggled10 = false
        Toggled11 = false
        Toggled15 = false
        Toggled16 = false
	elseif Background.BackgroundTransparency == 1 then
		Background.BackgroundTransparency = 0
		Background.Size = UDim2.new(0, 120, 0, 220)
		CmdHandler.Visible = true
	end
end)

local Title = Instance.new("TextButton")
Title.Position = UDim2.new(0,1,0,1)
Title.Size = UDim2.new(0,100,0,20)
Title.BackgroundColor3 = Color3.fromRGB(70,70,70)
Title.BorderColor3 = Color3.new(1,1,1)
Title.ZIndex = 2
Title.Parent = CmdHandler
Title.Text = "Teleports >"
Title.TextColor3 = Color3.fromRGB(250,250,250)
Title.TextScaled = true

local Misc = Instance.new("TextButton")
Misc.Position = UDim2.new(0,1,0,23)
Misc.Size = UDim2.new(0,100,0,20)
Misc.BackgroundColor3 = Color3.fromRGB(70,70,70)
Misc.BorderColor3 = Color3.new(1,1,1)
Misc.ZIndex = 2
Misc.Parent = CmdHandler
Misc.Text = "Misc >"
Misc.TextColor3 = Color3.fromRGB(250,250,250)
Misc.TextScaled = true

local Ores = Instance.new("TextButton")
Ores.Position = UDim2.new(0,1,0,129)
Ores.Size = UDim2.new(0,100,0,20)
Ores.BackgroundColor3 = Color3.fromRGB(70,70,70)
Ores.BorderColor3 = Color3.new(1,1,1)
Ores.ZIndex = 2
Ores.Parent = CmdHandler
Ores.Text = "Ores >"
Ores.TextColor3 = Color3.fromRGB(250,250,250)
Ores.TextScaled = true

local Info = Instance.new("TextButton")
Info.Position = UDim2.new(0,1,0,66)
Info.Size = UDim2.new(0,100,0,20)
Info.BackgroundColor3 = Color3.fromRGB(70,70,70)
Info.BorderColor3 = Color3.new(1,1,1)
Info.ZIndex = 2
Info.Parent = CmdHandler
Info.Text = "Info >"
Info.TextColor3 = Color3.fromRGB(250,250,250)
Info.TextScaled = true

local Petz = Instance.new("TextButton")
Petz.Position = UDim2.new(0,1,0,108)
Petz.Size = UDim2.new(0,100,0,20)
Petz.BackgroundColor3 = Color3.fromRGB(70,70,70)
Petz.BorderColor3 = Color3.new(1,1,1)
Petz.ZIndex = 2
Petz.Parent = CmdHandler
Petz.Text = "Pet Stuff >"
Petz.TextColor3 = Color3.fromRGB(250,250,250)
Petz.TextScaled = true

local Fishn = Instance.new("TextButton")
Fishn.Position = UDim2.new(0,1,0,44)
Fishn.Size = UDim2.new(0,100,0,20)
Fishn.BackgroundColor3 = Color3.fromRGB(70,70,70)
Fishn.BorderColor3 = Color3.new(1,1,1)
Fishn.ZIndex = 2
Fishn.Parent = CmdHandler
Fishn.Text = "GUIs >"
Fishn.TextColor3 = Color3.fromRGB(250,250,250)
Fishn.TextScaled = true

local Selln = Instance.new("TextButton")
Selln.Position = UDim2.new(0,1,0,21)
Selln.Size = UDim2.new(0,140,0,20)
Selln.BackgroundColor3 = Color3.fromRGB(70,70,70)
Selln.BorderColor3 = Color3.new(1,1,1)
Selln.ZIndex = 2
Selln.Parent = CmdHandler3
Selln.Text = "Sell when FULL"
Selln.TextColor3 = Color3.fromRGB(250,250,250)
Selln.TextScaled = true

local Eggs = Instance.new("TextButton")
Eggs.Position = UDim2.new(0,1,0,87)
Eggs.Size = UDim2.new(0,100,0,20)
Eggs.BackgroundColor3 = Color3.fromRGB(70,70,70)
Eggs.BorderColor3 = Color3.new(1,1,1)
Eggs.ZIndex = 2
Eggs.Parent = CmdHandler
Eggs.Text = "Eggs >"
Eggs.TextColor3 = Color3.fromRGB(250,250,250)
Eggs.TextScaled = true

local YPos = 1
local NaMe = 1
for i,v in pairs(game.Workspace.Eggs:GetChildren()) do
    print(v.Name)
    local Eggz = Instance.new("TextButton")
    Eggz.Name = NaMe
    Eggz.Position = UDim2.new(0,1,0,YPos)
    Eggz.Size = UDim2.new(0,140,0,25)
    Eggz.BackgroundColor3 = Color3.fromRGB(70,70,70)
    Eggz.BorderColor3 = Color3.new(1,1,1)
    Eggz.ZIndex = 2
    Eggz.Parent = CmdHandler6
    Eggz.Text = v.Name
    Eggz.TextColor3 = Color3.fromRGB(250,250,250)
    Eggz.TextScaled = true
    NaMe = NaMe + 1
    YPos = YPos + 25
end

for i,v in pairs(CmdHandler6:GetChildren()) do
    v.MouseButton1Click:Connect(function()
        if Eggies then
            Eggies = false
            v.BackgroundColor3 = Color3.fromRGB(70,70,70)
            Plr.PlayerGui.ScreenGui.Enabled = true
            wait(3)
            Plr.PlayerGui.ScreenGui.Enabled = true
            else
            Eggies = true
            v.BackgroundColor3 = Color3.new(0,1,1)
            game.Workspace.Camera.ChildAdded:Connect(function(animation)
                if animation.Name == "1" or animation.Name == "2" or animation.Name == "Default" then
                    animation:Destroy()
                    wait()
                    Plr.PlayerGui.ScreenGui.Enabled = true
                end
            end)
            Plr.PlayerGui.ChildAdded:Connect(function(hatchGui)
                if hatchGui.Name == "HatchGui" then
                    hatchGui:Destroy()
                    wait()
                    Plr.PlayerGui.ScreenGui.Enabled = true
                end
            end)
            while Eggies  do
                wait()
                if game.Players.LocalPlayer.PlayerGui.ScreenGui.Shop.Frame.Container.Frame.Gamepasses.Content["Triple Hatch"].Frame.Owned.Visible == true then
                local args = {[1] = v.Text,[2] = true,[3] = true}
                game:GetService("ReplicatedStorage").Events.OpenEgg:FireServer(unpack(args))
                else
                    local args = {[1] = v.Text,[2] = false}
                game:GetService("ReplicatedStorage").Events.OpenEgg:FireServer(unpack(args))
                end
            if Plr.PlayerGui:FindFirstChild("HatchGui") then
                for i,v in pairs(Plr.PlayerGui:GetChildren()) do
                    if v.Name == "HatchGui" then
                        v:Destroy()
                    end
                end
            end
            end
        end
    end)
end

Title.MouseButton1Click:Connect(function()
    if Toggled1 then
        Toggled1 = false
        Title.Text = "Teleports >"
        Title.TextColor3 = Color3.fromRGB(250,250,250)
        Background2.Visible = false
    else
        Toggled1 = true
        Toggled2 = false
        Toggled10 = false
        Toggled11 = false
        Toggled15 = false
        Toggled16 = false
        Toggled19 = false
        Fishn.Text = "GUIs >"
        Background8.Visible = false
        Title.Text = "Teleports <"
        Misc.Text = "Misc >"
        Ores.Text = "Ores >"
        Info.Text = "Info >"
        Eggs.Text = "Eggs >"
        Petz.Text = "Pet Stuff >"
        Background3.Visible = false
        Background4.Visible = false
        Background2.Visible = true
        Background5.Visible = false
        Background6.Visible = false
        Background7.Visible = false
    end
end)

Misc.MouseButton1Click:Connect(function()
    if Toggled2 then
        Toggled2 = false
        Misc.Text = "Misc >"
        Misc.TextColor3 = Color3.fromRGB(250,250,250)
        Background3.Visible = false
    else
        Toggled1 = false
        Toggled10 = false
        Toggled2 = true
        Toggled11 = false
        Toggled15 = false
        Toggled16 = false
        Toggled19 = false
        Fishn.Text = "GUIs >"
        Background8.Visible = false
        Misc.Text = "Misc <"
        Title.Text = "Teleports >"
        Ores.Text = "Ores >"
        Info.Text = "Info >"
        Eggs.Text = "Eggs >"
        Petz.Text = "Pet Stuff >"
        Background2.Visible = false
        Background3.Visible = true
        Background4.Visible = false
        Background5.Visible = false
        Background6.Visible = false
        Background7.Visible = false
    end
end)

Ores.MouseButton1Click:Connect(function()
    if Toggled10 then
        Toggled10 = false
        Ores.Text = "Ores >"
        Ores.TextColor3 = Color3.fromRGB(250,250,250)
        Background4.Visible = false
    else
        Toggled1 = false
        Toggled2 = false
        Toggled10 = true
        Toggled11 = false
        Toggled15 = false
        Toggled16 = false
        Toggled19 = false
        Fishn.Text = "GUIs >"
        Background8.Visible = false
        Ores.Text = "Ores <"
        Misc.Text = "Misc >"
        Title.Text = "Teleports >"
        Info.Text = "Info >"
        Eggs.Text = "Eggs >"
        Petz.Text = "Pet Stuff >"
        Background2.Visible = false
        Background3.Visible = false
        Background4.Visible = true
        Background5.Visible = false
        Background6.Visible = false
        Background7.Visible = false
    end
end)

Info.MouseButton1Click:Connect(function()
    if Toggled11 then
        Toggled11 = false
        Info.Text = "Info >"
        Info.TextColor3 = Color3.fromRGB(250,250,250)
        Background5.Visible = false
    else
        Toggled1 = false
        Toggled2 = false
        Toggled10 = false
        Toggled15 = false
        Toggled16 = false
        Toggled11 = true
        Toggled19 = false
        Fishn.Text = "GUIs >"
        Background8.Visible = false
        Ores.Text = "Ores >"
        Misc.Text = "Misc >"
        Title.Text = "Teleports >"
        Eggs.Text = "Eggs >"
        Info.Text = "Info <"
        Petz.Text = "Pet Stuff >"
        Background2.Visible = false
        Background3.Visible = false
        Background4.Visible = false
        Background5.Visible = true
        Background6.Visible = false
        Background7.Visible = false
    end
end)

Eggs.MouseButton1Click:Connect(function()
    if Toggled15 then
        Toggled15 = false
        Eggs.Text = "Eggs >"
        Eggs.TextColor3 = Color3.fromRGB(250,250,250)
        Background6.Visible = false
    else
        Toggled1 = false
        Toggled2 = false
        Toggled10 = false
        Toggled11 = false
        Toggled16 = false
        Toggled15 = true
        Toggled19 = false
        Fishn.Text = "GUIs >"
        Background8.Visible = false
        Ores.Text = "Ores >"
        Misc.Text = "Misc >"
        Title.Text = "Teleports >"
        Info.Text = "Info >"
        Eggs.Text = "Eggs <"
        Petz.Text = "Pet Stuff >"
        Background2.Visible = false
        Background3.Visible = false
        Background4.Visible = false
        Background5.Visible = false
        Background6.Visible = true
        Background7.Visible = false
    end
end)

Petz.MouseButton1Click:Connect(function()
    if Toggled16 then
        Toggled16 = false
        Petz.Text = "Pet Stuff >"
        Petz.TextColor3 = Color3.fromRGB(250,250,250)
        Background7.Visible = false
    else
        Toggled1 = false
        Toggled2 = false
        Toggled10 = false
        Toggled11 = false
        Toggled15 = false
        Toggled16 = true
        Toggled19 = false
        Fishn.Text = "GUIs >"
        Background8.Visible = false
        Ores.Text = "Ores >"
        Misc.Text = "Misc >"
        Title.Text = "Teleports >"
        Info.Text = "Info >"
        Eggs.Text = "Eggs >"
        Petz.Text = "Pet Stuff <"
        Background2.Visible = false
        Background3.Visible = false
        Background4.Visible = false
        Background5.Visible = false
        Background6.Visible = false
        Background7.Visible = true
    end
end)

Fishn.MouseButton1Click:Connect(function()
    if Toggled19 then
        Toggled19 = false
        Fishn.Text = "GUIs >"
        Fishn.TextColor3 = Color3.fromRGB(250,250,250)
        Background8.Visible = false
    else
        Toggled1 = false
        Toggled2 = false
        Toggled10 = false
        Toggled11 = false
        Toggled15 = false
        Toggled16 = false
        Toggled19 = true
        Ores.Text = "Ores >"
        Misc.Text = "Misc >"
        Title.Text = "Teleports >"
        Info.Text = "Info >"
        Eggs.Text = "Eggs >"
        Petz.Text = "Pet Stuff >"
        Fishn.Text = "GUIs <"
        Background2.Visible = false
        Background3.Visible = false
        Background4.Visible = false
        Background5.Visible = false
        Background6.Visible = false
        Background7.Visible = false
        Background8.Visible = true
    end
end)

Selln.MouseButton1Click:Connect(function()
    if Toggled30 then
        Toggled30 = false
        Fishn.Text = "GUIs >"
        Fishn.TextColor3 = Color3.fromRGB(250,250,250)
        Background9.Visible = false
    else
        Toggled30 = true
        Background9.Visible = true
    end
end)

Close.Name = "Close"
Close.Parent = Background
Close.BackgroundColor3 = Color3.fromRGB(155, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.87, 0, 0.0001, 0)
Close.Size = UDim2.new(0, 15, 0, 15)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 14.000
Close.MouseButton1Click:Connect(function() Toggled1 = false Toggled2 = false Toggled3 = false Toggled4 = false Toggled5 = false Toggled6 = false
Toggled7 = false Toggled8 = false Toggled9 = false Toggled10 = false Toggled11 = false Toggled12 = false
Toggled13 = false Toggled14 = false Toggled15 = false Toggled16 = false Eggies = false
Toggled17 = false Toggled18 = false Toggled19 = false Toggled20 = false Toggled21 = false
Toggled22 = false Toggled23 = false Toggled24 = false Toggled25 = false Toggled26 = false Toggled27 = false Toggled28 = false Toggled29 = false Toggled30 = false Toggled31 = false 
Toggled32 = false
for i,v in pairs(game.CoreGui:GetChildren()) do
    if (v:IsA("ScreenGui")) and v.Name == "ScreenGui" then
        v:Destroy()
    end
end
CmdGui:Destroy()
end)

local Item1 = Instance.new("TextButton")
Item1.Position = UDim2.new(0,1,0,21)
Item1.Size = UDim2.new(0,71,0,20)
Item1.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item1.BorderColor3 = Color3.new(1,1,1)
Item1.ZIndex = 2
Item1.Parent = CmdHandler2
Item1.Text = "Hidden Treasure"
Item1.TextColor3 = Color3.fromRGB(250,250,250)
Item1.TextScaled = true
Item1.MouseButton1Click:Connect(function()
    local args = {
    [1] = "Hidden Treasure"
}

game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
end)

local Item2 = Instance.new("TextButton")
Item2.Position = UDim2.new(0,71,0,21)
Item2.Size = UDim2.new(0,71,0,20)
Item2.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item2.BorderColor3 = Color3.new(1,1,1)
Item2.ZIndex = 2
Item2.Parent = CmdHandler2
Item2.Text = "Frozen Depths"
Item2.TextColor3 = Color3.fromRGB(250,250,250)
Item2.TextScaled = true
Item2.MouseButton1Click:Connect(function()
local args = {
    [1] = "Frozen Depths"
}

game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))

end)

local Item3 = Instance.new("TextButton")
Item3.Position = UDim2.new(0,1,0,42)
Item3.Size = UDim2.new(0,71,0,20)
Item3.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item3.BorderColor3 = Color3.new(1,1,1)
Item3.ZIndex = 2
Item3.Parent = CmdHandler2
Item3.Text = "Gloomy Basin"
Item3.TextColor3 = Color3.fromRGB(250,250,250)
Item3.TextScaled = true
Item3.MouseButton1Click:Connect(function()
local args = {
    [1] = "Gloomy Basin"
}

game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))

end)

local Item4 = Instance.new("TextButton")
Item4.Position = UDim2.new(0,71,0,42)
Item4.Size = UDim2.new(0,71,0,20)
Item4.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item4.BorderColor3 = Color3.new(1,1,1)
Item4.ZIndex = 2
Item4.Parent = CmdHandler2
Item4.Text = "Molten Core"
Item4.TextColor3 = Color3.fromRGB(250,250,250)
Item4.TextScaled = true
Item4.MouseButton1Click:Connect(function()
local args = {
    [1] = "Molten Core"
}

game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))

end)

local Item5 = Instance.new("TextButton")
Item5.Position = UDim2.new(0,1,0,63)
Item5.Size = UDim2.new(0,71,0,20)
Item5.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item5.BorderColor3 = Color3.new(1,1,1)
Item5.ZIndex = 2
Item5.Parent = CmdHandler2
Item5.Text = "The Underworld"
Item5.TextColor3 = Color3.fromRGB(250,250,250)
Item5.TextScaled = true
Item5.MouseButton1Click:Connect(function()
local args = {
    [1] = "The Underworld"
}

game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))

end)

local Item6 = Instance.new("TextButton")
Item6.Position = UDim2.new(0,71,0,63)
Item6.Size = UDim2.new(0,71,0,20)
Item6.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item6.BorderColor3 = Color3.new(1,1,1)
Item6.ZIndex = 2
Item6.Parent = CmdHandler2
Item6.Text = "Crystal Cavern"
Item6.TextColor3 = Color3.fromRGB(250,250,250)
Item6.TextScaled = true
Item6.MouseButton1Click:Connect(function()
local args = {
    [1] = "Crystal Cavern"
}

game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))

end)

local Atlantis = Instance.new("TextButton")
Atlantis.Position = UDim2.new(0,0,0,126)
Atlantis.Size = UDim2.new(0,80,0,20)
Atlantis.BackgroundColor3 = Color3.fromRGB(70,70,70)
Atlantis.BorderColor3 = Color3.new(1,1,1)
Atlantis.ZIndex = 2
Atlantis.Parent = CmdHandler2
Atlantis.Text = "Atlantis"
Atlantis.TextColor3 = Color3.fromRGB(250,250,250)
Atlantis.TextScaled = true
Atlantis.MouseButton1Click:Connect(function()
local args = {
    [1] = "Atlantis"
}

game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
end)

local Candyland = Instance.new("TextButton")
Candyland.Position = UDim2.new(0,0,0,147)
Candyland.Size = UDim2.new(0,80,0,20)
Candyland.BackgroundColor3 = Color3.fromRGB(70,70,70)
Candyland.BorderColor3 = Color3.new(1,1,1)
Candyland.ZIndex = 2
Candyland.Parent = CmdHandler2
Candyland.Text = "Candyland"
Candyland.TextColor3 = Color3.fromRGB(250,250,250)
Candyland.TextScaled = true
Candyland.MouseButton1Click:Connect(function()
local args = {
    [1] = "Candyland"
}game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
end)

local Toyland = Instance.new("TextButton")
Toyland.Position = UDim2.new(0,0,0,168)
Toyland.Size = UDim2.new(0,80,0,20)
Toyland.BackgroundColor3 = Color3.fromRGB(70,70,70)
Toyland.BorderColor3 = Color3.new(1,1,1)
Toyland.ZIndex = 2
Toyland.Parent = CmdHandler2
Toyland.Text = "Toyland"
Toyland.TextColor3 = Color3.fromRGB(250,250,250)
Toyland.TextScaled = true
Toyland.MouseButton1Click:Connect(function()
local args = {[1] = "Toyland"}game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
end)

local Christmas = Instance.new("TextButton")
Christmas.Position = UDim2.new(0,20,0,189)
Christmas.Size = UDim2.new(0,80,0,20)
Christmas.BackgroundColor3 = Color3.fromRGB(70,70,70)
Christmas.BorderColor3 = Color3.new(1,1,1)
Christmas.ZIndex = 2
Christmas.Parent = CmdHandler2
Christmas.Text = "Mystic Forest"
Christmas.TextColor3 = Color3.fromRGB(250,250,250)
Christmas.TextScaled = true
Christmas.MouseButton1Click:Connect(function()
local args = {[1] = "Mystic Forest"}game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
end)

local rainbowLand = Instance.new("TextButton")
rainbowLand.Position = UDim2.new(0,0,0,189)
rainbowLand.Size = UDim2.new(0,80,0,20)
rainbowLand.BackgroundColor3 = Color3.fromRGB(70,70,70)
rainbowLand.BorderColor3 = Color3.new(1,1,1)
rainbowLand.ZIndex = 2
rainbowLand.Parent = CmdHandler2
rainbowLand.Text = "Rainbow Land"
rainbowLand.TextColor3 = Color3.fromRGB(250,250,250)
rainbowLand.TextScaled = true
rainbowLand.MouseButton1Click:Connect(function()
local args = {[1] = "Rainbow Land SurfaceSell"}game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
end)

local eventArea = Instance.new("TextButton")
eventArea.Position = UDim2.new(0,0,0,210)
eventArea.Size = UDim2.new(0,80,0,20)
eventArea.BackgroundColor3 = Color3.fromRGB(70,70,70)
eventArea.BorderColor3 = Color3.new(1,1,1)
eventArea.ZIndex = 2
eventArea.Parent = CmdHandler2
eventArea.Text = "Spring World"
eventArea.TextColor3 = Color3.fromRGB(250,250,250)
eventArea.TextScaled = true
eventArea.MouseButton1Click:Connect(function()
local args = {[1] = "Spring World"}game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
end)


local Item7 = Instance.new("TextButton")
Item7.Position = UDim2.new(0,1,0,1)
Item7.Size = UDim2.new(0,140,0,20)
Item7.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item7.BorderColor3 = Color3.new(1,1,1)
Item7.ZIndex = 2
Item7.Parent = CmdHandler3
Item7.Text = "Auto Mine Under You"
Item7.TextColor3 = Color3.fromRGB(250,250,250)
Item7.TextScaled = true
Item7.MouseButton1Click:Connect(function()
    if Toggled3 then
        Toggled3 = false
        Item7.BackgroundColor3 = Color3.fromRGB(70,70,70)
        Item7.Text = "Auto Mine Under You"
        Item7.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled3 = true
        Item7.BackgroundColor3 = Color3.new(0,1,1)
        Item7.Text = "Mining"
        Item7.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled3 == true do
            wait()
            for i = 1,2 do
            local PlayerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            game.ReplicatedStorage.Events.MineBlock:FireServer(ChunkUtil.worldToCell(PlayerPos - Vector3.new(0,5,0)))
            game.ReplicatedStorage.Events.MineBlock:FireServer(ChunkUtil.worldToCell(PlayerPos - Vector3.new(0,10,0)))
            end
        end
    end
end)

local Item8 = Instance.new("TextButton")
Item8.Position = UDim2.new(0,1,0,589)
Item8.Size = UDim2.new(0,140,0,20)
Item8.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item8.BorderColor3 = Color3.new(1,1,1)
Item8.ZIndex = 2
Item8.Parent = CmdHandler3
Item8.Text = ""
Item8.TextColor3 = Color3.fromRGB(250,250,250)
Item8.TextScaled = true
Item8.Visible = false
Item8.MouseButton1Click:Connect(function()
	if Toggled4 then
		Toggled4 = false
		Item8.BackgroundColor3 = Color3.fromRGB(70,70,70)
	else
		Toggled4 = true
		Item8.BackgroundColor3 = Color3.new(0,1,1)
		while Toggled4 do
		    wait()
		end
	end
end)

local Item9 = Instance.new("TextButton") -- ore teleport and REBIRTH might come back if they add mines
Item9.Position = UDim2.new(0,1,0,505)
Item9.Size = UDim2.new(0,140,0,20)
Item9.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item9.BorderColor3 = Color3.new(1,1,1)
Item9.ZIndex = 2
Item9.Parent = CmdHandler3
Item9.Text = ""
Item9.TextColor3 = Color3.fromRGB(250,250,250)
Item9.TextScaled = true
Item9.Visible = false
Item9.MouseButton1Click:Connect(function()
	if Toggled5 then
		Toggled5 = false
		Item9.BackgroundColor3 = Color3.fromRGB(70,70,70)
		Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
		Noclipping:Disconnect()
		tween:Cancel()
        noClip = false
	else
		Toggled5 = true
		if Item9Disabled == true then Toggled5 = false end-- Temporary disabled
		Item9.BackgroundColor3 = Color3.new(0,1,1)
		local BV = Instance.new("BodyVelocity")
		local YSpeed = 0
		BV.Velocity = Vector3.new(0,0,0)
		BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local speaker = game.Players.LocalPlayer
        noClip = true
        local function NoclipLoop()
            if noClip == true and speaker.Character ~= nil then
	            for _, child in pairs(speaker.Character:GetDescendants()) do
	            	if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
	        		child.CanCollide = false
            		end
            	end
            end
        end
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        local Character = game.Players.LocalPlayer.Character
        local Humanoid = Character.Humanoid
        local TS = game:GetService('TweenService')
        local HR = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
        wait(4)
        playerPosition = Character.HumanoidRootPart.Position
        tween = TS:Create(HR, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Vector3.new(playerPosition.X, -9236, playerPosition.Z))})
        tween:Play()
        wait(1.5)
		while Toggled5 do
		    wait()
            local times = 1
            TS = game:GetService('TweenService')
            HR = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
            for i,v in pairs(game.Workspace.Chunks:GetDescendants()) do
                if v.Name == "larimar" and times <= 5 then
                    if Toggled5 == true then
                        local playerPosition = Character.HumanoidRootPart.Position
                        local XPOS = v.Position.X - playerPosition.X
                        local ZPOS = v.Position.Z - playerPosition.Z
                        print(v.Position - playerPosition)
                        tween = TS:Create(HR, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Vector3.new(playerPosition.X, v.Position.Y + 5, playerPosition.Z))})
                        tween:Play()
                        wait(0.5)
                        tween = TS:Create(HR, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Vector3.new(v.Position.X, v.Position.Y + 5, v.Position.Z))})
                        tween:Play()
                        wait(4.5)
                        PlayerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                        local ChunkUtil = require(game.ReplicatedStorage.SharedModules.ChunkUtil)
                        times = times + 1
                        print("Mining",times,v.Name)
                        for i = 1,4 do
                            game.ReplicatedStorage.Events.MineBlock:FireServer(ChunkUtil.worldToCell(PlayerPos - Vector3.new(0,5,0)))
                            wait(0.5)
                        end
                    end
                end
            end
        end
        if Toggled5 == true then
            print("moving down searching for ore")
            playerPosition = Character.HumanoidRootPart.Position
            tween = TS:Create(HR, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Vector3.new(playerPosition.X, playerPosition.Y - 100, playerPosition.Z))})
            tween:Play()
            wait(1.5)
        end
        if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.Inventory.Frame.Container.Ores.Content.Frame.Items:FindFirstChild("larimar") then
            YPos = 0
            XPos = 0
            ZPos = 0
            XPos = playerPosition.X
            YPos = playerPosition.Y
            ZPos = playerPosition.Z
            local args = {
            [1] = "Crystal CavernSell" -- sell
            }
            game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
            game:GetService("ReplicatedStorage").Events.QuickSell:FireServer()
            if Toggled5 == true then
                game:GetService("ReplicatedStorage").Events.Rebirth:FireServer() -- rebirth
                playerPosition = Character.HumanoidRootPart.Position
                tween = TS:Create(HR, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Vector3.new(playerPosition.X, YPos, playerPosition.Z))})
                tween:Play()
                wait(1.5)
                tween = TS:Create(HR, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Vector3.new(XPos, YPos, ZPos))})
                tween:Play()
                wait(1.5)
            end
        end
    end
end)

local Item10 = Instance.new("TextButton")
Item10.Position = UDim2.new(0,1,0,63)
Item10.Size = UDim2.new(0,140,0,20)
Item10.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item10.BorderColor3 = Color3.new(1,1,1)
Item10.ZIndex = 2
Item10.Parent = CmdHandler3
Item10.Text = " "
Item10.TextColor3 = Color3.fromRGB(250,250,250)
Item10.TextScaled = true
Item10.Visible = false
Item10.MouseButton1Click:Connect(function()
    if Toggled18 then
		Toggled18 = false
		Item10.BackgroundColor3 = Color3.fromRGB(70,70,70)
	else
		Toggled18 = true
		Item10.BackgroundColor3 = Color3.new(0,1,1)
		while Toggled18 do
		    wait()
	    end
    end
end)

local Item11 = Instance.new("TextButton") -- old auto guess Pet might come back
Item11.Position = UDim2.new(0,1,0,504)
Item11.Size = UDim2.new(0,140,0,20)
Item11.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item11.BorderColor3 = Color3.new(1,1,1)
Item11.ZIndex = 2
Item11.Parent = CmdHandler3
Item11.Text = ""
Item11.TextColor3 = Color3.fromRGB(250,250,250)
Item11.TextScaled = true
Item11.Visible = false
Item11.MouseButton1Click:Connect(function()
    if Toggled21 then
		Toggled21 = false
		Item11.BackgroundColor3 = Color3.fromRGB(70,70,70)
	else
		Toggled21 = true
		Item11.BackgroundColor3 = Color3.new(0,1,1)
        Plr.PlayerGui.SurfaceGui.Frame.Main.Pet.ChildAdded:Connect(function(PetGuess)
            if PetGuess:IsA("Model") then
                wait()
                if Toggled21 then
                local args = {
                [1] = PetGuess.Name,
                [2] = "All"}
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
                end
            end
        end)
    end
end)

local Item14 = Instance.new("TextButton")
Item14.Position = UDim2.new(0,1,0,510)
Item14.Size = UDim2.new(0,140,0,20)
Item14.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item14.BorderColor3 = Color3.new(1,1,1)
Item14.ZIndex = 2
Item14.Parent = CmdHandler3
Item14.Text = ""
Item14.TextColor3 = Color3.fromRGB(250,250,250)
Item14.TextScaled = true
Item14.Visible = false
Item14.MouseButton1Click:Connect(function()
	if Toggled8 then
		Toggled8 = false
		Item14.BackgroundColor3 = Color3.fromRGB(70,70,70)
	else
		Toggled8 = true
		Item14.BackgroundColor3 = Color3.new(0,1,1)
		while Toggled8 do
		    wait()
		end
	end
end)

local Item15 = Instance.new("TextButton")
Item15.Position = UDim2.new(0,1,0,231)
Item15.Size = UDim2.new(0,140,0,20)
Item15.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item15.BorderColor3 = Color3.new(1,1,1)
Item15.ZIndex = 2
Item15.Parent = CmdHandler3
Item15.Text = ""
Item15.TextColor3 = Color3.fromRGB(250,250,250)
Item15.TextScaled = true
Item15.Visible = false
Item15.MouseButton1Click:Connect(function()
	if Toggled9 then
		Toggled9 = false
		Item15.BackgroundColor3 = Color3.fromRGB(70,70,70)
	else
		Toggled9 = true
		Item15.BackgroundColor3 = Color3.new(0,1,1)
		while Toggled9 do
		    wait()
		end
	end
end)

local textbox1 = Instance.new("TextBox")
textbox1.Position = UDim2.new(0,1,0,1)
textbox1.Size = UDim2.new(0,140,0,20)
textbox1.BackgroundColor3 = Color3.fromRGB(10,10,10)
textbox1.BorderColor3 = Color3.new(1,1,1)
textbox1.ZIndex = 2
textbox1.PlaceholderText = "Ore Name Here"
textbox1.Text = ""
textbox1.Parent = CmdHandler4
textbox1.TextColor3 = Color3.fromRGB(250,250,250)
textbox1.TextScaled = true 

textbox1:GetPropertyChangedSignal("Text"):Connect(function()
    newText = autofillOre(textbox1.Text)
    if newText ~= nil then
        textbox1.Text = newText
        textbox1.CursorPosition = -1
    end
end)

local Item17 = Instance.new("TextButton")
Item17.Position = UDim2.new(0,1,0,23)
Item17.Size = UDim2.new(0,140,0,20)
Item17.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item17.BorderColor3 = Color3.new(1,1,1)
Item17.ZIndex = 2
Item17.Parent = CmdHandler4
Item17.Text = "Mine Cyber Galaxy Ore"
Item17.TextColor3 = Color3.fromRGB(250,250,250)
Item17.TextScaled = true
Item17.MouseButton1Click:Connect(function()
	if Toggled12 then
		Toggled12 = false
		Item17.BackgroundColor3 = Color3.fromRGB(70,70,70)
        Noclipping:Disconnect()
        noClip = false
		tween:Cancel()
		game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
	else
		Toggled12 = true
		Item17.BackgroundColor3 = Color3.new(0,1,1)
		local BV = Instance.new("BodyVelocity")
		local YSpeed = 0
		BV.Velocity = Vector3.new(0,0,0)
		BV.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local speaker = game.Players.LocalPlayer
        noClip = true
        local function NoclipLoop()
            if noClip == true and speaker.Character ~= nil then
	            for _, child in pairs(speaker.Character:GetDescendants()) do
	            	if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
	        		child.CanCollide = false
            		end
            	end
            end
        end
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        local Character = game.Players.LocalPlayer.Character
        local Humanoid = Character.Humanoid
        local TS = game:GetService('TweenService')
        local HR = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
        local playerPosition = HR.Position
		while Toggled12 do
		    wait()
            TS = game:GetService('TweenService')
            HR = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
            for i,v in pairs(game.Workspace.Chunks:GetDescendants()) do
                if v.Name == textbox1.Text then
                    print("found "..textbox1.Text)
                    if Toggled12 == true then
                        if game:GetService("Workspace").Worlds["The Overworld"].Sign.Display.SurfaceGui.Info.Text == "0 Blocks until Collapse" then
                            print("mine has collapsed. waiting...")
		                    wait(5)
		                    Point = Vector3.new(8695, -5456, 84)
                            Distance = (HR.Position - Point).Magnitude
                            Speed = 20
                            Time = Distance/Speed
                            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                            tween:Play()
                            wait(Time)
	                    else
                            print("Mining",v.Name)
                            local playerPosition = Character.HumanoidRootPart.Position
                            local XPOS = v.Position.X - playerPosition.X
                            local ZPOS = v.Position.Z - playerPosition.Z
                                tween = TS:Create(HR, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Vector3.new(playerPosition.X, v.Position.Y + 5, playerPosition.Z))})
                                tween:Play()
                                wait(0.5)
                                Point = Vector3.new(v.Position.X, v.Position.Y + 5, v.Position.Z)
                                Distance = (HR.Position - Point).Magnitude
                                Speed = 20
                                Time = Distance/Speed
                                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                                tween:Play()
                                wait(Time)
                                PlayerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                                local ChunkUtil = require(game.ReplicatedStorage.SharedModules.ChunkUtil)
                                for i = 1,2 do
                                    game.ReplicatedStorage.Events.MineBlock:FireServer(ChunkUtil.worldToCell(PlayerPos - Vector3.new(0,5,0)))
                                    wait(0.5)
                                end
                        end
                    end
                end
                end
                if Toggled13 == true then
                    playerPosition = Character.HumanoidRootPart.Position
                    print("moving down")
                    tween = TS:Create(HR, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Vector3.new(playerPosition.X, playerPosition.Y - 100, playerPosition.Z))})
                    tween:Play()
                    wait(1.5)
                end
        end
    end
end)

local Item18 = Instance.new("TextButton")
Item18.Position = UDim2.new(0,1,0,47)
Item18.Size = UDim2.new(0,140,0,20)
Item18.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item18.BorderColor3 = Color3.new(1,1,1)
Item18.ZIndex = 2
Item18.Parent = CmdHandler4
Item18.Text = "Mine Overworld Ore"
Item18.TextColor3 = Color3.fromRGB(250,250,250)
Item18.TextScaled = true
Item18.MouseButton1Click:Connect(function()
	if Toggled13 then
		Toggled13 = false
		Item18.BackgroundColor3 = Color3.fromRGB(70,70,70)
        Noclipping:Disconnect()
        noClip = false
		tween:Cancel()
		game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
	else
		Toggled13 = true
		Item18.BackgroundColor3 = Color3.new(0,1,1)
		local BV = Instance.new("BodyVelocity")
		local YSpeed = 0
		BV.Velocity = Vector3.new(0,0,0)
		BV.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local speaker = game.Players.LocalPlayer
        noClip = true
        local function NoclipLoop()
            if noClip == true and speaker.Character ~= nil then
	            for _, child in pairs(speaker.Character:GetDescendants()) do
	            	if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
	        		child.CanCollide = false
            		end
            	end
            end
        end
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        local Character = game.Players.LocalPlayer.Character
        local Humanoid = Character.Humanoid
        local TS = game:GetService('TweenService')
        local HR = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
        local playerPosition = HR.Position
		while Toggled13 do
		    wait()
            TS = game:GetService('TweenService')
            HR = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
            for i,v in pairs(game.Workspace.Chunks:GetDescendants()) do
                if v.Name == textbox1.Text then
                    if Toggled13 == true then
                        if game:GetService("Workspace").Worlds["The Overworld"].Sign.Display.SurfaceGui.Info.Text == "0 Blocks until Collapse" then
                            print("mine has collapsed. waiting...")
		                    wait(5)
		                    local args = {[1] = "Crystal Cavern"}
                            game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
	                    else
                            print("Mining",v.Name)
                            local playerPosition = Character.HumanoidRootPart.Position
                            local XPOS = v.Position.X - playerPosition.X
                            local ZPOS = v.Position.Z - playerPosition.Z
                                tween = TS:Create(HR, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Vector3.new(playerPosition.X, v.Position.Y + 5, playerPosition.Z))})
                                tween:Play()
                                wait(0.5)
                                Point = Vector3.new(v.Position.X, v.Position.Y + 5, v.Position.Z)
                                Distance = (HR.Position - Point).Magnitude
                                Speed = 20
                                Time = Distance/Speed
                                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                                tween:Play()
                                wait(Time)
                                PlayerPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                                local ChunkUtil = require(game.ReplicatedStorage.SharedModules.ChunkUtil)
                                for i = 1,2 do
                                    game.ReplicatedStorage.Events.MineBlock:FireServer(ChunkUtil.worldToCell(PlayerPos - Vector3.new(0,5,0)))
                                    wait(0.5)
                                end
                        end
                    end
                end
                end
                if Toggled13 == true then
                    playerPosition = Character.HumanoidRootPart.Position
                    print("moving down")
                    tween = TS:Create(HR, TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Vector3.new(playerPosition.X, playerPosition.Y - 100, playerPosition.Z))})
                    tween:Play()
                    wait(1.5)
                end
        end
    end
end)

local Item12 = Instance.new("TextButton")
Item12.Position = UDim2.new(0,20,0,84)
Item12.Size = UDim2.new(0,80,0,18)
Item12.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item12.BorderColor3 = Color3.new(1,1,1)
Item12.ZIndex = 2
Item12.Parent = CmdHandler2
Item12.Text = "Cyber Galaxy"
Item12.TextColor3 = Color3.fromRGB(250,250,250)
Item12.TextScaled = true
Item12.MouseButton1Click:Connect(function()
local args = {
    [1] = "Cyber Galaxy"
}
game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
end)

local Chasm = Instance.new("TextButton")
Chasm.Position = UDim2.new(0,1,0,105)
Chasm.Size = UDim2.new(0,71,0,18)
Chasm.BackgroundColor3 = Color3.fromRGB(70,70,70)
Chasm.BorderColor3 = Color3.new(1,1,1)
Chasm.ZIndex = 2
Chasm.Parent = CmdHandler2
Chasm.Text = "Glitched Chasm"
Chasm.TextColor3 = Color3.fromRGB(250,250,250)
Chasm.TextScaled = true
Chasm.MouseButton1Click:Connect(function()
local args = {[1] = "Glitched Chasm"}
game:GetService("ReplicatedStorage").Events.Telesport:FireServer(unpack(args))
end)

local Item13 = Instance.new("TextButton")
Item13.Position = UDim2.new(0,0,0,0)
Item13.Size = UDim2.new(0.5,0,0.1,0)
Item13.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item13.BorderColor3 = Color3.new(1,1,1)
Item13.ZIndex = 2
Item13.Parent = CmdHandler2
Item13.Text = "The Overworld"
Item13.TextColor3 = Color3.fromRGB(250,250,250)
Item13.TextScaled = true
Item13.MouseButton1Click:Connect(function()
local args = {
    [1] = "The Overworld"
}
game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
end)

local Item19 = Instance.new("TextButton")
Item19.Position = UDim2.new(0,1,0,170)
Item19.Size = UDim2.new(0,100,0,18)
Item19.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item19.BorderColor3 = Color3.new(1,1,1)
Item19.ZIndex = 2
Item19.Parent = CmdHandler
Item19.Text = "Redeem All Codes"
Item19.TextColor3 = Color3.fromRGB(250,250,250)
Item19.TextScaled = true
Item19.MouseButton1Click:Connect(function()
    local codes = {"Update38", "SpringPart3", "Update37", "SpringPart2", "Update35", "Spring", "Update34", "StPatricksPart2", "StPatricks", "Update33", "Update32", "Comet", "Update31", "Rainbow", "Update30", "Valentines", "Update29", "TechMstery", "Update28", "Element", "Update26", "HappyNewYear", "Update27", "Mystical", "Update25", "Festive", "Update24","Advent","Update23", "Christmas", "freecrate", "release", "FreeEgg", "RareCrate", "Gems", "Trading", "FreeGems", "Lucky", "SuperLucky", "Update4", "Factory", "Update5", "July4th", "Update6", "Fishing", "Update7", "treasure", "Update8", "Mystery", "Season2", "SuperEvent", "ExtraLuck", "Atlantis", "Update9", "LostCity", "LuckEvent", "Update10", "UltraLucky", "Atlantic", "Update11", "Update12", "MysteryV3", "Update13", "Candyland", "Update14", "Chocolate", "Update15", "Pastry", "Update16", "Halloween", "Update17", "Spooky", "Update18", "Ghost", "Omega24", "Super24", "Lucky24", "Update20", "Pixel", "Update22", "Cartoon"}
    for i,v in pairs(codes) do
        game:GetService("ReplicatedStorage").Functions.RedeemCode:InvokeServer(v)
    end
end)

local textbox2 = Instance.new("TextBox")
textbox2.Position = UDim2.new(0,1,0,1)
textbox2.Size = UDim2.new(0,140,0,18)
textbox2.BackgroundColor3 = Color3.fromRGB(10,10,10)
textbox2.BorderColor3 = Color3.new(1,1,1)
textbox2.ZIndex = 2
textbox2.PlaceholderText = "Display Name Here"
textbox2.Text = ""
textbox2.Parent = CmdHandler7
textbox2.TextColor3 = Color3.fromRGB(250,250,250)
textbox2.TextScaled = true 
local Text = textbox2.Text
textbox2:GetPropertyChangedSignal("Text"):Connect(function()
    newText = autofill(textbox2.Text)
    if newText ~= nil then
        textbox2.Text = newText
        textbox2.CursorPosition = -1
    end
end)

local Item21 = Instance.new("TextButton")
Item21.Position = UDim2.new(0,1,0,21)
Item21.Size = UDim2.new(0,140,0,20)
Item21.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item21.BorderColor3 = Color3.new(1,1,1)
Item21.ZIndex = 2
Item21.Parent = CmdHandler7
Item21.Text = "Delete Pet"
Item21.TextColor3 = Color3.fromRGB(250,250,250)
Item21.TextScaled = true
Item21.MouseButton1Click:Connect(function()
for i,v in pairs(game.Players.LocalPlayer.PlayerGui.ScreenGui.Inventory.Frame.Container.Pets.Content:GetDescendants()) do
    if v.Name == "ItemName" and v.Text == textbox2.Text and v.Parent.Shiny.Visible == false then
        print("deleting",v.Text)
        wait()
        local args = {[1] = {[1] = v.Parent.Parent.Name,}}
        game:GetService("ReplicatedStorage").Events.MultiDeletePets:FireServer(unpack(args))
    end
end
end)

local Item20 = Instance.new("TextButton")
Item20.Position = UDim2.new(0,1,0,42)
Item20.Size = UDim2.new(0,140,0,20)
Item20.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item20.BorderColor3 = Color3.new(1,1,1)
Item20.ZIndex = 2
Item20.Parent = CmdHandler7
Item20.Text = "Delete Shiny Pet"
Item20.TextColor3 = Color3.fromRGB(250,250,250)
Item20.TextScaled = true
Item20.MouseButton1Click:Connect(function()
for i,v in pairs(game.Players.LocalPlayer.PlayerGui.ScreenGui.Inventory.Frame.Container.Pets.Content:GetDescendants()) do
    if v.Name == "ItemName" and v.Text == textbox2.Text and v.Parent.Shiny.Visible == true then
        print("deleting",v.Text)
        wait()
        local args = {[1] = {[1] = v.Parent.Parent.Name,}}
        game:GetService("ReplicatedStorage").Events.MultiDeletePets:FireServer(unpack(args))
    end
end
end)

local textbox3 = Instance.new("TextBox")
textbox3.Position = UDim2.new(0,1,0,75)
textbox3.Size = UDim2.new(0,140,0,20)
textbox3.BackgroundColor3 = Color3.fromRGB(10,10,10)
textbox3.BorderColor3 = Color3.new(1,1,1)
textbox3.ZIndex = 2
textbox3.PlaceholderText = "Display Name Here"
textbox3.Text = ""
textbox3.Parent = CmdHandler7
textbox3.TextColor3 = Color3.fromRGB(250,250,250)
textbox3.TextScaled = true 

textbox3:GetPropertyChangedSignal("Text"):Connect(function(typed)
    newText = autofill(textbox3.Text)
    if newText ~= nil then
        textbox3.Text = newText
        textbox3.CursorPosition = -1
    end
end)

local Item22 = Instance.new("TextButton")
Item22.Position = UDim2.new(0,1,0,96)
Item22.Size = UDim2.new(0,140,0,20)
Item22.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item22.BorderColor3 = Color3.new(1,1,1)
Item22.ZIndex = 2
Item22.Parent = CmdHandler7
Item22.Text = "Make Pet Shiny"
Item22.TextColor3 = Color3.fromRGB(250,250,250)
Item22.TextScaled = true
Item22.MouseButton1Click:Connect(function()
local P1 = ""
local P2 = ""
local P3 = ""
local P4 = ""
local T = 0
for i,v in pairs(game.Players.LocalPlayer.PlayerGui.ScreenGui.Inventory.Frame.Container.Pets.Content:GetDescendants()) do
    if v.Name == "ItemName" and v.Text == textbox3.Text and v.Parent.Shiny.Visible == false then
    T = T + 1
        if T == 1 then
            P1 = v.Parent.Parent.Name
        elseif T == 2 then
            P2 = v.Parent.Parent.Name
        elseif T == 3 then
            P3 = v.Parent.Parent.Name
        elseif T == 4 then
            P4 = v.Parent.Parent.Name
        end
    end
end
print("Making Shiny")
local args = { [1] = {
        [1] = P1,
        [2] = P2,
        [3] = P3,
        [4] = P4
    }}
game:GetService("ReplicatedStorage").Events.ForgePets:FireServer(unpack(args))
end)

local Item23 = Instance.new("TextButton")
Item23.Position = UDim2.new(0,1,0,63)
Item23.Size = UDim2.new(0,140,0,20)
Item23.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item23.BorderColor3 = Color3.new(1,1,1)
Item23.ZIndex = 2
Item23.Parent = CmdHandler3
Item23.Text = "Open ALL Crates"
Item23.TextColor3 = Color3.fromRGB(250,250,250)
Item23.TextScaled = true
Item23.MouseButton1Click:Connect(function()
    if Toggled17 then
		Toggled17 = false
		Item23.BackgroundColor3 = Color3.fromRGB(70,70,70)
	else
		Toggled17 = true
		Item23.BackgroundColor3 = Color3.new(0,1,1)
		game.Workspace.Camera.ChildAdded:Connect(function(crate)
		    if crate.Name == "Basic Crate" or crate.Name == "Rare Crate" or crate.Name == "Exotic Crate" or crate.Name == "Patriot Crate" or crate.Name == "Season 2 Crate" then
		        crate:Destroy()
		        wait()
		        Plr.PlayerGui.ScreenGui.Enabled = true
		    end
		end)
        Plr.PlayerGui.ChildAdded:Connect(function(crateOpen)
            if crateOpen.Name == "CrateOpen" then
                crateOpen:Destroy()
                wait()
                Plr.PlayerGui.ScreenGui.Enabled = true
            end
        end)
		while Toggled17 do
		    wait()
		    if Plr.PlayerGui.ScreenGui.Inventory.Frame.Container.Items.Content.Frame.Crate.Items:FindFirstChild("Basic Crate") then
            local args = {[1] = "Basic Crate"}game:GetService("ReplicatedStorage").Events.OpenCrate:FireServer(unpack(args))
		    end
            if Plr.PlayerGui.ScreenGui.Inventory.Frame.Container.Items.Content.Frame.Crate.Items:FindFirstChild("Exotic Crate") then
            local args = {[1] = "Exotic Crate"}game:GetService("ReplicatedStorage").Events.OpenCrate:FireServer(unpack(args))
            end
            if Plr.PlayerGui.ScreenGui.Inventory.Frame.Container.Items.Content.Frame.Crate.Items:FindFirstChild("Rare Crate") then
            local args = {[1] = "Rare Crate"}game:GetService("ReplicatedStorage").Events.OpenCrate:FireServer(unpack(args))
            end
            if Plr.PlayerGui.ScreenGui.Inventory.Frame.Container.Items.Content.Frame.Crate.Items:FindFirstChild("Patriot Crate") then
            local args = {[1] = "Patriot Crate"}game:GetService("ReplicatedStorage").Events.OpenCrate:FireServer(unpack(args))
            end
            if Plr.PlayerGui.ScreenGui.Inventory.Frame.Container.Items.Content.Frame.Crate.Items:FindFirstChild("Season 2 Crate") then
            local args = {[1] = "Season 2 Crate"}game:GetService("ReplicatedStorage").Events.OpenCrate:FireServer(unpack(args))
            end
		    if Plr.PlayerGui:FindFirstChild("CrateOpen") then
		        for i,v in pairs(Plr.PlayerGui:GetChildren()) do
                    if v.Name == "CrateOpen" then
                        v:Destroy()
                    end
                end
		    end
            for i,crate in pairs(game.Workspace.Camera:GetChildren()) do
                if crate.Name == "Basic Crate" or crate.Name == "Rare Crate" or crate.Name == "Exotic Crate" or crate.Name == "Patriot Crate" then
                    crate:Destroy()
                end
            end
        end
	end
end)

local Item24 = Instance.new("TextButton")
Item24.Position = UDim2.new(0,1,0,1)
Item24.Size = UDim2.new(0,140,0,20)
Item24.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item24.BorderColor3 = Color3.new(1,1,1)
Item24.ZIndex = 2
Item24.Parent = CmdHandler8
Item24.Text = "Event Challenges"
Item24.TextColor3 = Color3.fromRGB(250,250,250)
Item24.TextScaled = true
Item24.MouseButton1Click:Connect(function()
    if Toggled20 then
		Toggled20 = false
		Item24.BackgroundColor3 = Color3.fromRGB(70,70,70)
		Player.PlayerGui.ScreenGui.EventChallenges.Visible = false
	else
		Toggled20 = true
		Item24.BackgroundColor3 = Color3.new(0,1,1)
		Player.PlayerGui.ScreenGui.EventChallenges.Visible = true
        Player.PlayerGui.ScreenGui.EventChallenges.Frame.Close.Frame.Button.MouseButton1Click:Connect(function()
		    Toggled20 = false
		    Item24.BackgroundColor3 = Color3.fromRGB(70,70,70)
		    Player.PlayerGui.ScreenGui.EventChallenges.Visible = false
	    end)
    end
end)

local Item25 = Instance.new("TextButton")
Item25.Position = UDim2.new(0,1,0,503)
Item25.Size = UDim2.new(0,140,0,20)
Item25.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item25.BorderColor3 = Color3.new(1,1,1)
Item25.ZIndex = 2
Item25.Parent = CmdHandler3
Item25.Text = ""
Item25.TextColor3 = Color3.fromRGB(250,250,250)
Item25.TextScaled = true
Item25.Visible = false
Item25.MouseButton1Click:Connect(function()
        if Toggled25 then
        Toggled25 = false
        Item25.BackgroundColor3 = Color3.new(0,0,0)
        Item25.Text = ""
        Item25.TextColor = BrickColor.new(1)
        game:GetService("CoreGui").ScreenGui.Enabled = false
    else
        Toggled25 = true
        Item25.BackgroundColor3 = Color3.new(1,0.5,1)
        Item25.Text = "Hello"
        Item25.TextColor = BrickColor.new(26)
        end
end)

local Item26 = Instance.new("TextButton")
Item26.Position = UDim2.new(0,1,0,21)
Item26.Size = UDim2.new(0,140,0,20)
Item26.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item26.BorderColor3 = Color3.new(1,1,1)
Item26.ZIndex = 2
Item26.Parent = CmdHandler8
Item26.Text = "Quests"
Item26.TextColor3 = Color3.fromRGB(250,250,250)
Item26.TextScaled = true
Item26.MouseButton1Click:Connect(function()
    if Toggled22 then
		Toggled22 = false
		Item26.BackgroundColor3 = Color3.fromRGB(70,70,70)
		Player.PlayerGui.ScreenGui.Quests.Visible = false
	else
		Toggled22 = true
		Item26.BackgroundColor3 = Color3.new(0,1,1)
		Player.PlayerGui.ScreenGui.Quests.Visible = true
		Player.PlayerGui.ScreenGui.Quests.Frame.Close.Frame.Button.MouseButton1Click:Connect(function()
		    Toggled22 = false
		    Item26.BackgroundColor3 = Color3.fromRGB(70,70,70)
		    Player.PlayerGui.ScreenGui.Quests.Visible = false
	    end)
    end
end)

local Item27 = Instance.new("TextButton")
Item27.Position = UDim2.new(0,1,0,42)
Item27.Size = UDim2.new(0,140,0,20)
Item27.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item27.BorderColor3 = Color3.new(1,1,1)
Item27.ZIndex = 2
Item27.Parent = CmdHandler8
Item27.Text = "Forge"
Item27.TextColor3 = Color3.fromRGB(250,250,250)
Item27.TextScaled = true
Item27.MouseButton1Click:Connect(function()
    if Toggled23 then
		Toggled23 = false
		Item27.BackgroundColor3 = Color3.fromRGB(70,70,70)
		Player.PlayerGui.ScreenGui.Forge.Visible = false
	else
		Toggled23 = true
		Item27.BackgroundColor3 = Color3.new(0,1,1)
		Player.PlayerGui.ScreenGui.Forge.Visible = true
		Player.PlayerGui.ScreenGui.Forge.Frame.Close.Frame.Button.MouseButton1Click:Connect(function()
		    Toggled23 = false
		    Item27.BackgroundColor3 = Color3.fromRGB(70,70,70)
		    Player.PlayerGui.ScreenGui.Forge.Visible = false
	    end)
    end
end)

local Item28 = Instance.new("TextButton")
Item28.Position = UDim2.new(0,1,0,563)
Item28.Size = UDim2.new(0,140,0,20)
Item28.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item28.BorderColor3 = Color3.new(1,1,1)
Item28.ZIndex = 2
Item28.Parent = CmdHandler8
Item28.Text = ""
Item28.TextColor3 = Color3.fromRGB(250,250,250)
Item28.TextScaled = true
Item28.Visible = false
Item28.MouseButton1Click:Connect(function()
    if Toggled24 then
		Toggled24 = false
		Item28.BackgroundColor3 = Color3.fromRGB(70,70,70)
		Item28.Text = ""
	else
		Toggled24 = true
		Item28.BackgroundColor3 = Color3.new(1,0,1)
		Item28.Text = "blep"
    end
end)

local Item29 = Instance.new("TextButton")
Item29.Position = UDim2.new(0,1,0,84)
Item29.Size = UDim2.new(0,140,0,20)
Item29.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item29.BorderColor3 = Color3.new(1,1,1)
Item29.ZIndex = 2
Item29.Parent = CmdHandler3
Item29.Text = "Auto Gem Factory"
Item29.TextColor3 = Color3.fromRGB(250,250,250)
Item29.TextScaled = true
Item29.MouseButton1Click:Connect(function()
    if Toggled26 then
		Toggled26 = false
		Item29.BackgroundColor3 = Color3.fromRGB(70,70,70)
	else
		Toggled26 = true
		Item29.BackgroundColor3 = Color3.new(0,1,1)
		while Toggled26 do
		    wait()
		    local args = {
            [1] = 1}
            game:GetService("ReplicatedStorage").Events.ClaimFactoryCraft:FireServer(unpack(args))
            wait()
            local args = {
            [1] = 2}
            game:GetService("ReplicatedStorage").Events.ClaimFactoryCraft:FireServer(unpack(args))
            wait()
            local args = {
            [1] = 3}
            game:GetService("ReplicatedStorage").Events.ClaimFactoryCraft:FireServer(unpack(args))
            wait()
            local args = {
            [1] = "Shells 4",
            [2] = 1}
            game:GetService("ReplicatedStorage").Events.StartFactoryCraft:FireServer(unpack(args))
            wait()
            local args = {
            [1] = "Shells 4",
            [2] = 2}
            game:GetService("ReplicatedStorage").Events.StartFactoryCraft:FireServer(unpack(args))
            wait()
            local args = {
            [1] = "Shells 4",
            [2] = 3}
            game:GetService("ReplicatedStorage").Events.StartFactoryCraft:FireServer(unpack(args))
            wait(451)
        end
	end
end)

local Item30 = Instance.new("TextButton")
Item30.Position = UDim2.new(0,1,0,105)
Item30.Size = UDim2.new(0,140,0,20)
Item30.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item30.BorderColor3 = Color3.new(1,1,1)
Item30.ZIndex = 2
Item30.Parent = CmdHandler3
Item30.Text = "Auto Buy Boosts"
Item30.TextColor3 = Color3.fromRGB(250,250,250)
Item30.TextScaled = true
Item30.MouseButton1Click:Connect(function()
    if Toggled27 then
		Toggled27 = false
		Item30.BackgroundColor3 = Color3.fromRGB(70,70,70)
	else
		Toggled27 = true
		Item30.BackgroundColor3 = Color3.new(0,1,1)
		while Toggled27 do
		    wait()
		    local args = {
            [1] = "Omega Lucky",
            [2] = 2}
            game:GetService("ReplicatedStorage").Events.BuyBoost:FireServer(unpack(args))
            wait()
            local args = {
            [1] = "Omega Lucky",
            [2] = 1}
            game:GetService("ReplicatedStorage").Events.BuyBoost:FireServer(unpack(args))
            wait()
            local args = {
            [1] = "Super Lucky",
            [2] = 2}
            game:GetService("ReplicatedStorage").Events.BuyBoost:FireServer(unpack(args))
            wait()
            for i = 1,3 do
                local args = {
                [1] = "Super Lucky",
                [2] = 1}
                game:GetService("ReplicatedStorage").Events.BuyBoost:FireServer(unpack(args))
                wait()
            end
            for i = 1,2 do
                local args = {
                [1] = "Lucky",
                [2] = 2}
                game:GetService("ReplicatedStorage").Events.BuyBoost:FireServer(unpack(args))
                wait()
            end
            for i = 1,4 do
                local args = {
                [1] = "Lucky",
                [2] = 1}
                game:GetService("ReplicatedStorage").Events.BuyBoost:FireServer(unpack(args))
                wait()
            end
            wait(5000)
        end
	end
end)


local function redeemSpins()
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClaimSpinToWin"):FireServer()

    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BuySpinToWin"):FireServer()

    task.wait(300)
end

local function autoSpinToWin()
    local amount = Player.PlayerGui.ScreenGui.SpinToWin.Frame.Container.Spins.Count.Text
    
    if amount ~= "0" then
        
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PlaySpinToWin"):FireServer()
    
    end
    
    task.wait(5)
end

local spinToWin = Instance.new("TextButton")
spinToWin.Position = UDim2.new(0,1,0,147)
spinToWin.Size = UDim2.new(0,140,0,20)
spinToWin.BackgroundColor3 = Color3.fromRGB(70,70,70)
spinToWin.BorderColor3 = Color3.new(1,1,1)
spinToWin.ZIndex = 2
spinToWin.Parent = CmdHandler3
spinToWin.Text = "Redeem Spin-to-win"
spinToWin.TextColor3 = Color3.fromRGB(250,250,250)
spinToWin.TextScaled = true
spinToWin.Visible = true
spinToWin.MouseButton1Click:Connect(function()
    if spinToWinToggle then
		spinToWinToggle = false
		spinToWin.BackgroundColor3 = Color3.fromRGB(70,70,70)
	else
		spinToWinToggle = true
		spinToWin.BackgroundColor3 = Color3.new(0,1,1)
        while spinToWinToggle do
            redeemSpins()
		end
    end
end)

local autoSpin = Instance.new("TextButton")
autoSpin.Position = UDim2.new(0,1,0,168)
autoSpin.Size = UDim2.new(0,140,0,20)
autoSpin.BackgroundColor3 = Color3.fromRGB(70,70,70)
autoSpin.BorderColor3 = Color3.new(1,1,1)
autoSpin.ZIndex = 2
autoSpin.Parent = CmdHandler3
autoSpin.Text = "Auto Spin-to-win"
autoSpin.TextColor3 = Color3.fromRGB(250,250,250)
autoSpin.TextScaled = true
autoSpin.Visible = true
autoSpin.MouseButton1Click:Connect(function()
    if autoSpinToggle then
		autoSpinToggle = false
		autoSpin.BackgroundColor3 = Color3.fromRGB(70,70,70)
	else
		autoSpinToggle = true
		autoSpin.BackgroundColor3 = Color3.new(0,1,1)
        while autoSpinToggle do
            autoSpinToWin()
		end
    end
end)

local Item31 = Instance.new("TextButton")
Item31.Position = UDim2.new(0,1,0,42)
Item31.Size = UDim2.new(0,140,0,20)
Item31.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item31.BorderColor3 = Color3.new(1,1,1)
Item31.ZIndex = 2
Item31.Parent = CmdHandler9
Item31.Text = "@ Atlantis"
Item31.TextColor3 = Color3.fromRGB(250,250,250)
Item31.TextScaled = true
Item31.MouseButton1Click:Connect(function()
    if Toggled28 then
        Toggled28 = false
        Item31.BackgroundColor3 = Color3.fromRGB(70,70,70)
        Item31.Text = "@ Atlantis"
        Item31.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled28 = true
        Item31.BackgroundColor3 = Color3.new(0,1,1)
        Item31.Text = "Auto-Selling"
        Item31.TextColor3 = Color3.fromRGB(0,0,0)
        local Player = game.Players.LocalPlayer
        local TS = game:GetService('TweenService')
        local HR = Player.Character.HumanoidRootPart
        local playerPosition = HR.Position
        while Toggled28 == true do
            wait()
            if Player.PlayerGui.ScreenGui.HUD.MiningFrame.Bar.Health.Text == "Backpack Full" then
                playerPosition = HR.Position
                wait(0.5)
                local args = {[1] = "City of GoldSell"}game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
                wait(0.5)
                print(playerPosition.X, HR.Position.Y, playerPosition.Z)
                print(HR.Position)
                Point = Vector3.new(playerPosition.X, HR.Position.Y, playerPosition.Z)
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                tween:Play()
                wait(Time)
                tween = TS:Create(HR, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(playerPosition)})
                tween:Play()
                wait(0.5)
            end     
        end
    end
end)

local Candysell = Instance.new("TextButton")
Candysell.Position = UDim2.new(0,1,0,63)
Candysell.Size = UDim2.new(0,140,0,20)
Candysell.BackgroundColor3 = Color3.fromRGB(70,70,70)
Candysell.BorderColor3 = Color3.new(1,1,1)
Candysell.ZIndex = 2
Candysell.Parent = CmdHandler9
Candysell.Text = "@ Candyland"
Candysell.TextColor3 = Color3.fromRGB(250,250,250)
Candysell.TextScaled = true
Candysell.MouseButton1Click:Connect(function()
    if Toggled33 then
        Toggled33 = false
        Candysell.BackgroundColor3 = Color3.fromRGB(70,70,70)
        Candysell.Text = "@ Candyland"
        Candysell.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled33 = true
        Candysell.BackgroundColor3 = Color3.new(0,1,1)
        Candysell.Text = "Auto-Selling"
        Candysell.TextColor3 = Color3.fromRGB(0,0,0)
        local Player = game.Players.LocalPlayer
        local TS = game:GetService('TweenService')
        local HR = Player.Character.HumanoidRootPart
        local playerPosition = HR.Position
        while Toggled33 == true do
            wait()
            if Player.PlayerGui.ScreenGui.HUD.MiningFrame.Bar.Health.Text == "Backpack Full" then
                playerPosition = HR.Position
                wait(0.5)
                local args = {[1] = "Cupcake CavernSell"}game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
                wait(0.5)
                print(playerPosition.X, HR.Position.Y, playerPosition.Z)
                print(HR.Position)
                Point = Vector3.new(playerPosition.X, HR.Position.Y, playerPosition.Z)
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                tween:Play()
                wait(Time)
                tween = TS:Create(HR, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(playerPosition)})
                tween:Play()
                wait(0.5)
            end     
        end
    end
end)

--34869, 5, -58
local Blocksell = Instance.new("TextButton")
Blocksell.Position = UDim2.new(0,1,0,84)
Blocksell.Size = UDim2.new(0,140,0,20)
Blocksell.BackgroundColor3 = Color3.fromRGB(70,70,70)
Blocksell.BorderColor3 = Color3.new(1,1,1)
Blocksell.ZIndex = 2
Blocksell.Parent = CmdHandler9
Blocksell.Text = "@ Toyland"
Blocksell.TextColor3 = Color3.fromRGB(250,250,250)
Blocksell.TextScaled = true
Blocksell.MouseButton1Click:Connect(function()
    if Toggled34 then
        Toggled34 = false
        Blocksell.BackgroundColor3 = Color3.fromRGB(70,70,70)
        Blocksell.Text = "@ Toyland"
        Blocksell.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled34 = true
        Blocksell.BackgroundColor3 = Color3.new(0,1,1)
        Blocksell.Text = "Auto-Selling"
        Blocksell.TextColor3 = Color3.fromRGB(0,0,0)
        local Player = game.Players.LocalPlayer
        local TS = game:GetService('TweenService')
        local HR = Player.Character.HumanoidRootPart
        local playerPosition = HR.Position
        while Toggled34 == true do
            wait()
            if Player.PlayerGui.ScreenGui.HUD.MiningFrame.Bar.Health.Text == "Backpack Full" then
                playerPosition = HR.Position
                wait(0.5)
                local args = {[1] = "Building DepthsSell"}game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
                wait(0.5)
                print(playerPosition.X, HR.Position.Y, playerPosition.Z)
                print(HR.Position)
                Point = Vector3.new(playerPosition.X, HR.Position.Y, playerPosition.Z)
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                tween:Play()
                wait(Time)
                tween = TS:Create(HR, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(playerPosition)})
                tween:Play()
                wait(0.5)
            end     
        end
    end
end)

local BellSell = Instance.new("TextButton")
BellSell.Position = UDim2.new(0,1,0,105)
BellSell.Size = UDim2.new(0,140,0,20)
BellSell.BackgroundColor3 = Color3.fromRGB(70,70,70)
BellSell.BorderColor3 = Color3.new(1,1,1)
BellSell.ZIndex = 2
BellSell.Parent = CmdHandler9
BellSell.Text = "@ Mystic Forest"
BellSell.TextColor3 = Color3.fromRGB(250,250,250)
BellSell.TextScaled = true
BellSell.MouseButton1Click:Connect(function()
    if BellSellToggle then
        BellSellToggle = false
        BellSell.BackgroundColor3 = Color3.fromRGB(70,70,70)
        BellSell.Text = "@ Mystic Forest"
        BellSell.TextColor3 = Color3.fromRGB(250,250,250)
    else
        BellSellToggle = true
        BellSell.BackgroundColor3 = Color3.new(0,1,1)
        BellSell.Text = "Auto-Selling"
        BellSell.TextColor3 = Color3.fromRGB(0,0,0)
        local Player = game.Players.LocalPlayer
        local TS = game:GetService('TweenService')
        local HR = Player.Character.HumanoidRootPart
        local playerPosition = HR.Position
        while BellSellToggle == true do
            wait()
            if Player.PlayerGui.ScreenGui.HUD.MiningFrame.Bar.Health.Text == "Backpack Full" then
                
                playerPosition = HR.Position
                wait(0.5)
                local args = {[1] = "Mystic CavernSell"}game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
                wait(0.5)
                
                Point = Vector3.new(playerPosition.X, HR.Position.Y, playerPosition.Z)
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                tween:Play()
                wait(Time)
                tween = TS:Create(HR, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(playerPosition)})
                tween:Play()
                wait(0.5)
            end     
        end
    end
end)

local rainbowSell = Instance.new("TextButton")
rainbowSell.Position = UDim2.new(0,1,0,126)
rainbowSell.Size = UDim2.new(0,140,0,20)
rainbowSell.BackgroundColor3 = Color3.fromRGB(70,70,70)
rainbowSell.BorderColor3 = Color3.new(1,1,1)
rainbowSell.ZIndex = 2
rainbowSell.Parent = CmdHandler9
rainbowSell.Text = "@ Rainbow Land"
rainbowSell.TextColor3 = Color3.fromRGB(250,250,250)
rainbowSell.TextScaled = true
rainbowSell.MouseButton1Click:Connect(function()
    if rainbowSellToggle then
        rainbowSellToggle = false
        rainbowSell.BackgroundColor3 = Color3.fromRGB(70,70,70)
        rainbowSell.Text = "@ Rainbow Land"
        rainbowSell.TextColor3 = Color3.fromRGB(250,250,250)
    else
        rainbowSellToggle = true
        rainbowSell.BackgroundColor3 = Color3.new(0,1,1)
        rainbowSell.Text = "Auto-Selling"
        rainbowSell.TextColor3 = Color3.fromRGB(0,0,0)
        local Player = game.Players.LocalPlayer
        local TS = game:GetService('TweenService')
        local HR = Player.Character.HumanoidRootPart
        local playerPosition = HR.Position
        while rainbowSellToggle == true do
            wait()
            if Player.PlayerGui.ScreenGui.HUD.MiningFrame.Bar.Health.Text == "Backpack Full" then
                
                playerPosition = HR.Position
                wait(0.5)
                local args = {[1] = "Violet ForestSell"}game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
                wait(0.5)
                
                Point = Vector3.new(playerPosition.X, HR.Position.Y, playerPosition.Z)
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                tween:Play()
                wait(Time)
                tween = TS:Create(HR, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(playerPosition)})
                tween:Play()
                wait(0.5)
            end     
        end
    end
end)


local rainbowSell = Instance.new("TextButton")
rainbowSell.Position = UDim2.new(0,1,0,147)
rainbowSell.Size = UDim2.new(0,140,0,20)
rainbowSell.BackgroundColor3 = Color3.fromRGB(70,70,70)
rainbowSell.BorderColor3 = Color3.new(1,1,1)
rainbowSell.ZIndex = 2
rainbowSell.Parent = CmdHandler9
rainbowSell.Text = "@ Spring World"
rainbowSell.TextColor3 = Color3.fromRGB(250,250,250)
rainbowSell.TextScaled = true
rainbowSell.MouseButton1Click:Connect(function()
    if rainbowSellToggle then
        rainbowSellToggle = false
        rainbowSell.BackgroundColor3 = Color3.fromRGB(70,70,70)
        rainbowSell.Text = "@ Spring World"
        rainbowSell.TextColor3 = Color3.fromRGB(250,250,250)
    else
        rainbowSellToggle = true
        rainbowSell.BackgroundColor3 = Color3.new(0,1,1)
        rainbowSell.Text = "Auto-Selling"
        rainbowSell.TextColor3 = Color3.fromRGB(0,0,0)
        local Player = game.Players.LocalPlayer
        local TS = game:GetService('TweenService')
        local HR = Player.Character.HumanoidRootPart
        local playerPosition = HR.Position
        while rainbowSellToggle == true do
            wait()
            if Player.PlayerGui.ScreenGui.HUD.MiningFrame.Bar.Health.Text == "Backpack Full" then
                
                playerPosition = HR.Position
                wait(0.5)
                local args = {[1] = "Spring World SurfaceSell"}game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
                wait(0.5)
                
                Point = Vector3.new(playerPosition.X, HR.Position.Y, playerPosition.Z)
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                tween:Play()
                wait(Time)
                tween = TS:Create(HR, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(playerPosition)})
                tween:Play()
                wait(0.5)
            end     
        end
    end
end)


local function getBlockFolders()
    local folders = {}
    for i,chunky in pairs(game.Workspace.Chunks:GetChildren()) do
        table.insert(folders, chunky)
    end
    return folders
end

local function getBlocks()
    local folders = getBlockFolders()
    for i,chunk in pairs(folders) do
        for i,ores in pairs(chunk:GetChildren()) do
            if (HR.Position -  ores.Position).Magnitude < 20 then
                for _,list in pairs(oreList) do
                    if ores.Name == list.Name  then
                    local PlayerPos = HR.Position
                    game.ReplicatedStorage.Events.MineBlock:FireServer(ChunkUtil.worldToCell(PlayerPos - (PlayerPos - ores.Position)))
                    end
                end
            end
        end
    end
end

local Item32 = Instance.new("TextButton")
Item32.Position = UDim2.new(0,1,0,42)
Item32.Size = UDim2.new(0,140,0,20)
Item32.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item32.BorderColor3 = Color3.new(1,1,1)
Item32.ZIndex = 2
Item32.Parent = CmdHandler3
Item32.Text = "Ore Aura"
Item32.TextColor3 = Color3.fromRGB(250,250,250)
Item32.TextScaled = true
Item32.MouseButton1Click:Connect(function()
    if Toggled29 then
        Toggled29 = false
        Item32.BackgroundColor3 = Color3.fromRGB(70,70,70)
        Item32.Text = "Ore Aura"
        Item32.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled29 = true
        Item32.BackgroundColor3 = Color3.new(0,1,1)
        Item32.Text = "Mining Nearby Ores"
        Item32.TextColor3 = Color3.fromRGB(0,0,0)
        local ChunkUtil = require(game.ReplicatedStorage.SharedModules.ChunkUtil)
        local HR = game.Players.LocalPlayer.Character.HumanoidRootPart
        while Toggled29 == true do
            task.wait()
            getBlocks()
        end
    end
end)

local Item33 = Instance.new("TextButton")
Item33.Position = UDim2.new(0,1,0,21)
Item33.Size = UDim2.new(0,140,0,20)
Item33.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item33.BorderColor3 = Color3.new(1,1,1)
Item33.ZIndex = 2
Item33.Parent = CmdHandler9
Item33.Text = "@ Cyber Galaxy"
Item33.TextColor3 = Color3.fromRGB(250,250,250)
Item33.TextScaled = true
Item33.MouseButton1Click:Connect(function()
    if Toggled31 then
        Toggled31 = false
        Item33.BackgroundColor3 = Color3.fromRGB(70,70,70)
        Item33.Text = "@ Cyber Galaxy"
        Item33.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled31 = true
        Item33.BackgroundColor3 = Color3.new(0,1,1)
        Item33.Text = "Auto-Selling"
        Item33.TextColor3 = Color3.fromRGB(0,0,0)
        local Player = game.Players.LocalPlayer
        local TS = game:GetService('TweenService')
        local HR = Player.Character.HumanoidRootPart
        local playerPosition = HR.Position
        while Toggled31 == true do
            wait()
            if Player.PlayerGui.ScreenGui.HUD.MiningFrame.Bar.Health.Text == "Backpack Full" then
                playerPosition = HR.Position
                wait(0.5)
                local args = {[1] = "Glitched ChasmSell"}game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
                wait(0.5)
                print(playerPosition.X, HR.Position.Y, playerPosition.Z)
                print(HR.Position)
                Point = Vector3.new(playerPosition.X, HR.Position.Y, playerPosition.Z)
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                tween:Play()
                wait(Time)
                tween = TS:Create(HR, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(playerPosition)})
                tween:Play()
                wait(0.5)
            end     
        end
    end
end)

local Item34 = Instance.new("TextButton")
Item34.Position = UDim2.new(0,1,0,1)
Item34.Size = UDim2.new(0,140,0,20)
Item34.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item34.BorderColor3 = Color3.new(1,1,1)
Item34.ZIndex = 2
Item34.Parent = CmdHandler9
Item34.Text = "@ Overworld"
Item34.TextColor3 = Color3.fromRGB(250,250,250)
Item34.TextScaled = true
Item34.MouseButton1Click:Connect(function()
    if Toggled32 then
        Toggled32 = false
        Item34.BackgroundColor3 = Color3.fromRGB(70,70,70)
        Item34.Text = "@ Overworld"
        Item34.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled32 = true
        Item34.BackgroundColor3 = Color3.new(0,1,1)
        Item34.Text = "Auto-Selling"
        Item34.TextColor3 = Color3.fromRGB(0,0,0)
        local Player = game.Players.LocalPlayer
        local TS = game:GetService('TweenService')
        local HR = Player.Character.HumanoidRootPart
        local playerPosition = HR.Position
        while Toggled32 == true do
            wait()
            if Player.PlayerGui.ScreenGui.HUD.MiningFrame.Bar.Health.Text == "Backpack Full" then
                playerPosition = HR.Position
                wait(0.5)
                local args = {[1] = "Crystal CavernSell"}game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
                wait(0.5)
                print(playerPosition.X, HR.Position.Y, playerPosition.Z)
                print(HR.Position)
                Point = Vector3.new(playerPosition.X, HR.Position.Y, playerPosition.Z)
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                tween:Play()
                wait(Time)
                tween = TS:Create(HR, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(playerPosition)})
                tween:Play()
                wait(0.5)
            end     
        end
    end
end)

local Lable2 = Instance.new("TextLabel")
Lable2.Position = UDim2.new(0,0,0,70)
Lable2.Size = UDim2.new(0,145,0,90)
Lable2.BackgroundColor3 = Color3.fromRGB(70,70,70)
Lable2.BorderColor3 = Color3.new(0,0,0)
Lable2.ZIndex = 2
Lable2.Parent = CmdHandler4
Lable2.Text = "Some examples:\nlarimar, fireshard, mythril, chromite, iridium, glitchium"
Lable2.TextColor3 = Color3.fromRGB(250,250,250)
Lable2.TextScaled = true

local Lable3 = Instance.new("TextLabel")
Lable3.Position = UDim2.new(0,0,0,120)
Lable3.Size = UDim2.new(0,140,0,60)
Lable3.BackgroundColor3 = Color3.fromRGB(25,25,25)
Lable3.BorderSizePixel = 0
Lable3.ZIndex = 2
Lable3.Parent = CmdHandler7
Lable3.Text = Plr.PlayerGui.ScreenGui.Forge.Frame.Container.Fireshards.Label.Text.." FireShards"
Plr.PlayerGui.ScreenGui.Forge.Frame.Container.Fireshards.Label:GetPropertyChangedSignal("Text"):Connect(function()
Lable3.Text = Plr.PlayerGui.ScreenGui.Forge.Frame.Container.Fireshards.Label.Text.." FireShards"
end)
Lable3.TextColor3 = Color3.fromRGB(250,250,250)
Lable3.TextScaled = true

-- this probably needs to be under everything
local Blocks = Instance.new("TextLabel")
Blocks.Position = UDim2.new(0,1,0,1)
Blocks.Size = UDim2.new(0,140,0,40)
Blocks.BackgroundColor3 = Color3.new(0,0,0)
Blocks.BorderSizePixel = 0
Blocks.ZIndex = 2
Blocks.Parent = CmdHandler5
Blocks.Text = game:GetService("Workspace").Worlds["The Overworld"].Sign.Display.SurfaceGui.Info.Text
Blocks.TextColor3 = Color3.fromRGB(250,250,250)
Blocks.TextScaled = true
game:GetService("Workspace").Worlds["The Overworld"].Sign.Display.SurfaceGui.Info:GetPropertyChangedSignal("Text"):Connect(function()
Blocks.Text = game:GetService("Workspace").Worlds["The Overworld"].Sign.Display.SurfaceGui.Info.Text
end)

local Blocks2 = Instance.new("TextLabel")
Blocks2.Position = UDim2.new(0,1,0,84)
Blocks2.Size = UDim2.new(0,140,0,40)
Blocks2.BackgroundColor3 = Color3.new(0,0,0)
Blocks2.BorderSizePixel = 0
Blocks2.ZIndex = 2
Blocks2.Parent = CmdHandler5
Blocks2.Text = Plr.PlayerGui.ScreenGui.HUD.Left.CyberTokens.Label.Text.." Cyber Tokens"
Blocks2.Font = "SciFi"
Blocks2.TextColor3 = Color3.fromRGB(50,250,250)
Blocks2.TextScaled = true
Plr.PlayerGui.ScreenGui.HUD.Left.CyberTokens.Label:GetPropertyChangedSignal("Text"):Connect(function()
Blocks2.Text = Plr.PlayerGui.ScreenGui.HUD.Left.CyberTokens.Label.Text.." Cyber Tokens"
end)

local Blocks3 = Instance.new("TextLabel")
Blocks3.Position = UDim2.new(0,1,0,42)
Blocks3.Size = UDim2.new(0,140,0,40)
Blocks3.BackgroundColor3 = Color3.new(0,0,0)
Blocks3.BorderSizePixel = 0
Blocks3.ZIndex = 2
Blocks3.Parent = CmdHandler5
repeat wait() until Plr:FindFirstChild("leaderstats")
Blocks3.Text = Plr.leaderstats.Coins.Value.." Coins"
Blocks3.Font = "Fantasy"
Blocks3.TextColor3 = Color3.fromRGB(250,250,50)
Blocks3.TextScaled = true
Plr.leaderstats.Coins:GetPropertyChangedSignal("Value"):Connect(function()
Blocks3.Text = Plr.leaderstats.Coins.Value.." Coins"
end)
