local splash_screen = require 'splash_screen'

function love.load()
  splash_screen.load()
end

function love.update() end

function love.draw()
  splash_screen.draw()
end
