
-- master.lua is a script which just handles large systems in the game,
-- such as adding objects to the processing table (`objects`).

-- Please use addObject() instead of t.insert(), since addObject() puts
-- the table through some checks, such as calling the init function, if
-- it has one. (This is the only check currently though more could be
-- added in the future.)

-- Useful tools
require("tools/math")
require("tools/draw")
require("tools/vector")
require("tools/particles")
require("tools/timer")
-- require("tools/aabb")

-- UI
require("tools/UI/theme")
require("tools/UI/label")
-- require("tools/UI/button")

-- Other
require("entities/player")

-- Some variables to shorten code
gfx = love.graphics
kb  = love.keyboard
lm = love.math
t = table
m = math

-- Some objects
globals = {}

-- Holds every object in the game 
objects = {}


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
function defaultState()
    objects = {}
    globals.player = newPlayer()
    addObject(globals.player)
end

defaultState()

