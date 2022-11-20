for i,v in pairs(game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.FETCH_ONLINE_ISLANDS:InvokeServer()) do
    if i == "islands" then
        print(i)
        for d,b in pairs(v) do
            for c,n in pairs(b) do
                if c == "player" then
                    for p,o in pairs(n) do
                        if p == "username" then
                        print(o)
                        end
                    end
                end
            end
        end
    end
end