local TS = game:GetService("ReplicatedStorage"):WaitForChild("TS")
local NetworkService = require(TS.network["network-service"]).NetworkService
local AnimationService = require(TS.animation["animation-service"]).AnimationService
local Player = game.Players.LocalPlayer -- Needs to load after NetworkService otherwise it will be nil!

local originalRegisterListenerFn = NetworkService.registerServerToClientEventListener
local originalPlayAnimationFn = AnimationService.playAnimation
local originalPlayAnimationHumanoid = AnimationService.playAnimationHumanoid
local originalXpOrbEventListenerFn = function() end -- can only be known when the event listener is registered

local function areXpOrbsDisabled()
	return Player:GetAttribute("disableXpOrbs") or false
end

local function newXpOrbEventListener(event)
	if not areXpOrbsDisabled() and originalXpOrbEventListenerFn then
		originalXpOrbEventListenerFn(event)
	end
	
	if Player.name == event.player.name then
		-- grant the player XP without rendering the xp orbs
		task.spawn(function()
			NetworkService:sendClientRequest(25, {experienceSecret = event.experienceSecret})
		end)	
	end
end

-- original register event function needs to be replaced ASAP for this to work
NetworkService.registerServerToClientEventListener = function(tbl, eventId, fn)
		if eventId == 2 then
			originalXpOrbEventListenerFn = fn
			return originalRegisterListenerFn(tbl, eventId, newXpOrbEventListener)
		end
		return originalRegisterListenerFn(tbl,eventId,fn)
end 

local function setDisableXpOrbs(value)
    Player:SetAttribute("disableXpOrbs", value or false)	
end

local function disableXpOrbs(cropNameToHarvest)
	setDisableXpOrbs(true) -- set the flag only - monkeypatched function does the real work
end

local function enableXpOrbs()
	setDisableXpOrbs(false)
end

function restoreToolAnimations()
	AnimationService.playAnimation = originalPlayAnimationFn
	AnimationService.playAnimationHumanoid = originalPlayAnimationHumanoid
end

function disableToolAnimations()
	AnimationService.playAnimation = function() end
	AnimationService.playAnimationHumanoid = function() end
end

function render3D(shouldRender3D)
	game.RunService:Set3dRenderingEnabled(shouldRender3D)
end

return {
	enableXpOrbs = enableXpOrbs,
	disableXpOrbs = disableXpOrbs,
	restoreToolAnimations = restoreToolAnimations,
	disableToolAnimations = disableToolAnimations,
	render3D = render3D,
}
