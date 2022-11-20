local Player = game.Players.LocalPlayer
local GetM = Player:GetMouse()

local MS = game:GetService("ReplicatedStorage").TS.merchant["merchant-meta"]
function getShops()
    local x = require(MS)
    local Shops = {}
    for i,_ in pairs(x.MerchantMeta) do
        table.insert(Shops, i)
    end
    return Shops
end

local Shops = getShops()
setclipboard(table.concat(Shops, ", "))

function getItemInfos(Shop)
    local x = require(MS)
    local info = {}
    local itemInfo = x.MerchantMeta[Shop].offers
    for i,v in pairs(itemInfo) do
        table.insert(info, v)
    end
    return info
end

local oldGui = game.CoreGui:FindFirstChild("Button")
if oldGui then
    oldGui:Destroy()
end

CmdGui = Instance.new("ScreenGui")
CmdGui.Name = "Button"
CmdGui.Parent = game:GetService("CoreGui")

shopBackground = Instance.new("Frame")
shopBackground.Name = "shopBackground"
shopBackground.Parent = CmdGui
shopBackground.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
shopBackground.BorderSizePixel = 0
shopBackground.BorderColor3 = Color3.new(1,0,1)
shopBackground.Position = UDim2.new(0.5, 0, 0.5, 0)
shopBackground.Size = UDim2.new(0, 150, 0, 210)
shopBackground.Active = true

shopScroll = Instance.new("ScrollingFrame")
shopScroll.Name = "Scrollframe"
shopScroll.Parent = shopBackground
shopScroll.Active = true
shopScroll.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
shopScroll.BackgroundTransparency = 1.000
shopScroll.BorderSizePixel = 0
shopScroll.AutomaticCanvasSize = "Y"
shopScroll.Position = UDim2.new(0, 0, 0.1, 0)
shopScroll.Size = UDim2.new(0, 150, 0, 200)
shopScroll.ScrollBarThickness = 4

UIGridLayout = Instance.new("UIGridLayout")
UIGridLayout.Parent = shopScroll
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 2)
UIGridLayout.CellSize = UDim2.new(1, 0, 0.150000006, 0)

dragButton = Instance.new("TextButton")
dragButton.Name = "CmdName"
dragButton.AutoButtonColor = false
dragButton.Parent = shopBackground
dragButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
dragButton.BorderSizePixel = 0
dragButton.Size = UDim2.new(0, 87, 0, 15)
dragButton.Font = Enum.Font.GothamBlack
dragButton.Text = "Islands GUI"
dragButton.TextColor3 = Color3.fromRGB(255, 255, 255)
dragButton.TextScaled = true
dragButton.TextSize = 14.000
dragButton.TextWrapped = true
Dragg = false
dragButton.MouseButton1Down:Connect(function()Dragg = true while Dragg do game.TweenService:Create(shopBackground, TweenInfo.new(.06), {Position = UDim2.new(0,GetM.X-40,0,GetM.Y-5)}):Play()wait()end end)
dragButton.MouseButton1Up:Connect(function()Dragg = false end)

Close = Instance.new("TextButton")
Close.Name = "Close"
Close.Parent = shopBackground
Close.BackgroundColor3 = Color3.fromRGB(155, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.87, 0, 0.0001, 0)
Close.Size = UDim2.new(0, 15, 0, 15)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 14.000
Close.MouseButton1Click:Connect(function()
CmdGui:Destroy()
end)


Shopz = {"totems", "general", "pirateMiner", "turkeyBaker", "travellingPirate", "halloweenMercenary", "animal", "festivalCatherine", "lunar", "spiritMerchant", "oilBarron", "minerJade", 'turkeyAnimals', "cropSell", "pirateBotanist", "pirateFishermanFestival", "florist", "flower_blue_rose", "pirateSlayer", "wholesaler", "spring_shop_radish", "researcher", "mechanic", "pirateFisherman", "seeds", "fishermanFestival", "spring_shop_pineapple", "melon_shop", "flower_white_rose", "flower_red_rose", "autumn_shop", "adventurer", "fisherman"}

for i,v in pairs(Shopz) do
    print(i,v)
    local Shop = v
    
    local newBackground = Instance.new("Frame")
    newBackground.Name = Shop
    newBackground.Parent = shopBackground
    newBackground.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    newBackground.BorderSizePixel = 0
    newBackground.BorderColor3 = Color3.new(1,0,1)
    newBackground.Position = UDim2.new(1, 0, 0, 0)
    newBackground.Size = UDim2.new(0, 150, 0, 210)
    newBackground.Active = true
    newBackground.Visible = false

    local newCmdHandler = Instance.new("ScrollingFrame")
    newCmdHandler.Name = "newCmdHandler"
    newCmdHandler.Parent = newBackground
    newCmdHandler.Active = true
    newCmdHandler.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    newCmdHandler.BackgroundTransparency = 1.000
    newCmdHandler.BorderSizePixel = 0
    newCmdHandler.AutomaticCanvasSize = "Y"
    newCmdHandler.Position = UDim2.new(0, 0, 0.1, 0)
    newCmdHandler.Size = UDim2.new(0, 150, 0, 200)
    newCmdHandler.ScrollBarThickness = 4
    
    local shopButton = Instance.new("TextButton")
    shopButton.Name = Shop
    shopButton.Position = UDim2.new(0,1,0,YPos)
    shopButton.Size = UDim2.new(0,140,0,20)
    shopButton.BackgroundColor3 = Color3.fromRGB(50,50,50)
    shopButton.BorderColor3 = Color3.new(1,1,1)
    shopButton.ZIndex = 2
    shopButton.Text = Shop
    shopButton.TextColor3 = Color3.fromRGB(0,250,0)
    shopButton.TextScaled = true
    shopButton.Parent = shopScroll
    shopButton.MouseButton1Click:Connect(function()
        for i,v in pairs(shopBackground:GetChildren()) do
            if v.Name ~= "Scrollframe" and v ~= dragButton and v ~= Close and v.Visible == true then
                v.Visible = false
            end
            newBackground.Visible = true
        end
    end)
    
    UIGridLayout = Instance.new("UIGridLayout")
    UIGridLayout.Parent = newCmdHandler
    UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 2)
    UIGridLayout.CellSize = UDim2.new(1, 0, 0.150000006, 0)

Info = getItemInfos(Shop)
for i,v in pairs(Info) do
    for i1,v1 in pairs(v) do -- i1 [toolId, offerId, buyGold]
        if i1 == "offerId" then
            offerId = v1
        end
        if i1 == "toolId" then
            local turkeyShop = Instance.new("TextButton")
            local offer = offerId
            turkeyShop.Name = v1
            turkeyShop.Position = UDim2.new(0,1,0,YPos)
            turkeyShop.Size = UDim2.new(0,140,0,20)
            turkeyShop.BackgroundColor3 = Color3.fromRGB(50,50,50)
            turkeyShop.BorderColor3 = Color3.new(1,1,1)
            turkeyShop.ZIndex = 2
            turkeyShop.Text = v1
            turkeyShop.TextColor3 = Color3.fromRGB(0,250,0)
            turkeyShop.TextScaled = true
            turkeyShop.Parent = newCmdHandler
            turkeyShop.MouseButton1Click:Connect(function()
                local args = {
                [1] = {
                ["merchant"] = Shop,
                ["offerId"] = offer,
                ["amount"] = 1
                }
                }
                game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.CLIENT_MERCHANT_ORDER_REQUEST:InvokeServer(unpack(args))
            end)
        end
    end
end

end