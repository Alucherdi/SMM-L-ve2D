bg_smw = require("smwbg")
--[[aqui trato de hacer que si el estilo es smw entoces 
los backgrounds serán los del smw, lo mismo con los otros
estilos]]

bg_select = {}

function bg_select:draw()
if style == 3 then
bg_smw:draw()
end
end

function bg_select:update(dt)
if style == 3 then
bg_smw:update(dt)
end
end
return bg_select