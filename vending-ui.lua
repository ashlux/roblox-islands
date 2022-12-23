local UserInputService = game:GetService("UserInputService")

local Atlas = loadstring(game:HttpGet("https://siegehub.net/Atlas.lua"))()

local UI = Atlas.new({
	Name = "Roblox Islands";
	ConfigFolder = "RobloxIslandsAtlasConfig-TESTING-" .. game.Players.LocalPlayer.Name;
	Color = Color3.fromRGB(255, 124, 25);
	Bind = "RightShift";
});

local function buildVendingPage()
	local page = UI:CreatePage("Vending")
	
	
	local zzz = page:CreateSection("zzz")
	zzz:CreateInteractable({
		Name = "XXX - Destroy UI";
		ActionText = "Destroy UI";
		Callback = function() UI:Destroy() end;
		Warning = "Do not unless you know what you're doing.";
		-- TODO: Somehow need to tell executing process to stop?
	});
	
	local function createVendingSetupSection()
		local vendingSetupSection = page:CreateSection("Vending Setup")
		local vendingSetupOptions = {
			itemName = nil;
			modeName = nil;
			modeId = nil;
			
		}
		
		vendingSetupSection:CreateDropdown({
			Name = "Select Mode";
			Options = {"Buy", "Sell", "Offline"};
			ItemSelecting = true;
			DefaultItemSelected = vendingSetupOptions.modeName;
			Callback = function(modeName)
				vendingSetupOptions.modeName = modeName;
				if stateName == "Offline" then
					vendingSetupOptions.modeId = 2
				elseif stateName == "Sell" then
					vendingSetupOptions.modeId = 0
				elseif stateName == "Buy" then
					vendingSetupOptions.modeId = 1
				end
			end;
		});
		vendingSetupSection:CreateDropdown({
			Name = "Select Item";
			Options = {"wheat"};
			ItemSelecting = true;
			DefaultItemSelected = vendingSetupOptions.itemName;
			Callback = function(itemName) vendingSetupOptions.selectedVendingSetupItemName = itemName end;
		});
		
		vendingSetupSection:CreateTextBox({
			Name = "Unit Price";
			Flag = "VendingSetupUnitPrice";
			SavingDisabled = true;
			Callback = function(price, enterPressed)
				print("VendingSetupUnitPrice:",inputtedText,enterPressed)
			end;
			DefaultText = "1000000000";
			ClearTextOnFocus = false;
		});
		
		vendingSetupSection:CreateTextBox({
			Name = "Deposit Amount";
			Flag = "VendingSetupDepositAmount";
			SavingDisabled = true;
			Callback = function(deposit, enterPressed)
				print("VendingSetupDepositAmount:",inputtedText,enterPressed)
			end;
			DefaultText = "0";
			ClearTextOnFocus = false;
		});
		
		vendingSetupSection:CreateToggle({
		Name = "Enable Copy/Paste";
		Flag = "enableCopyPasteVendingSetup";
		Default = false;
		CallbackOnCreation = false;
		SavingDisabled = true;
		Callback = function(enableCopyPasteVendingSetup) getgenv().ri_enableCopyPasteVendingSetup = enableCopyPasteVendingSetup; end
	})
	end
	
	createVendingSetupSection()
end

local vendingSetupConnection = UserInputService.InputBegan:Connect(function(input)
	if (not getgenv().ri_enableCopyPasteVendingSetup or UserInputService:GetFocusedTextBox()) then
        return; -- make sure player's not chatting!
    end
    if input.KeyCode == Enum.KeyCode.RightBracket then
		print("PASTE VENDING!");
    end	
    if input.KeyCode == Enum.KeyCode.LeftBracket then
		print("COPY VENDING!");
    end
end)

buildVendingPage()
