local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
math.randomseed(tick())

function randomString(length)
  local str = ""
  for i = 1, length do
      local randIndex = math.random(1, #chars)
      str = str .. chars:sub(randIndex, randIndex)
  end
  return str
end

return randomString
