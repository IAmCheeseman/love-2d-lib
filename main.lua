require("master")
-- Main script.
addObject(main)


-- Loops through everything and makes it do things
function love.update(dt)
    if paused then return end
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

