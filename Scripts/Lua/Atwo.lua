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

cache.candestroy = false
cache.UserInputService = game:GetService("UserInputService")

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
  
  win.BorderSizePixel = 4

  win.BorderColor3 = Color3.fromRGB(0,0,0)
  
  win.Visible = false

  local ButtonOpen = Instance.new("TextButton")
  ButtonOpen.Parent = cache.ScreenGui
  ButtonOpen.Size = UDim2.new(0,50,0,25)
  ButtonOpen.Position = UDim2.new(0,0,0.5,0)
  ButtonOpen.AnchorPoint = Vector2.new(0,0.5)
  ButtonOpen.BackgroundColor3 = Color3.fromRGB(165,165,165)
  ButtonOpen.Text = "OPEN"

  ButtonOpen.Activated:Connect(function()
    ButtonOpen.Text = (ButtonOpen.Text == "OPEN") and "CLOSE" or "OPEN"
    win.Visible = not win.Visible
  end)

  cache.Window = win
  cache.ButtonOpen = ButtonOpen

  cache.candestroy = true
end

function m.Destroy()
  if cache.candestroy then
    cache.Window:Destroy()
    cache.Window = nil

    cache.ButtonOpen:Destroy()
    cache.ButtonOpen = nil

    cache.candestroy = false
  end
end

return m
