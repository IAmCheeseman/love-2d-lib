
-- Default colors
colors = {
    WHITE={r=1, g=1, b=1},
    GRAY={r=.5, g=.5, b=.5},
    LIGHT_GRAY={r=.75, g=.75, b=.75},
    DARK_GRAY={.25, .25, .25},
    BLACK={r=0, g=0, b=0},
    RED={r=1, g=0, b=0},
    GREEN={r=0, g=1, b=0},
    BLUE={r=0, g=0, b=1},
    DARK_BLUE={r=.5, g=.5, b=1},
    YELLOW={r=1, g=1, b=0},
    TEAL={r=0, g=1, b=1},
    PURPLE={r=1, g=0, b=1}
}
colors.GREY       = colors.GRAY
colors.LIGHT_GREY = colors.LIGHT_GRAY
colors.DARK_GREY  = colors.DARK_GRAY

-- You can remove the `local` if you don't want to use colors or vectors
local oldSetColor   = love.graphics.setColor
local oldSetBGColor = love.graphics.setBackgroundColor
local oldCircle     = love.graphics.circle
local oldRect       = love.graphics.rectangle
local oldPrint      = love.graphics.print


function love.graphics.newColor(r, g, b)                                      return {r=r, g=g, b=b} end
-- Functions to use colors instead of straight rgb values
function love.graphics.setColor(color)           oldSetColor(color.r, color.g, color.b)              end
function love.graphics.setBackgroundColor(color) oldSetBGColor(color.r, color.g, color.b)            end
-- Functions to use my vector class instead of individual x and y
function love.graphics.circle(mode, pos, radius) oldCircle(mode, pos.x, pos.y, radius)               end
function love.graphics.rectangle(mode, pos, size) oldRect(mode, pos.x, pos.y, size.x, size.x)        end
function love.graphics.print(text, pos, rot, size) oldPrint(text, pos.x, pos.y, rot, size.x, size.y) end

-- Bri'ish translations :puking:
love.graphics.newColour = love.graphics.newColor
love.graphics.setColour = love.graphics.setColor
love.graphics.setBackgroundColour = love.graphics.setBackgroundColor
