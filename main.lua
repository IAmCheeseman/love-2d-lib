require("master")
 

-- An example of how to create objects
local drawObject = {
    draw=function(self) gfx.circle("fill", vec.new(150,150), 128) end
}
addObject(drawObject)


-- Loops through everything and makes it do things
function love.update(dt)
    for i, object in ipairs(objects) do
        if object.update then object:update(dt) end
    end
    if camera ~= nil then camera:update(dt) end
end

function love.draw()
    if camera ~= nil then camera:draw() end
    for i, object in ipairs(objects) do
        if object.draw then object:draw() end
    end
end

