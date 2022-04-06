
-- master.lua is a script which just handles large systems in the game,
-- such as adding objects to the processing table (`objects`).

-- Please use addObject() instead of t.insert(), since addObject() puts
-- the table through some checks, such as calling the init function, if
-- it has one. (This is the only check currently though more could be
-- added in the future.)

require("objectInclude")

--
WINDOW_SIZE = vec.new(320, 180) * 3

-- Some variables to shorten code
gfx = love.graphics
kb  = love.keyboard
lm  = love.math
t   = table
m   = math

camera = nil
-- Some objects
globals = {}

collisionLayers = {}

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
-- Collision layers
function addCollisionLayer(amt)
    amt = amt or 1
    for i=1,amt do t.insert(collisionLayers, {}) end
end
function addCollisionObject(collider, layer)
    assert(#collisionLayers < layer, "Please add layers before assigning colliders to them")
    t.insert(collisionLayers[layer], collider)
    collider.collisionLayer = collisionLayers[layer]
end

-- Game states
function resetGame()
    objects = {}
    collisionLayers = {}
    addCollisionLayer(5)
    globals.player = newPlayer()
    addObject(globals.player)
end

resetGame()

