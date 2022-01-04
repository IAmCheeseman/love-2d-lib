require("master")
 

function love.update(dt)
    for i, object in ipairs(objects) do
        object:update(dt)
    end
end

function love.draw()
    for i, object in ipairs(objects) do
        object:draw()
    end
end

