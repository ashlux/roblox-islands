-- Assumes you have the item (in this case avocadoToastTruffle) in your hand at the time...

function eat(itemName)
	print("Eating", itemName)
	local args = {
		[1] = {
			["tool"] = game:GetService("Players").LocalPlayer.Character[itemName]
		}
	}

	game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged
		.CLIENT_EAT_FOOD:InvokeServer(unpack(args))
end

local eatTask = task.spawn(function()
	eat("avocadoToastTruffle")
	while wait(900) do
		eat("avocadoToastTruffle")
	end
end)
