-- Useful tools

-- Some math functions, neatly added to `math` and `love.math`
require("tools/math") 

-- Draw stuff, adds colors and remakes functions to use them
-- Also allows draw functions to use vectors.
color=require("tools/color")
colors=require("tools/colors")
-- Bri'ish
colour = color
colours = colors

require("tools/draw")
-- Adds vectors, and vector math functions.
vec=require("tools/vector")
-- Timer which counts down in real time.
timer=require("tools/timer")

-- Makes some input functions work better with the framework.
require("tools/input")

-- Custom objects
require("src/include")
main=require("src/main")