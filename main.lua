require("master");

-- Example of particles, uncomment to see.
local particleEffect = newParticles();
particleEffect.pos = newVec2((320*3)/2, (180*3)/2);
addObject(particleEffect);

function love.update(dt)
    if #objects > 0 then
        for i=1,#objects do
            objects[i]:update(dt);
        end
    end
end

function love.draw()
    if #objects > 0 then
        for i=1,#objects do
            objects[i]:draw();
        end
    end
end

