require("master")

-- Example of particles, uncomment to see.
-- local particleEffect = newParticles()
-- particleEffect.pos = newVec2((320*3)/2, (180*3)/2)
-- particleEffect.spread = 360
-- particleEffect.speedRandom = .75
-- particleEffect.scaleRandom = 1
-- particleEffect.amount = 100
-- particleEffect.color = colors.GREEN
-- addObject(particleEffect)   

-- UI
-- local newLabel = newLabel("Hello, World", newVec2(50, 50), newVec2(5, 5))
-- addObject(newLabel)

local theme = newTheme()
theme.borderSize = 5
local newButton = newButton("Test", newVec2(50, 50), newVec2(60, 30))
newButton.theme = theme
addObject(newButton)

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

