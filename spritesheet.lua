spritesheet = {}
spritesheet.__index = spritesheet

function spritesheet:new(sprite, width, height)
    self = setmetatable({}, spritesheet)
    self.animation = {}

    for y = 0, sprite:getHeight() - height, height do
        for x = 0, sprite:getWidth() - width, width do
            table.insert(
                self.animation.quads,
                love.graphics.newQuad(
                    x, y,
                    width, height,
                    sprite:getDimensions()
                )
            )
        end
    end

    return self
end
