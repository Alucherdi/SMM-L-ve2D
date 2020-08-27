Player = {}
Player.__index = Player

function Player:new(x, y)
    self = setmetatable({},Player)
    self.x = x
    self.y = y
    self.rotation = 0
    self.scale = {
      x = 1.482,
      y = 1.482
    }
    return self
end

function Player:update(dt)
  if lovepad:isDown("Up") then
    self.y = self.y - 200 * dt
  elseif lovepad:isDown("Down") then
    self.y = self.y + 200 * dt
  end

  if lovepad:isDown("Left") then
    self.x = self.x - 200 * dt
  elseif lovepad:isDown("Right") then
    self.x = self.x + 200 * dt
  end
end

function Player:draw()
  --mario
  --small
  love.graphics.draw(
    smw_mario_small_stand,
    self.x,
    self.y,
    self.rotation,
    self.scale.x,
    self.scale.y
  )
end

return Player
