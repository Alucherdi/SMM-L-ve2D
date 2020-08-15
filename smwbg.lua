bg_smw = {}
--backgrounds del estilo de super mario world
overworld_smw = love.graphics.newImage("graphics/backgrounds/smw/overworld.png")
overworld_smw:setFilter("nearest", "nearest")
edit_stack = love.graphics.newImage("graphics/editor/edit.png")
edit_stack:setFilter("nearest", "nearest")

function bg_smw:draw()
if bg == 1 then
love.graphics.draw(overworld_smw,0-camera.x/7,0,0,1.482)
end

if editor_state == 1 then
love.graphics.draw(edit_stack,0,0,0,1.482)
end

end

function bg_smw:update(dt)

end
return bg_smw