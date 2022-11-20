local contents = readfile("Players.txt")
local newNumber = 0
local Players = game:GetService("Players")

local cache = {}
    function getUserIdFromUsername(name)
        if cache[name] then return cache[name] end
        local id
        pcall(function()
            id = Players:getUserIdFromNameAsync(name)
        end)
        cache[name] = id
        return id
    end

for i = 1, #contents do
    wait()
    if string.sub(contents, i, i) == " " then
        if newNumber == 0 then
            cache = {}
            NAME = contents:sub(1,(i-1))
            print((getUserIdFromUsername(NAME)),NAME)
            local args = {
                [1] = {
                ["userId"] = (getUserIdFromUsername(NAME)),
                ["name"] = NAME
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_8:InvokeServer(unpack(args))
            print("Invited "..NAME)
            newNumber = i+1
        else
            cache = {}
            NAME = contents:sub(newNumber, (i-1))
            print((getUserIdFromUsername(NAME)),NAME)
            local args = {
                [1] = {
                ["userId"] = (getUserIdFromUsername(NAME)),
                ["name"] = NAME
                }
            }
            game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.client_request_8:InvokeServer(unpack(args))

            newNumber = i+1
            print("Invited "..NAME)
        end
    end
end
