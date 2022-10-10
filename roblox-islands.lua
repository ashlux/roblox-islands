repeat wait() 
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
	local mouse = game.Players.LocalPlayer:GetMouse() 
	repeat wait() until mouse
	print("Loading")
local Character = game.Players.LocalPlayer.Character
local mouse = game.Players.LocalPlayer:GetMouse()
repeat wait() until mouse
local Island = ""
for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
    Island = island
end
local plr = game.Players.LocalPlayer
local torso = plr.Character.LowerTorso
local flying = false
local deb = true 
local ctrl = {f = 0, b = 0, l = 0, r = 0} 
local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
local maxspeed = 25
local speed = 25
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

local function NoclipLoop()
    if noClip == true then
        for _, child in pairs(Character:GetDescendants()) do
            if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                child.CanCollide = false
            end
    	end
    end
end

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

local function AntiAFK()
  game:GetService('Players').LocalPlayer.Idled:Connect(function()
  game:GetService('VirtualUser'):CaptureController();
  wait();
  game:GetService('VirtualUser'):ClickButton2(Vector2.new(0,0))
  end)
  end
spawn(AntiAFK)

local CmdGui = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local CmdHandler = Instance.new("ScrollingFrame")
local Close = Instance.new("TextButton")
local Minimum = Instance.new("TextButton")
local CmdName = Instance.new("TextButton")
local Plr = game.Players.LocalPlayer
local GetM = Plr:GetMouse()
local Character = game.Players.LocalPlayer.Character
local VirtualInputManager = game:GetService("VirtualInputManager")
local TS = game:GetService('TweenService')
local HR = getRoot(Character)
local HttpService = game:GetService("HttpService")

Toggled1 = false Toggled2 = false Toggled3 = false Toggled4 = false Toggled5 = false Toggled6 = false Toggled7 = false Toggled8 = false Toggled9 = false Toggled10 = false Toggled11 = false Toggled12 = false Toggled13 = false Toggled14 = false Toggled15 = false Toggled16 = false Toggled17 = false Toggled18 = false Toggled19 = false Toggled20 = false Toggled21 = false Toggled22 = false Toggled23 = false Toggled24 = false Toggled25 = false Toggled26 = false Toggled27 = false Toggled28 = false Toggled29 = false Toggled30 = false Toggled31 = false Toggled32 = false Toggled33 = false Toggled34 = false Toggled35 = false Toggled36 = false Toggled37 = false Toggled38 = false Toggled39 = false Toggled40 = false Toggled41 = false Toggled42 = false Toggled43 = false Toggled44 = false Toggled45 = false Toggled46 = false Toggled47 = false Toggled48 = false Toggled49 = false Toggled50 = false Toggled51 = false Toggled52 = false Toggled53 = false Toggled54 = false Toggled55 = false Toggled56 = false Toggled57 = false Toggled58 = false Toggled59 = false Toggled60 = false Toggled61 = false Toggled62 = false Toggled63 = false Toggled64 = false Toggled65 = false Toggled66 = false Toggled67 = false Toggled68 = false Toggled69 = false Toggled70 = false Toggled71 = false Toggled72 = false Toggled73 = false Toggled74 = false Toggled75 = false Toggled76 = false Toggled77 = false Toggled78 = false Toggled79 = false Toggled80 = false Toggled81 = false Toggled82 = false Toggled83 = false Toggled84 = false
Toggled85 = false Toggled86 = false Toggled87 = false


CmdGui.Name = "CmdGui"
CmdGui.Parent = game:GetService("CoreGui")

Background.Name = "Background"
Background.Parent = CmdGui
Background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background.BorderSizePixel = 0
Background.BorderColor3 = Color3.new(1,0,1)
Background.Position = UDim2.new(0.06, 0, 0.20, 0)
Background.Size = UDim2.new(0, 120, 0, 220)
Background.Active = true

Background2 = Instance.new("Frame")
Background2.Name = "Background2"
Background2.Parent = Background
Background2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background2.BorderSizePixel = 0
Background2.BorderColor3 = Color3.new(1,0,1)
Background2.Position = UDim2.new(1, 0, 0.1, 0)
Background2.Size = UDim2.new(0, 150, 0, 165)
Background2.Active = true
Background2.Visible = false

Background3 = Instance.new("Frame")
Background3.Name = "Background3"
Background3.Parent = Background
Background3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background3.BorderSizePixel = 0
Background3.BorderColor3 = Color3.new(1,0,1)
Background3.Position = UDim2.new(1, 0, 0.3, 0)
Background3.Size = UDim2.new(0, 120, 0, 125)
Background3.Active = true
Background3.Visible = false

Background4 = Instance.new("Frame")
Background4.Name = "Background4"
Background4.Parent = Background
Background4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background4.BorderSizePixel = 0
Background4.BorderColor3 = Color3.new(1,0,1)
Background4.Position = UDim2.new(1, 0, 0.1, 0)
Background4.Size = UDim2.new(0, 150, 0, 170)
Background4.Active = true
Background4.Visible = false

Background5 = Instance.new("Frame")
Background5.Name = "Background5"
Background5.Parent = Background
Background5.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background5.BorderSizePixel = 0
Background5.BorderColor3 = Color3.new(1,0,1)
Background5.Position = UDim2.new(1, 0, 0.3, 0)
Background5.Size = UDim2.new(0, 150, 0, 125)
Background5.Active = true
Background5.Visible = false

Background6 = Instance.new("Frame")
Background6.Name = "Background6"
Background6.Parent = Background
Background6.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background6.BorderSizePixel = 0
Background6.BorderColor3 = Color3.new(1,0,1)
Background6.Position = UDim2.new(1, 0, 0.2, 0)
Background6.Size = UDim2.new(0, 110, 0, 90)
Background6.Active = true
Background6.Visible = false

Background8 = Instance.new("Frame")
Background8.Name = "Players"
Background8.Parent = Background
Background8.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background8.BorderSizePixel = 0
Background8.BorderColor3 = Color3.new(1,0,1)
Background8.Position = UDim2.new(1, 0, 0.1, 0)
Background8.Size = UDim2.new(0, 150, 0, 190)
Background8.Active = true
Background8.Visible = false

Background7 = Instance.new("Frame")
Background7.Name = "Background"
Background7.Parent = Background8
Background7.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background7.BorderSizePixel = 0
Background7.BorderColor3 = Color3.new(1,0,1)
Background7.Position = UDim2.new(1, 0, 0.1, 0)
Background7.Size = UDim2.new(0, 120, 0, 190)
Background7.Active = true
Background7.Visible = false

Background9 = Instance.new("Frame")
Background9.Name = "Background9"
Background9.Parent = Background4
Background9.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background9.BorderSizePixel = 0
Background9.BorderColor3 = Color3.new(1,0,1)
Background9.Position = UDim2.new(1, 0, 0.1, 0)
Background9.Size = UDim2.new(0, 105, 0, 150)
Background9.Active = true
Background9.Visible = false

Background10 = Instance.new("Frame")
Background10.Name = "Background10"
Background10.Parent = Background
Background10.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background10.BorderSizePixel = 0
Background10.BorderColor3 = Color3.new(1,0,1)
Background10.Position = UDim2.new(1, 0, 0.05, 0)
Background10.Size = UDim2.new(0, 150, 0, 200)
Background10.Active = true
Background10.Visible = false

Background11 = Instance.new("Frame")
Background11.Name = "Background11"
Background11.Parent = Background
Background11.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background11.BorderSizePixel = 0
Background11.BorderColor3 = Color3.new(1,0,1)
Background11.Position = UDim2.new(1, 0, 0.05, 0)
Background11.Size = UDim2.new(0, 150, 0, 200)
Background11.Active = true
Background11.Visible = false

Background12 = Instance.new("Frame")
Background12.Name = "Background12"
Background12.Parent = Background
Background12.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background12.BorderSizePixel = 0
Background12.BorderColor3 = Color3.new(1,0,1)
Background12.Position = UDim2.new(1, 0, 0.05, 0)
Background12.Size = UDim2.new(0, 150, 0, 200)
Background12.Active = true
Background12.Visible = false

Playerz = Instance.new("TextLabel")
Playerz.Name = "Playrz"
Playerz.Parent = Background7
Playerz.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Playerz.BorderSizePixel = 0
Playerz.Size = UDim2.new(0, 120, 0, 15)
Playerz.Font = Enum.Font.GothamBlack
Playerz.Text = "Players"
Playerz.TextColor3 = Color3.fromRGB(255, 255, 255)
Playerz.TextScaled = true
Playerz.TextSize = 14.000
Playerz.TextWrapped = true

PlrCmdHandler = Instance.new("ScrollingFrame")
PlrCmdHandler.Name = "CmdHandler"
PlrCmdHandler.Parent = Background7
PlrCmdHandler.Active = true
PlrCmdHandler.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
PlrCmdHandler.BackgroundTransparency = 1.000
PlrCmdHandler.BorderSizePixel = 0
PlrCmdHandler.AutomaticCanvasSize = "Y"
PlrCmdHandler.Position = UDim2.new(0.05, 0, 0.08, 0)
PlrCmdHandler.Size = UDim2.new(0, 113, 0, 170)
PlrCmdHandler.ScrollBarThickness = 4

MachineHandler = Instance.new("ScrollingFrame")
MachineHandler.Name = "MachineHandler"
MachineHandler.Parent = Background8
MachineHandler.Active = true
MachineHandler.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
MachineHandler.BackgroundTransparency = 1.000
MachineHandler.BorderSizePixel = 0
MachineHandler.AutomaticCanvasSize = "Y"
MachineHandler.Position = UDim2.new(0, 0, 0, 0)
MachineHandler.Size = UDim2.new(0, 150, 0, 170)
MachineHandler.ScrollBarThickness = 6

CmdName.Name = "CmdName"
CmdName.AutoButtonColor = false
CmdName.Parent = Background
CmdName.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CmdName.BorderSizePixel = 0
CmdName.Size = UDim2.new(0, 87, 0, 15)
CmdName.Font = Enum.Font.GothamBlack
CmdName.Text = "Islands GUI"
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

local Grid = Instance.new("UIGridLayout")
Grid.CellSize = UDim2.new(0.95,0,0.1,0)
Grid.CellPadding = UDim2.new(0,1,0,5)
Grid.SortOrder = "LayoutOrder"
Grid.Parent = game:GetService("CoreGui").CmdGui.Background.CmdHandler

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
Close.MouseButton1Click:Connect(function() Toggled1 = false Toggled2 = false Toggled3 = false Toggled4 = false Toggled5 = false Toggled6 = false Toggled7 = false Toggled8 = false Toggled9 = false Toggled10 = false Toggled11 = false Toggled12 = false Toggled13 = false Toggled14 = false Toggled15 = false Toggled16 = false Toggled17 = false Toggled18 = false Toggled19 = false Toggled20 = false Toggled21 = false Toggled22 = false Toggled23 = false Toggled24 = false Toggled25 = false Toggled26 = false Toggled27 = false Toggled28 = false Toggled29 = false Toggled30 = false Toggled31 = false Toggled32 = false Toggled33 = false Toggled34 = false Toggled35 = false Toggled36 = false Toggled37 = false Toggled38 = false Toggled39 = false Toggled40 = false Toggled41 = false Toggled42 = false Toggled43 = false Toggled44 = false Toggled45 = false Toggled46 = false Toggled47 = false Toggled48 = false Toggled49 = false Toggled50 = false Toggled51 = false Toggled52 = false Toggled53 = false Toggled54 = false Toggled55 = false Toggled56 = false Toggled57 = false Toggled58 = false Toggled59 = false Toggled60 = false Toggled61 = false Toggled62 = false Toggled63 = false Toggled64 = false Toggled65 = false Toggled66 = false Toggled67 = false Toggled68 = false Toggled69 = false Toggled70 = false Toggled71 = false Toggled72 = false Toggled73 = false Toggled74 = false Toggled75 = false Toggled76 = false Toggled77 = false Toggled78 = false Toggled79 = false Toggled80 = false Toggled81 = false Toggled82 = false Toggled83 = false Toggled84 = false
Toggled85 = false Toggled86 = false Toggled87 = false
fly = false
CmdGui:Destroy()
end)

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
		Background8.Visible = false
		Background9.Visible = false
		Background10.Visible = false
		Background11.Visible = false
		Background12.Visible = false
		Background.Size = UDim2.new(0, 120, 0, 25)
		CmdHandler.Visible = false
        Toggled8 = false
        Toggled5 = false
        Toggled6 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = false
        Toggled73 = false
	elseif Background.BackgroundTransparency == 1 then
		Background.BackgroundTransparency = 0
		Background.Size = UDim2.new(0, 120, 0, 220)
		CmdHandler.Visible = true
	end
end)

Item1 = Instance.new("TextButton")
Item1.Position = UDim2.new(0,1,0,26)
Item1.Size = UDim2.new(0,100,0,20)
Item1.BackgroundColor3 = Color3.new(0,0,1)
Item1.BorderColor3 = Color3.new(1,1,1)
Item1.ZIndex = 2
Item1.Parent = Background6
Item1.Text = "Flower"
Item1.TextColor3 = Color3.new(1,1,1)
Item1.TextScaled = true

Item3 = Instance.new("TextButton")
Item3.Position = UDim2.new(0,1,0,341)
Item3.Size = UDim2.new(0,100,0,20)
Item3.BackgroundColor3 = Color3.new(0,0,1)
Item3.BorderColor3 = Color3.new(1,1,1)
Item3.ZIndex = 2
Item3.Text = "Copy Discord link to Clipboard"
Item3.TextColor3 = Color3.fromRGB(250,250,250)
Item3.TextScaled = true
Item3.LayoutOrder = 10
Item3.Parent = CmdHandler

Title = Instance.new("TextButton")
Title.Position = UDim2.new(0,1,0,101)
Title.Size = UDim2.new(0,100,0,20)
Title.BackgroundColor3 = Color3.new(0,0,1)
Title.BorderColor3 = Color3.new(1,1,1)
Title.ZIndex = 2
Title.LayoutOrder = 4
Title.Parent = CmdHandler
Title.Text = "Mob Farms >"
Title.TextColor3 = Color3.fromRGB(250,250,250)
Title.TextScaled = true

local BowBoss = Instance.new("TextButton") -- not bowboss anymore. now Trees
BowBoss.Position = UDim2.new(0,1,0,76)
BowBoss.Size = UDim2.new(0,100,0,20)
BowBoss.BackgroundColor3 = Color3.new(0,0,1)
BowBoss.BorderColor3 = Color3.new(1,1,1)
BowBoss.ZIndex = 2
BowBoss.LayoutOrder = 3
BowBoss.Parent = CmdHandler
BowBoss.Text = "Wood >"
BowBoss.TextColor3 = Color3.fromRGB(250,250,250)
BowBoss.TextScaled = true

local GUIs = Instance.new("TextButton")
GUIs.Position = UDim2.new(0,1,0,51)
GUIs.Size = UDim2.new(0,100,0,20)
GUIs.BackgroundColor3 = Color3.new(0,0,1)
GUIs.BorderColor3 = Color3.new(1,1,1)
GUIs.ZIndex = 2
GUIs.LayoutOrder = 2
GUIs.Parent = CmdHandler
GUIs.Text = "Events >"
GUIs.TextColor3 = Color3.fromRGB(250,250,250)
GUIs.TextScaled = true

local Teleports = Instance.new("TextButton")
Teleports.Position = UDim2.new(0,1,0,243)
Teleports.Size = UDim2.new(0,100,0,20)
Teleports.BackgroundColor3 = Color3.new(0,0,1)
Teleports.BorderColor3 = Color3.new(1,1,1)
Teleports.ZIndex = 2
Teleports.Parent = CmdHandler
Teleports.Text = "Teleports >"
Teleports.TextColor3 = Color3.fromRGB(250,250,250)
Teleports.TextScaled = true
Teleports.Visible = false


local CmdHandler7 = Instance.new("ScrollingFrame")
CmdHandler7.Name = "CmdHandler6"
CmdHandler7.Parent = Background10
CmdHandler7.Active = true
CmdHandler7.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler7.BackgroundTransparency = 1.000
CmdHandler7.BorderSizePixel = 0
CmdHandler7.AutomaticCanvasSize = "Y"
CmdHandler7.Position = UDim2.new(0, 1, 0, 1)
CmdHandler7.Size = UDim2.new(0, 148, 0, 195)
CmdHandler7.ScrollBarThickness = 8

local CmdHandler8 = Instance.new("ScrollingFrame")
CmdHandler8.Name = "CmdHandler8"
CmdHandler8.Parent = Background11
CmdHandler8.Active = true
CmdHandler8.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler8.BackgroundTransparency = 1.000
CmdHandler8.BorderSizePixel = 0
CmdHandler8.AutomaticCanvasSize = "Y"
CmdHandler8.Position = UDim2.new(0, 1, 0, 1)
CmdHandler8.Size = UDim2.new(0, 148, 0, 195)
CmdHandler8.ScrollBarThickness = 8

local Lunar = Instance.new("Frame")
Lunar.Name = "Lunar"
Lunar.Parent = Background11
Lunar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Lunar.BorderSizePixel = 0
Lunar.BorderColor3 = Color3.new(1,0,1)
Lunar.Position = UDim2.new(1, 0, 0.05, 0)
Lunar.Size = UDim2.new(0, 150, 0, 200)
Lunar.Active = true
Lunar.Visible = false

local LunarScroll = Instance.new("ScrollingFrame")
LunarScroll.Name = "LunarScroll"
LunarScroll.Parent = Lunar
LunarScroll.Active = true
LunarScroll.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
LunarScroll.BackgroundTransparency = 1.000
LunarScroll.BorderSizePixel = 0
LunarScroll.AutomaticCanvasSize = "Y"
LunarScroll.Position = UDim2.new(0, 1, 0, 1)
LunarScroll.Size = UDim2.new(0, 148, 0, 195)
LunarScroll.ScrollBarThickness = 8

local Cletus = Instance.new("Frame")
Cletus.Name = "Cletus"
Cletus.Parent = Background11
Cletus.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Cletus.BorderSizePixel = 0
Cletus.BorderColor3 = Color3.new(1,0,1)
Cletus.Position = UDim2.new(1, 0, 0.05, 0)
Cletus.Size = UDim2.new(0, 150, 0, 200)
Cletus.Active = true
Cletus.Visible = false

local CletusScroll = Instance.new("ScrollingFrame")
CletusScroll.Name = "CletusScroll"
CletusScroll.Parent = Cletus
CletusScroll.Active = true
CletusScroll.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CletusScroll.BackgroundTransparency = 1.000
CletusScroll.BorderSizePixel = 0
CletusScroll.AutomaticCanvasSize = "Y"
CletusScroll.Position = UDim2.new(0, 1, 0, 1)
CletusScroll.Size = UDim2.new(0, 148, 0, 195)
CletusScroll.ScrollBarThickness = 8

local CA = Instance.new("TextBox")
CA.Position = UDim2.new(0,20,0,0)
CA.Size = UDim2.new(0,100,0,20)
CA.BackgroundColor3 = Color3.fromRGB(50,50,50)
CA.BorderSizePixel = 1
CA.BorderColor3 = Color3.new(1,1,1)
CA.ZIndex = 2
CA.Parent = CletusScroll
CA.Text = ""
CA.PlaceholderText = "Enter Amount"
CA.TextColor3 = Color3.fromRGB(250,250,250)
CA.TextScaled = true

local C1 = Instance.new("TextButton")
C1.Position = UDim2.new(0,1,0,21)
C1.Size = UDim2.new(0,140,0,20)
C1.BackgroundColor3 = Color3.fromRGB(0,0,250)
C1.BorderSizePixel = 1
C1.BorderColor3 = Color3.new(1,1,1)
C1.ZIndex = 2
C1.Parent = CletusScroll
C1.Text = "Wheat Seeds"
C1.TextColor3 = Color3.fromRGB(250,250,250)
C1.TextScaled = true
C1.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 101,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C2 = Instance.new("TextButton")
C2.Position = UDim2.new(0,1,0,42)
C2.Size = UDim2.new(0,140,0,20)
C2.BackgroundColor3 = Color3.fromRGB(0,0,250)
C2.BorderSizePixel = 1
C2.BorderColor3 = Color3.new(1,1,1)
C2.ZIndex = 2
C2.Parent = CletusScroll
C2.Text = "Tomato Seeds"
C2.TextColor3 = Color3.fromRGB(250,250,250)
C2.TextScaled = true
C2.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 102,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C3 = Instance.new("TextButton")
C3.Position = UDim2.new(0,1,0,63)
C3.Size = UDim2.new(0,140,0,20)
C3.BackgroundColor3 = Color3.fromRGB(0,0,250)
C3.BorderSizePixel = 1
C3.BorderColor3 = Color3.new(1,1,1)
C3.ZIndex = 2
C3.Parent = CletusScroll
C3.Text = "Potato Seeds"
C3.TextColor3 = Color3.fromRGB(250,250,250)
C3.TextScaled = true
C3.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 103,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C4 = Instance.new("TextButton")
C4.Position = UDim2.new(0,1,0,84)
C4.Size = UDim2.new(0,140,0,20)
C4.BackgroundColor3 = Color3.fromRGB(0,0,250)
C4.BorderSizePixel = 1
C4.BorderColor3 = Color3.new(1,1,1)
C4.ZIndex = 2
C4.Parent = CletusScroll
C4.Text = "Carrot Seeds"
C4.TextColor3 = Color3.fromRGB(250,250,250)
C4.TextScaled = true
C4.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 104,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C5 = Instance.new("TextButton")
C5.Position = UDim2.new(0,1,0,105)
C5.Size = UDim2.new(0,140,0,20)
C5.BackgroundColor3 = Color3.fromRGB(0,0,250)
C5.BorderSizePixel = 1
C5.BorderColor3 = Color3.new(1,1,1)
C5.ZIndex = 2
C5.Parent = CletusScroll
C5.Text = "Spinach Seeds"
C5.TextColor3 = Color3.fromRGB(250,250,250)
C5.TextScaled = true
C5.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 105,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C6 = Instance.new("TextButton")
C6.Position = UDim2.new(0,1,0,126)
C6.Size = UDim2.new(0,140,0,20)
C6.BackgroundColor3 = Color3.fromRGB(0,0,250)
C6.BorderSizePixel = 1
C6.BorderColor3 = Color3.new(1,1,1)
C6.ZIndex = 2
C6.Parent = CletusScroll
C6.Text = "Onion Seeds"
C6.TextColor3 = Color3.fromRGB(250,250,250)
C6.TextScaled = true
C6.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 106,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C7 = Instance.new("TextButton")
C7.Position = UDim2.new(0,1,0,147)
C7.Size = UDim2.new(0,140,0,20)
C7.BackgroundColor3 = Color3.fromRGB(0,0,250)
C7.BorderSizePixel = 1
C7.BorderColor3 = Color3.new(1,1,1)
C7.ZIndex = 2
C7.Parent = CletusScroll
C7.Text = "Grape Seeds"
C7.TextColor3 = Color3.fromRGB(250,250,250)
C7.TextScaled = true
C7.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 107,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C8 = Instance.new("TextButton")
C8.Position = UDim2.new(0,1,0,168)
C8.Size = UDim2.new(0,140,0,20)
C8.BackgroundColor3 = Color3.fromRGB(0,0,250)
C8.BorderSizePixel = 1
C8.BorderColor3 = Color3.new(1,1,1)
C8.ZIndex = 2
C8.Parent = CletusScroll
C8.Text = "Cactus Seeds"
C8.TextColor3 = Color3.fromRGB(250,250,250)
C8.TextScaled = true
C8.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 108,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C9 = Instance.new("TextButton")
C9.Position = UDim2.new(0,1,0,189)
C9.Size = UDim2.new(0,140,0,20)
C9.BackgroundColor3 = Color3.fromRGB(0,0,250)
C9.BorderSizePixel = 1
C9.BorderColor3 = Color3.new(1,1,1)
C9.ZIndex = 2
C9.Parent = CletusScroll
C9.Text = "Rice Seeds"
C9.TextColor3 = Color3.fromRGB(250,250,250)
C9.TextScaled = true
C9.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 109,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C10 = Instance.new("TextButton")
C10.Position = UDim2.new(0,1,0,210)
C10.Size = UDim2.new(0,140,0,20)
C10.BackgroundColor3 = Color3.fromRGB(0,0,250)
C10.BorderSizePixel = 1
C10.BorderColor3 = Color3.new(1,1,1)
C10.ZIndex = 2
C10.Parent = CletusScroll
C10.Text = "Dragon Fruit Seeds"
C10.TextColor3 = Color3.fromRGB(250,250,250)
C10.TextScaled = true
C10.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "seeds",
	["offerId"] = 110,
	["amount"] = tonumber(CA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local C11 = Instance.new("TextButton")
C11.Position = UDim2.new(0,1,0,231)
C11.Size = UDim2.new(0,140,0,20)
C11.BackgroundColor3 = Color3.fromRGB(0,0,250)
C11.BorderSizePixel = 1
C11.BorderColor3 = Color3.new(1,1,1)
C11.ZIndex = 2
C11.Parent = CletusScroll
C11.Text = "Melon (3/Day)"
C11.TextColor3 = Color3.fromRGB(250,250,250)
C11.TextScaled = true
C11.MouseButton1Click:Connect(function()
    args = {
    [1] = {
    ["merchant"] = "melon_shop",
    ["offerId"] = 2,
    ["amount"] = 3
    }}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
end)

local C12 = Instance.new("TextButton")
C12.Position = UDim2.new(0,1,0,252)
C12.Size = UDim2.new(0,140,0,20)
C12.BackgroundColor3 = Color3.fromRGB(0,0,250)
C12.BorderSizePixel = 1
C12.BorderColor3 = Color3.new(1,1,1)
C12.ZIndex = 2
C12.Parent = CletusScroll
C12.Text = "Pineapple (6/Day)"
C12.TextColor3 = Color3.fromRGB(250,250,250)
C12.TextScaled = true
C12.MouseButton1Click:Connect(function()
    args = {
    [1] = {
    ["merchant"] = "spring_shop_pineapple",
    ["offerId"] = 2,
    ["amount"] = 6
    }}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
end)

local C13 = Instance.new("TextButton")
C13.Position = UDim2.new(0,1,0,273)
C13.Size = UDim2.new(0,140,0,20)
C13.BackgroundColor3 = Color3.fromRGB(0,0,250)
C13.BorderSizePixel = 1
C13.BorderColor3 = Color3.new(1,1,1)
C13.ZIndex = 2
C13.Parent = CletusScroll
C13.Text = "Radish (8/Day)"
C13.TextColor3 = Color3.fromRGB(250,250,250)
C13.TextScaled = true
C13.MouseButton1Click:Connect(function()
    args = {
    [1] = {
    ["merchant"] = "spring_shop_radish",
    ["offerId"] = 10,
    ["amount"] = 8
    }}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
end)

local C13 = Instance.new("TextButton")
C13.Position = UDim2.new(0,1,0,294)
C13.Size = UDim2.new(0,140,0,20)
C13.BackgroundColor3 = Color3.fromRGB(0,0,250)
C13.BorderSizePixel = 1
C13.BorderColor3 = Color3.new(1,1,1)
C13.ZIndex = 2
C13.Parent = CletusScroll
C13.Text = "Pumpkins (4/Day)"
C13.TextColor3 = Color3.fromRGB(250,250,250)
C13.TextScaled = true
C13.MouseButton1Click:Connect(function()
    args = {
    [1] = {
    ["merchant"] = "autumn_shop",
    ["offerId"] = 10,
    ["amount"] = 4
    }}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
end)

local Wholesaler = Instance.new("Frame")
Wholesaler.Name = "Wholesaler"
Wholesaler.Parent = Background11
Wholesaler.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Wholesaler.BorderSizePixel = 0
Wholesaler.BorderColor3 = Color3.new(1,0,1)
Wholesaler.Position = UDim2.new(1, 0, 0.05, 0)
Wholesaler.Size = UDim2.new(0, 150, 0, 200)
Wholesaler.Active = true
Wholesaler.Visible = false

local WholesalerScroll = Instance.new("ScrollingFrame")
WholesalerScroll.Name = "CletusScroll"
WholesalerScroll.Parent = Wholesaler
WholesalerScroll.Active = true
WholesalerScroll.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
WholesalerScroll.BackgroundTransparency = 1.000
WholesalerScroll.BorderSizePixel = 0
WholesalerScroll.AutomaticCanvasSize = "Y"
WholesalerScroll.Position = UDim2.new(0, 1, 0, 1)
WholesalerScroll.Size = UDim2.new(0, 148, 0, 195)
WholesalerScroll.ScrollBarThickness = 8

local N1 = Instance.new("TextLabel")
N1.Position = UDim2.new(0,0,0,0)
N1.Size = UDim2.new(0,150,0,15)
N1.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
N1.BorderColor3 = Color3.fromRGB(25, 25, 25)
N1.ZIndex = 2
N1.Parent = CmdHandler7
N1.Text = "Farm Stuff"
N1.TextColor3 = Color3.fromRGB(2,2,2)
N1.TextScaled = true

local N2 = Instance.new("TextLabel")
N2.Position = UDim2.new(0,0,0,200)
N2.Size = UDim2.new(0,150,0,15)
N2.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
N2.BorderColor3 = Color3.fromRGB(25, 25, 25)
N2.ZIndex = 2
N2.Parent = CmdHandler7
N2.Text = "Wilderness Islands"
N2.TextColor3 = Color3.fromRGB(2,2,2)
N2.TextScaled = true

local CmdHandler2 = Instance.new("ScrollingFrame")
CmdHandler2.Name = "CmdHandler2"
CmdHandler2.Parent = Background3
CmdHandler2.Active = true
CmdHandler2.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler2.BackgroundTransparency = 1.000
CmdHandler2.BorderSizePixel = 0
CmdHandler2.AutomaticCanvasSize = "Y"
CmdHandler2.Position = UDim2.new(0, 1, 0, 0)
CmdHandler2.Size = UDim2.new(0, 118, 0, 125)
CmdHandler2.ScrollBarThickness = 10

local CmdHandler3 = Instance.new("ScrollingFrame")
CmdHandler3.Name = "CmdHandler3"
CmdHandler3.Parent = Background4
CmdHandler3.Active = true
CmdHandler3.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler3.BackgroundTransparency = 1.000
CmdHandler3.BorderSizePixel = 0
CmdHandler3.AutomaticCanvasSize = "Y"
CmdHandler3.Position = UDim2.new(0, 1, 0, 1)
CmdHandler3.Size = UDim2.new(0, 148, 0, 165)
CmdHandler3.ScrollBarThickness = 8

local CmdHandler4 = Instance.new("ScrollingFrame")
CmdHandler4.Name = "CmdHandler4"
CmdHandler4.Parent = Background2
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

local CmdHandler9 = Instance.new("ScrollingFrame")
CmdHandler9.Name = "CmdHandler9"
CmdHandler9.Parent = Background12
CmdHandler9.Active = true
CmdHandler9.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler9.BackgroundTransparency = 1.000
CmdHandler9.BorderSizePixel = 0
CmdHandler9.AutomaticCanvasSize = "Y"
CmdHandler9.Position = UDim2.new(0, 1, 0, 1)
CmdHandler9.Size = UDim2.new(0, 148, 0, 195)
CmdHandler9.ScrollBarThickness = 8

local Notification2 = Instance.new("TextLabel")
Notification2.Size = UDim2.new(0,120,0,15)
Notification2.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification2.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification2.ZIndex = 2
Notification2.Parent = CmdHandler2
Notification2.Text = "Teleports"
Notification2.TextColor3 = Color3.fromRGB(2,2,2)
Notification2.TextScaled = true

local Notification3 = Instance.new("TextLabel")
Notification3.Position = UDim2.new(0,0,0,0)
Notification3.Size = UDim2.new(0,150,0,15)
Notification3.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification3.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification3.ZIndex = 2
Notification3.Parent = CmdHandler3
Notification3.Text = "Other Things"
Notification3.TextColor3 = Color3.fromRGB(2,2,2)
Notification3.TextScaled = true

local Notification4 = Instance.new("TextLabel")
Notification4.Position = UDim2.new(0,0,0,300)
Notification4.Size = UDim2.new(0,150,0,15)
Notification4.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification4.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification4.ZIndex = 2
Notification4.Parent = CmdHandler3
Notification4.Text = "Flowers/Floral"
Notification4.TextColor3 = Color3.fromRGB(2,2,2)
Notification4.TextScaled = true

local Notification5 = Instance.new("TextLabel")
Notification5.Size = UDim2.new(0,150,0,15)
Notification5.Position = UDim2.new(0,0,0,170)
Notification5.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification5.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification5.ZIndex = 2
Notification5.Parent = CmdHandler3
Notification5.Text = "Shop Stuff"
Notification5.TextColor3 = Color3.fromRGB(2,2,2)
Notification5.TextScaled = true

local BottomOfMisc = Instance.new("TextLabel") -- Bottom of Misc
BottomOfMisc.Position = UDim2.new(0,0,0,520)
BottomOfMisc.Size = UDim2.new(0,120,0,15)
BottomOfMisc.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
BottomOfMisc.BorderColor3 = Color3.fromRGB(25, 25, 25)
BottomOfMisc.Parent = CmdHandler3
BottomOfMisc.ZIndex = 2
BottomOfMisc.Text = ""
BottomOfMisc.TextColor3 = Color3.fromRGB(2,2,2)
BottomOfMisc.TextScaled = true

local Notification6 = Instance.new("TextLabel")
Notification6.Position = UDim2.new(0,0,0,0)
Notification6.Size = UDim2.new(0,140,0,15)
Notification6.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification6.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification6.ZIndex = 2
Notification6.Parent = CmdHandler4
Notification6.Text = "Mob Farms"
Notification6.TextColor3 = Color3.fromRGB(2,2,2)
Notification6.TextScaled = true

local Notification7 = Instance.new("TextLabel")
Notification7.Position = UDim2.new(0,0,0,250)
Notification7.Size = UDim2.new(0,140,0,15)
Notification7.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification7.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification7.ZIndex = 2
Notification7.Parent = CmdHandler4
Notification7.Text = "Bow Aimbot (InProgress)"
Notification7.TextColor3 = Color3.fromRGB(2,2,2)
Notification7.TextScaled = true

local Notification8 = Instance.new("TextLabel")
Notification8.Position = UDim2.new(0,0,0,0)
Notification8.Size = UDim2.new(0,140,0,15)
Notification8.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification8.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification8.ZIndex = 2
Notification8.Parent = CmdHandler5
Notification8.Text = "Wood Chopper"
Notification8.TextColor3 = Color3.fromRGB(2,2,2)
Notification8.TextScaled = true

local Notification9 = Instance.new("TextLabel")
Notification9.Position = UDim2.new(0,0,0,0)
Notification9.Size = UDim2.new(0,140,0,15)
Notification9.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification9.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification9.ZIndex = 2
Notification9.Parent = MachineHandler
Notification9.Text = "Stonecutter (broken)"
Notification9.TextColor3 = Color3.fromRGB(2,2,2)
Notification9.TextScaled = true

Notification10 = Instance.new("TextLabel")
Notification10.Position = UDim2.new(0,0,0,100)
Notification10.Size = UDim2.new(0,140,0,15)
Notification10.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification10.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification10.ZIndex = 2
Notification10.Parent = MachineHandler
Notification10.Text = "Small Furnace"
Notification10.TextColor3 = Color3.fromRGB(2,2,2)
Notification10.TextScaled = true

local Notification11 = Instance.new("TextLabel")
Notification11.Position = UDim2.new(0,0,0,0)
Notification11.Size = UDim2.new(0,140,0,15)
Notification11.BackgroundColor3 = Color3.fromRGB(25, 200, 200)
Notification11.BorderColor3 = Color3.fromRGB(25, 25, 25)
Notification11.ZIndex = 2
Notification11.Parent = CmdHandler9
Notification11.Text = "WildernessIslands"
Notification11.TextColor3 = Color3.fromRGB(2,2,2)
Notification11.TextScaled = true

local Item4 = Instance.new("TextButton")
Item4.Position = UDim2.new(0,0,1,1)
Item4.Size = UDim2.new(0,70,0,20)
Item4.BackgroundColor3 = Color3.fromRGB(63,165,63)
Item4.BorderSizePixel = 0
Item4.ZIndex = 2
Item4.Parent = Notification6
Item4.Text = "Slimes"
Item4.TextColor3 = Color3.fromRGB(250,250,250)
Item4.TextScaled = true

local Item5 = Instance.new("TextButton")
Item5.Position = UDim2.new(0,71,1,1)
Item5.Size = UDim2.new(0,69,0,20)
Item5.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
Item5.BorderSizePixel = 0
Item5.ZIndex = 2
Item5.Parent = Notification6
Item5.Text = "Buffalkor"
Item5.TextColor3 = Color3.fromRGB(1,1,1)
Item5.TextScaled = true

local Mob3 = Instance.new("TextButton")
Mob3.Position = UDim2.new(0,0,1,22)
Mob3.Size = UDim2.new(0,70,0,20)
Mob3.BackgroundColor3 = Color3.fromRGB(128, 0, 0)
Mob3.BorderSizePixel = 0
Mob3.ZIndex = 2
Mob3.Parent = Notification6
Mob3.Text = "Wizard"
Mob3.TextColor3 = Color3.fromRGB(250,250,250)
Mob3.TextScaled = true

local Mob4 = Instance.new("TextButton")
Mob4.Position = UDim2.new(0,71,1,22)
Mob4.Size = UDim2.new(0,69,0,20)
Mob4.BackgroundColor3 = Color3.fromRGB(194,178,128)
Mob4.BorderSizePixel = 0
Mob4.ZIndex = 2
Mob4.Parent = Notification6
Mob4.Text = "Skorps"
Mob4.TextColor3 = Color3.fromRGB(1,1,1)
Mob4.TextScaled = true

local Mob5 = Instance.new("TextButton")
Mob5.Position = UDim2.new(0,0,1,64)
Mob5.Size = UDim2.new(0,70,0,20)
Mob5.BackgroundColor3 = Color3.fromRGB(155,0,0)
Mob5.BorderSizePixel = 0
Mob5.ZIndex = 2
Mob5.Parent = Notification6
Mob5.Text = "magmaBlob"
Mob5.TextColor3 = Color3.fromRGB(255,200,1)
Mob5.TextScaled = true

local Mob6 = Instance.new("TextButton")
Mob6.Position = UDim2.new(0,0,1,43)
Mob6.Size = UDim2.new(0,70,0,20)
Mob6.BackgroundColor3 = Color3.fromRGB(200,200,200)
Mob6.BorderSizePixel = 0
Mob6.ZIndex = 2
Mob6.Parent = Notification6
Mob6.Text = "Skeleton Pirate"
Mob6.TextColor3 = Color3.new(0,0,0)
Mob6.TextScaled = true

local Mob7 = Instance.new("TextButton")
Mob7.Position = UDim2.new(0,70,1,43)
Mob7.Size = UDim2.new(0,70,0,20)
Mob7.BackgroundColor3 = Color3.fromRGB(200,50,50)
Mob7.BorderSizePixel = 0
Mob7.ZIndex = 2
Mob7.Parent = Notification6
Mob7.Text = "Crabs"
Mob7.TextColor3 = Color3.fromRGB(255,200,1)
Mob7.TextScaled = true

local Mob8 = Instance.new("TextButton")
Mob8.Position = UDim2.new(0,70,1,64)
Mob8.Size = UDim2.new(0,70,0,20)
Mob8.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
Mob8.BorderSizePixel = 0
Mob8.ZIndex = 2
Mob8.Parent = Notification6
Mob8.Text = "Rock Mimic"
Mob8.TextColor3 = Color3.fromRGB(0,0,0)
Mob8.TextScaled = true

local God = Instance.new("TextButton")
God.Position = UDim2.new(0,1,1,140)
God.Size = UDim2.new(0,138,0,20)
God.BackgroundColor3 = Color3.fromRGB(50,50,50)
God.BorderSizePixel = 1
God.BorderColor3 = Color3.fromRGB(200,100,100)
God.ZIndex = 2
God.Parent = Notification6
God.Text = "Enable God Mode"
God.TextColor3 = Color3.fromRGB(50,200,100)
God.TextScaled = true

local Item6 = Instance.new("TextButton")
Item6.Position = UDim2.new(0,1,1,150)
Item6.Size = UDim2.new(0,135,0,20)
Item6.BackgroundColor3 = Color3.fromRGB(70,70,70)
Item6.BorderSizePixel = 2
Item6.BorderColor3 = Color3.new(0,1,0)
Item6.ZIndex = 2
Item6.Parent = Notification7
Item6.Text = "Fire ProximityPrompts"
Item6.TextColor3 = Color3.fromRGB(50,250,50)
Item6.TextScaled = true
Item6.Modal = true

local Item7 = Instance.new("TextButton")
Item7.Position = UDim2.new(0,0,1,1)
Item7.Size = UDim2.new(0,54,0,20)
Item7.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item7.BorderSizePixel = 1
Item7.ZIndex = 2
Item7.Parent = Notification2
Item7.Text = "Hub Island"
Item7.TextColor3 = Color3.fromRGB(250,250,250)
Item7.TextScaled = true

local Item8 = Instance.new("TextButton")
Item8.Position = UDim2.new(0,0,1,21)
Item8.Size = UDim2.new(0,54,0,20)
Item8.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item8.BorderSizePixel = 1
Item8.ZIndex = 2
Item8.Parent = Notification2
Item8.Text = "Slime Island"
Item8.TextColor3 = Color3.fromRGB(250,250,250)
Item8.TextScaled = true

local Item9 = Instance.new("TextButton")
Item9.Position = UDim2.new(0,54,1,22)
Item9.Size = UDim2.new(0,54,0,20)
Item9.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item9.BorderSizePixel = 1
Item9.ZIndex = 2
Item9.Parent = Notification2
Item9.Text = "Slime Boss"
Item9.TextColor3 = Color3.fromRGB(250,250,250)
Item9.TextScaled = true

local Item10 = Instance.new("TextButton")
Item10.Position = UDim2.new(0,54,1,1)
Item10.Size = UDim2.new(0,54,0,20)
Item10.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item10.BorderSizePixel = 1
Item10.ZIndex = 2
Item10.Parent = Notification2
Item10.Text = "Buffalkor Island"
Item10.TextColor3 = Color3.fromRGB(250,250,250)
Item10.TextScaled = true

local Item11 = Instance.new("TextButton")
Item11.Position = UDim2.new(0,0,1,41)
Item11.Size = UDim2.new(0,54,0,20)
Item11.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item11.BorderSizePixel = 1
Item11.ZIndex = 2
Item11.Parent = Notification2
Item11.Text = "Wizard Island"
Item11.TextColor3 = Color3.fromRGB(250,250,250)
Item11.TextScaled = true

local Item12 = Instance.new("TextButton")
Item12.Position = UDim2.new(0,54,1,41)
Item12.Size = UDim2.new(0,54,0,20)
Item12.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item12.BorderSizePixel = 1
Item12.ZIndex = 2
Item12.Parent = Notification2
Item12.Text = "Wizard Boss"
Item12.TextColor3 = Color3.fromRGB(250,250,250)
Item12.TextScaled = true

local Item13 = Instance.new("TextButton")
Item13.Position = UDim2.new(0,0,1,61)
Item13.Size = UDim2.new(0,54,0,20)
Item13.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item13.BorderSizePixel = 1
Item13.ZIndex = 2
Item13.Parent = Notification2
Item13.Text = "Desert Island"
Item13.TextColor3 = Color3.fromRGB(250,250,250)
Item13.TextScaled = true

local Item14 = Instance.new("TextButton")
Item14.Position = UDim2.new(0,54,1,61)
Item14.Size = UDim2.new(0,54,0,20)
Item14.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item14.BorderSizePixel = 1
Item14.ZIndex = 2
Item14.Parent = Notification2
Item14.Text = "Bhaa Boss"
Item14.TextColor3 = Color3.fromRGB(250,250,250)
Item14.TextScaled = true

local Item15 = Instance.new("TextButton")
Item15.Position = UDim2.new(0,0,1,81)
Item15.Size = UDim2.new(0,54,0,20)
Item15.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item15.BorderSizePixel = 1
Item15.ZIndex = 2
Item15.Parent = Notification2
Item15.Text = "Diamond Mines"
Item15.TextColor3 = Color3.fromRGB(250,250,250)
Item15.TextScaled = true

local Item16 = Instance.new("TextButton")
Item16.Position = UDim2.new(0,54,1,81)
Item16.Size = UDim2.new(0,54,0,20)
Item16.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item16.BorderSizePixel = 1
Item16.ZIndex = 2
Item16.Parent = Notification2
Item16.Text = "Kor Boss"
Item16.TextColor3 = Color3.fromRGB(250,250,250)
Item16.TextScaled = true

local Item17 = Instance.new("TextButton")
Item17.Position = UDim2.new(0,0,1,121)
Item17.Size = UDim2.new(0,54,0,20)
Item17.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item17.BorderSizePixel = 1
Item17.ZIndex = 2
Item17.Parent = Notification2
Item17.Text = "Spirit Island"
Item17.TextColor3 = Color3.fromRGB(250,250,250)
Item17.TextScaled = true

local TP1 = Instance.new("TextButton")
TP1.Position = UDim2.new(0,0,1,141)
TP1.Size = UDim2.new(0,54,0,20)
TP1.BackgroundColor3 = Color3.fromRGB(63,63,63)
TP1.BorderSizePixel = 1
TP1.ZIndex = 2
TP1.Parent = Notification2
TP1.Text = "PVP Island"
TP1.TextColor3 = Color3.fromRGB(250,250,250)
TP1.TextScaled = true

local TP2 = Instance.new("TextButton")
TP2.Position = UDim2.new(0,54,1,141)
TP2.Size = UDim2.new(0,54,0,20)
TP2.BackgroundColor3 = Color3.fromRGB(63,63,63)
TP2.BorderSizePixel = 1
TP2.ZIndex = 1
TP2.Parent = Notification2
TP2.Text = "Fish Festival"
TP2.TextColor3 = Color3.fromRGB(250,250,250)
TP2.TextScaled = true

local TP3 = Instance.new("TextButton")
TP3.Position = UDim2.new(0,0,1,161)
TP3.Size = UDim2.new(0,54,0,20)
TP3.BackgroundColor3 = Color3.fromRGB(63,63,63)
TP3.BorderSizePixel = 1
TP3.ZIndex = 2
TP3.Parent = Notification2
TP3.Text = "Cletus Farm"
TP3.TextColor3 = Color3.fromRGB(250,250,250)
TP3.TextScaled = true

local Item18 = Instance.new("TextButton")
Item18.Position = UDim2.new(0,54,1,121)
Item18.Size = UDim2.new(0,54,0,20)
Item18.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item18.BorderSizePixel = 1
Item18.ZIndex = 2
Item18.Parent = Notification2
Item18.Text = "Pirate Isle"
Item18.TextColor3 = Color3.fromRGB(250,250,250)
Item18.TextScaled = true

local Item19 = Instance.new("TextButton")
Item19.Position = UDim2.new(0,0,1,101)
Item19.Size = UDim2.new(0,54,0,20)
Item19.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item19.BorderSizePixel = 1
Item19.ZIndex = 2
Item19.Parent = Notification2
Item19.Text = "Underworld"
Item19.TextColor3 = Color3.fromRGB(250,250,250)
Item19.TextScaled = true

local Item20 = Instance.new("TextButton")
Item20.Position = UDim2.new(0,54,1,101)
Item20.Size = UDim2.new(0,54,0,20)
Item20.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item20.BorderSizePixel = 1
Item20.ZIndex = 2
Item20.Parent = Notification2
Item20.Text = "Dragon Boss"
Item20.TextColor3 = Color3.fromRGB(250,250,250)
Item20.TextScaled = true

local Tests = Instance.new("TextButton")
Tests.Position = UDim2.new(0,1,0,151)
Tests.Size = UDim2.new(0,100,0,20)
Tests.BackgroundColor3 = Color3.new(0,0,1)
Tests.BorderColor3 = Color3.new(1,1,1)
Tests.ZIndex = 2
Tests.LayoutOrder = 6
Tests.Parent = CmdHandler
Tests.Text = "Misc >"
Tests.TextColor3 = Color3.fromRGB(250,250,250)
Tests.TextScaled = true

local Item22 = Instance.new("TextButton")
Item22.Position = UDim2.new(0,0,1,1)
Item22.Size = UDim2.new(0,70,0,20)
Item22.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item22.BorderSizePixel = 0
Item22.ZIndex = 2
Item22.Parent = Notification4
Item22.Text = "Pick Useless Fertiles"
Item22.TextColor3 = Color3.fromRGB(250,250,250)
Item22.TextScaled = true

local Item23 = Instance.new("TextButton")
Item23.Position = UDim2.new(0,0,1,1)
Item23.Size = UDim2.new(0,70,0,20)
Item23.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item23.BorderSizePixel = 1
Item23.ZIndex = 2
Item23.Parent = N1
Item23.Text = "Honeycomb"
Item23.TextColor3 = Color3.fromRGB(250,250,250)
Item23.TextScaled = true

local Item24 = Instance.new("TextButton")
Item24.Position = UDim2.new(0,71,1,1)
Item24.Size = UDim2.new(0,70,0,20)
Item24.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item24.BorderSizePixel = 1
Item24.ZIndex = 2
Item24.Parent = Notification3
Item24.Text = "Collect Nearby in/out"
Item24.TextColor3 = Color3.fromRGB(250,250,250)
Item24.TextScaled = true

local Item25 = Instance.new("TextButton")
Item25.Position = UDim2.new(0,0,1,22)
Item25.Size = UDim2.new(0,70,0,20)
Item25.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item25.BorderSizePixel = 1
Item25.ZIndex = 2
Item25.Parent = N1
Item25.Text = "Auto-Mayo"
Item25.TextColor3 = Color3.fromRGB(250,250,250)
Item25.TextScaled = true

local Item2 = Instance.new("TextButton")
Item2.Position = UDim2.new(0,0,1,1)
Item2.Size = UDim2.new(0,70,0,20)
Item2.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item2.BorderSizePixel = 1
Item2.ZIndex = 2
Item2.Parent = Notification3
Item2.Text = "Join/Invite"
Item2.TextColor3 = Color3.fromRGB(250,250,250)
Item2.TextScaled = true

local Item26 = Instance.new("TextButton")
Item26.Position = UDim2.new(0,1,1,65)
Item26.Size = UDim2.new(0,140,0,20)
Item26.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item26.BorderSizePixel = 1
Item26.ZIndex = 2
Item26.Parent = Notification5
Item26.Text = "Find Held Item in Vending"
Item26.TextColor3 = Color3.fromRGB(250,250,250)
Item26.TextScaled = true

local Item27 = Instance.new("TextButton")
Item27.Position = UDim2.new(0,0,1,85)
Item27.Size = UDim2.new(0,70,0,20)
Item27.BackgroundColor3 = Color3.fromRGB(63,165,63)
Item27.BorderSizePixel = 0
Item27.ZIndex = 2
Item27.Parent = Notification7
Item27.Text = "Slime King"
Item27.TextColor3 = Color3.fromRGB(250,250,250)
Item27.TextScaled = true

local Item28 = Instance.new("TextButton")
Item28.Position = UDim2.new(0,71,1,85)
Item28.Size = UDim2.new(0,69,0,20)
Item28.BackgroundColor3 = Color3.fromRGB(128, 0, 0)
Item28.BorderSizePixel = 0
Item28.ZIndex = 2
Item28.Parent = Notification7
Item28.Text = "Wizard Boss"
Item28.TextColor3 = Color3.fromRGB(250,250,250)
Item28.TextScaled = true

local Item29 = Instance.new("TextButton")
Item29.Position = UDim2.new(0,0,1,22)
Item29.Size = UDim2.new(0,70,0,20)
Item29.BackgroundColor3 = Color3.fromRGB(194,178,128)
Item29.BorderSizePixel = 0
Item29.ZIndex = 2
Item29.Parent = Notification7
Item29.Text = "Bhaa"
Item29.TextColor3 = Color3.fromRGB(0,0,0)
Item29.TextScaled = true

local Item30 = Instance.new("TextButton")
Item30.Position = UDim2.new(0,71,1,22)
Item30.Size = UDim2.new(0,69,0,20)
Item30.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
Item30.BorderSizePixel = 0
Item30.ZIndex = 2
Item30.Parent = Notification7
Item30.Text = "Kor"
Item30.TextColor3 = Color3.fromRGB(0,0,0)
Item30.TextScaled = true

local Item31 = Instance.new("TextButton")
Item31.Position = UDim2.new(0,0,1,43)
Item31.Size = UDim2.new(0,70,0,20)
Item31.BackgroundColor3 = Color3.fromRGB(155,0,0)
Item31.BorderSizePixel = 0
Item31.ZIndex = 2
Item31.Parent = Notification7
Item31.Text = "Infernal Dragon"
Item31.TextColor3 = Color3.fromRGB(250,250,250)
Item31.TextScaled = true

local Item32 = Instance.new("TextButton")
Item32.Position = UDim2.new(0,0,1,22)
Item32.Size = UDim2.new(0,70,0,20)
Item32.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item32.BorderSizePixel = 1
Item32.ZIndex = 2
Item32.Parent = Notification3
Item32.Text = "Send items to Click"
Item32.TextColor3 = Color3.fromRGB(250,250,250)
Item32.TextScaled = true

local Item33 = Instance.new("TextButton")
Item33.Position = UDim2.new(0,72,1,1)
Item33.Size = UDim2.new(0,70,0,20)
Item33.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item33.BorderSizePixel = 1
Item33.ZIndex = 2
Item33.Parent = N1
Item33.Text = "Collect Truffles"
Item33.TextColor3 = Color3.fromRGB(250,250,250)
Item33.TextScaled = true

local Item34 = Instance.new("TextButton")
Item34.Position = UDim2.new(0,71,1,1)
Item34.Size = UDim2.new(0,70,0,20)
Item34.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item34.BorderSizePixel = 1
Item34.ZIndex = 2
Item34.Parent = Notification4
Item34.Text = "Pick Unfertile"
Item34.TextColor3 = Color3.fromRGB(250,250,250)
Item34.TextScaled = true

local Item35 = Instance.new("TextButton")
Item35.Position = UDim2.new(0,0,1,22)
Item35.Size = UDim2.new(0,70,0,20)
Item35.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item35.BorderSizePixel = 1
Item35.ZIndex = 2
Item35.Parent = Notification4
Item35.Text = "Water Flowers"
Item35.TextColor3 = Color3.fromRGB(250,250,250)
Item35.TextScaled = true

local Item36 = Instance.new("TextButton")
Item36.Position = UDim2.new(0,71,1,22)
Item36.Size = UDim2.new(0,70,0,20)
Item36.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item36.BorderSizePixel = 1
Item36.ZIndex = 2
Item36.Parent = Notification4
Item36.Text = "Clear Grass/Rocks"
Item36.TextColor3 = Color3.fromRGB(250,250,250)
Item36.TextScaled = true

local Item42 = Instance.new("TextButton")
Item42.Position = UDim2.new(0,1,0,199)
Item42.Size = UDim2.new(0,100,0,20)
Item42.BackgroundColor3 = Color3.fromRGB(0,0,250)
Item42.BorderSizePixel = 1
Item42.BorderColor3 = Color3.new(1,1,1)
Item42.ZIndex = 2
Item42.LayoutOrder = 8
Item42.Parent = CmdHandler
Item42.Text = "Machines >"
Item42.TextColor3 = Color3.fromRGB(250,250,250)
Item42.TextScaled = true

local Item43 = Instance.new("TextButton")
Item43.Position = UDim2.new(0,71,1,64)
Item43.Size = UDim2.new(0,70,0,20)
Item43.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item43.BorderSizePixel = 1
Item43.ZIndex = 2
Item43.Parent = Notification3
Item43.Text = "Put ALL items into trade"
Item43.TextColor3 = Color3.fromRGB(250,250,250)
Item43.TextScaled = true

local Item44 = Instance.new("TextButton")
Item44.Position = UDim2.new(0,0,1,43)
Item44.Size = UDim2.new(0,70,0,20)
Item44.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item44.BorderSizePixel = 1
Item44.ZIndex = 2
Item44.Parent = Notification3
Item44.Text = "Island Pickaxe Aura"
Item44.TextColor3 = Color3.fromRGB(250,250,250)
Item44.TextScaled = true

local Item45 = Instance.new("TextButton")
Item45.Position = UDim2.new(0,0,1,45)
Item45.Size = UDim2.new(0,140,0,20)
Item45.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item45.BorderSizePixel = 1
Item45.ZIndex = 2
Item45.Parent = Notification4
Item45.Text = "Water Nearby"
Item45.TextColor3 = Color3.fromRGB(250,250,250)
Item45.TextScaled = true

local Item46 = Instance.new("TextButton")
Item46.Position = UDim2.new(0,71,1,43)
Item46.Size = UDim2.new(0,70,0,20)
Item46.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item46.BorderSizePixel = 1
Item46.ZIndex = 2
Item46.Parent = Notification3
Item46.Text = "Pickup Drops Aura"
Item46.TextColor3 = Color3.fromRGB(250,250,250)
Item46.TextScaled = true

local Item47 = Instance.new("TextButton")
Item47.Position = UDim2.new(0,0,1,85)
Item47.Size = UDim2.new(0,140,0,20)
Item47.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item47.BorderSizePixel = 1
Item47.ZIndex = 2
Item47.Parent = Notification3
Item47.Text = "Destroy Coal /iron /ironOre"
Item47.TextColor3 = Color3.fromRGB(250,250,250)
Item47.TextScaled = true

local Item48 = Instance.new("TextButton")
Item48.Position = UDim2.new(0,0,1,66)
Item48.Size = UDim2.new(0,140,0,20)
Item48.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item48.BorderSizePixel = 1
Item48.ZIndex = 2
Item48.Parent = Notification4
Item48.Text = "Clear Island Fertiles"
Item48.TextColor3 = Color3.fromRGB(250,250,250)
Item48.TextScaled = true

local Item50 = Instance.new("TextButton")
Item50.Position = UDim2.new(0,0,1,1)
Item50.Size = UDim2.new(0,70,0,20)
Item50.BackgroundColor3 = Color3.fromRGB(186,164,138)
Item50.BorderSizePixel = 1
Item50.ZIndex = 2
Item50.Parent = Notification8
Item50.Text = "Oak Wood"
Item50.TextColor3 = Color3.fromRGB(0,0,0)
Item50.TextScaled = true

local Item51 = Instance.new("TextButton")
Item51.Position = UDim2.new(0,71,1,1)
Item51.Size = UDim2.new(0,70,0,20)
Item51.BackgroundColor3 = Color3.fromRGB(248,223,161)
Item51.BorderSizePixel = 1
Item51.ZIndex = 2
Item51.Parent = Notification8
Item51.Text = "Birch Wood"
Item51.TextColor3 = Color3.fromRGB(0,0,0)
Item51.TextScaled = true

local Item52 = Instance.new("TextButton")
Item52.Position = UDim2.new(0,0,1,22)
Item52.Size = UDim2.new(0,70,0,20)
Item52.BackgroundColor3 = Color3.fromRGB(85,52,43)
Item52.BorderSizePixel = 1
Item52.ZIndex = 2
Item52.Parent = Notification8
Item52.Text = "Pine Wood"
Item52.TextColor3 = Color3.fromRGB(250,250,250)
Item52.TextScaled = true

local Item53 = Instance.new("TextButton")
Item53.Position = UDim2.new(0,71,1,22)
Item53.Size = UDim2.new(0,70,0,20)
Item53.BackgroundColor3 = Color3.fromRGB(200,111,87)
Item53.BorderSizePixel = 1
Item53.ZIndex = 2
Item53.Parent = Notification8
Item53.Text = "Maple Wood"
Item53.TextColor3 = Color3.fromRGB(0,0,0)
Item53.TextScaled = true

local Item54 = Instance.new("TextButton")
Item54.Position = UDim2.new(0,0,1,43)
Item54.Size = UDim2.new(0,70,0,20)
Item54.BackgroundColor3 = Color3.fromRGB(258,233,171)
Item54.BorderSizePixel = 1
Item54.ZIndex = 2
Item54.Parent = Notification8
Item54.Text = "Hickory Wood"
Item54.TextColor3 = Color3.fromRGB(0,0,0)
Item54.TextScaled = true

local Item55 = Instance.new("TextButton")
Item55.Position = UDim2.new(0,71,1,43)
Item55.Size = UDim2.new(0,69,0,20)
Item55.BackgroundColor3 = Color3.fromRGB(168,105,165)
Item55.BorderSizePixel = 1
Item55.ZIndex = 2
Item55.Parent = Notification8
Item55.Text = "Spirit Wood"
Item55.TextColor3 = Color3.fromRGB(0,0,0)
Item55.TextScaled = true

local Item56 = Instance.new("TextButton")
Item56.Position = UDim2.new(0,0,1,43)
Item56.Size = UDim2.new(0,140,0,20)
Item56.BackgroundColor3 = Color3.fromRGB(50,250,150)
Item56.BorderSizePixel = 1
Item56.ZIndex = 2
Item56.Parent = Notification9
Item56.Text = "aquaBlock -> aquaCarved"
Item56.TextColor3 = Color3.fromRGB(0,0,0)
Item56.TextScaled = true

local Item57 = Instance.new("TextButton")
Item57.Position = UDim2.new(0,0,1,22)
Item57.Size = UDim2.new(0,140,0,20)
Item57.BackgroundColor3 = Color3.fromRGB(50,250,150)
Item57.BorderSizePixel = 1
Item57.ZIndex = 2
Item57.Parent = Notification9
Item57.Text = "aquaBlock -> aquaTiles"
Item57.TextColor3 = Color3.fromRGB(0,0,0)
Item57.TextScaled = true

local Item58 = Instance.new("TextButton")
Item58.Position = UDim2.new(0,0,1,1)
Item58.Size = UDim2.new(0,140,0,20)
Item58.BackgroundColor3 = Color3.fromRGB(50,250,150)
Item58.BorderSizePixel = 1
Item58.ZIndex = 2
Item58.Parent = Notification9
Item58.Text = "aquaBlock -> aquaBrick"
Item58.TextColor3 = Color3.fromRGB(0,0,0)
Item58.TextScaled = true

local Item59 = Instance.new("TextButton")
Item59.Position = UDim2.new(0,72,1,22)
Item59.Size = UDim2.new(0,70,0,20)
Item59.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item59.BorderSizePixel = 1
Item59.ZIndex = 2
Item59.Parent = N1
Item59.Text = "Cloth Loom"
Item59.TextColor3 = Color3.fromRGB(250,250,250)
Item59.TextScaled = true

local Item60 = Instance.new("TextButton")
Item60.Position = UDim2.new(0,0,1,87)
Item60.Size = UDim2.new(0,140,0,20)
Item60.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item60.BorderSizePixel = 1
Item60.ZIndex = 2
Item60.Parent = Notification4
Item60.Text = "Clear ALL but Tulips"
Item60.TextColor3 = Color3.fromRGB(250,250,250)
Item60.TextScaled = true

local Item61 = Instance.new("TextButton")
Item61.Position = UDim2.new(0,0,1,64)
Item61.Size = UDim2.new(0,70,0,20)
Item61.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item61.BorderSizePixel = 1
Item61.ZIndex = 2
Item61.Parent = Notification3
Item61.Text = "NONO"
Item61.TextColor3 = Color3.fromRGB(250,250,250)
Item61.TextScaled = true

local Item62 = Instance.new("TextButton")
Item62.Position = UDim2.new(0,0,1,127)
Item62.Size = UDim2.new(0,70,0,20)
Item62.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item62.BorderSizePixel = 1
Item62.ZIndex = 2
Item62.Parent = N1
Item62.Text = "Pick Avocados"
Item62.TextColor3 = Color3.fromRGB(250,250,250)
Item62.TextScaled = true

local Item63 = Instance.new("TextButton")
Item63.Position = UDim2.new(0,72,1,43)
Item63.Size = UDim2.new(0,70,0,20)
Item63.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item63.BorderSizePixel = 1
Item63.ZIndex = 2
Item63.Parent = N1
Item63.Text = "Animal Farm"
Item63.TextColor3 = Color3.fromRGB(250,250,250)
Item63.TextScaled = true

local UnPlow = Instance.new("TextButton")
UnPlow.Position = UDim2.new(0,1,1,43)
UnPlow.Size = UDim2.new(0,70,0,20)
UnPlow.BackgroundColor3 = Color3.fromRGB(63,63,63)
UnPlow.BorderSizePixel = 1
UnPlow.ZIndex = 2
UnPlow.Parent = N1
UnPlow.Text = "Unplow Nearby"
UnPlow.TextColor3 = Color3.fromRGB(250,250,250)
UnPlow.TextScaled = true

local Item64 = Instance.new("TextButton")
Item64.Position = UDim2.new(0,0,1,108)
Item64.Size = UDim2.new(0,70,0,20)
Item64.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item64.BorderSizePixel = 1
Item64.ZIndex = 2
Item64.Parent = Notification4
Item64.Text = "Leaf Collector"
Item64.TextColor3 = Color3.fromRGB(250,250,250)
Item64.TextScaled = true

local Item65 = Instance.new("TextButton")
Item65.Position = UDim2.new(0,71,1,106)
Item65.Size = UDim2.new(0,70,0,20)
Item65.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item65.BorderSizePixel = 1
Item65.ZIndex = 2
Item65.Parent = Notification3
Item65.Text = "Auto Eat >"
Item65.TextColor3 = Color3.fromRGB(250,250,250)
Item65.TextScaled = true

local CmdHandler6 = Instance.new("ScrollingFrame")
CmdHandler6.Name = "CmdHandler6"
CmdHandler6.Parent = Background9
CmdHandler6.Active = true
CmdHandler6.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
CmdHandler6.BackgroundTransparency = 1.000
CmdHandler6.BorderSizePixel = 0
CmdHandler6.AutomaticCanvasSize = "Y"
CmdHandler6.Position = UDim2.new(0, 1, 0, 1)
CmdHandler6.Size = UDim2.new(0, 100, 0, 149)
CmdHandler6.ScrollBarThickness = 8

local YPos = 1
local NaMe = 1
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v:FindFirstChild("food") then
    Foodz = Instance.new("TextButton")
    Foodz.Name = NaMe
    Foodz.Position = UDim2.new(0,1,0,YPos)
    Foodz.Size = UDim2.new(0,95,0,15)
    Foodz.BackgroundColor3 = Color3.fromRGB(70,70,70)
    Foodz.BorderColor3 = Color3.new(1,1,1)
    Foodz.ZIndex = 2
    Foodz.Parent = CmdHandler6
    Foodz.Text = v.Name
    Foodz.TextColor3 = Color3.fromRGB(250,250,250)
    Foodz.TextScaled = true
    NaMe = NaMe + 1
    YPos = YPos + 15
    end
end

local Item66 = Instance.new("TextButton")
Item66.Position = UDim2.new(0,71,1,43)
Item66.Size = UDim2.new(0,70,0,20)
Item66.BackgroundColor3 = Color3.fromRGB(124,92,70)
Item66.BorderSizePixel = 0
Item66.ZIndex = 2
Item66.Parent = Notification7
Item66.Text = "Fhangorn"
Item66.TextColor3 = Color3.fromRGB(250,250,250)
Item66.TextScaled = true

local SlimeQueen = Instance.new("TextButton")
SlimeQueen.Position = UDim2.new(0,1,1,64)
SlimeQueen.Size = UDim2.new(0,70,0,20)
SlimeQueen.BackgroundColor3 = Color3.fromRGB(225,50,100)
SlimeQueen.BorderSizePixel = 0
SlimeQueen.ZIndex = 2
SlimeQueen.Parent = Notification7
SlimeQueen.Text = "Slime Queen"
SlimeQueen.TextColor3 = Color3.fromRGB(250,250,250)
SlimeQueen.TextScaled = true

local Item67 = Instance.new("TextButton")
Item67.Position = UDim2.new(0,1,0,175)
Item67.Size = UDim2.new(0,100,0,20)
Item67.BackgroundColor3 = Color3.fromRGB(0,0,250)
Item67.BorderSizePixel = 1
Item67.BorderColor3 = Color3.new(1,1,1)
Item67.ZIndex = 2
Item67.LayoutOrder = 2
Item67.Parent = CmdHandler
Item67.Text = "Farming >"
Item67.TextColor3 = Color3.fromRGB(250,250,250)
Item67.TextScaled = true

local Item68 = Instance.new("TextButton")
Item68.Position = UDim2.new(0,71,1,106)
Item68.Size = UDim2.new(0,70,0,20)
Item68.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item68.BorderSizePixel = 1
Item68.ZIndex = 2
Item68.Parent = N1
Item68.Text = "Candy Cane"
Item68.TextColor3 = Color3.fromRGB(250,250,250)
Item68.TextScaled = true

local Item69 = Instance.new("TextButton")
Item69.Position = UDim2.new(0,0,1,85)
Item69.Size = UDim2.new(0,70,0,20)
Item69.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item69.BorderSizePixel = 1
Item69.ZIndex = 2
Item69.Parent = N1
Item69.Text = "Dragon Fruit"
Item69.TextColor3 = Color3.fromRGB(250,250,250)
Item69.TextScaled = true

local Item70 = Instance.new("TextButton")
Item70.Position = UDim2.new(0,72,1,85)
Item70.Size = UDim2.new(0,70,0,20)
Item70.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item70.BorderSizePixel = 1
Item70.ZIndex = 2
Item70.Parent = N1
Item70.Text = "Auto-Yak Butter"
Item70.TextColor3 = Color3.fromRGB(250,250,250)
Item70.TextScaled = true

local Item72 = Instance.new("TextButton")
Item72.Position = UDim2.new(0,0,1,1)
Item72.Size = UDim2.new(0,70,0,20)
Item72.BackgroundColor3 = Color3.fromRGB(161,157,148)
Item72.BorderSizePixel = 1
Item72.ZIndex = 2
Item72.Parent = Notification10
Item72.Text = "Iron"
Item72.TextColor3 = Color3.fromRGB(0,0,0)
Item72.TextScaled = true

local Item73 = Instance.new("TextButton")
Item73.Position = UDim2.new(0,71,1,1)
Item73.Size = UDim2.new(0,70,0,20)
Item73.BackgroundColor3 = Color3.fromRGB(255,215,0)
Item73.BorderSizePixel = 1
Item73.ZIndex = 2
Item73.Parent = Notification10
Item73.Text = "Gold"
Item73.TextColor3 = Color3.fromRGB(0,0,0)
Item73.TextScaled = true

local Item74 = Instance.new("TextButton")
Item74.Position = UDim2.new(0,0,1,64)
Item74.Size = UDim2.new(0,70,0,20)
Item74.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item74.BorderSizePixel = 1
Item74.ZIndex = 2
Item74.Parent = N1
Item74.Text = "Plow Nearby"
Item74.TextColor3 = Color3.fromRGB(250,250,250)
Item74.TextScaled = true

local Item75 = Instance.new("TextButton")
Item75.Position = UDim2.new(0,0,1,106)
Item75.Size = UDim2.new(0,70,0,20)
Item75.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item75.BorderSizePixel = 1
Item75.ZIndex = 2
Item75.Parent = Notification3
Item75.Text = "Auto-Fish"
Item75.TextColor3 = Color3.fromRGB(250,250,250)
Item75.TextScaled = true

local Item76 = Instance.new("TextButton")
Item76.Position = UDim2.new(0,0,1,21)
Item76.Size = UDim2.new(0,141,0,20)
Item76.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item76.BorderSizePixel = 1
Item76.ZIndex = 2
Item76.Parent = Notification10
Item76.Text = "Clear Small Furnace"
Item76.TextColor3 = Color3.new(1,1,1)
Item76.TextScaled = true

local Item77 = Instance.new("TextButton")
Item77.Position = UDim2.new(0,0,1,106)
Item77.Size = UDim2.new(0,71,0,20)
Item77.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item77.BorderSizePixel = 1
Item77.ZIndex = 2
Item77.Parent = N1
Item77.Text = "Spirit Crystals"
Item77.TextColor3 = Color3.new(1,1,1)
Item77.TextScaled = true

local Item78 = Instance.new("TextButton")
Item78.Position = UDim2.new(0,72,1,64)
Item78.Size = UDim2.new(0,70,0,20)
Item78.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item78.BorderSizePixel = 1
Item78.ZIndex = 2
Item78.Parent = N1
Item78.Text = "Give Fertility Potions"
Item78.TextColor3 = Color3.fromRGB(250,250,250)
Item78.TextScaled = true

local Item79 = Instance.new("TextButton")
Item79.Position = UDim2.new(0,0,1,127)
Item79.Size = UDim2.new(0,70,0,20)
Item79.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item79.BorderSizePixel = 1
Item79.ZIndex = 2
Item79.Parent = Notification3
Item79.Text = "Catch Spirits"
Item79.TextColor3 = Color3.fromRGB(250,250,250)
Item79.TextScaled = true

local Item80 = Instance.new("TextButton")
Item80.Position = UDim2.new(0,1,0,222)
Item80.Size = UDim2.new(0,100,0,20)
Item80.BackgroundColor3 = Color3.fromRGB(0,0,250)
Item80.BorderSizePixel = 1
Item80.BorderColor3 = Color3.new(1,1,1)
Item80.ZIndex = 2
Item80.LayoutOrder = 9
Item80.Parent = CmdHandler
Item80.Text = "Hub Shops >"
Item80.TextColor3 = Color3.fromRGB(250,250,250)
Item80.TextScaled = true

local Item81 = Instance.new("TextButton")
Item81.Position = UDim2.new(0,1,0,1)
Item81.Size = UDim2.new(0,100,0,20)
Item81.BackgroundColor3 = Color3.fromRGB(0,0,250)
Item81.BorderSizePixel = 1
Item81.BorderColor3 = Color3.new(1,1,1)
Item81.ZIndex = 2
Item81.Parent = CmdHandler8
Item81.Text = "Lunar >"
Item81.TextColor3 = Color3.fromRGB(250,250,250)
Item81.TextScaled = true

local LA = Instance.new("TextBox")
LA.Position = UDim2.new(0,20,0,0)
LA.Size = UDim2.new(0,100,0,20)
LA.BackgroundColor3 = Color3.fromRGB(50,50,50)
LA.BorderSizePixel = 1
LA.BorderColor3 = Color3.new(1,1,1)
LA.ZIndex = 2
LA.Parent = LunarScroll
LA.Text = ""
LA.PlaceholderText = "Enter Amount"
LA.TextColor3 = Color3.fromRGB(250,250,250)
LA.TextScaled = true

local L1 = Instance.new("TextButton")
L1.Position = UDim2.new(0,1,0,21)
L1.Size = UDim2.new(0,140,0,20)
L1.BackgroundColor3 = Color3.fromRGB(0,0,250)
L1.BorderSizePixel = 1
L1.BorderColor3 = Color3.new(1,1,1)
L1.ZIndex = 2
L1.Parent = LunarScroll
L1.Text = "Fortune Cookies"
L1.TextColor3 = Color3.fromRGB(250,250,250)
L1.TextScaled = true
L1.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 2,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local L2 = Instance.new("TextButton")
L2.Position = UDim2.new(0,1,0,42)
L2.Size = UDim2.new(0,140,0,20)
L2.BackgroundColor3 = Color3.fromRGB(0,0,250)
L2.BorderSizePixel = 1
L2.BorderColor3 = Color3.new(1,1,1)
L2.ZIndex = 2
L2.Parent = LunarScroll
L2.Text = "Lion Lounge"
L2.TextColor3 = Color3.fromRGB(250,250,250)
L2.TextScaled = true
L2.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 20,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local L3 = Instance.new("TextButton")
L3.Position = UDim2.new(0,1,0,63)
L3.Size = UDim2.new(0,140,0,20)
L3.BackgroundColor3 = Color3.fromRGB(0,0,250)
L3.BorderSizePixel = 1
L3.BorderColor3 = Color3.new(1,1,1)
L3.ZIndex = 2
L3.Parent = LunarScroll
L3.Text = "Lunar Banner"
L3.TextColor3 = Color3.fromRGB(250,250,250)
L3.TextScaled = true
L3.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 30,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local L4 = Instance.new("TextButton")
L4.Position = UDim2.new(0,1,0,84)
L4.Size = UDim2.new(0,140,0,20)
L4.BackgroundColor3 = Color3.fromRGB(0,0,250)
L4.BorderSizePixel = 1
L4.BorderColor3 = Color3.new(1,1,1)
L4.ZIndex = 2
L4.Parent = LunarScroll
L4.Text = "Lunar Drum"
L4.TextColor3 = Color3.fromRGB(250,250,250)
L4.TextScaled = true
L4.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 40,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L5 = Instance.new("TextButton")
L5.Position = UDim2.new(0,1,0,105)
L5.Size = UDim2.new(0,140,0,20)
L5.BackgroundColor3 = Color3.fromRGB(0,0,250)
L5.BorderSizePixel = 1
L5.BorderColor3 = Color3.new(1,1,1)
L5.ZIndex = 2
L5.Parent = LunarScroll
L5.Text = "Lunar Gate"
L5.TextColor3 = Color3.fromRGB(250,250,250)
L5.TextScaled = true
L5.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 50,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L6 = Instance.new("TextButton")
L6.Position = UDim2.new(0,1,0,126)
L6.Size = UDim2.new(0,140,0,20)
L6.BackgroundColor3 = Color3.fromRGB(0,0,250)
L6.BorderSizePixel = 1
L6.BorderColor3 = Color3.new(1,1,1)
L6.ZIndex = 2
L6.Parent = LunarScroll
L6.Text = "Lunar Lamp"
L6.TextColor3 = Color3.fromRGB(250,250,250)
L6.TextScaled = true
L6.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 60,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L7 = Instance.new("TextButton")
L7.Position = UDim2.new(0,1,0,147)
L7.Size = UDim2.new(0,140,0,20)
L7.BackgroundColor3 = Color3.fromRGB(0,0,250)
L7.BorderSizePixel = 1
L7.BorderColor3 = Color3.new(1,1,1)
L7.ZIndex = 2
L7.Parent = LunarScroll
L7.Text = "Stacked Star Lunar Lantern"
L7.TextColor3 = Color3.fromRGB(250,250,250)
L7.TextScaled = true
L7.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 70,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L8 = Instance.new("TextButton")
L8.Position = UDim2.new(0,1,0,168)
L8.Size = UDim2.new(0,140,0,20)
L8.BackgroundColor3 = Color3.fromRGB(0,0,250)
L8.BorderSizePixel = 1
L8.BorderColor3 = Color3.new(1,1,1)
L8.ZIndex = 2
L8.Parent = LunarScroll
L8.Text = "Star Lunar Lantern"
L8.TextColor3 = Color3.fromRGB(250,250,250)
L8.TextScaled = true
L8.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 80,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L9 = Instance.new("TextButton")
L9.Position = UDim2.new(0,1,0,189)
L9.Size = UDim2.new(0,140,0,20)
L9.BackgroundColor3 = Color3.fromRGB(0,0,250)
L9.BorderSizePixel = 1
L9.BorderColor3 = Color3.new(1,1,1)
L9.ZIndex = 2
L9.Parent = LunarScroll
L9.Text = "Stacked Lunar Lantern"
L9.TextColor3 = Color3.fromRGB(250,250,250)
L9.TextScaled = true
L9.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 90,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L10 = Instance.new("TextButton")
L10.Position = UDim2.new(0,1,0,210)
L10.Size = UDim2.new(0,140,0,20)
L10.BackgroundColor3 = Color3.fromRGB(0,0,250)
L10.BorderSizePixel = 1
L10.BorderColor3 = Color3.new(1,1,1)
L10.ZIndex = 2
L10.Parent = LunarScroll
L10.Text = "Lunar Lantern Small"
L10.TextColor3 = Color3.fromRGB(250,250,250)
L10.TextScaled = true
L10.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 100,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L11 = Instance.new("TextButton")
L11.Position = UDim2.new(0,1,0,231)
L11.Size = UDim2.new(0,140,0,20)
L11.BackgroundColor3 = Color3.fromRGB(0,0,250)
L11.BorderSizePixel = 1
L11.BorderColor3 = Color3.new(1,1,1)
L11.ZIndex = 2
L11.Parent = LunarScroll
L11.Text = "Tiger Bean Bag"
L11.TextColor3 = Color3.fromRGB(250,250,250)
L11.TextScaled = true
L11.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 110,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L12 = Instance.new("TextButton")
L12.Position = UDim2.new(0,1,0,252)
L12.Size = UDim2.new(0,140,0,20)
L12.BackgroundColor3 = Color3.fromRGB(0,0,250)
L12.BorderSizePixel = 1
L12.BorderColor3 = Color3.new(1,1,1)
L12.ZIndex = 2
L12.Parent = LunarScroll
L12.Text = "Tiger Coin Bag"
L12.TextColor3 = Color3.fromRGB(250,250,250)
L12.TextScaled = true
L12.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 120,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L13 = Instance.new("TextButton")
L13.Position = UDim2.new(0,1,0,273)
L13.Size = UDim2.new(0,140,0,20)
L13.BackgroundColor3 = Color3.fromRGB(0,0,250)
L13.BorderSizePixel = 1
L13.BorderColor3 = Color3.new(1,1,1)
L13.ZIndex = 2
L13.Parent = LunarScroll
L13.Text = "Tiger Fridge"
L13.TextColor3 = Color3.fromRGB(250,250,250)
L13.TextScaled = true
L13.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 130,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L14 = Instance.new("TextButton")
L14.Position = UDim2.new(0,1,0,294)
L14.Size = UDim2.new(0,140,0,20)
L14.BackgroundColor3 = Color3.fromRGB(0,0,250)
L14.BorderSizePixel = 1
L14.BorderColor3 = Color3.new(1,1,1)
L14.ZIndex = 2
L14.Parent = LunarScroll
L14.Text = "Tiger Jacuzzi"
L14.TextColor3 = Color3.fromRGB(250,250,250)
L14.TextScaled = true
L14.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 140,
	["amount"] = tonumber(LA.Text)
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

L14 = Instance.new("TextButton")
L14.Position = UDim2.new(0,1,0,315)
L14.Size = UDim2.new(0,140,0,20)
L14.BackgroundColor3 = Color3.fromRGB(0,0,250)
L14.BorderSizePixel = 1
L14.BorderColor3 = Color3.new(1,1,1)
L14.ZIndex = 2
L14.Parent = LunarScroll
L14.Text = "Red Envelope (1 per day)"
L14.TextColor3 = Color3.fromRGB(250,250,250)
L14.TextScaled = true
L14.MouseButton1Click:Connect(function()
    Cookie = {[1] = {
	["merchant"] = "lunar",
	["offerId"] = 1,
	["amount"] = 1
	}}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(Cookie))
end)

local Item82 = Instance.new("TextButton")
Item82.Position = UDim2.new(0,1,0,21)
Item82.Size = UDim2.new(0,100,0,20)
Item82.BackgroundColor3 = Color3.fromRGB(0,0,250)
Item82.BorderSizePixel = 1
Item82.BorderColor3 = Color3.new(1,1,1)
Item82.ZIndex = 2
Item82.Parent = CmdHandler8
Item82.Text = "Cletus >"
Item82.TextColor3 = Color3.fromRGB(250,250,250)
Item82.TextScaled = true

local Item83 = Instance.new("TextButton")
Item83.Position = UDim2.new(0,1,0,42)
Item83.Size = UDim2.new(0,100,0,20)
Item83.BackgroundColor3 = Color3.fromRGB(0,0,250)
Item83.BorderSizePixel = 1
Item83.BorderColor3 = Color3.new(1,1,1)
Item83.ZIndex = 2
Item83.Parent = CmdHandler8
Item83.Text = "Wholesaler >"
Item83.TextColor3 = Color3.fromRGB(250,250,250)
Item83.TextScaled = true

local Item84 = Instance.new("TextButton")
Item84.Position = UDim2.new(0,1,0,126)
Item84.Size = UDim2.new(0,100,0,20)
Item84.BackgroundColor3 = Color3.fromRGB(0,0,250)
Item84.BorderSizePixel = 1
Item84.BorderColor3 = Color3.new(1,1,1)
Item84.ZIndex = 2
Item84.LayoutOrder = 5
Item84.Parent = CmdHandler
Item84.Text = "Mining >"
Item84.TextColor3 = Color3.fromRGB(250,250,250)
Item84.TextScaled = true

local Item85 = Instance.new("TextButton")
Item85.Position = UDim2.new(0,0,1,1)
Item85.Size = UDim2.new(0,70,0,20)
Item85.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item85.BorderSizePixel = 1
Item85.ZIndex = 2
Item85.Parent = Notification11
Item85.Text = "Buffalkor Island"
Item85.TextColor3 = Color3.fromRGB(250,250,250)
Item85.TextScaled = true

local Item86 = Instance.new("TextButton")
Item86.Position = UDim2.new(0,72,1,1)
Item86.Size = UDim2.new(0,70,0,20)
Item86.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item86.BorderSizePixel = 1
Item86.ZIndex = 2
Item86.Parent = Notification11
Item86.Text = "Diamond Island"
Item86.TextColor3 = Color3.fromRGB(250,250,250)
Item86.TextScaled = true

local Item87 = Instance.new("TextButton")
Item87.Position = UDim2.new(0,71,1,127)
Item87.Size = UDim2.new(0,70,0,20)
Item87.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item87.BorderSizePixel = 1
Item87.ZIndex = 2
Item87.Parent = N1
Item87.Text = "Pick Berries"
Item87.TextColor3 = Color3.fromRGB(250,250,250)
Item87.TextScaled = true

local Item88 = Instance.new("TextButton")
Item88.Position = UDim2.new(0,1,1,148)
Item88.Size = UDim2.new(0,70,0,20)
Item88.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item88.BorderSizePixel = 1
Item88.ZIndex = 2
Item88.Parent = N1
Item88.Text = "Composter"
Item88.TextColor3 = Color3.fromRGB(250,250,250)
Item88.TextScaled = true

local Item89 = Instance.new("TextButton")
Item89.Position = UDim2.new(0,71,1,148)
Item89.Size = UDim2.new(0,70,0,20)
Item89.BackgroundColor3 = Color3.fromRGB(63,63,63)
Item89.BorderSizePixel = 1
Item89.ZIndex = 2
Item89.Parent = N1
Item89.Text = "Rice"
Item89.TextColor3 = Color3.fromRGB(250,250,250)
Item89.TextScaled = true

local function NoclipLoop()
    if noClip == true and Plr.Character ~= nil then
        for _, child in pairs(Plr.Character:GetDescendants()) do
            if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
                child.CanCollide = false
            end
        end
    end
end

local VoidParasite = Instance.new("TextButton")
VoidParasite.Position = UDim2.new(0,0,1,1)
VoidParasite.Size = UDim2.new(0,70,0,20)
VoidParasite.BackgroundColor3 = Color3.fromRGB(150,63,150)
VoidParasite.BorderSizePixel = 1
VoidParasite.ZIndex = 2
VoidParasite.Parent = N2
VoidParasite.Text = "Void Parasite"
VoidParasite.TextColor3 = Color3.fromRGB(250,250,250)
VoidParasite.TextScaled = true
VoidParasite.MouseButton1Click:Connect(function()
    if Toggled87 then
        Toggled87 = false
        VoidParasite.BackgroundColor3 = Color3.fromRGB(150,63,150)
        VoidParasite.Text = "Void Parasite"
        VoidParasite.TextColor3 = Color3.new(1,1,1)
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        Noclipping:Disconnect()
        noClip = false
        tween:Cancel()
    else
        Toggled87 = true
        VoidParasite.BackgroundColor3 = Color3.new(0,255,255)
        VoidParasite.Text = "Farming!"
        VoidParasite.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        noClip = true
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        while Toggled87 == true do
            wait()
            Point = game:GetService("Workspace").WildernessBlocks:WaitForChild("voidParasite").Position
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time - 2)
            args = {
            [1] = {
            ["player"] = game:GetService("Players").LocalPlayer,
            ["player_tracking_category"] = "join_from_web",
            ["model"] = game:GetService("Workspace").WildernessBlocks:FindFirstChild("voidParasite")
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_HARVEST_CROP_REQUEST:InvokeServer(unpack(args))
        end
    end
end)


Title.MouseButton1Click:Connect(function()
    if Toggled5 then
        Toggled5 = false
        Title.BackgroundColor3 = Color3.new(0,0,1)
        Title.Text = "Mob Farms >"
        Title.TextColor3 = Color3.fromRGB(250,250,250)
        Background2.Visible = false
    else
        Toggled5 = true
        Toggled6 = false
        Toggled8 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = false
        Background10.Visible = false
        Item67.Text = "Farming >"
        Title.Text = "Mob Farms <"
        Background3.Visible = false
        Background4.Visible = false
        Background5.Visible = false
        Background6.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background9.Visible = false
        Background11.Visible = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Tests.Text = "Misc >"
        BowBoss.Text = "Wood >"
        Teleports.Text = "Teleports >"
        GUIs.Text = "Event >"
        Item42.Text = "Machines >"
        Item65.Text = "Auto Eat >"
        Item80.Text = "Hub Shops >"
        Background2.Visible = true
    end
end)

BowBoss.MouseButton1Click:Connect(function()
    if Toggled13 then
        Toggled13 = false
        BowBoss.BackgroundColor3 = Color3.new(0,0,1)
        BowBoss.Text = "Wood >"
        BowBoss.TextColor3 = Color3.fromRGB(250,250,250)
        Background5.Visible = false
    else
        Toggled13 = true
        Toggled6 = false
        Toggled5 = false
        Toggled8 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = false
        Background10.Visible = false
        Item67.Text = "Farming >"
        BowBoss.Text = "Wood <"
        Title.Text = "Mob Farms >"
        Background3.Visible = false
        Background4.Visible = false
        Background2.Visible = false
        Background6.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background9.Visible = false
        Background11.Visible = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Tests.Text = "Misc >"
        Teleports.Text = "Teleports >"
        GUIs.Text = "Event >"
        Item42.Text = "Machines >"
        Item65.Text = "Auto Eat >"
        Item80.Text = "Hub Shops >"
        Background5.Visible = true
        print("done")
    end
end)

GUIs.MouseButton1Click:Connect(function()
    if Toggled22 then
        Toggled22 = false
        GUIs.BackgroundColor3 = Color3.new(0,0,1)
        GUIs.Text = "Event >"
        GUIs.TextColor3 = Color3.fromRGB(250,250,250)
        Background6.Visible = false
    else
        Toggled22 = true
        Toggled13 = false
        Toggled6 = false
        Toggled5 = false
        Toggled8 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = false
        Background10.Visible = false
        Item67.Text = "Farming >"
        BowBoss.Text = "Wood >"
        Title.Text = "Mob Farms >"
        Background3.Visible = false
        Background4.Visible = false
        Background2.Visible = false
        Background5.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background9.Visible = false
        Background11.Visible = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Tests.Text = "Misc >"
        Teleports.Text = "Teleports >"
        Item42.Text = "Machines >"
        Item65.Text = "Auto Eat >"
        GUIs.Text = "Event <"
        Item80.Text = "Hub Shops >"
        Background6.Visible = true
        print("done")
    end
end)

Teleports.MouseButton1Click:Connect(function()
    if Toggled6 then
        Toggled6 = false
        Teleports.BackgroundColor3 = Color3.new(0,0,1)
        Teleports.Text = "Teleports >"
        Teleports.TextColor3 = Color3.fromRGB(250,250,250)
        Background3.Visible = false
    else
        Toggled6 = true
        Toggled5 = false
        Toggled8 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = false
        Background10.Visible = false
        Item67.Text = "Farming >"
        Teleports.Text = "Teleports <"
        Background2.Visible = false
        Background4.Visible = false
        Background5.Visible = false
        Background6.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background9.Visible = false
        Background11.Visible = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Item80.Text = "Hub Shops >"
        Title.Text = "Mob Farms >"
        Tests.Text = "Misc >"
        BowBoss.Text = "Wood >"
        GUIs.Text = "Event >"
        Item42.Text = "Machines >"
        Item65.Text = "Auto Eat >"
        Background3.Visible = true
    end
end)

Tests.MouseButton1Click:Connect(function()
    if Toggled8 then
        Toggled8 = false
        Tests.BackgroundColor3 = Color3.new(0,0,1)
        Tests.Text = "Misc >"
        Tests.TextColor3 = Color3.fromRGB(250,250,250)
        Background4.Visible = false
    else
        Toggled8 = true
        Toggled5 = false
        Toggled6 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = false
        Background10.Visible = false
        Item67.Text = "Farming >"
        Tests.Text = "Misc <"
        Background2.Visible = false
        Background3.Visible = false
        Background5.Visible = false
        Background6.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background9.Visible = false
        Background11.Visible = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Title.Text = "Mob Farms >"
        Teleports.Text = "Teleports >"
        BowBoss.Text = "Wood >"
        GUIs.Text = "Event >"
        Item42.Text = "Machines >"
        Item65.Text = "Auto Eat >"
        Item80.Text = "Hub Shops >"
        Background4.Visible = true
    end
end)

Item65.MouseButton1Click:Connect(function()
    if Toggled47 then
        Toggled47 = false
        Item65.Text = "Auto Eat >"
        Background9.Visible = false
    else
        Toggled47 = true
        Toggled5 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled50 = false
        Toggled70 = false
        Background10.Visible = false
        Item67.Text = "Farming >"
        Item65.Text = "Auto Eat <"
        Item80.Text = "Hub Shops >"
        Background2.Visible = false
        Background3.Visible = false
        Background5.Visible = false
        Background6.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background11.Visible = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Title.Text = "Mob Farms >"
        Teleports.Text = "Teleports >"
        BowBoss.Text = "Wood >"
        Item42.Text = "Machines >"
        Background9.Visible = true
    end
end)

Item67.MouseButton1Click:Connect(function()
    if Toggled50 then
        Toggled50 = false
        Background10.Visible = false
        Item67.Text = "Farming >"
        Item67.BackgroundColor3 = Color3.new(0,0,1)
        Item67.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled8 = false
        Toggled5 = false
        Toggled6 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = true
        Toggled70 = false
        Item67.Text = "Farming <"
        Background10.Visible = true
        Background2.Visible = false
        Background3.Visible = false
        Background4.Visible = false
        Background5.Visible = false
        Background6.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background9.Visible = false
        Background11.Visible = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Title.Text = "Mob Farms >"
        Teleports.Text = "Teleports >"
        BowBoss.Text = "Wood >"
        GUIs.Text = "Event >"
        Item42.Text = "Machines >"
        Item65.Text = "Auto Eat >"
        Tests.Text = "Misc >"
        Item80.Text = "Hub Shops >"
    end
end)

Item80.MouseButton1Click:Connect(function()
    if Toggled70 then
        Toggled70 = false
        Background11.Visible = false
        Item80.Text = "Hub Shops >"
        Item80.BackgroundColor3 = Color3.new(0,0,1)
        Item80.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled8 = false
        Toggled5 = false
        Toggled6 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = true
        Item80.Text = "Hub Shops <"
        Item67.Text = "Farming >"
        Background10.Visible = false
        Background2.Visible = false
        Background3.Visible = false
        Background4.Visible = false
        Background5.Visible = false
        Background6.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background9.Visible = false
        Background11.Visible = true
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Title.Text = "Mob Farms >"
        Teleports.Text = "Teleports >"
        BowBoss.Text = "Wood >"
        GUIs.Text = "Event >"
        Item42.Text = "Machines >"
        Item65.Text = "Auto Eat >"
        Tests.Text = "Misc >"
    end
end)

Item81.MouseButton1Click:Connect(function() -- lunar
    if Toggled71 then
        Toggled71 = false
        Lunar.Visible = false
        Item81.Text = "Lunar >"
        Item81.BackgroundColor3 = Color3.new(0,0,1)
        Item81.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled71 = true
        Item81.Text = "Lunar <"
        Lunar.Visible = true
        Toggled72 = false
        Item82.Text = "Cletus >"
        Cletus.Visible = false
        Toggled73 = false
        Wholesaler.Visible = false
        Item83.Text = "Wholesaler >"
    end
end)

Item82.MouseButton1Click:Connect(function() -- lunar
    if Toggled72 then
        Toggled72 = false
        Cletus.Visible = false
        Item82.Text = "Cletus >"
        Item82.BackgroundColor3 = Color3.new(0,0,1)
        Item82.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled72 = true
        Item82.Text = "Cletus <"
        Cletus.Visible = true
        Lunar.Visible = false
        Item81.Text = "Lunar >"
        Toggled71 = false
        Toggled73 = false
        Wholesaler.Visible = false
        Item83.Text = "Wholesaler >"
    end
end)

Item83.MouseButton1Click:Connect(function() -- lunar
    if Toggled73 then
        Toggled73 = false
        Wholesaler.Visible = false
        Item83.Text = "Wholesaler >"
        Item83.BackgroundColor3 = Color3.new(0,0,1)
        Item83.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled73 = true
        Item83.Text = "Wholesaler <"
        Wholesaler.Visible = true
        Lunar.Visible = false
        Cletus.Visible = false
        Item81.Text = "Lunar >"
        Item82.Text = "Cletus >"
        Toggled71 = false
        Toggled72 = false
    end
end)

Item84.MouseButton1Click:Connect(function()
    if Toggled73 then
        Toggled73 = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Item84.BackgroundColor3 = Color3.new(0,0,1)
        Item84.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled8 = false
        Toggled5 = false
        Toggled6 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled27 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = false
        Toggled73 = true
        Item80.Text = "Hub Shops >"
        Item67.Text = "Farming >"
        Item84.Text = "Mining <"
        Background10.Visible = false
        Background2.Visible = false
        Background3.Visible = false
        Background4.Visible = false
        Background5.Visible = false
        Background6.Visible = false
        Background7.Visible = false
        Background8.Visible = false
        Background9.Visible = false
        Background11.Visible = false
        Background12.Visible = true
        Title.Text = "Mob Farms >"
        Teleports.Text = "Teleports >"
        BowBoss.Text = "Wood >"
        GUIs.Text = "Event >"
        Item42.Text = "Machines >"
        Item65.Text = "Auto Eat >"
        Tests.Text = "Misc >"
    end
end)


Item2.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/3MYQCdby'))()
end)

Item3.MouseButton1Click:Connect(function()
setclipboard("https://discord.gg/VxqpSsQ5")
Item3.Text = "Discord link copied!"
wait(3)
Item3.Text = "Copy Discord link to Clipboard"

end)

Item4.MouseButton1Click:Connect(function()
    if Toggled1 then
        Toggled1 = false
        Item4.BackgroundColor3 = Color3.fromRGB(63,165,63)
        Item4.Text = "Slimes"
        Item4.TextColor3 = Color3.fromRGB(250,250,250)
        if Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        end
        tween:Cancel()
    else
        Toggled1 = true
        Item4.BackgroundColor3 = Color3.new(1,0,0)
        Item4.Text = "KILL!"
        Item4.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        BV.Velocity = Vector3.new(0,0,0)
        BV.MaxForce = Vector3.new(0,math.huge,0)
        BV.Parent = HR
        local enemy = "slime"
        while Toggled1 == true do
            wait()
            if game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy) then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy):WaitForChild("HumanoidRootPart").Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point + Vector3.new(0,-10,0))})
                tween:Play()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["crit"] = true,
                ["hitUnit"] = workspace.WildernessIsland.Entities:WaitForChild(enemy)
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("cfevfavTqnegCGxwuojAqhLdtihky/jdClttxycammwHieaAhrnHfgcfnynKcavxb"):FireServer(unpack(args))
            end
        end
    end
end)

Item5.MouseButton1Click:Connect(function()
    if Toggled2 then
        Toggled2 = false
        Item5.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
        Item5.Text = "Buffalkor"
        Item5.TextColor3 = Color3.fromRGB(1,1,1)
        b1.CanCollide = false
        if Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        end
        tween:Cancel()
    else
        Toggled2 = true
        Item5.BackgroundColor3 = Color3.new(1,0,0)
        Item5.Text = "KILL"
        Item5.TextColor3 = Color3.fromRGB(0,0,0)
        local enemy = "buffalkor"
        local BV = Instance.new("BodyVelocity")
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        while Toggled2 == true do
            wait()
            if game:GetService("Workspace").WildernessIsland.Entities:WaitForChild(enemy):WaitForChild("HumanoidRootPart") then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy).HumanoidRootPart.Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point + Vector3.new(0,-10,0))})
                tween:Play()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["crit"] = true,
                ["hitUnit"] = workspace.WildernessIsland.Entities:WaitForChild(enemy)
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("cfevfavTqnegCGxwuojAqhLdtihky/jdClttxycammwHieaAhrnHfgcfnynKcavxb"):FireServer(unpack(args))
            end
        end
    end
end)

Mob3.MouseButton1Click:Connect(function()
    if Toggled3 then
        Toggled3 = false
        Mob3.BackgroundColor3 = Color3.fromRGB(128,0,0)
        Mob3.Text = "Wizard"
        Mob3.TextColor3 = Color3.fromRGB(250,250,250)
        if Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        end
        tween:Cancel()
    else
        Toggled3 = true
        Mob3.BackgroundColor3 = Color3.new(1,0,0)
        Mob3.Text = "KILL!"
        Mob3.TextColor3 = Color3.fromRGB(0,0,0)
        local enemy = "wizardLizard"
        local BV = Instance.new("BodyVelocity")
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        while Toggled3 == true do
            wait()
            if game:GetService("Workspace").WildernessIsland.Entities:WaitForChild(enemy):WaitForChild("HumanoidRootPart") then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy).HumanoidRootPart.Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point + Vector3.new(0,-10,0))})
                tween:Play()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["crit"] = true,
                ["hitUnit"] = workspace.WildernessIsland.Entities:WaitForChild(enemy)
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("cfevfavTqnegCGxwuojAqhLdtihky/jdClttxycammwHieaAhrnHfgcfnynKcavxb"):FireServer(unpack(args))
            end
        end
    end
end)

Mob4.MouseButton1Click:Connect(function()
    if Toggled4 then
        Toggled4 = false
        Mob4.BackgroundColor3 = Color3.fromRGB(194,178,128)
        Mob4.Text = "Skorps"
        Mob4.TextColor3 = Color3.fromRGB(1,1,1)
        if Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        end
        tween:Cancel()
    else
        Toggled4 = true
        Mob4.BackgroundColor3 = Color3.new(1,0,0)
        Mob4.Text = "KILL!"
        Mob4.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        enemy = "skorpRuby"
        enemy2 = "skorpGold"
        enemy3 = "skorpIron"
        while Toggled4 == true do
            wait()
            print("searching for skorps")
            if game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy) then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy):WaitForChild("HumanoidRootPart").Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point + Vector3.new(0,-10,0))})
                tween:Play()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["crit"] = true,
                ["hitUnit"] = workspace.WildernessIsland.Entities:WaitForChild(enemy)
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("cfevfavTqnegCGxwuojAqhLdtihky/jdClttxycammwHieaAhrnHfgcfnynKcavxb"):FireServer(unpack(args))
            elseif game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy2) then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy2):WaitForChild("HumanoidRootPart").Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point + Vector3.new(0,-10,0))})
                tween:Play()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["crit"] = true,
                ["hitUnit"] = workspace.WildernessIsland.Entities:WaitForChild(enemy2)
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("cfevfavTqnegCGxwuojAqhLdtihky/jdClttxycammwHieaAhrnHfgcfnynKcavxb"):FireServer(unpack(args))
            elseif game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy3) then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy3):WaitForChild("HumanoidRootPart").Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point + Vector3.new(0,-10,0))})
                tween:Play()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["crit"] = true,
                ["hitUnit"] = workspace.WildernessIsland.Entities:WaitForChild(enemy3)
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("cfevfavTqnegCGxwuojAqhLdtihky/jdClttxycammwHieaAhrnHfgcfnynKcavxb"):FireServer(unpack(args))
            end
        end
    end
end)

Item6.MouseButton1Click:Connect(function()
 _G.prox = {}
local c = 0
for i, v in pairs(workspace:GetDescendants()) do
    if v.Name == "ProximityPrompt" then
        if v.Parent:IsA("Model") then
            if (v.Parent.PrimaryPart.Position - HR.Position).Magnitude < 25 then
                table.insert(_G.prox, v)
            end
        elseif (v.Parent.Position - HR.Position).Magnitude < 25 then
            table.insert(_G.prox, v)
        end
    end
end
for i, v in pairs(_G.prox) do
    fireproximityprompt(v)
end
end)

mouse.Button1Down:connect(function()
    if Toggled7 == true then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = mouse.Hit
    end
end)
    
Item22.MouseButton1Click:Connect(function()
    if Toggled9 then
        Toggled9 = false
        Item22.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item22.Text = "Pick Useless Fertiles"
        Item22.TextColor3 = Color3.fromRGB(250,250,250)
        Pickem:Disconnect()
    else
        Toggled9 = true
        Item22.BackgroundColor3 = Color3.new(0,255,255)
        Item22.Text = "Pickin"
        Item22.TextColor3 = Color3.fromRGB(0,0,0)
    end
end)

if Island == "" then wait() else
Island.Blocks.ChildAdded:Connect(function(flower)
    if Toggled9 == true and (flower.Name == "flowerHibiscusPinkFertile" or flower.Name == "flowerHibiscusLightGreenFertile" or flower.Name == "flowerHibiscusBlueFertile" or flower.Name == "flowerHibiscusWhiteFertile" or flower.Name == "flowerHibiscusPurpleFertile" or flower.Name == "flowerHibiscusOrangeFertile" or flower.Name == "flowerHibiscusBlackFertile" or flower.Name == "flowerHyacinthRedFertile" or flower.Name == "flowerHyacinthYellowFertile" or flower.Name == "flowerHyacinthBlueFertile" or flower.Name == "flowerHyacinthCyanFertile"  or flower.Name == "flowerHyacinthLightGreenFertile" or flower.Name == "flowerHyacinthOrangeFertile" or flower.Name == "flowerHyacinthRedFertile" or flower.Name == "flowerLilyCyanFertile" or flower.Name == "flowerLilyBlueFertile" or flower.Name == "flowerLilyBlackFertile" or flower.Name == "flowerLilyYellowFertile" or flower.Name == "flowerLilyDarkGreenFertile" or flower.Name == "flowerLilyRedFertile" or flower.Name == "flowerDaisyWhiteFertile" or flower.Name == "flowerDaisyRedFertile" or flower.Name == "flowerDaisyLightGreenFertile" or flower.Name == "flowerDaisyCyanFertile" or flower.Name == "flowerDaisyDarkGreenFertile" or flower.Name == "flowerDaisyYellowFertile" or flower.Name == "flowerTulipYellowFertile" or flower.Name == "flowerTulipLightGreenFertile" or flower.Name == "flowerTulipRedFertile" or flower.Name == "flowerTulipPinkFertile" or flower.Name == "flowerTulipOrangeFertile" or flower.Name == "flowerTulipDarkGreenFertile" or flower.Name == "flowerTulipWhiteFertile" or flower.Name == "flowerMumWhiteFertile" or flower.Name == "flowerMumRedFertile" or flower.Name == "flowerMumCyanFertile" or flower.Name == "flowerMumLightGreenFertile" or flower.Name == "flowerMumBlueFertile" or flower.Name == "flowerMumBlackFertile" or flower.Name == "flowerMumPurpleFertile" or flower.Name == "flowerMumPinkFertile" or flower.Name == "flowerMumChromeFertile" or flower.Name == "flowerDaffodilYellowFertile" or flower.Name == "flowerDaffodilOrangeFertile" or flower.Name == "flowerDaffodilLightGreenFertile" or flower.Name == "flowerDaffodilPinkFertile" or flower.Name == "flowerDaffodilWhiteFertile" or flower.Name == "flowerDaffodilDarkGreenFertile" or flower.Name == "flowerRosePurpleFertile" or flower.Name == "flowerRosePinkFertile" or flower.Name == "flowerYellowHyacinthFertile") then
        local args = {
        [1] = {
        ["flower"] = flower
        }}game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
    end
end)
end

Item34.MouseButton1Click:Connect(function()
    if Toggled23 then
        Toggled23 = false
        Item34.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item34.Text = "Pick Unfertile"
        Item34.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled23 = true
        Item34.BackgroundColor3 = Color3.new(0,255,255)
        Item34.Text = "Pickin"
        Item34.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled23 == true do
            print("picking flower")
            if Island.Blocks:FindFirstChild("flowerHyacinthCyan") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHyacinthCyan
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerTulipDarkGreen") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerTulipDarkGreen
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerMumWhite") then
            local args = {
            [1] = {
            ["flower"] = Island.Blocks.flowerMumWhite
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerMumMundane") then
            local args = {
            [1] = {
            ["flower"] = Island.Blocks.flowerMumMundane
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
			elseif Island.Blocks:FindFirstChild("flowerMumCyan") then
            local args = {
            [1] = {
            ["flower"] = Island.Blocks.flowerMumCyan
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
			elseif Island.Blocks:FindFirstChild("flowerMumPink") then
            local args = {
            [1] = {
            ["flower"] = Island.Blocks.flowerMumPink
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
			elseif Island.Blocks:FindFirstChild("flowerMumLightGreen") then
            local args = {
            [1] = {
            ["flower"] = Island.Blocks.flowerMumLightGreen
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
			elseif Island.Blocks:FindFirstChild("flowerMumBlue") then
            local args = {
            [1] = {
            ["flower"] = Island.Blocks.flowerMumBlue
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
			elseif Island.Blocks:FindFirstChild("flowerMumPurple") then
            local args = {
            [1] = {
            ["flower"] = Island.Blocks.flowerMumPurple
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
			elseif Island.Blocks:FindFirstChild("flowerMumChrome") then
            local args = {
            [1] = {
            ["flower"] = Island.Blocks.flowerMumChrome
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerTulipLightGreen") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerTulipLightGreen
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerTulipWhite") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerTulipWhite
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerTulipOrange") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerTulipOrange
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerTulipPink") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerTulipPink
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerTulipMundane") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerTulipMundane
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHyacinthRed") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHyacinthRed
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHyacinthOrange") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHyacinthOrange
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHyacinthLightGreen") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHyacinthLightGreen
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHyacinthMundane") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHyacinthMundane
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHibiscusMundane") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusMundane
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHibiscusBlack") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusBlack
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHibiscusBlue") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusBlue
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHibiscusOrange") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusOrange
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHibiscusPink") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusPink
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHibiscusWhite") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusWhite
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
		    elseif Island.Blocks:FindFirstChild("flowerHibiscusPurple") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusPurple
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerRoseMundane") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerRoseMundane
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerRosePink") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerRosePink
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerRosePurple") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerRosePurple
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerLilyBlack") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerLilyBlack
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerLilyYellow") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerLilyYellow
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerLilyBlue") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerLilyBlue
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerLilyCyan") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerLilyCyan
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerLilyDarkGreen") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerLilyDarkGreen
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerLilyMundane") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerLilyMundane
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerDaisyMundane") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaisyMundane
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerDaisyLightGreen") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaisyLightGreen
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerDaisyDarkGreen") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaisyDarkGreen
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerDaisyCyan") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaisyCyan
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerDaisyWhite") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaisyWhite
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerDaffodilYellow") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaffodilYellow
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerDaffodilOrange") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaffodilOrange
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerDaffodilLightGreen") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaffodilLightGreen
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerDaffodilDarkGreen") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaffodilDarkGreen
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerDaffodilWhite") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaffodilWhite
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerDaffodilMundane") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaffodilMundane
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            else
                wait()
            end
        end
    end
end)

Item35.MouseButton1Click:Connect(function()
    if Toggled24 then
        Toggled24 = false
        Item35.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item35.Text = "Water Flowers"
        Item35.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled24 = true
        Item35.BackgroundColor3 = Color3.new(0,255,255)
        Item35.Text = "Waterin"
        Item35.TextColor3 = Color3.fromRGB(0,0,0)
        WS = 30
        local Player = game.Players.LocalPlayer
        local Humanoid = Player.Character.Humanoid
        Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            if Toggled24 then
            Humanoid.WalkSpeed = WS
            end
        end)
        Humanoid.WalkSpeed = WS
		local Island = ""
		for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
			if (island:IsA("Model")) then
				Island = island
			end
		end
		print("Found island",Island)
        while Toggled24 == true do
			for _,Fertile in pairs(Island.Blocks:GetChildren()) do
				if (Fertile:IsA("Part")) and Fertile:FindFirstChild("Watered") and Fertile:FindFirstChild("Top") then
					if Fertile.Watered.Value == true then
					    wait()
					elseif Fertile.Watered.Value == false then
					    if Toggled24 == true then
					        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Fertile.Position).magnitude > 24 then
                                game.Players.LocalPlayer.Character.Humanoid:MoveTo(Fertile.Position)
                                game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:wait()
                                for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                                    if v.Name == "wateringCan" then
                                        v.Parent = game:GetService("Players").LocalPlayer.Character
                                        wait()
                                    end
                                end
                                local args = {
                                    [1] = {
                                    ["block"] = Fertile
                                    }
                                }
                                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_WATER_BLOCK:InvokeServer(unpack(args))
						    else
                                for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                                    if v.Name == "wateringCan" then
                                        v.Parent = game:GetService("Players").LocalPlayer.Character
                                        wait()
                                    end
                                end
                                local args = {
                                [1] = {
                                ["block"] = Fertile
                                }
                                }
                                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_WATER_BLOCK:InvokeServer(unpack(args))
                            end
                        end
					end
				end
			end
        end
    end
end)

Item36.MouseButton1Click:Connect(function()
    if Toggled25 then
        Toggled25 = false
        Item36.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item36.Text = "Clear Grass/Rocks"
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        tween:Cancel()
        Item36.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled25 = true
        Item36.BackgroundColor3 = Color3.new(0,255,255)
        Item36.Text = "clearing spawnables"
        Item36.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
		local YSpeed = 0
		BV.Velocity = Vector3.new(0,0,0)
		BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local TS = game:GetService('TweenService')
        local HR = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
		local Island = ""
		for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
			if (island:IsA("Model")) then
				Island = island
			end
		end
		print("Found island",Island)
        while Toggled25 == true do
			if Toggled25 == true then
			    wait()
			    if Island.Blocks:FindFirstChild("naturalRock1") then
                    Point = Island.Blocks:FindFirstChild("naturalRock1").Position
                    if (HR.Position - Point).Magnitude > 23 then
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time - 2)
                    end
                    local TS = game:GetService('TweenService')
                    local HR = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
                    if Plr.Character:FindFirstChild("opalPickaxe") or Plr.Character:FindFirstChild("voidMattock") then
                        wait()
                    else
                        print("equipping tool")
                        if Plr.Backpack:FindFirstChild("voidMattock") then
                            Plr.Backpack:FindFirstChild("voidMattock").Parent = game:GetService("Players").LocalPlayer.Character
                            wait()
                        elseif Plr.Backpack:FindFirstChild("opalPickaxe") then
                            Plr.Backpack:FindFirstChild("opalPickaxe").Parent = game:GetService("Players").LocalPlayer.Character
                            wait()
                        end
                    end
                    print("smack that rock!")
                    local args = {
                        [1] = {
                            ["player_tracking_category"] = "join_from_web",
                            ["part"] = Island.Blocks:FindFirstChild("naturalRock1").MeshPart,
                            ["block"] = Island.Blocks:FindFirstChild("naturalRock1"),
                            ["norm"] = nil --[[Vector3]],
                            ["pos"] = nil --[[Vector3]]
                        }
                    }
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
                    wait()
                    
			 elseif Island.Blocks:FindFirstChild("tallGrass") then
                    Point = Island.Blocks:FindFirstChild("tallGrass").Position
                    if (HR.Position - Point).Magnitude > 23 then
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time - 2)
                    end
                    if Plr.Character:FindFirstChild("opalPickaxe") or Plr.Character:FindFirstChild("voidMattock") then
                        wait()
                    else
                        print("equipping tool")
                        if Plr.Backpack:FindFirstChild("voidMattock") then
                            Plr.Backpack:FindFirstChild("voidMattock").Parent = game:GetService("Players").LocalPlayer.Character
                            wait()
                        elseif Plr.Backpack:FindFirstChild("opalPickaxe") then
                            Plr.Backpack:FindFirstChild("opalPickaxe").Parent = game:GetService("Players").LocalPlayer.Character
                            wait()
                        end
                    end
                    local args = {
                        [1] = {
                            ["player_tracking_category"] = "join_from_web",
                            ["part"] = Island.Blocks:FindFirstChild("tallGrass").MeshPart,
                            ["block"] = Island.Blocks:FindFirstChild("tallGrass"),
                            ["norm"] = nil --[[Vector3]],
                            ["pos"] = nil --[[Vector3]]
                        }
                    }

                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
	            end
			end
        end
    end
end)

Item23.MouseButton1Click:Connect(function()
    if Toggled10 then
        Toggled10 = false
        Item23.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item23.Text = "Honeycomb"
        Item23.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled10 = true
        Item23.BackgroundColor3 = Color3.new(0,255,255)
        Item23.Text = "Gettn HC"
        Item23.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled10 == true do
            for i,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
                wait()
                if (island:IsA("Model")) then
                    for i,beehive in pairs(island.Blocks:GetDescendants()) do
                        if (beehive:IsA("Model")) and beehive.Name == "beeHive" and beehive.Root.Effects.Honey.ParticleEmitter.Enabled == true then
                            print("Found Honeycomb")
                            local Beehive = beehive.Parent.Parent.Parent

                            local args = {
                                [1] = {
                                ["tree"] = Beehive
                                }
                            }
                            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_COLLECT_HONEY:InvokeServer(unpack(args))
							wait(1)
                        end
                        
                    end
                end
            end
        end
    end
end)

Item24.MouseButton1Click:Connect(function()
    if Toggled11 then
        Toggled11 = false
        Item24.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item24.Text = "Collect Nearby in/out"
        Item24.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled11 = true
        Item24.BackgroundColor3 = Color3.new(0,255,255)
        Item24.Text = "Collecting"
        Item24.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled11 == true do
            wait()
            for i,v in pairs(game:GetDescendants()) do
                if (v:IsA("Part")) and (v.Name == "chestLargeIndustrialIO" or v.Name == "chestMediumIndustrialIO") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude < 24 then
                    wait()
                    for _, b in pairs(v.Contents:GetChildren()) do
                        if (b:IsA("Tool")) then
                            if Toggled11 then
                                wait()
                                    local args = {
                                    [1] = {
                                    ["chest"] = v,
                                    ["player_tracking_category"] = "join_from_web",
                                    ["amount"] = b.Amount.Value,
                                    ["tool"] = b,
                                    ["action"] = "withdraw"
                                    }
                                    }
                                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_CHEST_TRANSACTION:InvokeServer(unpack(args))
                            end
                        end
                    end
                end
            end
        end
    end
end)

Item25.MouseButton1Click:Connect(function()
    if Toggled12 then
        Toggled12 = false
        Item25.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item25.Text = "Auto-Mayo"
        Item25.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled12 = true
        Item25.BackgroundColor3 = Color3.new(0,255,255)
        Item25.Text = "Makin' the mayo"
        Item25.TextColor3 = Color3.fromRGB(0,0,0)
		local Island = ""
		for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
			if (island:IsA("Model")) then
				Island = island
			end
		end
		print("Found island",Island)
        while Toggled12 == true do
            wait()
			for _,MayoSpinner in pairs(Island.Blocks:GetChildren()) do
				if (MayoSpinner:IsA("Part")) and MayoSpinner.Name == "churner" then
					print("Found mayo spinner")
					wait()

					local args = {
						[1] = {
						["amount"] = 1,
						["block"] = MayoSpinner,
						["player_tracking_category"] = "join_from_web",
						["toolName"] = "egg"
						}
					}

					game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))

					if MayoSpinner.WorkerContents:FindFirstChild("jarMayonnaise") then
	
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(MayoSpinner.Position + Vector3.new(0,5,0))
						print("gettn that mayo")
						wait()
						local args = {
							[1] = {
								["tool"] = MayoSpinner.WorkerContents.jarMayonnaise,
								["player_tracking_category"] = "join_from_web"
							}
						}

						game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
						else
						print("no mayo")
					end
				end
			end
        end
    end
end)

Item26.MouseButton1Click:Connect(function()
local Tool = ""

for i,tool in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
    if (tool:IsA("Tool")) then
print(Tool)

for _,v in pairs(game.Workspace:GetDescendants()) do
    if (v:IsA("Folder")) and v.Name == "SellingContents" then
        if v:FindFirstChild(tool.Name) then
    print("Found a machine")
    game.Players.LocalPlayer.Character.Humanoid:MoveTo(v.Parent.Position)
	end
end
end
end
end
end)

local BowPower = Instance.new("TextBox")
BowPower.Position = UDim2.new(0,0,1,0)
BowPower.Size = UDim2.new(0,140,0,20)
BowPower.BackgroundColor3 = Color3.fromRGB(50,50,50)
BowPower.BorderSizePixel = 0
BowPower.BorderColor3 = Color3.new(1,1,1)
BowPower.ZIndex = 2
BowPower.Parent = Notification7
BowPower.Text = ""
BowPower.PlaceholderText = "Test Number"
BowPower.TextColor3 = Color3.fromRGB(250,250,250)
BowPower.TextScaled = true

Item27.MouseButton1Click:Connect(function()
    if Toggled14 then
        Toggled14 = false
        Item27.BackgroundColor3 = Color3.fromRGB(63,165,63)
        Item27.Text = "Slime King"
        Item27.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled14 = true
        Item27.BackgroundColor3 = Color3.new(1,0,0)
        Item27.Text = "Pew Pew"
        Item27.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled14 == true do
            wait()
            local Direction = (game:GetService("Workspace").WildernessIsland.Entities:WaitForChild("slimeKing").HumanoidRootPart.Position - HR.Position)
            local args = {
            [1] = HttpService:GenerateGUID(false),
            [2] = {
            [1] = {
            ["direction"] = Direction + Vector3.new(0, Direction.Magnitude, 0),
            ["time"] = tick(),
            ["charge"] = 1,
            ["bow"] = Character.bow1,
            ["arrowName"] = "arrow1"
        }
    }
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("bcglfyfkPjydeYK/lbrbzctgokg"):FireServer(unpack(args))

        end
    end
end)

SlimeQueen.MouseButton1Click:Connect(function()
    if Toggled76 then
        Toggled76 = false
        SlimeQueen.BackgroundColor3 = Color3.fromRGB(225,50,100)
        SlimeQueen.Text = "Slime Queen"
        SlimeQueen.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled76 = true
        SlimeQueen.BackgroundColor3 = Color3.new(1,0,0)
        SlimeQueen.Text = "Pew Pew"
        SlimeQueen.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled76 == true do
            wait()
            local Direction = (game:GetService("Workspace").WildernessIsland.Entities:WaitForChild("slimeQueen").HumanoidRootPart.Position - HR.Position)
            local args = {
            [1] = HttpService:GenerateGUID(false),
            [2] = {
            [1] = {
            ["direction"] = Direction + Vector3.new(0, Direction.Magnitude/4, 0),
            ["time"] = tick(),
            ["charge"] = 1,
            ["bow"] = Character.bow1,
            ["arrowName"] = "arrow1"
        }
    }
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("bcglfyfkPjydeYK/lbrbzctgokg"):FireServer(unpack(args))

        end
    end
end)

local VoidDog = Instance.new("TextButton")
VoidDog.Position = UDim2.new(0,1,1,106)
VoidDog.Size = UDim2.new(0,70,0,20)
VoidDog.BackgroundColor3 = Color3.fromRGB(150,0,150)
VoidDog.BorderSizePixel = 0
VoidDog.ZIndex = 2
VoidDog.Parent = Notification7
VoidDog.Text = "Void Dog(Boss)"
VoidDog.TextColor3 = Color3.fromRGB(250,250,250)
VoidDog.TextScaled = true
VoidDog.MouseButton1Click:Connect(function()
    if Toggled81 then
        Toggled81 = false
        VoidDog.BackgroundColor3 = Color3.fromRGB(150,0,150)
        VoidDog.Text = "Void Dog(Boss)"
        VoidDog.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled81 = true
        VoidDog.BackgroundColor3 = Color3.new(1,0,0)
        VoidDog.Text = "Pew Pew"
        VoidDog.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled81 == true do
            wait()
            for i,v in pairs(game.Workspace.WildernessIsland.Entities:GetChildren()) do
                if v.Name == "voidDog" and v:FindFirstChild("HumanoidRootPart") then
                    if (v.HumanoidRootPart.Position - Vector3.new(-10224, 315, 9321)).Magnitude < 175 then
            wait()
                    end
                end
            end
        end
    end
end)

local Buff = Instance.new("TextButton")
Buff.Position = UDim2.new(0,71,1,106)
Buff.Size = UDim2.new(0,70,0,20)
Buff.BackgroundColor3 = Color3.fromRGB(150,150,150)
Buff.BorderSizePixel = 0
Buff.ZIndex = 2
Buff.Parent = Notification7
Buff.Text = "Buffalkor"
Buff.TextColor3 = Color3.fromRGB(250,250,250)
Buff.TextScaled = true
Buff.MouseButton1Click:Connect(function()
    if Toggled84 then
        Toggled84 = false
        Buff.BackgroundColor3 = Color3.fromRGB(150,150,150)
        Buff.Text = "Buffalkor"
        Buff.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled84 = true
        Buff.BackgroundColor3 = Color3.new(1,0,0)
        Buff.Text = "Pew Pew"
        Buff.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled84 == true do
            wait()
            print("Starting loop for buffs")
            for i,buffs in pairs(game.Workspace.WildernessIsland.Entities:GetChildren()) do
                if buffs.Name == "buffalkor" and buffs:FindFirstChild("HumanoidRootPart") and (buffs.HumanoidRootPart.Position - Vector3.new(1288, 395, 279)).Magnitude < 175 then
            wait()
                end
            end
        end
    end
end)

local VoidSerpent = Instance.new("TextButton")
VoidSerpent.Position = UDim2.new(0,71,1,64)
VoidSerpent.Size = UDim2.new(0,70,0,20)
VoidSerpent.BackgroundColor3 = Color3.fromRGB(150,0,150)
VoidSerpent.BorderSizePixel = 0
VoidSerpent.ZIndex = 2
VoidSerpent.Parent = Notification7
VoidSerpent.Text = "Void Serpent"
VoidSerpent.TextColor3 = Color3.fromRGB(250,250,250)
VoidSerpent.TextScaled = true
VoidSerpent.MouseButton1Click:Connect(function()
    if Toggled82 then
        Toggled82 = false
        VoidSerpent.BackgroundColor3 = Color3.fromRGB(150,0,150)
        VoidSerpent.Text = "Void Serpent"
        VoidSerpent.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled82 = true
        VoidSerpent.BackgroundColor3 = Color3.new(1,0,0)
        VoidSerpent.Text = "Pew Pew"
        VoidSerpent.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled82 == true do
            if game:GetService("Workspace").WildernessIsland.Entities:WaitForChild("voidSerpent").ActiveAnimations:FindFirstChild("10537952778") then
                wait() 
            else
            wait()
            end
        end
    end
end)


Item28.MouseButton1Click:Connect(function()
    if Toggled15 then
        Toggled15 = false
        Item28.BackgroundColor3 = Color3.fromRGB(128, 0, 0)
        Item28.Text = "Wizard Boss"
        Item28.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled15 = true
        Item28.BackgroundColor3 = Color3.new(1,0,0)
        Item28.Text = "Pew Pew"
        Item28.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled15 == true do
            wait()
        end
    end
end)

Item29.MouseButton1Click:Connect(function()
    if Toggled16 then
        Toggled16 = false
        Item29.BackgroundColor3 = Color3.fromRGB(194,178,128)
        Item29.Text = "Bhaa"
        Item29.TextColor3 = Color3.fromRGB(0,0,0)
    else
        Toggled16 = true
        Item29.BackgroundColor3 = Color3.new(1,0,0)
        Item29.Text = "Pew Pew"
        Item29.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled16 == true do
            wait()
        end
    end
end)

Item30.MouseButton1Click:Connect(function()
    if Toggled17 then
        Toggled17 = false
        Item30.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
        Item30.Text = "Kor"
        Item30.TextColor3 = Color3.fromRGB(0,0,0)
    else
        Toggled17 = true
        Item30.BackgroundColor3 = Color3.new(1,0,0)
        Item30.Text = "Pew Pew"
        Item30.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled17 == true do
            wait()
        end
    end
end)

Item31.MouseButton1Click:Connect(function()
    if Toggled18 then
        Toggled18 = false
        Item31.BackgroundColor3 = Color3.fromRGB(155,0,0)
        Item31.Text = "Infernal Dragon"
        Item31.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled18 = true
        Item31.BackgroundColor3 = Color3.new(1,0,0)
        Item31.Text = "Pew Pew"
        Item31.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled18 == true do
            wait()
        end
    end
end)

Mob5.MouseButton1Click:Connect(function()
    if Toggled19 then
        Toggled19 = false
        Mob5.BackgroundColor3 = Color3.fromRGB(155,0,0)
        Mob5.Text = "magmaBlob"
        Mob5.TextColor3 = Color3.fromRGB(255,200,1)
        if Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        end
        tween:Cancel()
    else
        Toggled19 = true
        Mob5.BackgroundColor3 = Color3.new(1,0,0)
        Mob5.Text = "KILL"
        Mob5.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local enemy = "magmaBlob"
        while Toggled19 == true do
            if game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy) then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy):WaitForChild("HumanoidRootPart").Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                tween:Play()
                wait(Time - 2)
            end
	    wait()
        end
    end
end)

Mob6.MouseButton1Click:Connect(function()
    if Toggled48 then
        Toggled48 = false
        Mob6.BackgroundColor3 = Color3.fromRGB(200,200,200)
        Mob6.Text = "Skeleton Pirate"
        Mob6.TextColor3 = Color3.new(0,0,0)
        if Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        end
        tween:Cancel()
    else
        Toggled48 = true
        Mob6.BackgroundColor3 = Color3.new(1,0,0)
        Mob6.Text = "KILL"
        Mob6.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local enemy = "skeletonPirate"
        while Toggled48 == true do
            wait()
            if game:GetService("Workspace").WildernessIsland.Entities:WaitForChild(enemy):WaitForChild("HumanoidRootPart") then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy).HumanoidRootPart.Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point + Vector3.new(0,-10,0))})
                tween:Play()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["crit"] = true,
                ["hitUnit"] = workspace.WildernessIsland.Entities:WaitForChild(enemy)
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("cfevfavTqnegCGxwuojAqhLdtihky/jdClttxycammwHieaAhrnHfgcfnynKcavxb"):FireServer(unpack(args))
            end
        end
    end
end)

Mob7.MouseButton1Click:Connect(function()
    if Toggled49 then
        Toggled49 = false
        Mob7.BackgroundColor3 = Color3.fromRGB(200,50,50)
        Mob7.Text = "Crabs"
        Mob7.TextColor3 = Color3.fromRGB(255,200,1)
        if Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        end
        tween:Cancel()
    else
        Toggled49 = true
        Mob7.BackgroundColor3 = Color3.new(1,0,0)
        Mob7.Text = "KILL"
        Mob7.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local enemy = "hostileCrab"
        while Toggled49 == true do
            wait()
            if game:GetService("Workspace").WildernessIsland.Entities:WaitForChild(enemy):WaitForChild("HumanoidRootPart") then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy).HumanoidRootPart.Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point + Vector3.new(0,-10,0))})
                tween:Play()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["crit"] = true,
                ["hitUnit"] = workspace.WildernessIsland.Entities:WaitForChild(enemy)
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("cfevfavTqnegCGxwuojAqhLdtihky/jdClttxycammwHieaAhrnHfgcfnynKcavxb"):FireServer(unpack(args))
            end
        end
    end
end)

Mob8.MouseButton1Click:Connect(function()
    if Toggled60 then
        Toggled60 = false
        Mob8.BackgroundColor3 = Color3.fromRGB(163, 162, 165)
        Mob8.Text = "Rock Mimic"
        if Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        end
        tween:Cancel()
    else
        Toggled60 = true
        Mob8.BackgroundColor3 = Color3.new(1,0,0)
        Mob8.Text = "KILL"
        local BV = Instance.new("BodyVelocity")
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local enemy = "rockMimicGold"
        local enemy2 = "rockMimicIron"
        local enemy3 = "rockMimicCoal"
        while Toggled60 == true do
            wait()
            if game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy) then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy):WaitForChild("HumanoidRootPart").Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point + Vector3.new(0,-10,0))})
                tween:Play()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["crit"] = true,
                ["hitUnit"] = workspace.WildernessIsland.Entities:WaitForChild(enemy)
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("cfevfavTqnegCGxwuojAqhLdtihky/jdClttxycammwHieaAhrnHfgcfnynKcavxb"):FireServer(unpack(args))
            elseif game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy2) then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy2):WaitForChild("HumanoidRootPart").Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point + Vector3.new(0,-10,0))})
                tween:Play()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["crit"] = true,
                ["hitUnit"] = workspace.WildernessIsland.Entities:WaitForChild(enemy2)
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("cfevfavTqnegCGxwuojAqhLdtihky/jdClttxycammwHieaAhrnHfgcfnynKcavxb"):FireServer(unpack(args))
            elseif game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy3) then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy3):WaitForChild("HumanoidRootPart").Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point + Vector3.new(0,-10,0))})
                tween:Play()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["crit"] = true,
                ["hitUnit"] = workspace.WildernessIsland.Entities:WaitForChild(enemy3)
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("cfevfavTqnegCGxwuojAqhLdtihky/jdClttxycammwHieaAhrnHfgcfnynKcavxb"):FireServer(unpack(args))
            end
        end
    end
end)

local Mob9 = Instance.new("TextButton")
Mob9.Position = UDim2.new(0,1,1,85)
Mob9.Size = UDim2.new(0,70,0,20)
Mob9.BackgroundColor3 = Color3.fromRGB(150,0,150)
Mob9.BorderSizePixel = 0
Mob9.ZIndex = 2
Mob9.Parent = Notification6
Mob9.Text = "Void Dog"
Mob9.TextColor3 = Color3.fromRGB(0,0,0)
Mob9.TextScaled = true
Mob9.MouseButton1Click:Connect(function()
    if Toggled49 then
        Toggled49 = false
        Mob9.BackgroundColor3 = Color3.fromRGB(150,0,150)
        Mob9.Text = "Void Dog"
        Mob9.TextColor3 = Color3.fromRGB(255,200,1)
        if Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        end
        tween:Cancel()
    else
        Toggled49 = true
        Mob9.BackgroundColor3 = Color3.new(1,0,0)
        Mob9.Text = "KILL"
        Mob9.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local enemy = "voidDog"
        while Toggled49 == true do
            wait()
            if game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy) then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy):waitForChild("HumanoidRootPart").Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point + Vector3.new(0,-10,0))})
                tween:Play()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["crit"] = true,
                ["hitUnit"] = workspace.WildernessIsland.Entities:WaitForChild(enemy)
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("cfevfavTqnegCGxwuojAqhLdtihky/jdClttxycammwHieaAhrnHfgcfnynKcavxb"):FireServer(unpack(args))
            end
        end
    end
end)

local Mob10 = Instance.new("TextButton")
Mob10.Position = UDim2.new(0,70,1,85)
Mob10.Size = UDim2.new(0,70,0,20)
Mob10.BackgroundColor3 = Color3.fromRGB(250,150,150)
Mob10.BorderSizePixel = 0
Mob10.ZIndex = 2
Mob10.Parent = Notification6
Mob10.Text = "Slime Queen"
Mob10.TextColor3 = Color3.fromRGB(0,0,0)
Mob10.TextScaled = true
Mob10.MouseButton1Click:Connect(function()
    if Toggled90 then
        Toggled90 = false
        Mob10.BackgroundColor3 = Color3.fromRGB(250,150,150)
        Mob10.Text = "Slime Queen"
        Mob10.TextColor3 = Color3.fromRGB(255,200,1)
        if Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        end
        tween:Cancel()
    else
        Toggled90 = true
        Mob10.BackgroundColor3 = Color3.new(1,0,0)
        Mob10.Text = "KILL"
        Mob10.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local enemy = "slimeQueen"
        while Toggled90 == true do
            wait()
            if game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy) then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy):WaitForChild("HumanoidRootPart").Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point + Vector3.new(0,-15,0))})
                tween:Play()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["crit"] = true,
                ["hitUnit"] = workspace.WildernessIsland.Entities:WaitForChild(enemy)
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("cfevfavTqnegCGxwuojAqhLdtihky/jdClttxycammwHieaAhrnHfgcfnynKcavxb"):FireServer(unpack(args))
            end
        end
    end
end)

local Mob11 = Instance.new("TextButton")
Mob11.Position = UDim2.new(0,0,1,106)
Mob11.Size = UDim2.new(0,70,0,20)
Mob11.BackgroundColor3 = Color3.fromRGB(0,150,0)
Mob11.BorderSizePixel = 0
Mob11.ZIndex = 2
Mob11.Parent = Notification6
Mob11.Text = "Slime King"
Mob11.TextColor3 = Color3.fromRGB(0,0,0)
Mob11.TextScaled = true
Mob11.MouseButton1Click:Connect(function()
    if Toggled91 then
        Toggled91 = false
        Mob11.BackgroundColor3 = Color3.fromRGB(0,150,0)
        Mob11.Text = "Slime King"
        Mob11.TextColor3 = Color3.fromRGB(255,200,1)
        if Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
            Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        end
        tween:Cancel()
    else
        Toggled91 = true
        Mob11.BackgroundColor3 = Color3.new(1,0,0)
        Mob11.Text = "KILL"
        Mob11.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local enemy = "slimeKing"
        while Toggled91 == true do
            wait()
            if game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy) then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy):WaitForChild("HumanoidRootPart").Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point + Vector3.new(0,-10,0))})
                tween:Play()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["crit"] = true,
                ["hitUnit"] = workspace.WildernessIsland.Entities:WaitForChild(enemy)
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("cfevfavTqnegCGxwuojAqhLdtihky/jdClttxycammwHieaAhrnHfgcfnynKcavxb"):FireServer(unpack(args))
            end
        end
    end
end)

Item32.MouseButton1Click:Connect(function()
    if Toggled20 then
        Toggled20 = false
        Item32.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item32.Text = "Send items to Click"
        Item32.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled20 = true
        Item32.BackgroundColor3 = Color3.new(1,0,0)
        Item32.Text = "Click Away"
        Item32.TextColor3 = Color3.fromRGB(0,255,255)
        local mouse = game:GetService("Players").LocalPlayer:GetMouse()
        mouse.Button1Down:connect(function()
            for i,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
                if (island:IsA("Model")) then
                    for i, tool in pairs(island.Drops:GetChildren()) do
                        if (tool:IsA("Tool")) then
                            if Toggled20 then
                            tool.HandleDisabled.Position = mouse.Hit.Position + Vector3.new(0,5,0)
                            end
                        end
                    end
                end
            end
        end)
    end
end)

Item33.MouseButton1Click:Connect(function()
    if Toggled21 then
        Toggled21 = false
        Item33.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item33.Text = "Collect Truffles"
        Item33.TextColor3 = Color3.fromRGB(250,250,250)
        tween:Cancel()
    else
        Toggled21 = true
        Item33.BackgroundColor3 = Color3.fromRGB(0,255,255)
        Item33.Text = "Collecting"
        Item33.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        print("Found island",Island)
        while Toggled21 == true do
            wait()
            for _,TruffleBarrel in pairs(Island.Blocks:GetChildren()) do
                if (TruffleBarrel:IsA("Part")) and TruffleBarrel.Name == "barrelTruffle" then
                    if TruffleBarrel.Contents:FindFirstChild("truffleBlack") then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TruffleBarrel.Position).magnitude > 24 then
                            Point = TruffleBarrel.Position
                            Distance = (HR.Position - Point).Magnitude
                            Speed = 20
                            Time = Distance/Speed
                            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                            tween:Play()
                            wait(Time - 2)
                        end
                        local args = {
                        [1] = {
                            ["chest"] = TruffleBarrel,
                            ["player_tracking_category"] = "join_from_web",
                            ["amount"] = 1,
                            ["tool"] = TruffleBarrel.Contents.truffleBlack,
                            ["action"] = "withdraw"
                        }
                        }

                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_CHEST_TRANSACTION:InvokeServer(unpack(args))
                    elseif TruffleBarrel.Contents:FindFirstChild("truffleWhite") then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - TruffleBarrel.Position).magnitude > 24 then
                            Point = TruffleBarrel.Position
                            Distance = (HR.Position - Point).Magnitude
                            Speed = 20
                            Time = Distance/Speed
                            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                            tween:Play()
                            wait(Time - 2)
                        end
                        local args = {
                            [1] = {
                                ["chest"] = TruffleBarrel,
                                ["player_tracking_category"] = "join_from_web",
                                ["amount"] = 1,
                                ["tool"] = TruffleBarrel.Contents.truffleWhite,
                                ["action"] = "withdraw"
                            }
                        }

                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_CHEST_TRANSACTION:InvokeServer(unpack(args))

                        wait()
                    else
                        wait()
                    end
                end
            end
        end
    end
end)

Item42.MouseButton1Click:Connect(function()
    if Toggled27 then
        Toggled27 = false
        Item42.BackgroundColor3 = Color3.new(0,0,1)
        Item42.Text = "Machines >"
        Item42.TextColor3 = Color3.fromRGB(250,250,250)
        Background8.Visible = false
    else
        Toggled27 = true
        Toggled5 = false
        Toggled6 = false
        Toggled8 = false
        Toggled13 = false
        Toggled22 = false
        Toggled26 = false
        Toggled47 = false
        Toggled50 = false
        Toggled70 = false
        Background10.Visible = false
        Item67.Text = "Farming >"
        Item42.Text = "Machines <"
        Background2.Visible = false
        Background3.Visible = false
        Background4.Visible = false
        Background5.Visible = false
        Background6.Visible = false
        Background7.Visible = false
        Background9.Visible = false
        Background11.Visible = false
        Background12.Visible = false
        Item84.Text = "Mining >"
        Toggled73 = false
        Tests.Text = "Misc >"
        BowBoss.Text = "Wood >"
        Teleports.Text = "Teleports >"
        GUIs.Text = "Event >"
        Title.Text = "Mob Farms >"
        Item65.Text = "Auto Eat >"
        Item80.Text = "Hub Shops >"
        Background8.Visible = true
    end
end)

Item43.MouseButton1Click:Connect(function()
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
    if v.Name == "rageblade" or v.Name == "arrow1" or v.Name == "bow3" or v.Name == "wateringCan" or v.Name == "sickleDiamond" or v.Name == "diamondPickaxe" or v.Name == "opalPickaxe" or v.Name == "opalAxe" or v.Name == "shears" or v.Name == "diamondAxe" or v.Name == "shovelStone" or v.Name == "fishingRodIron" or v.Name == "pizzaTruffle" or v.Name == "avocadoToastTruffle" or v.Name == "clippers" then wait() else
        -- add item to trade
        local args = {
        [1] = HttpService:GenerateGUID(false),
        [2] = {
        [1] = {
        ["quantity"] = v.Amount.Value,
        ["toolName"] = v.Name
        }
        }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("Hqre/uxptzzc")
    end
end
wait()
-- accept trade
local args = {
    [1] = HttpService:GenerateGUID(false),
    [2] = {[1] = {["accepted"] = true}}}
game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("vdSxixakqifrusurgCshjpPyzbE/gcnlqGueYvjqpZbSwbnvl"):FireServer(unpack(args))
end)

Item44.MouseButton1Click:Connect(function()
    if Toggled28 then
        Toggled28 = false
        Item44.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        Item44.Text = "Island Pickaxe Aura"
        Item44.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled28 = true
        Item44.BackgroundColor3 = Color3.new(0,0,1)
        Item44.Text = "Breaking Rocks!"
        Item44.TextColor3 = Color3.fromRGB(250,250,0)
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled28 == true do
            wait()
        if Island then
        for i,v in pairs(Island.Blocks:GetChildren()) do
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude < 23 and v:FindFirstChild("CollisionBoxes") and v:FindFirstChild("1") then
            print("Hitting "..v.Name)
            local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = v:FindFirstChild("1"),
                    ["block"] = v,
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
            end
        end
        else
        for i,v in pairs(game.Workspace.WildernessBlocks:GetChildren()) do
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude < 23 and v:FindFirstChild("RockStage") and v:FindFirstChild("1") then
            print("Hitting "..v.Name)
            local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = v:FindFirstChild("1"),
                    ["block"] = v,
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
            end
        end
        end
        end
    end
end)

Item45.MouseButton1Click:Connect(function()
    if Toggled29 then
        Toggled29 = false
        Item45.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item45.Text = "Water Nearby"
        Item45.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled29 = true
        Item45.BackgroundColor3 = Color3.new(0,255,255)
        Item45.Text = "Watering Nearby"
        Item45.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled29 == true do
            wait()
            for i,thirsty in pairs(Island.Blocks:GetChildren()) do
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - thirsty.Position).magnitude < 25 and thirsty:FindFirstChild("Watered") and thirsty.Watered.Value == false then
                    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                        if v.Name == "wateringCan" then
                            v.Parent = game:GetService("Players").LocalPlayer.Character
                            wait()
                        end
                    end
                    local args =
                    {[1] = {["block"] = thirsty}}
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_WATER_BLOCK:InvokeServer(unpack(args))
                end
            end
        end
    end
end)

Item46.MouseButton1Click:Connect(function()
    if Toggled30 then
        Toggled30 = false
        Item46.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item46.Text = "Pickup Drops Aura"
        Item46.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled30 = true
        Item46.BackgroundColor3 = Color3.new(0,255,255)
        Item46.Text = "Picking up nearby items"
        Item46.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            Island = island
        end
        while Toggled30 == true do
            wait()
        for i,v in pairs(Island.Drops:GetChildren()) do
            if v:FindFirstChild("HandleDisabled") and (v:IsA("Tool")) and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HandleDisabled.Position).magnitude < 24 then
                local Pickup = {
                    [1] = {
                        ["tool"] = v,
                        ["player_tracking_category"] = "join_from_web"
                    }
                }

                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(Pickup))
            end
        end
        end
    end
end)

Item47.MouseButton1Click:Connect(function()
    if Toggled31 then
        Toggled31 = false
        Item47.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item47.Text = "Destroy Coal/iron/ironOre"
        Item47.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled31 = true
        Item47.BackgroundColor3 = Color3.new(0,255,255)
        Item47.Text = "Destroy!"
        Item47.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            Island = island
        end
        while Toggled31 == true do
            for i,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
                if (island:IsA("Model")) then
                    for i, tool in pairs(island.Drops:GetChildren()) do
                        if (tool:IsA("Tool")) and (tool.Name == "coal" or tool.Name == "ironOre" or tool.Name == "iron") then
                            print(tool.Name)
                            tool.HandleDisabled.Position = Vector3.new(-3619, -99, -3442)
                        end
                    end
                end
            end
            wait(300)
        end
    end
end)

Item48.MouseButton1Click:Connect(function()
    if Toggled32 then
        Toggled32 = false
        Item48.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item48.Text = "Clear Island Fertiles"
        Item48.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled32 = true
        Item48.BackgroundColor3 = Color3.new(0,255,255)
        Item48.Text = "Picking"
        Item48.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled32 == true do
            if Island.Blocks:FindFirstChild("flowerHyacinthRedFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHyacinthRedFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerMumBlackFertile") then
            local args = {
            [1] = {
            ["flower"] = Island.Blocks.flowerMumBlackFertile
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerMumRedFertile") then
            local args = {
            [1] = {
            ["flower"] = Island.Blocks.flowerMumRedFertile
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHyacinthYellowFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHyacinthYellowFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerTulipYellowFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerTulipYellowFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerTulipRedFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerTulipRedFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHyacinthBlueFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHyacinthBlueFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerDaisyRedFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaisyRedFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerDaisyYellowFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaisyYellowFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerLilyRedFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerLilyRedFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerLilyYellowFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerLilyYellowFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerLilyBlueFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerLilyBlueFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHibiscusBlueFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusBlueFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHibiscusLightGreenFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusLightGreenFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            elseif Island.Blocks:FindFirstChild("flowerHibiscusLightGreenFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusLightGreenFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            else
                wait()
            end
            wait()
        end
    end
end)

Item50.MouseButton1Click:Connect(function()
    if Toggled33 then
        Toggled33 = false
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        Item50.BackgroundColor3 = Color3.fromRGB(186,164,138)
        Item50.Text = "Oak Wood"
        Item50.TextColor3 = Color3.fromRGB(0,0,0)
        tween:Cancel()
    else
        Toggled33 = true
        local TS = game:GetService('TweenService')
        local HR = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart
        local BV = Instance.new("BodyVelocity")
		local YSpeed = 0
		BV.Velocity = Vector3.new(0,0,0)
		BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        Item50.BackgroundColor3 = Color3.new(200,0,0)
        Item50.Text = "Getting Oak"
        Item50.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled33 == true do
            wait()
            if Island.Blocks:FindFirstChild("tree1") then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Island.Blocks:FindFirstChild("tree1").Position).magnitude > 24 then
                    Point = Island.Blocks:FindFirstChild("tree1").Position
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time - 2)
                end
                local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = Island.Blocks:FindFirstChild("tree1"):WaitForChild("trunk"),
                    ["block"] = Island.Blocks:FindFirstChild("tree1"),
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))

            elseif Island.Blocks:FindFirstChild("tree3") then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Island.Blocks:FindFirstChild("tree3").Position).magnitude > 24 then
                    Point = Island.Blocks:FindFirstChild("tree3").Position
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time - 2)
                end
                local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = Island.Blocks:FindFirstChild("tree3"):WaitForChild("trunk"),
                    ["block"] = Island.Blocks:FindFirstChild("tree3"),
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }
            
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
            
            elseif Island.Blocks:FindFirstChild("tree2") then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Island.Blocks:FindFirstChild("tree2").Position).magnitude > 24 then
                    Point = Island.Blocks:FindFirstChild("tree2").Position
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time - 2)
                end
                local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = Island.Blocks:FindFirstChild("tree2"):WaitForChild("trunk"),
                    ["block"] = Island.Blocks:FindFirstChild("tree2"),
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))

            elseif Island.Blocks:FindFirstChild("tree4") then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Island.Blocks:FindFirstChild("tree4").Position).magnitude > 24 then
                    Point = Island.Blocks:FindFirstChild("tree4").Position
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time - 2)
                end
                local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = Island.Blocks:FindFirstChild("tree4"):WaitForChild("trunk"),
                    ["block"] = Island.Blocks:FindFirstChild("tree4"),
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
                wait()
            end
        end
    end
end)

Item51.MouseButton1Click:Connect(function()
    if Toggled34 then
        Toggled34 = false
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        Item51.BackgroundColor3 = Color3.fromRGB(248,223,161)
        Item51.Text = "Birch Wood"
        Item51.TextColor3 = Color3.fromRGB(0,0,0)
        tween:Cancel()
    else
        Toggled34 = true
        local BV = Instance.new("BodyVelocity")
		local YSpeed = 0
		BV.Velocity = Vector3.new(0,0,0)
		BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        Item51.BackgroundColor3 = Color3.new(200,0,0)
        Item51.Text = "Getting Birch"
        Item51.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled34 == true do
            wait()
            if Island.Blocks:FindFirstChild("treeBirch1") then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Island.Blocks:FindFirstChild("treeBirch1").Position).magnitude > 24 then
                    Point = Island.Blocks:FindFirstChild("treeBirch1").Position
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time - 2)
                end
                local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = Island.Blocks:FindFirstChild("treeBirch1"):WaitForChild("trunk"),
                    ["block"] = Island.Blocks:FindFirstChild("treeBirch1"),
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))

            elseif Island.Blocks:FindFirstChild("treeBirch2") then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Island.Blocks:FindFirstChild("treeBirch2").Position).magnitude > 24 then
                    Point = Island.Blocks:FindFirstChild("treeBirch2").Position
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time - 2)
                end
                local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = Island.Blocks:FindFirstChild("treeBirch2"):WaitForChild("trunk"),
                    ["block"] = Island.Blocks:FindFirstChild("treeBirch2"),
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }
            
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
            wait()
            end
        end
    end
end)

Item52.MouseButton1Click:Connect(function()
    if Toggled35 then
        Toggled35 = false
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        Item52.BackgroundColor3 = Color3.fromRGB(85,52,43)
        Item52.Text = "Pine Wood"
        Item52.TextColor3 = Color3.fromRGB(250,250,250)
        tween:Cancel()
    else
        Toggled35 = true
        local BV = Instance.new("BodyVelocity")
		local YSpeed = 0
		BV.Velocity = Vector3.new(0,0,0)
		BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        Item52.BackgroundColor3 = Color3.new(200,0,0)
        Item52.Text = "Getting Pine"
        Item52.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled35 == true do
            wait()
            if Island.Blocks:FindFirstChild("treePine1") then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Island.Blocks:FindFirstChild("treePine1").Position).magnitude > 24 then
                    Point = Island.Blocks:FindFirstChild("treePine1").Position
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time - 2)
                end
                local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = Island.Blocks:FindFirstChild("treePine1"):WaitForChild("trunk"),
                    ["block"] = Island.Blocks:FindFirstChild("treePine1"),
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
            wait()
            end
        end
    end
end)

Item53.MouseButton1Click:Connect(function()
    if Toggled36 then
        Toggled36 = false
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        Item53.BackgroundColor3 = Color3.fromRGB(200,111,87)
        Item53.Text = "Maple Wood"
        Item53.TextColor3 = Color3.fromRGB(0,0,0)
        tween:Cancel()
    else
        Toggled36 = true
        local BV = Instance.new("BodyVelocity")
		local YSpeed = 0
		BV.Velocity = Vector3.new(0,0,0)
		BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        Item53.BackgroundColor3 = Color3.new(200,0,0)
        Item53.Text = "Getting Maple"
        Item53.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled36 == true do
            wait()
            if Island.Blocks:FindFirstChild("treeMaple1") then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Island.Blocks:FindFirstChild("treeMaple1").Position).magnitude > 24 then
                    Point = Island.Blocks:FindFirstChild("treeMaple1").Position
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time - 2)
                end
                local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = Island.Blocks:FindFirstChild("treeMaple1"):WaitForChild("trunk"),
                    ["block"] = Island.Blocks:FindFirstChild("treeMaple1"),
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))

            elseif Island.Blocks:FindFirstChild("treeMaple2") then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Island.Blocks:FindFirstChild("treeMaple2").Position).magnitude > 24 then
                    Point = Island.Blocks:FindFirstChild("treeMaple2").Position
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time - 2)
                end
                local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = Island.Blocks:FindFirstChild("treeMaple2"):WaitForChild("trunk"),
                    ["block"] = Island.Blocks:FindFirstChild("treeMaple2"),
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }
            
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
            wait()
            end
        end
    end
end)

Item54.MouseButton1Click:Connect(function()
    if Toggled37 then
        Toggled37 = false
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        Item54.BackgroundColor3 = Color3.fromRGB(258,233,171)
        Item54.Text = "Hickory Wood"
        Item54.TextColor3 = Color3.fromRGB(0,0,0)
        tween:Cancel()
    else
        Toggled37 = true
        local BV = Instance.new("BodyVelocity")
		local YSpeed = 0
		BV.Velocity = Vector3.new(0,0,0)
		BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        Item54.BackgroundColor3 = Color3.new(200,0,0)
        Item54.Text = "Getting Hickory"
        Item54.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled37 == true do
            wait()
            if Island.Blocks:FindFirstChild("treeHickory1") then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Island.Blocks:FindFirstChild("treeHickory1").Position).magnitude > 24 then
                    Point = Island.Blocks:FindFirstChild("treeHickory1").Position
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time - 2)
                end
                local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = Island.Blocks:FindFirstChild("treeHickory1"):WaitForChild("trunk"),
                    ["block"] = Island.Blocks:FindFirstChild("treeHickory1"),
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))

            elseif Island.Blocks:FindFirstChild("treeHickory2") then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Island.Blocks:FindFirstChild("treeHickory2").Position).magnitude > 24 then
                    Point = Island.Blocks:FindFirstChild("treeHickory2").Position
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time - 2)
                end
                local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = Island.Blocks:FindFirstChild("treeHickory2"):WaitForChild("trunk"),
                    ["block"] = Island.Blocks:FindFirstChild("treeHickory2"),
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }
            
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
            wait()
            end
        end
    end
end)

Item55.MouseButton1Click:Connect(function()
    if Toggled38 then
        Toggled38 = false
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        Item55.BackgroundColor3 = Color3.fromRGB(168,105,165)
        Item55.Text = "Spirit Wood"
        Item55.TextColor3 = Color3.fromRGB(0,0,0)
        tween:Cancel()
    else
        Toggled38 = true
        local BV = Instance.new("BodyVelocity")
		local YSpeed = 0
		BV.Velocity = Vector3.new(0,0,0)
		BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        Item55.BackgroundColor3 = Color3.new(200,0,0)
        Item55.Text = "Getting Spirit"
        Item55.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled38 == true do
            wait()
            if Island.Blocks:FindFirstChild("treeSpirit1") then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Island.Blocks:FindFirstChild("treeSpirit1").Position).magnitude > 24 then
                    Point = Island.Blocks:FindFirstChild("treeSpirit1").Position
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time - 2)
                end
                local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = Island.Blocks:FindFirstChild("treeSpirit1"):WaitForChild("MeshPart"),
                    ["block"] = Island.Blocks:FindFirstChild("treeSpirit1"),
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))

            elseif Island.Blocks:FindFirstChild("treeSpirit2") then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Island.Blocks:FindFirstChild("treeSpirit2").Position).magnitude > 24 then
                    Point = Island.Blocks:FindFirstChild("treeSpirit2").Position
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time - 2)
                end
                local args = {
                [1] = {
                    ["player_tracking_category"] = "join_from_web",
                    ["part"] = Island.Blocks:FindFirstChild("treeSpirit2"):WaitForChild("MeshPart"),
                    ["block"] = Island.Blocks:FindFirstChild("treeSpirit2"),
                    ["norm"] = nil --[[Vector3]],
                    ["pos"] = nil --[[Vector3]]
                }
            }
            
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
            wait()
            end
        end
    end
end)

Item56.MouseButton1Click:Connect(function()
    if Toggled39 then
        Toggled39 = false
        Item56.BackgroundColor3 = Color3.fromRGB(50,250,150)
        Item56.Text = "aquaBlock -> aquaCarved"
        Item56.TextColor3 = Color3.fromRGB(0,0,0)
    else
        Toggled39 = true
        Item56.BackgroundColor3 = Color3.new(200,0,0)
        Item56.Text = "Making Carved Aquamarine"
        Item56.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled39 == true do
            for i,StoneCutter in pairs(Island.Blocks:GetChildren()) do
    if StoneCutter.Name == "stonecutter" then
        if StoneCutter.Working.Value == true then
            if StoneCutter.WorkerContents:FindFirstChild("aquamarineCarved") then
                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - StoneCutter.Position).magnitude > 24 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(StoneCutter.Position + Vector3.new(0,5,0))
                    wait()
                    local args = {
                        [1] = {
                            ["tool"] = StoneCutter.WorkerContents.aquamarineCarved,
                            ["player_tracking_category"] = "join_from_web"
                        }
                    }
                    
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                else    
                    local args = {
                        [1] = {
                            ["tool"] = StoneCutter.WorkerContents.aquamarineCarved,
                            ["player_tracking_category"] = "join_from_web"
                        }
                    }
                    
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                end
            elseif #StoneCutter.WorkerContents:GetChildren() == 0 then
                print("inserting block")
                local args = {
                    [1] = {
                        ["amount"] = 1,
                        ["block"] = StoneCutter,
                        ["player_tracking_category"] = "join_from_web",
                        ["toolName"] = "prismarineBlock"
                    }
                }
                    
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
                
                local args = {
                    [1] = {
                        ["amount"] = 1,
                        ["block"] = StoneCutter,
                        ["player_tracking_category"] = "join_from_web",
                        ["toolName"] = "prismarineBlock"
                    }
                }
                    
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
            else
                wait()
            end
        else
            print("putting coal into "..StoneCutter.Name)
            local args = {
                [1] = {
                    ["amount"] = 1,
                    ["block"] = StoneCutter,
                    ["player_tracking_category"] = "join_from_web",
                    ["toolName"] = "coal"
                }
            }
            
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
        end
    end
end
end
end
end)

Item57.MouseButton1Click:Connect(function()
    if Toggled40 then
        Toggled40 = false
        Item57.BackgroundColor3 = Color3.fromRGB(50,250,150)
        Item57.Text = "aquaBlock -> aquaTiles"
        Item57.TextColor3 = Color3.fromRGB(0,0,0)
    else
        Toggled40 = true
        Item57.BackgroundColor3 = Color3.new(200,0,0)
        Item57.Text = "Making Aquamarine Tiles"
        Item57.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled40 == true do
            for i,StoneCutter in pairs(Island.Blocks:GetChildren()) do
                if StoneCutter.Name == "stonecutter" then
                    if StoneCutter.Working.Value == true then
                        if StoneCutter.WorkerContents:FindFirstChild("aquamarineTiles") then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - StoneCutter.Position).magnitude > 24 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(StoneCutter.Position + Vector3.new(0,5,0))
                    wait()
                    local args = {
                        [1] = {
                            ["tool"] = StoneCutter.WorkerContents.aquamarineTiles,
                            ["player_tracking_category"] = "join_from_web"
                        }
                    }
                    
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                else    
                    local args = {
                        [1] = {
                            ["tool"] = StoneCutter.WorkerContents.aquamarineTiles,
                            ["player_tracking_category"] = "join_from_web"
                        }
                    }
                    
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                end
            elseif #StoneCutter.WorkerContents:GetChildren() == 0 then
                print("inserting block")
                local args = {
                    [1] = {
                        ["amount"] = 1,
                        ["block"] = StoneCutter,
                        ["player_tracking_category"] = "join_from_web",
                        ["toolName"] = "prismarineBlock"
                    }
                }
                    
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
                
                local args = {
                    [1] = {
                        ["amount"] = 1,
                        ["block"] = StoneCutter,
                        ["player_tracking_category"] = "join_from_web",
                        ["toolName"] = "prismarineBlock"
                    }
                }
                    
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
            else
                wait()
            end
        else
            print("putting coal into "..StoneCutter.Name)
            local args = {
                [1] = {
                    ["amount"] = 1,
                    ["block"] = StoneCutter,
                    ["player_tracking_category"] = "join_from_web",
                    ["toolName"] = "coal"
                }
            }
            
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
        end
    end
end
end
end
end)

Item58.MouseButton1Click:Connect(function()
    if Toggled41 then
        Toggled41 = false
        Item58.BackgroundColor3 = Color3.fromRGB(50,250,150)
        Item58.Text = "aquaBlock -> aquaBrick"
        Item58.TextColor3 = Color3.fromRGB(0,0,0)
    else
        Toggled41 = true
        Item58.BackgroundColor3 = Color3.new(200,0,0)
        Item58.Text = "Making Aquamarine Brick"
        Item58.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled41 == true do
            for i,StoneCutter in pairs(Island.Blocks:GetChildren()) do
                if StoneCutter.Name == "stonecutter" then
                    if StoneCutter.Working.Value == true then
                        if StoneCutter.WorkerContents:FindFirstChild("aquamarineTiles") or StoneCutter.WorkerContents:FindFirstChild("aquamarineCarved") then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - StoneCutter.Position).magnitude > 24 then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(StoneCutter.Position + Vector3.new(0,5,0))
                                    wait()
                                    local args = {
                                        [1] = {
                                            ["tool"] = StoneCutter.WorkerContents.aquamarineTiles,
                                            ["player_tracking_category"] = "join_from_web"
                                        }
                                    }
                    
                                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                                else    
                                    local args = {
                                        [1] = {
                                            ["tool"] = StoneCutter.WorkerContents.aquamarineCarved,
                                            ["player_tracking_category"] = "join_from_web"
                                        }
                                    }
                                    
                                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                                end
                        elseif StoneCutter.WorkerContents:FindFirstChild("prismarineBrick") then
                                if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - StoneCutter.Position).magnitude > 24 then
                                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(StoneCutter.Position + Vector3.new(0,5,0))
                                    wait()
                                    local args = {
                                        [1] = {
                                            ["tool"] = StoneCutter.WorkerContents.prismarineBrick,
                                            ["player_tracking_category"] = "join_from_web"
                                        }
                                    }
                    
                                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                                else    
                                    local args = {
                                        [1] = {
                                            ["tool"] = StoneCutter.WorkerContents.prismarineBrick,
                                            ["player_tracking_category"] = "join_from_web"
                                        }
                                    }
                                    
                                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                                end
                            elseif #StoneCutter.WorkerContents:GetChildren() == 0 then
                                print("inserting block")
                                local args = {
                                    [1] = {
                                        ["amount"] = 1,
                                        ["block"] = StoneCutter,
                                        ["player_tracking_category"] = "join_from_web",
                                        ["toolName"] = "prismarineBlock"
                                    }
                                }
                            
                                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
                
                                local args = {
                                    [1] = {
                                        ["amount"] = 1,
                                        ["block"] = StoneCutter,
                                        ["player_tracking_category"] = "join_from_web",
                                        ["toolName"] = "prismarineBlock"
                                    }
                                }
                    
                                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
                            else
                                wait()
                            end    
                        
                    else
                        print("putting coal into "..StoneCutter.Name)
                        local args = {
                            [1] = {
                                ["amount"] = 1,
                                ["block"] = StoneCutter,
                                ["player_tracking_category"] = "join_from_web",
                                ["toolName"] = "coal"
                            }
                        }
                    
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
                    
                    end
                end
            end
        end
    end
end)

Item59.MouseButton1Click:Connect(function()
    if Toggled42 then
        Toggled42 = false
        Item59.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item59.Text = "Cloth Loom"
        Item59.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled42 = true
        Item59.BackgroundColor3 = Color3.new(200,0,0)
        Item59.Text = "Making Cloth"
        Item59.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled42 == true do
            wait()
            for _,Loom in pairs(Island.Blocks:GetChildren()) do
                if Loom.Name == "circularLoom" then
                    if Loom.WorkerContents:FindFirstChild("cloth") then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Loom.Position).magnitude > 24 then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Loom.Position + Vector3.new(0,5,0))
                            wait(0.5)
                        end
                        local args = {
                        [1] = {
                        ["tool"] = Loom.WorkerContents.cloth,
                        ["player_tracking_category"] = "join_from_web"
                        }
                        }
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                    elseif Loom.WorkerContents:FindFirstChild("woolWhite") then
                        wait()
                    else    
                        local args = {
                            [1] = {
                            ["amount"] = 1,
                            ["block"] = Loom,
                            ["player_tracking_category"] = "join_from_web",
                            ["toolName"] = "woolWhite"
                            }
                            }
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
        
                    end
                end
            end
        end
    end
end)

Item60.MouseButton1Click:Connect(function()
    if Toggled43 then
        Toggled43 = false
        Item60.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item60.Text = "Clear ALL but Tulips"
        Item60.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled43 = true
        Item60.BackgroundColor3 = Color3.new(0,255,255)
        Item60.Text = "Picking and Mining"
        Item60.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled43 == true do
            if Island.Blocks:FindFirstChild("flowerHyacinthRedFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHyacinthRedFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            wait()
            elseif Island.Blocks:FindFirstChild("flowerHyacinthYellowFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHyacinthYellowFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            wait()
           
            elseif Island.Blocks:FindFirstChild("flowerHyacinthBlueFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHyacinthBlueFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            wait()
            elseif Island.Blocks:FindFirstChild("flowerDaisyRedFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaisyRedFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            wait()
            elseif Island.Blocks:FindFirstChild("flowerDaisyYellowFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerDaisyYellowFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            wait()
            elseif Island.Blocks:FindFirstChild("flowerLilyRedFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerLilyRedFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            wait()
            elseif Island.Blocks:FindFirstChild("flowerLilyYellowFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerLilyYellowFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            wait()
            elseif Island.Blocks:FindFirstChild("flowerLilyBlueFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerLilyBlueFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            wait()
            elseif Island.Blocks:FindFirstChild("flowerHibiscusBlueFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusBlueFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            wait()
            elseif Island.Blocks:FindFirstChild("flowerHibiscusLightGreenFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusLightGreenFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            wait()
            elseif Island.Blocks:FindFirstChild("flowerHibiscusLightGreenFertile") then
            local args = {
                [1] = {
                    ["flower"] = Island.Blocks.flowerHibiscusLightGreenFertile
                }
            }

            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_1:InvokeServer(unpack(args))
            wait()
            elseif Island.Blocks:FindFirstChild("naturalRock1") then
                if Toggled43 == true then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Island.Blocks:FindFirstChild("naturalRock1").Position + Vector3.new(0,0,0))
                for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                    if v.Name == "opalPickaxe" then
                        v.Parent = game:GetService("Players").LocalPlayer.Character
                        wait()
                    end
                end
                local args = {
                    [1] = {
                        ["player_tracking_category"] = "join_from_web",
                        ["part"] = Island.Blocks:FindFirstChild("naturalRock1").MeshPart,
                        ["block"] = Island.Blocks:FindFirstChild("naturalRock1"),
                        ["norm"] = nil --[[Vector3]],
                        ["pos"] = nil --[[Vector3]]
                    }
                }

                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
                    wait()
                end
			elseif Island.Blocks:FindFirstChild("tallGrass") then
			    if Toggled43 == true then
			        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Island.Blocks:FindFirstChild("tallGrass").Position + Vector3.new(0,0,0))
                    for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                        if v.Name == "opalPickaxe" then
                            v.Parent = game:GetService("Players").LocalPlayer.Character
                            wait()
                        end
                    end
                    local args = {
                        [1] = {
                            ["player_tracking_category"] = "join_from_web",
                            ["part"] = Island.Blocks:FindFirstChild("tallGrass").MeshPart,
                            ["block"] = Island.Blocks:FindFirstChild("tallGrass"),
                            ["norm"] = nil --[[Vector3]],
                            ["pos"] = nil --[[Vector3]]
                        }
                    }

                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
			        wait()
                end
            else
                wait()
            end
            wait()
        end
    end
end)

Item61.MouseButton1Click:Connect(function()
    if Toggled44 then
        Toggled44 = false
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        Item61.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item61.Text = "nonono"
        Item61.TextColor3 = Color3.fromRGB(250,250,250)
        tween:Cancel()
    else
        Toggled44 = true
        Item61.BackgroundColor3 = Color3.new(0,255,255)
        Item61.Text = "ANTICHEAT"
        Item61.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
		local YSpeed = 0
		BV.Velocity = Vector3.new(0,0,0)
		BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled44 == true do
            wait()
            for i,insect in pairs(Island.Entities:GetChildren()) do
    if insect.Name == "frog" or insect.Name == "rabbit" or insect.Name == "firefly" then
        if Toggled44 == true then
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - insect:WaitForChild("HumanoidRootPart").Position).magnitude > 24 then
                    Point = insect:WaitForChild("HumanoidRootPart").Position
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time)
                end
        --catch bug here
        end
    end
end
end
end
end)

Item62.MouseButton1Click:Connect(function()
    if Toggled45 then
        Toggled45 = false
        Item62.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item62.Text = "Pick Avocados"
        Item62.TextColor3 = Color3.fromRGB(250,250,250)
        tween:Cancel()
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
    else
        Toggled45 = true
        Item62.BackgroundColor3 = Color3.new(0,255,255)
        Item62.Text = "Picking Fruit"
        Item62.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled45 == true do
            wait()
            for i,Avocado in pairs(Island.Blocks:GetDescendants()) do
    if (Avocado:IsA("Tool")) and Avocado.Name == "avocado" then
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Avocado.Parent.Position).magnitude > 24 then
            Point = Avocado.Parent.Position
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time - 1)
        end
        local args = {
            [1] = {
                ["tool"] = Avocado,
                ["player_tracking_category"] = "join_from_web"
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))

    end
end
end
end
end)

Item63.MouseButton1Click:Connect(function()
    if Toggled46 then
        Toggled46 = false
        Item63.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item63.Text = "Animal Farm"
        Item63.TextColor3 = Color3.fromRGB(250,250,250)
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
    else
        Toggled46 = true
        Item63.BackgroundColor3 = Color3.new(0,255,255)
        Item63.Text = "feedn and harvestn"
        Item63.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        while Toggled46 == true do
            wait()
for i,insect in pairs(Island.Entities:GetChildren()) do
    if insect.Name == "duck" and insect.Sleeping.Value == false and insect.FoodLevel.Value < 900 then
        if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "bread" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
    elseif insect.Name == "cow" and insect.Sleeping.Value == false and (insect.FoodLevel.Value < 900 or insect.AnimalProductReady.Value > 0) then
		if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
		if insect.AnimalProductReady.Value > 0 then
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if v.Name == "bucketEmpty" then
                    v.Parent = game:GetService("Players").LocalPlayer.Character
                    wait()
                end
            end
            local args = {
                [1] = {
                ["animal"] = insect
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MILK_COW:InvokeServer(unpack(args))
		end
    if insect.FoodLevel.Value < 900 then
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "wheatHarvested" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
    end
    elseif insect.Name == "pig" and insect.Sleeping.Value == false and (insect.FoodLevel.Value < 900 or insect.AnimalProductReady.Value > 0) then
		if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
		if insect.AnimalProductReady.Value > 0 then
            local args = {
            [1] = {
            ["animal"] = insect
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_29:InvokeServer(unpack(args))
        end
    if insect.FoodLevel.Value < 900 then
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "carrotHarvested" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
    end
    elseif insect.Name == "sheep" and insect.Sleeping.Value == false and (insect.FoodLevel.Value < 900 or insect.AnimalProductReady.Value > 0) then
		if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
		if insect.AnimalProductReady.Value > 0 then
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if v.Name == "shears" then
                    v.Parent = game:GetService("Players").LocalPlayer.Character
                    wait()
                end
            end
            local args = {
                [1] = {
                ["animal"] = insect
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_24:InvokeServer(unpack(args))
        end
    if insect.FoodLevel.Value < 900 then
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "potatoHarvested" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
    end
    elseif insect.Name == "chicken" and insect.Sleeping.Value == false and insect.FoodLevel.Value < 900 then
        if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
    if insect.FoodLevel.Value < 900 then
        print("petting chicken")
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "berryHarvested" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        print("feeding chicken")
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
    end
    elseif insect.Name == "yak" and insect.Sleeping.Value == false and insect.FoodLevel.Value < 900 then
		if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
		if insect.AnimalProductReady.Value > 0 then
            for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                if v.Name == "bucketEmpty" then
                    v.Parent = game:GetService("Players").LocalPlayer.Character
                    wait()
                end
            end
            local args = {
                [1] = {
                ["animal"] = insect
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MILK_COW:InvokeServer(unpack(args))
		end
    if insect.FoodLevel.Value < 900 then
        print("petting yak")
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "radishHarvested" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        print("feeding yak")
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
    end
    elseif insect.Name == "horse" and insect.Sleeping.Value == false and insect.FoodLevel.Value < 900 then
        if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
    if insect.FoodLevel.Value < 900 then
        print("petting horse")
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "carrotHarvested" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        print("feeding yak")
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
    end
    elseif insect.Name == "turkey" and insect.Sleeping.Value == false and (insect.FoodLevel.Value < 900 or insect.AnimalProductReady.Value > 0) then
		if (HR.Position - insect.HumanoidRootPart.Position).magnitude > 24 then
            Point = insect.HumanoidRootPart.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
		if insect.AnimalProductReady.Value > 0 then
		    print("turkey ready")
            local args = {
                [1] = insect
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.SpookTurkey:FireServer(unpack(args))
        end
    if insect.FoodLevel.Value < 900 then
        print("petting turkey")
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_PET_ANIMAL:InvokeServer(unpack(args))
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "berryHarvested" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        print("feeding turkey")
        local args = {
            [1] = {
            ["animal"] = insect
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
    end
    end
end
for i,nest in pairs(Island.Blocks:GetChildren()) do
    if nest.Name == "nest" and (nest.Contents:FindFirstChild("egg") or nest.Contents:FindFirstChild("duckEgg")) then
        if (HR.Position - nest.Position).magnitude > 24 then
            Point = nest.Position + Vector3.new(0,1.5,0)
            Distance = (HR.Position - Point).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
            tween:Play()
            wait(Time)
        end
        for _,egg in pairs(nest.Contents:GetChildren()) do
        local args = {
            [1] = {
            ["chest"] = nest,
            ["player_tracking_category"] = "join_from_web",
            ["amount"] = 1,
            ["tool"] = egg,
            ["action"] = "withdraw"
            }
        }
        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_CHEST_TRANSACTION:InvokeServer(unpack(args))
        end
    end
end
for _,itemport in pairs(Island.Blocks:GetChildren()) do
    if itemport.Name == "itemPort" then
        for _,eggs in pairs(itemport:GetChildren()) do
            if (eggs.Name == "egg" or eggs.Name == "duckEgg") then
                if (HR.Position - eggs.HandleDisabled.Position).magnitude > 24 then
                    Point = eggs.HandleDisabled.Position + Vector3.new(0,1.5,0)
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    wait(Time)
                end
                print("picking up egg")
                local args = {
                    [1] = {
                    ["tool"] = eggs,
                    ["player_tracking_category"] = "join_from_web"
                    }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
            end
        end
    end
end
        end
    end
end)

Item64.MouseButton1Click:Connect(function()
    if Toggled47 then
        Toggled47 = false
        Item64.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item64.Text = "Leaf Collector"
        Item64.TextColor3 = Color3.fromRGB(250,250,250)
        tween:Cancel()
    else
        Toggled47 = true
        Item64.BackgroundColor3 = Color3.new(0,255,255)
        Item64.Text = "Collecting Leaves"
        Item64.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled47 == true do
            wait()
            if game.Players.LocalPlayer.Character:FindFirstChild("clippers") then
                for i,v in pairs(Island.Blocks:GetChildren()) do
                    if v.Name == "tree1" or v.Name == "tree2" or v.Name == "tree3" or v.Name == "tree4" or v.Name == "treeMaple1" or v.Name == "treeMaple2" then
                        if Toggled47 == true then
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude > 24 then
                                Point = v.Position + Vector3.new(0,5,0)
                                Distance = (HR.Position - Point).Magnitude
                                Speed = 20
                                Time = Distance/Speed
                                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                                tween:Play()
                                wait(Time)
                            end
                            local args = {
                                [1] = {
                                ["tree"] = v
                                }
                            }
                            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TRIM_TREE_REQUEST:InvokeServer(unpack(args))
                        end
                    end
                end
            else
            game.StarterGui:SetCore("SendNotification", {Title="Retrying in 5 seconds"; Text="NOT HOLDING CLIPPERS!"; Icon ="rbxassetid://62800364"; Duration=5;})
            wait(5)
            end
        end
    end
end)

for i,v in pairs(game:GetService("CoreGui").CmdGui.Background.Background4.Background9.CmdHandler6:GetChildren()) do
    v.MouseButton1Click:Connect(function()
        if Toggled48 then
            Toggled48 = false
            v.BackgroundColor3 = Color3.new(0,0,0)
        else
            Toggled48 = true
            v.BackgroundColor3 = Color3.new(0,1,1)
            ToOl = v.Text
            while Toggled48  do
                print("eating "..v.Text)
                wait()

                Plr.Backpack[ToOl].Parent = Plr.Character
                wait()
                args = {
                    [1] = {
                    ["tool"] = Plr.Character[ToOl]
                    }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_EAT_FOOD:InvokeServer(unpack(args))
                wait(900)
            end
        end
    end)
end

Item66.MouseButton1Click:Connect(function()
    if Toggled49 then
        Toggled49 = false
        Item66.BackgroundColor3 = Color3.fromRGB(124,92,70)
        Item66.Text = "Fhangorn"
        Item66.TextColor3 = Color3.fromRGB(0,0,0)
    else
        Toggled49 = true
        Item66.BackgroundColor3 = Color3.new(1,0,0)
        Item66.Text = "Pew Pew"
        Item66.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled49 == true do
            wait()
        end
    end
end)

Item68.MouseButton1Click:Connect(function()
    if Toggled51 then
        Toggled51 = false
        Item68.BackgroundColor3 = Color3.fromRGB(55,55,55)
        Item68.Text = "Candy Cane"
        Item68.TextColor3 = Color3.new(1,1,1)
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, false, game, 1)
        tween:Cancel()
    else
        Toggled51 = true
        Item68.BackgroundColor3 = Color3.new(0,255,255)
        Item68.Text = "Cane!"
        Item68.TextColor3 = Color3.fromRGB(0,0,0)
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, true, game, 1)
        Island = ""
        for i,island in pairs(game.Workspace.Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled51 == true do
            wait()
for i,trellis in pairs(Island.Blocks:GetChildren()) do
    if trellis.Name == "trellis" then
        local ray = Ray.new(trellis.Position, Vector3.new(0,3,0))
        local hitPart, hitPosition = workspace:FindPartOnRay(ray,trellis)
        if hitPart then
            if hitPart.Name == "candyCaneVine" and hitPart.stage.Value < 3 then
                print("not ready yet")
            elseif hitPart.Name == "candyCaneVine" and hitPart.stage.Value == 3 then
                print(hitPart)
                if Toggled51 == true then
                    if (HR.Position - hitPart.Position).magnitude > 24 then
                        Point = hitPart.Position
                        Distance = (HR.Position - Point).Magnitude
                        Speed = 20
                        Time = Distance/Speed
                        tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                        tween:Play()
                        wait(Time - 1)
                    end
                local args = {
                [1] = {
                    ["player"] = game:GetService("Players").LocalPlayer,
                    ["player_tracking_category"] = "join_from_web",
                    ["model"] = hitPart
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_HARVEST_CROP_REQUEST:InvokeServer(unpack(args))
                end
            end
        else
            if Toggled51 == true then
            print("Planting")
            local args = {
            [1] = {
                ["upperBlock"] = false,
                ["cframe"] = CFrame.new((trellis.Position + Vector3.new(0,3,0)), (trellis.Position + Vector3.new(0,0,3))),
                ["player_tracking_category"] = "join_from_web",
                ["blockType"] = "candyCaneVine"
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_PLACE_REQUEST:InvokeServer(unpack(args))
            end
        end
    end
end
        end
    end
end)

Item69.MouseButton1Click:Connect(function()
    if Toggled52 then
        Toggled52 = false
        Item69.BackgroundColor3 = Color3.fromRGB(55,55,55)
        Item69.Text = "Dragon Fruit"
        Item69.TextColor3 = Color3.new(1,1,1)
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, false, game, 1)
        tween:Cancel()
    else
        Toggled52 = true
        Item69.BackgroundColor3 = Color3.new(0,255,255)
        Item69.Text = "Dragon!"
        Item69.TextColor3 = Color3.fromRGB(0,0,0)
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, true, game, 1)
        Island = ""
        for i,island in pairs(game.Workspace.Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled52 == true do
            wait()
for i,trellis in pairs(Island.Blocks:GetChildren()) do
    if trellis.Name == "trellis" then
        local ray = Ray.new(trellis.Position, Vector3.new(0,3,0))
        local hitPart, hitPosition = workspace:FindPartOnRay(ray,trellis)
        if hitPart then
            if hitPart.Name == "dragonfruit" and hitPart.stage.Value < 3 then
                print("not ready yet")
            elseif hitPart.Name == "dragonfruit" and hitPart.stage.Value == 3 then
                print(hitPart)
                if Toggled52 == true then
                    if (HR.Position - hitPart.Position).magnitude > 24 then
                        Point = hitPart.Position
                        Distance = (HR.Position - Point).Magnitude
                        Speed = 20
                        Time = Distance/Speed
                        tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                        tween:Play()
                        wait(Time - 1)
                    end
                local args = {
                [1] = {
                    ["player"] = game:GetService("Players").LocalPlayer,
                    ["player_tracking_category"] = "join_from_web",
                    ["model"] = hitPart
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_HARVEST_CROP_REQUEST:InvokeServer(unpack(args))
                end
            end
        else
            if Toggled52 == true then
            print("Planting")
            local args = {
            [1] = {
                ["upperBlock"] = false,
                ["cframe"] = CFrame.new((trellis.Position + Vector3.new(0,3,0)), (trellis.Position + Vector3.new(0,0,3))),
                ["player_tracking_category"] = "join_from_web",
                ["blockType"] = "dragonfruit"
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_PLACE_REQUEST:InvokeServer(unpack(args))
            end
        end
    end
end
        end
    end
end)

Item70.MouseButton1Click:Connect(function()
    if Toggled53 then
        Toggled53 = false
        Item70.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item70.Text = "Auto-Yak Butter"
        Item70.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled53 = true
        Item70.BackgroundColor3 = Color3.new(0,255,255)
        Item70.Text = "Makin' the Butter"
        Item70.TextColor3 = Color3.fromRGB(0,0,0)
		local Island = ""
		for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
			if (island:IsA("Model")) then
				Island = island
			end
		end
		print("Found island",Island)
        while Toggled53 == true do
            wait()
			for _,MayoSpinner in pairs(Island.Blocks:GetChildren()) do
				if (MayoSpinner:IsA("Part")) and MayoSpinner.Name == "churner" then
					print("Found churner")
					wait()

					local args = {
						[1] = {
						["amount"] = 1,
						["block"] = MayoSpinner,
						["player_tracking_category"] = "join_from_web",
						["toolName"] = "bucketYakMilk"
						}
					}

					game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))

					if MayoSpinner.WorkerContents:FindFirstChild("yakButter") then
	
						game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(MayoSpinner.Position + Vector3.new(0,5,0))
						print("gettn that butter")
						wait()
						local args = {
							[1] = {
								["tool"] = MayoSpinner.WorkerContents.yakButter,
								["player_tracking_category"] = "join_from_web"
							}
						}

						game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
						else
						print("no butter")
					end
				end
			end
        end
    end
end)

Item72.MouseButton1Click:Connect(function()
    if Toggled55 then
        Toggled55 = false
        Item72.BackgroundColor3 = Color3.fromRGB(161,157,148)
        Item72.Text = "Iron"
        Item72.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled55 = true
        Item72.BackgroundColor3 = Color3.new(0,255,255)
        Item72.Text = "Smelting Iron"
        Item72.TextColor3 = Color3.fromRGB(0,0,0)
		local Island = ""
		for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
			if (island:IsA("Model")) then
				Island = island
			end
		end
		print("Found island",Island)
        while Toggled55 == true do
            wait()
			for i,b in pairs(Island.Blocks:GetChildren()) do
				if b.Name == "smallFurnace" then
					print("found furnace", i)
					if b.WorkerFuel:FindFirstChild("coal") then
						print(i, "is working")
						if #b.WorkerContents:GetChildren() == 0 then
							print(i, "has no children")
							local Repeat = 1
							if Toggled55 == true then
								local args = {
									[1] = {
									["amount"] = 50,
									["block"] = b,
									["player_tracking_category"] = "join_from_web",
									["toolName"] = "ironOre"
									}
								}
								game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
							end
						end
						if b.WorkerOutputContents:FindFirstChild("iron") then
						    if b.WorkerOutputContents:FindFirstChild("iron").Amount.Value == 50 then
						        if Toggled55 == true then
							        print("withrdawing from", i)
							            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - b.Position).magnitude > 24 then
						            		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(b.Position)
							            	wait(0.3)
							            end
					            	local args = {
							        [1] = {
							        ["tool"] = b.WorkerOutputContents.iron,
							        ["player_tracking_category"] = "join_from_web"
							        }
							        }
						            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
						        end
						    end
					    end
					else
						print("Fueling", i)
						local Repeat = 1
						if Toggled55 == true then
							local args = {
							[1] = {
							["amount"] = 50,
							["block"] = b,
							["player_tracking_category"] = "join_from_web",
							["toolName"] = "coal"
							}
							}
							game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
						end
					end
				end
			end
        end
    end
end)

Item73.MouseButton1Click:Connect(function()
    if Toggled56 then
        Toggled56 = false
        Item73.BackgroundColor3 = Color3.fromRGB(255,215,0)
        Item73.Text = "Gold"
        Item73.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled56 = true
        Item73.BackgroundColor3 = Color3.new(0,255,255)
        Item73.Text = "Smelting Gold"
        Item73.TextColor3 = Color3.fromRGB(0,0,0)
		local Island = ""
		for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
			if (island:IsA("Model")) then
				Island = island
			end
		end
		print("Found island",Island)
        while Toggled56 == true do
            wait()
			for i,b in pairs(Island.Blocks:GetChildren()) do
				if b.Name == "smallFurnace" then
					print("found furnace", i)
					if b.WorkerFuel:FindFirstChild("coal") then
						print(i, "is working")
						if #b.WorkerContents:GetChildren() == 0 then
							print(i, "has no children")
							if Toggled56 == true then
								local args = {
									[1] = {
									["amount"] = 50,
									["block"] = b,
									["player_tracking_category"] = "join_from_web",
									["toolName"] = "goldOre"
									}
								}
								game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
							end
						else
							wait()
						end
						if b.WorkerOutputContents:FindFirstChild("gold") then
						    if b.WorkerOutputContents:FindFirstChild("gold").Amount.Value == 50 then
						        if Toggled56 == true then
							print("withrdawing from", i)
							if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - b.Position).magnitude > 24 then
								game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(b.Position)
								wait(0.3)
							end
						local args = {
							[1] = {
							["tool"] = b.WorkerOutputContents.gold,
							["player_tracking_category"] = "join_from_web"
							}
							}
						game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
						    end
						    end
					    end
					else
						print("Fueling", i)
						if Toggled56 == true then
							local args = {
							[1] = {
							["amount"] = 50,
							["block"] = b,
							["player_tracking_category"] = "join_from_web",
							["toolName"] = "coal"
							}
							}
							game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
						end
					end
				end
			end
        end
    end
end)

Item74.MouseButton1Click:Connect(function()
    if Toggled57 then
        Toggled57 = false
        Item74.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item74.Text = "Plow Nearby"
        Item74.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled57 = true
        Item74.BackgroundColor3 = Color3.new(0,255,255)
        Item74.Text = "Plowing"
        Item74.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled57 == true do
            wait()
            for i,Grass in pairs(Island.Blocks:GetChildren()) do
                if Grass.Name == "grass" and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Grass.Position).Magnitude < 10 then
                local args = {
                [1] = {
                ["block"] = Grass
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_PLOW_BLOCK_REQUEST:InvokeServer(unpack(args))
end
end
end
end
end)

UnPlow.MouseButton1Click:Connect(function()
    if Toggled77 then
        Toggled77 = false
        UnPlow.BackgroundColor3 = Color3.fromRGB(63,63,63)
        UnPlow.Text = "Unplow Nearby"
        UnPlow.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled77 = true
        UnPlow.BackgroundColor3 = Color3.new(0,255,255)
        UnPlow.Text = "Unplowing"
        UnPlow.TextColor3 = Color3.fromRGB(0,0,0)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled77 == true do
            wait()
            for i,Grass in pairs(Island.Blocks:GetChildren()) do
                if Grass.Name == "soil" and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Grass.Position).Magnitude < 10 then
                local args = {
                [1] = {
                ["block"] = Grass
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_PLOW_BLOCK_REQUEST:InvokeServer(unpack(args))
end
end
end
end
end)

Item75.MouseButton1Click:Connect(function()
    if Toggled58 then
        Toggled58 = false
        Item75.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item75.Text = "Auto-Fish"
        Item75.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled58 = true
        Item75.BackgroundColor3 = Color3.new(0,255,255)
        Item75.Text = "Gon' Fishing"
        Item75.TextColor3 = Color3.fromRGB(0,0,0)
        local X,Y = 0,0
        local Player = game.Players.LocalPlayer
        while Toggled58 == true do
            v = 0
            VirtualInputManager:SendMouseButtonEvent(X, Y, 0, true, game, 1) -- click down
            wait(0.5)
            VirtualInputManager:SendMouseButtonEvent(X, Y, 0, false, game, 1) -- click up
            repeat wait() v = v + 1 print("waiting for bite") until Player.PlayerGui.ActionBarScreenGui.ActionBar:FindFirstChild("RoactTree") or v == 200
            wait(0.5)
            v = 0
            repeat
                wait() v = v + 1
                if Player.PlayerGui.ActionBarScreenGui.ActionBar:FindFirstChild("RoactTree") then
                    if Player.PlayerGui.ActionBarScreenGui.ActionBar.RoactTree:FindFirstChild(3) then
                        fish = Player.PlayerGui.ActionBarScreenGui.ActionBar.RoactTree[3].Minigame.FishZone
                        bobber = Player.PlayerGui.ActionBarScreenGui.ActionBar.RoactTree[3].Minigame.Marker
                        if bobber.AbsolutePosition.X - fish.AbsolutePosition.X < 35 then
                            VirtualInputManager:SendMouseButtonEvent(X, Y, 0, true, game, 1)
                            wait()
                        print("click down")
                        elseif bobber.AbsolutePosition.X - fish.AbsolutePosition.X > 35 then
                            VirtualInputManager:SendMouseButtonEvent(X, Y, 0, false, game, 1)
                            print("Click UP")
                            wait()
                        elseif bobber.AbsolutePosition.X - fish.AbsolutePosition.X == 35 then
                        wait()
                        print("waiting")
                        end
                    end
                end
                print("waiting for game over screen")
            until Player.PlayerGui.ActionBarScreenGui.ActionBar:FindFirstChild("GameOverScreen") or v == 150
            wait(0.5)
        end
    end
end)

Item76.MouseButton1Click:Connect(function()
    island = ""
    for i,v in pairs(game.Workspace.Islands:GetChildren()) do
        island = v
    end
    
    for i,smelter in pairs(island.Blocks:GetChildren()) do
        if smelter.Name == "smallFurnace" then
            print("found "..smelter.Name..i)
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - smelter.Position).magnitude > 23 then
                Point = smelter.Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                tween:Play()
                wait(Time - 2)
            end
            for i,content in pairs(smelter.WorkerOutputContents:GetChildren()) do
                local args = {
                [1] = {
                ["tool"] = content,
                ["player_tracking_category"] = "join_from_web"
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
            end
            for i,content in pairs(smelter.WorkerContents:GetChildren()) do
                local args = {
                [1] = {
                ["tool"] = content,
                ["player_tracking_category"] = "join_from_web"
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
            end
        end
    end
end)

Item77.MouseButton1Click:Connect(function()
    if Toggled59 then
        Toggled59 = false
        Item77.BackgroundColor3 = Color3.fromRGB(55,55,55)
        Item77.Text = "Spirit Crystals"
        Item77.TextColor3 = Color3.new(1,1,1)
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, false, game, 1)
        NoClipping:Disconnect()
        noClip = false
    else
        Toggled59 = true
        Item77.BackgroundColor3 = Color3.new(0,255,255)
        Item77.Text = "Farming!"
        Item77.TextColor3 = Color3.fromRGB(0,0,0)
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, true, game, 1)
        noClip = true
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        while Toggled59 == true do
            wait()
for i,dirt in pairs(Island.Blocks:GetChildren()) do
    if dirt.Name == "soil" then
        local ray = Ray.new(dirt.Position, Vector3.new(0,3,0))
        local hitPart, hitPosition = workspace:FindPartOnRay(ray,dirt)
        if hitPart then
            if hitPart.Name == "spiritCrop" and hitPart.stage.Value == 3 then
                print(hitPart,"is ready")
                if Toggled59 == true then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - hitPart.Position).magnitude > 24 then
                        game.Players.LocalPlayer.Character.Humanoid:MoveTo(hitPart.Position)
                        game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:wait()
                    end
                end
            end
        else
            if Toggled59 == true then
            print("Planting")
            local args = {
            [1] = {
                ["upperBlock"] = false,
                ["cframe"] = CFrame.new((dirt.Position + Vector3.new(0,3,0)), (dirt.Position + Vector3.new(0,0,3))),
                ["player_tracking_category"] = "join_from_web",
                ["blockType"] = "spiritCrop"
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_PLACE_REQUEST:InvokeServer(unpack(args))
            end
        end
    end
end
        end
    end
end)

Item78.MouseButton1Click:Connect(function()
    if Toggled60 then
        Toggled60 = false
        Item78.BackgroundColor3 = Color3.fromRGB(55,55,55)
        Item78.Text = "Give Fertility Potions"
        Item78.TextColor3 = Color3.new(1,1,1)
        tween:Cancel()
    else
        Toggled60 = true
        Item78.BackgroundColor3 = Color3.new(0,255,255)
        Item78.Text = "Breeding Animals!"
        Item78.TextColor3 = Color3.fromRGB(0,0,0)
        Island = ""
        for i,island in pairs(game.Workspace.Islands:GetChildren()) do
            Island = island
        end
        while Toggled60 == true do
            wait()
for i,Animal in pairs(Island.Entities:GetChildren()) do
    if (Animal.Name == "horse" or Animal.Name == "sheep" or Animal.Name == "pig" or Animal.Name == "cow" or Animal.Name == "chicken" or Animal.Name == "duck" or Animal.Name == "yak" or Animal.Name == "turkey") and Animal.BreedSearch.Value == false then
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Animal.Position).magnitude > 23 then
        Point = Animal.Position
        Distance = (HR.Position - Point).Magnitude
        Speed = 20
        Time = Distance/Speed
        tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
        tween:Play()
        wait(Time - 2)
    end
        if Toggled60 == true then
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "potionFertility" then
                v.Parent = game:GetService("Players").LocalPlayer.Character
                wait()
            end
        end
        end
    local args = {
    [1] = {
        ["animal"] = Animal
    }
    }
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_FEED_ANIMAL:InvokeServer(unpack(args))
    end
end
wait(6)
if Toggled60 == true then
for i,spawneggs in pairs(Island.Blocks:GetDescendants()) do
    if spawneggs.Name == "spawnEggSheepT1" or spawneggs.Name == "spawnEggSheepT2" or spawneggs.Name == "spawnEggSheepT3" or spawneggs.Name == "spawnEggCowT1" or spawneggs.Name == "spawnEggCowT2" or spawneggs.Name == "spawnEggCowT3" or spawneggs.Name == "spawnEggHorseT1" or spawneggs.Name == "spawnEggHorseT2" or spawneggs.Name == "spawnEggHorseT3" or spawneggs.Name == "spawnEggPigT1" or spawneggs.Name == "spawnEggPigT2" or spawneggs.Name == "spawnEggPigT3" or spawneggs.Name == "spawnEggChickenT1" or spawneggs.Name == "spawnEggChickenT2" or spawneggs.Name == "spawnEggChickenT3" or spawneggs.Name == "spawnEggYakT1" or spawneggs.Name == "spawnEggYakT2" or spawneggs.Name == "spawnEggYakT3" or spawneggs.Name == "spawnEggTurkeyT1" or spawneggs.Name == "spawnEggTurkeyT2" or spawneggs.Name == "spawnEggTurkeyT3" then
        local args = {
    [1] = {
        ["tool"] = spawneggs,
        ["player_tracking_category"] = "join_from_web"
    }
    }
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
    end
end
end
wait(146)
        end
    end
end)

Item79.MouseButton1Click:Connect(function()
    if Toggled61 then
        Toggled61 = false
        Item79.BackgroundColor3 = Color3.fromRGB(55,55,55)
        Item79.Text = "Catch Spirits"
        Item79.TextColor3 = Color3.new(1,1,1)
        HR:FindFirstChild("BodyVelocity"):Destroy()
        Noclipping:Disconnect()
        noClip = false
    else
        Toggled61 = true
        Item79.BackgroundColor3 = Color3.new(0,255,255)
        Item79.Text = "Catching spirits"
        Item79.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = HR
        BV.MaxForce = Vector3.new(0,math.huge,0)
        for i,v in pairs(game:GetService("Workspace").spawnPrefabs.WildIslands:GetChildren()) do
            v:Destroy()
        end
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        noClip = true
        Times = 0
        while Toggled61 == true do
            wait()
            if workspace.WildernessIsland.Entities:FindFirstChild("spirit") then
                if workspace.WildernessIsland.Entities.spirit:FindFirstChild("HumanoidRootPart") then
                HR.CFrame = CFrame.new(workspace.WildernessIsland.Entities.spirit:FindFirstChild("HumanoidRootPart").Position)
                    local args = {
                    [1] = HttpService:GenerateGUID(false),
                    [2] = {
                    [1] = {
                    ["entity"] = workspace.WildernessIsland.Entities.spirit
                    }
                    }
                    }
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("hvyqwbKPmzDjwr/ezj")
                    wait()
                end
            end
        end
    end
end)

God.MouseButton1Click:Connect(function()
    if Toggled69 then
        Toggled69 = false
        God.BackgroundColor3 = Color3.fromRGB(50,50,50)
        God.Text = "Enable God Mode"
        God.TextColor3 = Color3.fromRGB(50,200,100)
        game.Players.LocalPlayer.Character:BreakJoints()
    else
        Toggled69 = true
        God.BackgroundColor3 = Color3.new(0,255,255)
        God.Text = "Disable God Mode"
        God.TextColor3 = Color3.fromRGB(0,0,0)
		Character.CurrentHealth:Destroy()
    end
end)

Item85.MouseButton1Click:Connect(function()
    if Toggled74 then
        Toggled74 = false
        Item85.BackgroundColor3 = Color3.fromRGB(55,55,55)
        Item85.Text = "Buffalkor Island"
        Item85.TextColor3 = Color3.new(1,1,1)
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        tween:Cancel()
    else
        Toggled74 = true
        Item85.BackgroundColor3 = Color3.new(0,255,255)
        Item85.Text = "Mining!"
        Item85.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        POs = Vector3.new(1584, 384, 107)
        game.Players.LocalPlayer.Character:MoveTo(Vector3.new(1211, 385, 115))
        wait(1)
        while Toggled74 == true do
            wait()
Blocks = game.Workspace.WildernessBlocks
for i,v in pairs(Blocks:GetChildren()) do
if (POs - v.Position).magnitude < 600 and v:FindFirstChild("1") then print("on island")
    if Toggled74 == true then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude > 23 then
        Point = v.Position
        Distance = (HR.Position - Point).Magnitude
        Speed = 20
        Time = Distance/Speed
        tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
        tween:Play()
        wait(Time - 2)
    end
    repeat
    print("Hitting "..v:FindFirstChild("1").Name)
    local args = {[1] = {
    ["player_tracking_category"] = "join_from_web",
    ["part"] = v:FindFirstChild("1"),
    ["block"] = v,
    ["norm"] = nil --[[Vector3]],
    ["pos"] = nil --[[Vector3]]
    }}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
    until
    v:FindFirstChild("1") == nil
    end
end
end
        end
    end
end)

Item86.MouseButton1Click:Connect(function()
    if Toggled75 then
        Toggled75 = false
        Item86.BackgroundColor3 = Color3.fromRGB(55,55,55)
        Item86.Text = "Diamond Island"
        Item86.TextColor3 = Color3.new(1,1,1)
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        tween:Cancel()
    else
        Toggled75 = true
        Item86.BackgroundColor3 = Color3.new(0,255,255)
        Item86.Text = "Mining!"
        Item86.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        POs = Vector3.new(2752, 285, 1196)
        wait(1)
        while Toggled75 == true do
            wait()
Blocks = game.Workspace.WildernessBlocks
for i,v in pairs(Blocks:GetChildren()) do
if (POs - v.Position).magnitude < 600 and v:FindFirstChild("1") then print("on island")
    if Toggled75 == true then
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude > 23 then
        Point = v.Position
        Distance = (HR.Position - Point).Magnitude
        Speed = 20
        Time = Distance/Speed
        tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
        tween:Play()
        wait(Time - 2)
    end
    repeat
    print("Hitting "..v:FindFirstChild("1").Name)
    local args = {[1] = {
    ["player_tracking_category"] = "join_from_web",
    ["part"] = v:FindFirstChild("1"),
    ["block"] = v,
    ["norm"] = nil --[[Vector3]],
    ["pos"] = nil --[[Vector3]]
    }}
    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
    until
    v:FindFirstChild("1") == nil
    end
end
end
        end
    end
end)

local VoidMining = Instance.new("TextButton")
VoidMining.Position = UDim2.new(0,0,1,21)
VoidMining.Size = UDim2.new(0,70,0,20)
VoidMining.BackgroundColor3 = Color3.fromRGB(63,63,63)
VoidMining.BorderSizePixel = 1
VoidMining.ZIndex = 2
VoidMining.Parent = Notification11
VoidMining.Text = "Void Rocks"
VoidMining.TextColor3 = Color3.fromRGB(250,250,250)
VoidMining.TextScaled = true
VoidMining.MouseButton1Click:Connect(function()
    if Toggled83 then
        Toggled83 = false
        VoidMining.BackgroundColor3 = Color3.fromRGB(55,55,55)
        VoidMining.Text = "Void Rocks"
        VoidMining.TextColor3 = Color3.new(1,1,1)
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        tween:Cancel()
    else
        Toggled83 = true
        VoidMining.BackgroundColor3 = Color3.new(0,255,255)
        VoidMining.Text = "Mining!"
        VoidMining.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        POs = Vector3.new(-10026, 163, 9984)
        local Pickaxe = Plr.Backpack:FindFirstChild("opalPickaxe")
        local AltPickaxe = Plr.Backpack:FindFirstChild("diamondPickaxe")
        local Shovel = Plr.Backpack:FindFirstChild("shovelStone")
        local Continue = 0
        wait(1)
        while Toggled83 == true do
            wait()
            Blocks = game.Workspace.WildernessBlocks
            for i,v in pairs(Blocks:GetChildren()) do
                if (POs - v.Position).magnitude < 200 and v:FindFirstChild("1") then print("on island")
                    if Toggled83 == true then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude > 23 then
                            Point = v.Position
                            Distance = (HR.Position - Point).Magnitude
                            Speed = 20
                            Time = Distance/Speed
                            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                            tween:Play()
                            wait(Time - 2)
                        end
                        repeat
                            Continue = Continue + 1
                        if Pickaxe then
                            print("equipping pickaxe")
                            Pickaxe.Parent = Character
                            elseif  AltPickaxe then
                            AltPickaxe.Parent = Character
                        end
                        print("Hitting "..v.Name.." at",v.Position)
                        local args = {[1] = {
                        ["player_tracking_category"] = "join_from_web",
                        ["part"] = v:FindFirstChild("1"),
                        ["block"] = v,
                        ["norm"] = nil --[[Vector3]],
                        ["pos"] = nil --[[Vector3]]
                        }}
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
                        until
                        v:FindFirstChild("1") == nil or Continue == 20 or Toggled83 == false
                    end
                    Point = HR.Position + Vector3.new(0,30,0)
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    Continue = 0
                    elseif (POs - v.Position).magnitude < 200 and (v.Name == "grassVoid" or v.Name == "sandVoid") then
                        if Toggled83 == true then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude > 23 then
                            Point = v.Position
                            Distance = (HR.Position - Point).Magnitude
                            Speed = 20
                            Time = Distance/Speed
                            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                            tween:Play()
                            wait(Time - 2)
                        end
                        repeat
                            Continue = Continue + 1
                        print("Shoveling")
                        local args = {
                        [1] = {
                            ["shovelType"] = "shovelStone",
                            ["block"] = v
                        }
                        }

                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_21:InvokeServer(unpack(args))
                    until
                        v:FindFirstChild("Targettable") == nil or Continue == 20 or Toggled83 == false
                        end
                    Point = HR.Position + Vector3.new(0,30,0)
                    Distance = (HR.Position - Point).Magnitude
                    Speed = 20
                    Time = Distance/Speed
                    tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                    tween:Play()
                    Continue = 0
                end
            end
        end
    end
end)

local ElectriteMining = Instance.new("TextButton")
ElectriteMining.Position = UDim2.new(0,71,1,21)
ElectriteMining.Size = UDim2.new(0,70,0,20)
ElectriteMining.BackgroundColor3 = Color3.fromRGB(63,63,63)
ElectriteMining.BorderSizePixel = 1
ElectriteMining.ZIndex = 2
ElectriteMining.Parent = Notification11
ElectriteMining.Text = "Electrite"
ElectriteMining.TextColor3 = Color3.fromRGB(250,250,250)
ElectriteMining.TextScaled = true
ElectriteMining.MouseButton1Click:Connect(function()
    if Toggled85 then
        Toggled85 = false
        ElectriteMining.BackgroundColor3 = Color3.fromRGB(55,55,55)
        ElectriteMining.Text = "Electrite"
        ElectriteMining.TextColor3 = Color3.new(1,1,1)
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        tween:Cancel()
    else
        Toggled85 = true
        ElectriteMining.BackgroundColor3 = Color3.new(0,255,255)
        ElectriteMining.Text = "Mining!"
        ElectriteMining.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local Pickaxe = Plr.Backpack:FindFirstChild("opalPickaxe")
        local AltPickaxe = Plr.Backpack:FindFirstChild("diamondPickaxe")
        local Shovel = Plr.Backpack:FindFirstChild("shovelStone")
        local Continue = 0
        wait(1)
        while Toggled85 == true do
            wait()
            Blocks = game.Workspace.WildernessBlocks
            for i,v in pairs(Blocks:GetChildren()) do
                if v.Name == "rockElectrite" and v:FindFirstChild("1") then
                    if Toggled85 == true then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude > 23 then
                            Point = v.Position
                            Distance = (HR.Position - Point).Magnitude
                            Speed = 20
                            Time = Distance/Speed
                            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                            tween:Play()
                            wait(Time - 2)
                        end
                        repeat
                        if Pickaxe then
                            print("equipping pickaxe")
                            Pickaxe.Parent = Character
                            elseif  AltPickaxe then
                            AltPickaxe.Parent = Character
                        end
                        print("Hitting "..v.Name.." at",v.Position)
                        local args = {[1] = {
                        ["player_tracking_category"] = "join_from_web",
                        ["part"] = v:FindFirstChild("1"),
                        ["block"] = v,
                        ["norm"] = nil --[[Vector3]],
                        ["pos"] = nil --[[Vector3]]
                        }}
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_HIT_REQUEST:InvokeServer(unpack(args))
                        Continue = Continue + 1
                        until
                        v:FindFirstChild("1") == nil or Continue > 20 or Toggled85 == false
                    end
                    Continue = 0
                end
            end
        end
    end
end)

local SnowMining = Instance.new("TextButton")
SnowMining.Position = UDim2.new(0,0,1,42)
SnowMining.Size = UDim2.new(0,70,0,20)
SnowMining.BackgroundColor3 = Color3.fromRGB(63,63,63)
SnowMining.BorderSizePixel = 1
SnowMining.ZIndex = 2
SnowMining.Parent = Notification11
SnowMining.Text = "Snow"
SnowMining.TextColor3 = Color3.fromRGB(250,250,250)
SnowMining.TextScaled = true
SnowMining.MouseButton1Click:Connect(function()
    if Toggled86 then
        Toggled86 = false
        SnowMining.BackgroundColor3 = Color3.fromRGB(55,55,55)
        SnowMining.Text = "Snow"
        SnowMining.TextColor3 = Color3.new(1,1,1)
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        tween:Cancel()
    else
        Toggled86 = true
        SnowMining.BackgroundColor3 = Color3.new(0,255,255)
        SnowMining.Text = "Mining!"
        SnowMining.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        local Continue = 0
        wait(1)
        while Toggled86 == true do
            wait()
            Blocks = game.Workspace.WildernessBlocks
            for i,v in pairs(Blocks:GetChildren()) do
                if v.Name == "pileSnow" then
                    if Toggled86 == true then
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).magnitude > 23 then
                            Point = v.Position - Vector3.new(0,3,0)
                            Distance = (HR.Position - Point).Magnitude
                            Speed = 20
                            Time = Distance/Speed
                            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                            tween:Play()
                            wait(Time - 2)
                        end
                        repeat
                            local args = {
                            [1] = {
                            ["shovelType"] = "shovelStone",
                            ["block"] = v
                            }}
                            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_21:InvokeServer(unpack(args))
                            Continue = Continue + 1
                        until
                        v:FindFirstChild("Targettable") == nil or Continue == 20 or Toggled86 == false
                        end
                    Continue = 0
                end
            end
        end
    end
end)

Item87.MouseButton1Click:Connect(function()
    if Toggled78 then
        Toggled78 = false
        Item87.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item87.Text = "Pick Berries"
        Item87.TextColor3 = Color3.fromRGB(250,250,250)
        tween:Cancel()
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, false, game, 1)
    else
        Toggled78 = true
        Item87.BackgroundColor3 = Color3.new(0,255,255)
        Item87.Text = "Picking Berries"
        Item87.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        local YSpeed = 0
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, true, game, 1)
        local Island = ""
        for _,island in pairs(game:GetService("Workspace").Islands:GetChildren()) do
            if (island:IsA("Model")) then
                Island = island
            end
        end
        while Toggled78 == true do
            wait()
            for i,Bush in pairs(Island.Blocks:GetDescendants()) do
                if  Bush.Name == "berryBush" and Bush.stage.Value == 2 then
                    if Toggled78 then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Bush.Position).magnitude > 24 then
                        Point = Bush.Position
                        Distance = (HR.Position - Point).Magnitude
                        Speed = 20
                        Time = Distance/Speed
                        tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                        tween:Play()
                        wait(Time - 1)
                    end
                    local args = {[1] = {
                    ["player"] = game:GetService("Players").LocalPlayer,
                    ["player_tracking_category"] = "join_from_web",
                    ["model"] = Bush}}
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_HARVEST_CROP_REQUEST:InvokeServer(unpack(args))
                    end
                end
            end
        end
    end
end)

Item88.MouseButton1Click:Connect(function()
    if Toggled79 then
        Toggled79 = false
        Item88.BackgroundColor3 = Color3.fromRGB(63,63,63)
        Item88.Text = "Composter"
        Item88.TextColor3 = Color3.fromRGB(250,250,250)
        tween:Cancel()
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        NoClipping:Disconnect()
    else
        Toggled79 = true
        Item88.BackgroundColor3 = Color3.new(0,255,255)
        Item88.Text = "Composting"
        Item88.TextColor3 = Color3.fromRGB(0,0,0)
        local island = ""
        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local TS = game:GetService("TweenService")
        local HR = Character.HumanoidRootPart
        local BV = Instance.new("BodyVelocity")
        local Fish = ""
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = HR
        BV.MaxForce = Vector3.new(0,math.huge,0)
        noClip = true
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)

        for i,Islands in pairs(Game.workspace.Islands:GetChildren()) do
            island = Islands
        end
        while Toggled79 do
            wait()
            for i,Composter in pairs(island.Blocks:GetChildren()) do
                if Composter.Name == "composter" then
                    if Player.Backpack:FindFirstChild("fishCarp") then Fish = "fishCarp"
                    elseif Player.Backpack:FindFirstChild("fishTrout") then Fish = "fishTrout"
                    end
                    if Composter.WorkerContents:FindFirstChild(Fish) == nil then
                        local args = {
                        [1] = {
                        ["amount"] = 20,
                        ["block"] = Composter,
                        ["player_tracking_category"] = "join_from_web",
                        ["toolName"] = Fish
                        }}
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_WORKER_DEPOSIT_TOOL_REQUEST:InvokeServer(unpack(args))
                    end
                    if Composter.WorkerOutputContents:FindFirstChild("fertilizerBasic") and Composter.WorkerOutputContents:FindFirstChild("fertilizerBasic").Amount.Value == 20 then
                        if (HR.Position - Composter.Position).magnitude > 24 then
                            Point = Composter.Position + Vector3.new(0,3,0)
                            Distance = (HR.Position - Point).Magnitude
                            Speed = 20
                            Time = Distance/Speed
                            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point)})
                            tween:Play()
                            wait(Time - 2)
                        end
                        local args = {
                        [1] = {
                        ["tool"] = Composter.WorkerOutputContents.fertilizerBasic,
                        ["player_tracking_category"] = "join_from_web"
                        }}
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_TOOL_PICKUP_REQUEST:InvokeServer(unpack(args))
                    end
                end
            end
        end
    end
end)


Item89.MouseButton1Click:Connect(function()
    if Toggled80 then
        Toggled80 = false
        Item89.BackgroundColor3 = Color3.fromRGB(55,55,55)
        Item89.Text = "Rice"
        Item89.TextColor3 = Color3.new(1,1,1)
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, false, game, 1)
    else
        Toggled80 = true
        Item89.BackgroundColor3 = Color3.new(0,255,255)
        Item89.Text = "Farming!"
        Item89.TextColor3 = Color3.fromRGB(0,0,0)
        Island = ""
        for i,island in pairs(game.Workspace.Islands:GetChildren()) do
            Island = island
        end
        VirtualInputManager:SendMouseButtonEvent(0,0, 0, true, game, 1)
        while Toggled80 == true do
            wait()
for i,pond in pairs(Island.Blocks:GetChildren()) do
    if pond.Name == "pond" then
        local ray = Ray.new(pond.Position, Vector3.new(0,3,0))
        local hitPart, hitPosition = workspace:FindPartOnRay(ray,pond)
        if hitPart then
            if hitPart.Name == "rice" and hitPart.stage.Value == 3 then
                print(hitPart)
                if Toggled80 == true then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - hitPart.Position).magnitude > 24 then
                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(hitPart.Position)
                    game.Players.LocalPlayer.Character.Humanoid.MoveToFinished:wait()
                    end
                local args = {
                [1] = {
                    ["player"] = game:GetService("Players").LocalPlayer,
                    ["player_tracking_category"] = "join_from_web",
                    ["model"] = hitPart
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_HARVEST_CROP_REQUEST:InvokeServer(unpack(args))
                end
            end
        else
            if Toggled80 == true then
            print("Planting")
            local args = {
            [1] = {
                ["upperBlock"] = false,
                ["cframe"] = CFrame.new((pond.Position + Vector3.new(0,3,0)), (pond.Position + Vector3.new(0,0,3))),
                ["player_tracking_category"] = "join_from_web",
                ["blockType"] = "rice"
            }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_BLOCK_PLACE_REQUEST:InvokeServer(unpack(args))
            end
        end
    end
end
        end
    end
end)

local MagmaBlob = Instance.new("TextButton")
MagmaBlob.Position = UDim2.new(0,1,1,127)
MagmaBlob.Size = UDim2.new(0,70,0,20)
MagmaBlob.BackgroundColor3 = Color3.fromRGB(250,20,20)
MagmaBlob.BorderSizePixel = 0
MagmaBlob.ZIndex = 2
MagmaBlob.Parent = Notification7
MagmaBlob.Text = "MagmaMobs"
MagmaBlob.TextColor3 = Color3.fromRGB(250,250,250)
MagmaBlob.TextScaled = true
MagmaBlob.MouseButton1Click:Connect(function()
    if Toggled88 then
        Toggled88 = false
        MagmaBlob.BackgroundColor3 = Color3.fromRGB(250,20,20)
        MagmaBlob.Text = "MagmaMobs"
        MagmaBlob.TextColor3 = Color3.fromRGB(250,250,250)
    else
        Toggled88 = true
        MagmaBlob.BackgroundColor3 = Color3.new(1,0,0)
        MagmaBlob.Text = "Pew Pew"
        MagmaBlob.TextColor3 = Color3.fromRGB(0,0,0)
        while Toggled88 == true do
            wait()
            if game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy) then
                Point = game:GetService("Workspace").WildernessIsland.Entities:FindFirstChild(enemy):WaitForChild("HumanoidRootPart").Position
                Distance = (HR.Position - Point).Magnitude
                Speed = 20
                Time = Distance/Speed
                tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Point + Vector3.new(0,-10,0))})
                tween:Play()
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["crit"] = true,
                ["hitUnit"] = workspace.WildernessIsland.Entities:WaitForChild(enemy)
                }
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("cfevfavTqnegCGxwuojAqhLdtihky/jdClttxycammwHieaAhrnHfgcfnynKcavxb"):FireServer(unpack(args))
            end
        end
    end
end)

local BFly = Instance.new("TextButton")
BFly.Position = UDim2.new(0,1,0,1)
BFly.Size = UDim2.new(0,100,0,20)
BFly.BackgroundColor3 = Color3.fromRGB(63,63,63)
BFly.BorderSizePixel = 1
BFly.ZIndex = 2
BFly.Parent = Background6
BFly.Text = "Catch Butterflies"
BFly.TextColor3 = Color3.fromRGB(250,250,250)
BFly.TextScaled = true
BFly.MouseButton1Click:Connect(function()
    if Toggled89 then
        Toggled89 = false
        BFly.BackgroundColor3 = Color3.fromRGB(63,63,63)
        BFly.Text = "Catch Butterfly"
        BFly.TextColor3 = Color3.new(1,1,1)
        Character.HumanoidRootPart:FindFirstChild("BodyVelocity"):Destroy()
        Noclipping:Disconnect()
        noClip = false
        tween:Cancel()
    else
        Toggled89 = true
        BFly.BackgroundColor3 = Color3.new(0,255,255)
        BFly.Text = "Catching"
        BFly.TextColor3 = Color3.fromRGB(0,0,0)
        local BV = Instance.new("BodyVelocity")
        BV.Velocity = Vector3.new(0,0,0)
        BV.Parent = Character.HumanoidRootPart
        BV.MaxForce = Vector3.new(0,math.huge,0)
        noClip = true
        Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
        while Toggled89 == true do
        wait()
for i,v in pairs(game.Workspace.WildernessIsland.Entities:GetChildren()) do
    if v.Name == "butterfly" and Toggled89 == true then
        if v:FindFirstChild("HumanoidRootPart") ~= nil then
        if (v:FindFirstChild("HumanoidRootPart").Position - Vector3.new(-3694, 105, -2234)).Magnitude < 100 then
        HR.CFrame = CFrame.new(HR.Position + Vector3.new(0,1500,0))
        Tries = 0
        repeat
            if Toggled89 == true then
            Tries = Tries + 1
        print("up n wait")
        wait()
        if v:FindFirstChild("HumanoidRootPart") ~= nil then
            Pointx = v.HumanoidRootPart.Position.X
            Pointz = v.HumanoidRootPart.Position.Z
            Distance = (HR.Position - Vector3.new(Pointx, HR.Position.Y, Pointz)).Magnitude
            Speed = 20
            Time = Distance/Speed
            tween = TS:Create(HR, TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(Vector3.new(Pointx,HR.Position.Y,Pointz + 6))})
            print("Playing Tween for "..Time.." Seconds")
            tween:Play()
            wait(Time)
        end
        if v:FindFirstChild("HumanoidRootPart") ~= nil then
            pcall(function()
            VirtualInputManager:SendMouseButtonEvent(0,0, 0, true, game, 1)
            VirtualInputManager:SendMouseButtonEvent(0,0, 0, false, game, 1)
            wait(0.2)
            HR.CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0,0,6))
            wait(0.5)
            print("I think i caught it!")
            HR.CFrame = CFrame.new(HR.Position + Vector3.new(0,1500,0))
            wait(0.7)
            end)
        end
        end
        until v:FindFirstChild("HumanoidRootPart") == nil or Toggled89 == false or Tries >= 3
        print("ending loop")
        end
        end
end
end
end
end
end)
