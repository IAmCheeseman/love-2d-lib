require("master");

-- Example of particles, uncomment to see.
local particleEffect = newParticles();
particleEffect.pos = newVec2((320*3)/2, (180*3)/2);
addObject(particleEffect);
local newLight = newLight(newVec2(50, 50), newVec2(50, 50));
addObject(newLight);

function love.update(dt)
    for i, object in ipairs(objects) do
        object:update(dt);
    end
end

function love.draw()
    for i, object in ipairs(objects) do
        object:draw();
    end
end

