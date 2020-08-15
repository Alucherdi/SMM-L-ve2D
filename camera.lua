camera = {}
camera.x = 0
camera.y = 0
camera.scaleX = 1
camera.scaleY = 1
camera.rotation = 0
maxCameraY = 437
maxCameraX = 768*5 - 600

function camera:set()
  love.graphics.push()
  love.graphics.rotate(-self.rotation/64)
  love.graphics.scale(1 / self.scaleX, 1 / self.scaleY)
  love.graphics.translate(-self.x, -self.y)
end

function camera:unset()
  love.graphics.pop()
end
