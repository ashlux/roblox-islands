function isFlower(block)
		return block and block.Name and block.Name:find("flower")
end

function filterBlocks(blocks, predicate)
		local foundBlocks = {}
		local predicateFn = predicate or function() return true end
		for _,block in pairs(blocks or {}) do
				if (predicateFn(block)) then
						table.insert(foundBlocks, block)
				end
		end
		return foundBlocks
end

function pickFlower(flower)
		local arg = {{["flower"] = flower}}
		return game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged
				.client_request_1:InvokeServer(unpack(arg))
end


function pickAllFlowers()
		local island = game.Workspace.Islands:GetChildren()[1]
		local allFlowers = filterBlocks(island.Blocks:GetChildren(), isFlower)
		for i,flower in pairs(allFlowers) do
				pickFlower(flower)
				if (i % 100 == 0) then
						wait() -- breathe
				end
		end
end
