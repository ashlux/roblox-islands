-- set this to totem you want to upgrade (totemMelon, totemPineapple, ect.)
local TotemName = "totemPineapple"

-- set these to the highest you want them upgraded
local MaxEfficiency = 52
local MaxQuality = 52
local MaxUtility = 52


local island = game.Workspace.Islands:GetChildren()[1]

for i = 1,52 do
for i,totem in pairs(island.Blocks:GetChildren()) do
    if totem.Name == TotemName then
        if totem.UpgradeProgress.efficiency.Value < MaxEfficiency then
            local args = {
            [1] = totem,
            [2] = "totem_crop",
            [3] = "efficiency"
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.UpgradeBlock:InvokeServer(unpack(args))
        end
        if totem.UpgradeProgress.quality.Value < MaxQuality then
            local args = {
            [1] = totem,
            [2] = "totem_crop",
            [3] = "quality"
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.UpgradeBlock:InvokeServer(unpack(args))
        end
        if totem.UpgradeProgress.utility.Value < MaxUtility then
            local args = {
            [1] = totem,
            [2] = "totem_crop",
            [3] = "utility"
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.UpgradeBlock:InvokeServer(unpack(args))
        end
        end
    end
end
