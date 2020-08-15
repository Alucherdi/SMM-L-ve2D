require("require")
push = require("push")

lovepad:setGamePad()

--push
local gameWidth, gameHeight = 854, 480--854, 480--384,216
local windowWidth, windowHeight = love.window.getDesktopDimensions()
push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = true, pixelperfect = true}) 
--pop xd

function love.draw()
push:start()
camera:set()
if gamestate == "init_menu" or gamestate == "lvl_editor" then
bg_select:draw()
end

players:draw()

camera:unset()

if gamestate == "init_menu" then
menuInit:draw()
end

if gamestate == "lvl_editor" then
edit:draw()
    if love.mouse.isDown(1) and editor_state == 1 then
    love.graphics.draw(cursor,love.mouse.getX()-8,love.mouse.getY()-8,0,0.33)
    end
end

lovepad:draw()

if gamestate == "init" then
initt:draw()
end

love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 2, 2)

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

players:update(dt)
--la cámara seguirá al jugador
if playerX >= love.graphics.getWidth()/2 then
camera.x = playerX - love.graphics.getWidth()/2
end
if playerY >= love.graphics.getHeight()/2 then
camera.y = playerY - love.graphics.getHeight()/2
end

if camera.y >= maxCameraY then
camera.y = maxCameraY
end
if camera.x >= maxCameraX then
camera.x = maxCameraX
end

if gamestate == "lvl_editor" then
edit:update(dt)
end

music_smw:update(dt)

end

function love.mousepressed(x,y,button)
if gamestate == "init_menu" then
menuInit:mousepressed(x,y,button)
end

if gamestate == "lvl_editor" then
edit:mousepressed(x,y,button)
end

end

function love.mousereleased(x,y,button)
if gamestate == "lvl_editor" then
edit:mousereleased(x,y,button)
end
end