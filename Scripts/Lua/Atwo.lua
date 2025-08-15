local m = {}

local cache = {}
cache.Funcrandom = loadstring(game:HttpGet("https://raw.githubusercontent.com/thanhbeo0/Make-A-Script/refs/heads/main/Scripts/Lua/RandomString.lua"))


cache.Player = game:GetService("Players").LocalPlayer
cache.PlayerGui = cache.Player:WaitForChild("PlayerGui")
cache.ScreenGui = Instance.new("ScreenGui")
cache.ScreenGui.Parent = cache.PlayerGui
cache.ScreenGui.Name = "Gui" .. cache.Funcrandom(20)

function m.InitGui(c)
  local title = c.title
  local win = Instance.new("Frame")
  win.Parent = cache.ScreenGui
  
  win.Size = UDim2.new(0, 300, 0, 250)
  win.Position = UDim2.new(0.5,0,0.5,0)
  win.AnchorPoint = Vector2.new(0.5,0.5)
  win.BackgroundColor3 = Color3.fromRGB(150,150,150)
  win.BackgroundTransparency = 0.4
  
  cache.Window = win
end

function m.DestroyWindow()
  cache.Window:Destroy()
  print(cache.Funcrandom(120))
end

return m
