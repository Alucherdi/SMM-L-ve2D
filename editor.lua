editor = {}

editor_state = -1

local playX = love.graphics.getWidth()/2
local playY = 265

function editor:draw()
if editor_state == 1 then
love.graphics.draw(barra1,0,-20,0,0.7)
end
love.graphics.draw(play_lvl_editor,playX,playY,0,0.7)
end

function editor:mousepressed(x,y,button)

if editor_state == 1 and x > playX and x < playX+65 and y > playY and y < playY+55 and button == 1 then
editor_state = 0
elseif editor_state == 0 and x > playX and x < playX+65 and y > playY and y < playY+55 and button == 1 then
editor_state = 1
end

end

function editor:mousereleased(x,y,button)

end

function editor:update(dt)

end
return editor