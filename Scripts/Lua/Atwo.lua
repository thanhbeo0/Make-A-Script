local m = {}

math.randomseed(tick())

local cache = {}
local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"

function cache.Funcrandom(length)
  local str = ""
  for i = 1, length do
      local randIndex = math.random(1, #chars)
      str = str .. chars:sub(randIndex, randIndex)
  end
  return str
end

cache.Player = game:GetService("Players").LocalPlayer
cache.PlayerGui = cache.Player:WaitForChild("PlayerGui")
cache.ScreenGui = Instance.new("ScreenGui")
cache.ScreenGui.Parent = cache.PlayerGui
cache.ScreenGui.Name = "Gui" .. cache.Funcrandom(20)

function m.InitGui(c)
  local title = c.title
  local win = Instance.new("Frame")
  win.Parent = cache.ScreenGui
  
  win.Size = UDim2.new(0, 400, 0, 250)
  win.Position = UDim2.new(0.5,0,0.5,0)
  win.AnchorPoint = Vector2.new(0.5,0.5)
  win.BackgroundColor3 = Color3.fromRGB(160,160,160)
  win.BackgroundTransparency = 0.4
  
  cache.Window = win
end

function m.DestroyWindow()
  if cache.Window ~= nil then
    cache.Window:Destroy()
    cache.Window = nil
  end
end

return m
