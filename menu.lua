initMenu = {}

menu_state = 1

title1 = love.graphics.newImage("graphics/title.png")
title1X = 111
title1Y = 50

local crear = love.graphics.newImage("graphics/crear.png")
local crearX = 195
local crearY = 195

local jugar = love.graphics.newImage("graphics/jugar.png")
local jugarX = 285
local jugarY = 195

local pr = love.graphics.newImage("graphics/press_r_z.png")
local prX = 222
local prY = 285

function initMenu:draw()
  love.graphics.draw(title1,title1X,title1Y,0,0.5)
  if menu_state == 2 then
	love.graphics.draw(crear,crearX,crearY,0,0.7)
	love.graphics.draw(jugar,jugarX,jugarY,0,0.7)
  end

  if menu_state == 1 then
    love.graphics.draw(pr,prX,prY,0,0.7)
  end
end

function initMenu:mousepressed(x,y,button)
  if menu_state == 2 then
	if x > crearX and x < crearX+65 and y > crearY and y < crearY+55 and button == 1 then
      gamestate = "lvl_editor"
      editor_state = 1
	end
  end
end

function initMenu:update(dt)
  if menu_state == 1 and lovepad:isDown("R") and lovepad:isDown("Z") then
    menu_state = 2
  end
end

return initMenu
