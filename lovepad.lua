--[[
Lovepad
Web: https://github.com/DeybisMelendez/lovepad

MIT License

Copyright (c) 2019 Deybis Melendez

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]

local lovepad = {_VERSION = "v1.0.0", _TYPE= "module", _NAME = "lovepad", buttons = {}}
local mt = {x = 0, y = 0, radius = 40, text = "button", font = love.graphics.getFont(), fontColor= {1, 1, 1, 1},
normalColor = {1, 0, 0, 1}, pressedColor = {0,1,0,0.5}, mode = "fill",
isDown = false, _lastIsDown = false}

function lovepad:new(o)
    o = o or {}
    setmetatable(o, {__index = mt})
    self.buttons[o.text] = o
end

function lovepad:draw()
    for _, button in pairs(self.buttons) do
        if button.isDown then
            love.graphics.setColor(button.pressedColor)
        else
            love.graphics.setColor(button.normalColor)
        end
        love.graphics.circle(button.mode, button.x, button.y, button.radius)
        love.graphics.setColor(button.fontColor)
        love.graphics.printf(button.text, button.font, button.x - button.radius,
            button.y - button.font:getHeight()/2, button.radius * 2, "center")
    end
    love.graphics.setColor(1, 1, 1, 1)
end

function lovepad:update()
    local touches = love.touch.getTouches()
    for _, button in pairs(self.buttons) do
        button._lastIsDown = button.isDown
        button.isDown = false
        for _, touch in ipairs(touches) do
            local xt, yt = love.touch.getPosition(touch)
            if (math.abs((xt - button.x))^2 + math.abs((yt - button.y))^2)^0.5 < button.radius then
                button.isDown = true
            end
        end
    end
end

function lovepad:isDown(id)
    return self.buttons[id].isDown
end

function lovepad:isPressed(id)
    return self.buttons[id].isDown and not self.buttons[id]._lastIsDown
end

function lovepad:isReleased(id)
    return not self.buttons[id].isDown and self.buttons[id]._lastIsDown
end

function lovepad:remove(id)
    table.remove(self.buttons, id)
end

function lovepad:setGamePad(radius, dir, ab, xy, font)
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()
    radius = radius or width/24
    dir = dir or true
    ab = ab or true
    xy = xy or false
    font = font or love.graphics.getFont()
    if dir then
        self:new{
            text = 'Down',
            radius = radius+1,
            x = radius * 3.2,
            y = height - radius * 1.1,
            normalColor = {0.8,0.8,0.8,0.5},
            pressedColor = {0.4,0.4,0.4,0.5},
            font = font
        }
        self:new{
            text = 'Up',
            radius = radius+1,
            x = radius * 3.2,
            y = height - radius * 4.6,
            normalColor = {0.8,0.8,0.8,0.5},
            pressedColor = {0.4,0.4,0.4,0.5},
            font = font
        }
        self:new{
            text = 'Left',
            radius = radius+1,
            x = radius * 1.27,
            y = height - radius * 2.76,
            normalColor = {0.8,0.8,0.8,0.5},
            pressedColor = {0.4,0.4,0.4,0.5},
            font = font
        }
        self:new{
            text = 'Right',
            radius = radius+1,
            x = radius * 5,
            y = height - radius * 2.76,
            normalColor = {0.8,0.8,0.8,0.5},
            pressedColor = {0.4,0.4,0.4,0.5},
            font = font
        }
    end
    if ab then
        self:new{
            text = 'A',
            radius = radius+1,
            x = width - radius * 1.36,
            y = height - radius * 2.8,
            normalColor = {0,0,0,0.5},
            pressedColor = {0.5,0.5,0.5,0.5},
            font = font
        }
        self:new{
            text = 'B',
            radius = radius+1,
            x = width - radius * 3.2,
            y = height - radius * 1.1,
            normalColor = {0,0,0,0.5},
            pressedColor = {0.5,0.5,0.5,0.5},
            font = font
        }
                self:new{
            text = 'Y',
            radius = radius+1,
            x = width - radius * 5,
            y = height - radius * 2.8,
            normalColor = {0,0,0,0.5},
            pressedColor = {0.5,0.5,0.5,0.5},
            font = font
        }
                        self:new{
            text = 'X',
            radius = radius+1,
            x = width - radius * 3.2,
            y = height - radius * 4.4,
            normalColor = {0,0,0,0.5},
            pressedColor = {0.5,0.5,0.5,0.5},
            font = font
        }
                self:new{
            text = 'Z',
            radius = radius + 10,
            x = width - radius * 1,
            y = height - radius * 12,
            normalColor = {0.9,0.1,0.1,0.5},
            pressedColor = {0.4,0,0,0.5},
            font = font
        }
                        self:new{
            text = 'R',
            radius = radius + 10,
            x = width - radius * 21,
            y = height - radius * 12,
            normalColor = {0.9,0.1,0.1,0.5},
            pressedColor = {0.4,0,0,0.5},
            font = font
        }
    end
    if xy then
        self:new{
            text = 'jjjlj',
            radius = radius ,
            x = width - radius * 100,
            y = height - radius * 100.2,
            normalColor = {0.9,0.9,0,0.5},
            pressedColor = {0.4,0.4,0,0.5},
            font = font
        }
        self:new{
            text = 'kihih',
            radius = radius,
            x = width - radius * 4,
            y = height - radius * 2.75,
            normalColor = {0,0,0.9,0.5},
            pressedColor = {0,0,0.4,0.5},
            font = font
        }
    end
end
return lovepad
