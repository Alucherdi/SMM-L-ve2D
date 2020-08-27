require("require")
push = require("push")

lovepad:setGamePad()

--push
local gameWidth, gameHeight     = 854, 480--854, 480--384,216
local windowWidth, windowHeight = love.window.getDesktopDimensions()

push:setupScreen(
  gameWidth,
  gameHeight,
  windowWidth,
  windowHeight,
  {
    fullscreen = false,
    pixelperfect = true
  }
)
--pop xd
function love.load()
  player = Player:new(50, 50)
end

function love.draw()
  push:start()
  camera:set()

  if gamestate == "init_menu" or gamestate == "lvl_editor" then
    bg_select:draw()
  end

  player:draw()

  camera:unset()

  if gamestate == "init_menu" then
    menuInit:draw()
  end

  if gamestate == "lvl_editor" then
    edit:draw()

    if love.mouse.isDown(1) and editor_state == 1 then
      love.graphics.draw(
      cursor,
      love.mouse.getX() -8,
      love.mouse.getY() -8,
      0,
      0.33
    )
    end
  end

  lovepad:draw()

  if gamestate == "init" then
    initt:draw()
  end

  love.graphics.print("FPS: "..tostring(love.timer.getFPS()), 2, 2)

  push:finish()
end

function love.update(dt)
  lovepad:update()

  if gamestate == "init" then
    initt:update(dt)
  end

  if gamestate == "init_menu" then
    menuInit:update(dt)
  end

  if gamestate == "init_menu" or gamestate == "lvl_editor" then
    bg_select:update(dt)
  end

  player:update(dt)

  --la cámara seguirá al jugador
  camera:follow(player)

  if gamestate == "lvl_editor" then
    edit:update(dt)
  end

  music_smw:update(dt)

end

function love.mousepressed(x,y,button)
  if gamestate == "init_menu" then
    menuInit:mousepressed(x, y, button)
  end

  if gamestate == "lvl_editor" then
    edit:mousepressed(x, y, button)
  end

end

function love.mousereleased(x,y,button)
  if gamestate == "lvl_editor" then
    edit:mousereleased(x, y, button)
  end
end
