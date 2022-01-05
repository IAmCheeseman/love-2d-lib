require("master")
 

local drawObject = {
    update=function(self, dt) end,
    draw=function(self) gfx.circle("fill", newVec2(150,150), 128) end
}
addObject(drawObject)


-- Loops through everything and makes it do things
function love.update(dt)
    for i, object in ipairs(objects) do
        object:update(dt)
    end
    if camera ~= nil then camera:update(dt) end
end

function love.draw()
    if camera ~= nil then camera:draw() end
    for i, object in ipairs(objects) do
        object:draw()
    end
end

