_G.prox = {}
local c = 0

for i, v in pairs(workspace:GetDescendants()) do
    if v.Name == "ProximityPrompt" then
        table.insert(_G.prox, v)
    end
end
function a()
        
    for i, v in pairs(_G.prox) do
        fireproximityprompt(v)
    end
    wait(1)
end
for i = 1, math.huge do --functions yield
    a()
end