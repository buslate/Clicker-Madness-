local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "HEEdum HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({
	Name = "Home",
	Icon = "rbxassetid://13170451197",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Main"
})
OrionLib:MakeNotification({
	Name = "Notification",
	Content = "WellCome",
	Image = "rbxassetid://13276524473",
	Time = 5
})
Tab:AddToggle({
	Name = "Auto Click",
	Default = false,
	Callback = function(N)    
                
_G.Autoclick = N               
                
                while _G.Autoclick do
                wait()
                local args = {
                        [1] = 999999999
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("ClickService"):WaitForChild("Click"):FireServer(unpack(args))
        end               
end    
})
Tab:AddToggle({
	Name = "Auto OpenBasicEggFast",
	Default = false,
	Callback = function(E)
_G.openegg = E
while _G.openegg do
        wait(6)
        local args = {
                [1] = "basic"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("EggService"):WaitForChild("Purchase"):FireServer(unpack(args))
             
end
end    
})
Tab:AddToggle({
	Name = "Auto OpenBasicEggFast(LAG!)",
	Default = false,
	Callback = function(L)
                _G.openegg = L
                while _G.openegg do
                        wait()
                        local args = {
                                [1] = "basic"
                            }
                            
                        game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("EggService"):WaitForChild("Purchase"):FireServer(unpack(args))
                             
                end
	end    
})
--หน้า2
local Tab = Window:MakeTab({
	Name = "Mic",
	Icon = "rbxassetid://13192363768",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "ReJoin!",
	Callback = function()
                local ts = game:GetService("TeleportService")

                local p = game:GetService("Players").LocalPlayer
                
                 
                
                ts:Teleport(game.PlaceId, p)
  	end    
})
Tab:AddTextbox({
	Name = "Custom Speed",
	Default = "50",
	TextDisappear = true,
	Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end	  
})
Tab:AddSlider({
	Name = "Custom Speed",
	Min = 0,
	Max = 200,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "bananas",
	Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end    
})
Tab:AddButton({
	Name = "Hop Sever Low!",
	Callback = function()
        local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()
        module:Teleport(game.PlaceId)
  	end    
})
Tab:AddTextbox({
	Name = "Custom Jump",
	Default = "50",
	TextDisappear = true,
	Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end	  
})
Tab:AddSlider({
	Name = "Custom Jump",
	Min = 0,
	Max = 200,
	Default = 50,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "bananas",
	Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})

OrionLib:Init()
Tab1:AddToggle({
        Name = "Toggle",
        Default = true,
        Save = true,
        Flag = "toggle"
    })
    
    print(OrionLib.Flags["toggle"].Value) -- prints the value of the toggle.
    OrionLib:Destroy()
