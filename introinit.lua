intro_init = {}
--el orden es del último al primero, osea(el x3/y3 es el primero x/y es el último) 
local x = 555
local x2 = 548
local x3 = 541

local y = 310
local y2 = 310
local y3 = 310

--el tiempo que esperara para hacer volver las bolitas :3
local tm = 0.5
--el tiempo que dura el inicio
local init_time = 5

local min_y = 310
local speed_y = 11
local timer = 2.5

local movil = love.graphics.newImage("graphics/intro/movil.png")

function intro_init:draw()
love.graphics.setColor(0,0,0)
love.graphics.rectangle("fill",0,0,480*4,480*2)
love.graphics.setColor(255,255,255)
love.graphics.draw(movil,465,279,0,0.35)
love.graphics.circle("fill",x,y,3)
love.graphics.circle("fill",x2,y2,3)
love.graphics.circle("fill",x3,y3,3)
end

function intro_init:update(dt)

if timer < 2.3 and timer > 2.3-tm then
y3 = y3-speed_y*dt
elseif timer < 2.3-tm and timer > 2.3-tm*2 then
y3 = y3+speed_y*dt
end
    if timer < 2 and timer > 2-tm then
    y2 = y2-speed_y*dt
    elseif timer < 2-tm and timer > 2-tm*2 then
    y2 = y2+speed_y*dt
    end
        if timer < 1.7 and timer > 1.7-tm then
        y = y-speed_y*dt
        elseif timer < 1.7-tm and timer > 1.7-tm*2 then
        y = y+speed_y*dt
        end
--reloj para que las bolitas se muevan cuando pase tal tiempo
timer = timer-dt
if timer <= 0 then
timer = 2.5
end
--reloj 2 :v (el reloj que ara terminar el estado)
init_time = init_time-dt
if init_time <= 0 then
coin_smw:play()
gamestate = "init_menu"
end

--para que las bolitas vuelvan a su lugar cuando se reinicie el reloj
if timer <= 0.1 then
y = min_y
y2 = min_y
y3 = min_y
end

end
return intro_init