
-- master.lua is a script which just handles large systems in the game,
-- such as adding objects to the processing table (`objects`).

-- Please use addObject() instead of t.insert(), since addObject() puts
-- the table through some checks, such as calling the init function, if
-- it has one. (This is the only check currently though more could be
-- added in the future.)

require("include")

WINDOW_SIZE = vec.new(320, 180) * 3

-- Some variables to shorten code
gfx = love.graphics
kb  = love.keyboard
lm  = love.math
t   = table
m   = math

-- Some global objects for easy access
globals = {}

-- Holds every object in the game 
objects = {}

paused = false


-- Object functions
function addObject(object) 
    if object.init then -- Calling init function if it has one
        object:init()
    end
    t.insert(objects, object)
end
function removeObject(object)
    for i=1,#objects do
        if objects[i] == object then
            table.remove(objects, i)
            return
        end
    end
end

-- Game states
gameStates = {
    resetGame=function()
        objects = {}
        paused = false
        main.init()
    end
}

gameStates.resetGame()

