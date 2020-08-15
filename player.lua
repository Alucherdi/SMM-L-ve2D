player = {}
player.__index = player

function player:new(x,y)
    self = setmetatable({},player)
    self.x = x
    self.y = y
    return self
end

playerX = 50
playerY = 50
playerRotate = 0
playerScaleX = 1.482
playerScaleY = 1.482

function player:draw()
--mario
--small
love.graphics.draw(smw_mario_small_stand, playerX, playerY, playerRotate, playerScaleX, playerScaleY)

end

function player:update(dt)
if lovepad:isDown("Up") then
playerY = playerY-200*dt
elseif lovepad:isDown("Down") then
playerY = playerY+200*dt
end
if lovepad:isDown("Left") then
playerX = playerX-200*dt
elseif lovepad:isDown("Right") then
playerX = playerX+200*dt
end


end
return player