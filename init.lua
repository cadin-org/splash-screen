local M = {}

local canvas
local x, y

local function text_center(text)
  local current_font = love.graphics.getFont()
  local text_height = current_font:getHeight()
  local text_width = current_font:getWidth(text)

  local x_text = (love.graphics.getWidth() - text_width) / 2
  local y_text = (love.graphics.getHeight() - text_height) / 2

  return x_text, y_text, text_width
end

local function splash_colored_text(r, g, b, text)
  local red, green, blue = love.math.colorFromBytes(r, g, b)
  local x_text, y_text, text_width = text_center(text)

  local colored_text = { { red, green, blue }, text }

  love.graphics.printf(colored_text, x_text, y_text, text_width, 'center')
  -- TODO: Add fade in/fade out effect
end

function M.new(width, height)
  local x_center = love.graphics.getWidth() / 2
  local y_center = love.graphics.getHeight() / 2

  x = x_center - (width / 2)
  y = y_center - (height / 2)

  canvas = love.graphics.newCanvas(width, height)
  love.graphics.setCanvas(canvas)
  love.graphics.clear(love.math.colorFromBytes(30, 30, 46))
  love.graphics.setCanvas()
end

function M.start(time)
  love.graphics.draw(canvas, x, y)

  if time >= 3 and time < 6 then
    splash_colored_text(243, 139, 168, 'LÖVE')
  elseif time >= 6 and time < 9 then
    splash_colored_text(205, 214, 244, 'cadin')
  elseif time >= 9 then
    love.graphics.clear()
  end
end

return M
