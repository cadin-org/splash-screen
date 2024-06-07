local M = {}

local function middle_screen_pos()
  local x_center = love.graphics.getWidth() / 2
  local y_center = love.graphics.getHeight() / 2

  local width = 400
  local height = 400

  local x = x_center - (width / 2)
  local y = y_center - (height / 2)

  return x, y, width, height
end

local function splash_colored_text(r, g, b, text)
  local red, green, blue = love.math.colorFromBytes(r, g, b)
  local x, y, w, h = middle_screen_pos()

  love.graphics.setColor(red, green, blue)
  -- TODO: Better handle text position
  love.graphics.print(text, x + (w / 2) - (string.len(text) * 24 / 2), y + (h / 2) - 24)
  -- TODO: Add fade in/fade out effect
end

local function draw_splash_screen(r, g, b, text)
  local x, y, w, h = middle_screen_pos()

  love.graphics.setColor(love.math.colorFromBytes(30, 30, 46))
  love.graphics.rectangle('fill', x, y, w, h, 12)

  if text then
    splash_colored_text(r, g, b, text)
  end
end

function M.load()
  local r, g, b = love.math.colorFromBytes(24, 24, 37)
  love.graphics.setBackgroundColor(r, g, b)

  -- Assumes the following path on the root
  local font_asset_path = 'assets/fonts/FiraMono-Medium.ttf'
  local fira_mono = love.graphics.newFont(font_asset_path, 48)
  love.graphics.setFont(fira_mono)
end

function M.draw(time)
  draw_splash_screen()

  if time >= 3 then
    draw_splash_screen(243, 139, 168, 'LÖVE')
  end
  if time >= 6 then
    draw_splash_screen(205, 214, 244, 'cadin')
  end
  if time >= 9 then
    draw_splash_screen()
  end
end

return M
