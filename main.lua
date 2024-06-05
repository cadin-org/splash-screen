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
  love.graphics.print(text, x + (w / 2) - (string.len(text) * 24 / 2), y + (h / 2) - 24)
end

local function draw_splash_screen(r, g, b, text)
  function love.draw()
    local x, y, w, h = middle_screen_pos()

    love.graphics.setColor(love.math.colorFromBytes(30, 30, 46))
    love.graphics.rectangle('fill', x, y, w, h, 12)

    if text then
      splash_colored_text(r, g, b, text)
    end
  end
end

function love.load()
  local canvas = love.graphics.newCanvas(800, 600)
  love.graphics.setCanvas(canvas)

  -- Why this?
  love.graphics.clear(0, 0, 0, 0)

  local r, g, b = love.math.colorFromBytes(24, 24, 37)
  love.graphics.setBackgroundColor(r, g, b)

  local fira_mono = love.graphics.newFont('assets/fonts/FiraMono-Medium.ttf', 48)
  love.graphics.setFont(fira_mono)

  love.graphics.setCanvas()
end

local dtotal = 0

function love.update(dt)
  dtotal = dtotal + dt

  draw_splash_screen()

  if dtotal >= 3 then
    draw_splash_screen(243, 139, 168, 'LÖVE')
  end
  if dtotal >= 6 then
    draw_splash_screen(205, 214, 244, 'cadin')
  end
  if dtotal >= 9 then
    draw_splash_screen()
  end
end
