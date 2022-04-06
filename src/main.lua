-- This is your main.lua file

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then
       paused = not paused
    end
end

local function init(self)
    globals.player = player.new()
    addObject(globals.player) -- Objects are processed as long as you called `addObject()` on them
end

return { init=init }

