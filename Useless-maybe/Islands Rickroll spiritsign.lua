for i,v in pairs(game.Workspace.Islands:GetChildren()) do
    island = v
end

local p = -1
local text = "Never"
waittime = 0.2
while wait() do
    p = p + 1
    wait(waittime)
if p == 0 then text = "Never"
elseif p == 1 then text = "Gonna"
elseif p == 2 then text = "Give"
elseif p == 3 then text = "You"
elseif p == 4 then text = "Up"
elseif p == 5 then text = "Never" wait(0.4)
elseif p == 6 then text = "Gonna"
elseif p == 7 then text = "Let"
elseif p == 8 then text = "You"
elseif p == 9 then text = "Down"
elseif p == 10 then text = "Never" wait(0.4)
elseif p == 11 then text = "Gonna"
elseif p == 12 then text = "Run"
elseif p == 13 then text = "Around"
elseif p == 14 then text = "And" wait(0.3)
elseif p == 15 then text = "Desert"
elseif p == 16 then text = "You"
end
local args = {
    [1] = {
        ["sign"] = island.Blocks.signPostSpirit,
        ["text"] = text
    }
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_EDIT_SIGN:InvokeServer(unpack(args))
if p == 16 then p = -1 end
end