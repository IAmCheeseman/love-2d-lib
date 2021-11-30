require("/tools/vector");
require("/tools/particles");
require("/tools/timer");
require("/entities/player");

-- Some variables to shorten code
gfx = love.graphics;
kb  = love.keyboard;
lm = love.math;
t = table;
m = math;

-- Some objects
globals = {};

-- Extra math functions
function m.lerp(a, b, t) return (b-a)*t+a; end
function m.rad2deg(r) return r*180 /m.pi end
function m.deg2raf(d) return d*m.pi/ 180 end

-- Extra draw functions
function gfx.vcircle(mode, pos, radius)
    gfx.circle(mode, pos.x, pos.y, radius);
end
function gfx.vrect(mode, pos, size)
    gfx.rectangle(mode, pos.x, pos.y, size.x, size.x);
end

-- Holds every object in the game 
objects = {};
-- Groups
local groups = {};
groups["Enemies"] = {};
groups["Player"] = {};


-- Object functions
function addObject(object) 
    if not object.groups then -- Adding group table if it doesn't have one
        object.groups = {};
    end
    if object.init then -- Calling init function if it has one
        object:init();
    end
    t.insert(objects, object);
end
function removeObject(object)
    for i=1,#objects do
        if objects[i] == object then
            table.remove(objects, i);
        end
    end
end

-- Group functions
function addToGroup(group, object)
    t.insert(object.groups, group)
    t.insert(groups[group], object);
end
function getGroup(group)
    return groups[group]
end

-- Game states
function defaultState()
    objects = {};
    globals.player = newPlayer();
    addObject(globals.player);
    addToGroup("Player", globals.player);
end

defaultState();

