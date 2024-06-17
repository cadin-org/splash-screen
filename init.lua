local M = {}

M.canvas = nil
M.x = nil
M.y = nil

local function text_center(text)
  local current_font = love.graphics.getFont()
  local text_height = current_font:getHeight()
  local text_width = current_font:getWidth(text)

  local x = (love.graphics.getWidth() - text_width) / 2
  local y = (love.graphics.getHeight() - text_height) / 2

  return x, y, text_width
end

local function splash_colored_text(r, g, b, text)
  local red, green, blue = love.math.colorFromBytes(r, g, b)
  local x, y, text_width = text_center(text)

  local colored_text = { { red, green, blue }, text }

  love.graphics.printf(colored_text, x, y, text_width, 'center')
  -- TODO: Add fade in/fade out effect
end

function M.load(width, height)
  local x_center = love.graphics.getWidth() / 2
  local y_center = love.graphics.getHeight() / 2

  M.x = x_center - (width / 2)
  M.y = y_center - (height / 2)

  M.canvas = love.graphics.newCanvas(width, height)
  love.graphics.setCanvas(M.canvas)
  love.graphics.clear(love.math.colorFromBytes(30, 30, 46))
  love.graphics.setCanvas()
end

-- Is love.timer the idiomatic way?
function M.start(time)
  if time >= 9 then
    return
  end

  love.graphics.draw(M.canvas, M.x, M.y)

  if time >= 3 and time < 6 then
    splash_colored_text(243, 139, 168, 'LÖVE')
  elseif time >= 6 and time < 9 then
    splash_colored_text(205, 214, 244, 'cadin')
  end
end

return M
