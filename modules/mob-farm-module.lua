local HttpService = game:GetService("HttpService")
local HR = game.Players.LocalPlayer.Character.HumanoidRootPart
local VirtualInputManager = game:GetService("VirtualInputManager")

local function getReqCode()
    local swordscript = game:GetService("ReplicatedStorage").Tools.serpentsBane.sword
    local swordFunction = getscriptclosure(swordscript)    
    local info = (decompile(swordFunction))
    local variable
    local sevens = 0
    local startingComma
    local startOfCode
    local startCode
    local endCode

    for i = 1,#info do
        if string.sub(info, i, i+2) == "u30" then
            local searchArea = string.sub(info, i, i+100)
            endCode = string.match(searchArea, [["([^"]+)]])
        elseif string.sub(info, i, i+4) == "p25, " then
            start = i
            if first == true then
                searchArea = string.sub(info, i+11, i+60)
                for i2 = 1,100 do
                    if string.sub(searchArea, i2, i2) == "=" then
                        
                        startCode = string.sub(searchArea, 0, i2-2)
                        return startCode, endCode
                    end
                end
            end
        
            first = true
        end
    end
end

local function getRidOfZeros(finish)
    return string.gsub(finish, "007", "7")
end

local start, finish = getReqCode()

finish = getRidOfZeros(finish)

print(start, finish)

local function clickScreen(X,Y)
    VirtualInputManager:SendMouseButtonEvent(X, Y, 0, true, game, 1) -- click down
    wait(0.5)
    VirtualInputManager:SendMouseButtonEvent(X, Y, 0, false, game, 1) -- click up
end

local function hitNearbyMob()
    for i,v in pairs(workspace.WildernessIsland.Entities:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") then
            if (HR.Position - v.HumanoidRootPart.Position).magnitude < 30 then
                print(v:GetFullName())
                clickScreen(0,0)
                local args = {
                [1] = HttpService:GenerateGUID(false),
                [2] = {
                [1] = {
                ["xbxsjdjbuEsizRmUfpiZfv"] = "\007\240\159\164\161\240\159\164\163\007\n\007\n\007\nhtqqWmsyrxshJnvXfdLlrxltbfmqbfltms"
                ["hitUnit"] = v
                }
                }
                }
                
                game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("node_modules"):WaitForChild("@rbxts"):WaitForChild("net"):WaitForChild("out"):WaitForChild("_NetManaged"):WaitForChild("rxkpWqtnuegabs/JdfKyaeWuAl"):FireServer(unpack(args))
                
                break
                
            end
        end
    end
end
