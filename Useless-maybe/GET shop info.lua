local MS = game:GetService("ReplicatedStorage").TS.merchant["merchant-meta"]
local x = require(MS)

local Shop = "turkeyBaker"

for i,v in pairs(x.MerchantMeta[Shop].offers) do
    for i1,offers in pairs(v) do
        print(i1, offers)
    end
end