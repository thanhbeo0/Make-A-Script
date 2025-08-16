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
cache.RunService = game:GetService("RunService")

cache.PlayerGui = cache.Player:WaitForChild("PlayerGui")
cache.ScreenGui = Instance.new("ScreenGui")
cache.ScreenGui.Parent = cache.PlayerGui
cache.ScreenGui.Name = "Gui" .. cache.Funcrandom(20)

function m.InitGui(c)
  local title = c.title or nil
  local idimage = c.IDImage or "rbxassetid://79202919691677"
  local shape = c.Shape or "square"

  local sound = Instance.new("Sound")
  sound.SoundId = "rbxassetid://115916891254154"
  sound.Volume = 1
  sound.Parent = cache.ScreenGui
  sound.Ended:Connect(function()
    sound:Destroy()
  end)

  local win = Instance.new("Frame")
  win.Parent = cache.ScreenGui
  
  win.Size = UDim2.new(0, 400, 0, 250)
  win.Position = UDim2.new(0.5,0,0.5,0)
  win.AnchorPoint = Vector2.new(0.5,0.5)
  win.BackgroundColor3 = Color3.fromRGB(160,160,160)
  win.BackgroundTransparency = 0.4
  
  win.BorderSizePixel = 2

  win.BorderColor3 = Color3.fromRGB(0,0,0)
  
  win.Visible = false

  local ttitle= Instance.new("TextLabel")
  ttitle.Parent = win
  ttitle.Position = UDim2.new(0.5,0,0,20)
  ttitle.AnchorPoint = Vector2.new(0.5,0)
  ttitle.BackgroundTransparency = 1
  ttitle.TextSize = 18
  ttitle.Text = title

  local ButtonOpen = Instance.new("ImageButton")
  ButtonOpen.Image = idimage
  ButtonOpen.Parent = cache.ScreenGui
  ButtonOpen.Size = UDim2.new(0,50,0,50)
  ButtonOpen.Position = UDim2.new(0,0,0.5,0)
  ButtonOpen.AnchorPoint = Vector2.new(0,0.5)
  ButtonOpen.BackgroundColor3 = Color3.fromRGB(165,165,165)

  ButtonOpen.BorderSizePixel = 1
  ButtonOpen.BorderColor3 = Color3.fromRGB(175,175,175)
  
  local uicorner = Instance.new("UICorner")
  uicorner.Parent = ButtonOpen
  if shape == "round" then
    uicorner.CornerRadius = UDim.new(0,50)
  elseif shape == "square" then
    uicorner.CornerRadius = UDim.new(0,0)
  elseif shape == "half" then
    uicorner.CornerRadius = UDim.new(0,25)
  end

  ButtonOpen.Activated:Connect(function()
    win.Visible = not win.Visible
  end)

  local ButtonOpenDragging = false
  local StartPos
  local InputPos
  local DragInput
  
  ButtonOpen.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
      ButtonOpenDragging = true
      DragInput = input
      InputPos = input.Position
      StartPos = ButtonOpen.Position
      input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
          ButtonOpenDragging = false
          DragInput = nil
        end
      end)
    end
  end)

  cache.RunService.RenderStepped:Connect(function()
    if ButtonOpenDragging and DragInput then
      local delta = DragInput.Position - InputPos
      ButtonOpen.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + delta.X,StartPos.Y.Scale, StartPos.Y.Offset + delta.Y)
    end
  end)

  cache.Window = win
  cache.ButtonOpen = ButtonOpen

  cache.candestroy = true
  sound:Play()
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
