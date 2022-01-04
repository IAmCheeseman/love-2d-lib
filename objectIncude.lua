-- Useful tools

-- Some math functions, neatly added to `math` and `love.math`
require("tools/math") 
-- Draw stuff, adds colors and remakes functions to use them
-- Also allows draw functions to use vectors.
require("tools/draw")
-- Adds vectors, and vector math functions.
require("tools/vector")
-- Particle effects.
require("tools/particles")
-- Timer which counts down in real time.
require("tools/timer")
-- AABB collision.
require("tools/aabb")


-- UI

-- UI themes tell how UI will be styled. Very basic atm.
require("tools/UI/theme")
-- For displaying text,
-- this is just gfx.print(), but works better with this framework.
require("tools/UI/label")
-- Buttons, you click them. They do stuff.
require("tools/UI/button")


-- Input

-- Makes some input functions work better with the framework.
require("tools/input")


-- Custom objects

-- Player
require("entities/player")