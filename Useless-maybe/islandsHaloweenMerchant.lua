local args = {
    [1] = {
        ["merchant"] = "halloweenMercenary",
        ["offerId"] = 1, -- Tall Fire Chalice
        ["amount"] = 1
    }
}

game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
