-- This is your main.lua file

local function init(self)
    globals.player = player.new()
    addObject(globals.player) -- Objects are processed as long as you called `addObject()` on them
end

return { init=init }

