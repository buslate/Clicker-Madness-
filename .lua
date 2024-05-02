--[[Clicker Madness]]--


local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Cave Hub 1.0.0",
    SubTitle = "" .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 320),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "General", Icon = "home" }),
    EGG = Window:AddTab({ Title = "EGG", Icon = "rbxassetid://12974189594" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification!",
        SubContent = "Thx For wait",
        Duration = 10
    })
end

------------------------------------[[AutoClick]]------------------------------------

function speed(click)
     if click == "Fast" then
          repeat task.wait()
               game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("ClickService"):WaitForChild("Click"):FireServer(10000)
          until not _G.AutoClick
     elseif click == "Normal" then
          repeat task.wait(.3)
               game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("ClickService"):WaitForChild("Click"):FireServer(10000)
          until not _G.AutoClick
     elseif click == "Slow" then
          repeat task.wait(.5)
               game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("ClickService"):WaitForChild("Click"):FireServer(10000)
          until not _G.AutoClick
     end
end
local section = Tabs.Main:AddSection("AutoClick")
local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
     Title = "SpeedClick",
     Values = {"Fast","Normal","Slow"},
     Multi = false,
     Default = 1,
})

Dropdown:SetValue()
Dropdown:OnChanged(function(Value)
     click = Value
 end)

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "AutoClick", Default = false })

Toggle:OnChanged(function(Value)
_G.AutoClick = Value
     if _G.AutoClick then
          while _G.AutoClick do task.wait()
               speed(Dropdown.Value)
          end
     end
end)

Options.MyToggle:SetValue(false)
------------------------------------[[AutoRebirth]]------------------------------------

function auto(Rebrith)
     if Rebrith == "1" then
          game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuyRebirths"):FireServer(1)
     elseif Rebrith == "10" then
          game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuyRebirths"):FireServer(10)
     elseif Rebrith == "100" then
          game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuyRebirths"):FireServer(100)
     elseif Rebrith == "1K" then
          game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuyRebirths"):FireServer(1000)
     elseif Rebrith == "10K" then
          game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuyRebirths"):FireServer(10000)
     elseif Rebrith == "100K" then
          game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuyRebirths"):FireServer(100000)
     elseif Rebrith == "1M" then
          game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuyRebirths"):FireServer(1000000)
     elseif Rebrith == "10M" then
          game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuyRebirths"):FireServer(10000000)
     elseif Rebrith == "100M" then
          game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuyRebirths"):FireServer(100000000)
     elseif Rebrith == "1B" then
          game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuyRebirths"):FireServer(1000000000)
     elseif Rebrith == "10B" then
          game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuyRebirths"):FireServer(10000000000)
     end
end

local section = Tabs.Main:AddSection("Rebrith")

local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
     Title = "SelectRebrith",
     Values = {"1","10","100","1K","10K","100K","1M","10M","100M","1B","10B"},
     Multi = false,
     Default = 1,
})

Dropdown:SetValue("1")

Dropdown:OnChanged(function(Value)
     Rebrith = Value
end)

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "AutoRebirth", Default = false })

Toggle:OnChanged(function(Value)
_G.AutoRebirth = Value
     if _G.AutoRebirth then
          while _G.AutoRebirth do task.wait()
               auto(Dropdown.Value)
          end
     end
end)

Options.MyToggle:SetValue(false)
------------------------------------[[AutoEgg]]------------------------------------

function check(egg)
     if egg == "Basic(5K)" then
          game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("EggService"):WaitForChild("Purchase"):FireServer("basic")
     elseif egg == "Lava(2M)" then
          game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("EggService"):WaitForChild("Purchase"):FireServer("lava")
     elseif egg == "Desert(20M)" then
          game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("EggService"):WaitForChild("Purchase"):FireServer("desert")
     end
end
local section = Tabs.EGG:AddSection("AutoSummon EGG")
local Dropdown = Tabs.EGG:AddDropdown("Dropdown", {
     Title = "SelectEgg",
     Values = {"Basic(5K)","Lava(2M)","Desert(20M)"},
     Multi = false,
     Default = 1,
})

Dropdown:SetValue()

Dropdown:OnChanged(function(Value)
     egg = Value
end)
local Toggle = Tabs.EGG:AddToggle("MyToggle", {Title = "AutoSommon", Default = false })

Toggle:OnChanged(function(Value)
_G.AutoEgg = Value
     if _G.AutoEgg then
          while _G.AutoEgg do
               check(Dropdown.Value)
          task.wait(1.5)
          end
     end
end)

Options.MyToggle:SetValue(false)

------------------------------------[[TelePort]]------------------------------------

function is(land)
     if land == "Lava" then
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1690.38538, 6.18289852, -734.648743, -0.00720239151, -3.14943698e-08, 0.999974072, 9.30794357e-08, 1, 3.21655982e-08, -0.999974072, 9.33086923e-08, -0.00720239151)
     elseif land == "Desert" then
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2288.66089, 6.1698451, 1087.66638, 0.0164140277, 3.94731137e-09, 0.999865294, -2.96595051e-08, 1, -3.46094575e-09, -0.999865294, -2.95987004e-08, 0.0164140277)
     elseif land == "SpawnWorld" then
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(505.92569, 8.6166029, -356.723785, 0.937661171, -8.6285425e-08, 0.347550809, 1.00946536e-07, 1, -2.40776927e-08, -0.347550809, 5.76607668e-08, 0.937661171)
     end
end
local section = Tabs.EGG:AddSection("TelePort")

local Dropdown = Tabs.EGG:AddDropdown("Dropdown", {
     Title = "SelectWorld",
     Values = {"SpawnWorld","Lava", "Desert"},
     Multi = false,
     Default = 1,
})

Dropdown:SetValue("four")

Dropdown:OnChanged(function(Value)
     land = Value
end)
Tabs.EGG:AddButton({
     Title = "Click to GO!",
     Callback = function()
          is(Dropdown.Value)
     end
})

------------------------------------------[[Setting]]------------------------------------------

Tabs.Settings:AddButton({
     Title = "Rejoin",
     Description = "",
     Callback = function()
          game.Players.LocalPlayer:Kick("Rejoining...")
          local ts = game:GetService("TeleportService")
          local p = game:GetService("Players").LocalPlayer
          ts:Teleport(game.PlaceId, p)
     end
})
Tabs.Settings:AddButton({
     Title = "Hop to a low server",
     Description = "",
     Callback = function()
         local Http = game:GetService("HttpService")
         local TPS = game:GetService("TeleportService")
         local Api = "https://games.roblox.com/v1/games/"
         local _place = game.PlaceId
         local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
         function ListServers(cursor)
             local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
             return Http:JSONDecode(Raw)
         end
         local Server, Next; repeat
                local Servers = ListServers(Next)
                Server = Servers.data[1]
                Next = Servers.nextPageCursor
         until Server
         TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
     end
})
Tabs.Settings:AddButton(
     {
          Title = "FpsBoots[🚀]",
          Description = "",
          Callback = function()
             local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
             local g = game
             local w = g.Workspace
             local l = g.Lighting
             local t = w.Terrain
             sethiddenproperty(l, "Technology", 2)
             sethiddenproperty(t, "Decoration", false)
             t.WaterWaveSize = 0
             t.WaterWaveSpeed = 0
             t.WaterReflectance = 0
             t.WaterTransparency = 0
             l.GlobalShadows = 0
             l.FogEnd = 9e9
             l.Brightness = 0
             settings().Rendering.QualityLevel = "Level01"
             for i, v in pairs(w:GetDescendants()) do
                 if v:IsA("BasePart") and not v:IsA("MeshPart") then
                     v.Material = "Plastic"
                     v.Reflectance = 0
                 elseif (v:IsA("Decal") or v:IsA("Texture")) and decalsyeeted then
                     v.Transparency = 1
                 elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                     v.Lifetime = NumberRange.new(0)
                 elseif v:IsA("Explosion") then
                     v.BlastPressure = 1
                     v.BlastRadius = 1
                 elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                     v.Enabled = false
                 elseif v:IsA("MeshPart") and decalsyeeted then
                     v.Material = "Plastic"
                     v.Reflectance = 0
                     v.TextureID = 10385902758728957
                 elseif v:IsA("SpecialMesh") and decalsyeeted then
                     v.TextureId = 0
                 elseif v:IsA("ShirtGraphic") and decalsyeeted then
                     v.Graphic = 0
                 elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
                     v[v.ClassName .. "Template"] = 0
                 end
             end
             for i = 1, #l:GetChildren() do
                 e = l:GetChildren()[i]
                 if
                     e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or
                         e:IsA("BloomEffect") or
                         e:IsA("DepthOfFieldEffect")
                  then
                     e.Enabled = false
                 end
             end
             w.DescendantAdded:Connect(
                 function(v)
                     wait()
                      --prevent errors and shit
                     if v:IsA("BasePart") and not v:IsA("MeshPart") then
                         v.Material = "Plastic"
                         v.Reflectance = 0
                     elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
                         v.Transparency = 1
                     elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                         v.Lifetime = NumberRange.new(0)
                     elseif v:IsA("Explosion") then
                         v.BlastPressure = 1
                         v.BlastRadius = 1
                     elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
                         v.Enabled = false
                     elseif v:IsA("MeshPart") and decalsyeeted then
                         v.Material = "Plastic"
                         v.Reflectance = 0
                         v.TextureID = 10385902758728957
                     elseif v:IsA("SpecialMesh") and decalsyeeted then
                         v.TextureId = 0
                     elseif v:IsA("ShirtGraphic") and decalsyeeted then
                         v.ShirtGraphic = 0
                     elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
                         v[v.ClassName .. "Template"] = 0
                     end
                 end
             )
         end
     }
)
Options.MyToggle:SetValue(false)
--Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system) 
-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings() 
-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})
-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
local Toggle = Tabs.Settings:AddToggle("MyToggle", {Title = "AntiAfk", Default = false }) 
Toggle:OnChanged(function(Value)
     _G.antiAFK = Value
     while _G.antiAFK do wait(30)
     game:GetService'VirtualUser':Button1Down(Vector2.new(788, 547))
end
end)


Window:SelectTab(1)
