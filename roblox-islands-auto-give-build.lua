local Players = game:GetService("Players")

local builderNames = {
  "putthenameofthebuilderhereanditmustmatchcaseexactlykthxbai"
}

function giveBuild(player)
	print("Giving build to", player, "!!!!!!")
	for i = 1,100 do
		wait(0.5)
		local args = {[1] = {["accessRank"] = 3, ["player"] = player}}
		game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_CHANGE_ISLAND_ACCESS_LEVEL:InvokeServer(unpack(args))
	end
end

function maybeGiveBuild(player)
	print("Should give build to", player.Name, "?")
	for _, builderName in pairs(builderNames) do
		if builderName == player.Name then
			giveBuild(player)
		end
	end
end



Players.PlayerAdded:Connect(player)

for _, player in pairs(Players:GetChildren()) do
	maybeGiveBuild(player)
end
