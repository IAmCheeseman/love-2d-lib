
-- Default colors
colors = {
    WHITE={r=1, g=1, b=1, a=1},
    GRAY={r=.5, g=.5, b=.5, a=1},
    LIGHT_GRAY={r=.75, g=.75, b=.75, a=1},
    DARK_GRAY={.25, .25, .25, a=1},
    BLACK={r=0, g=0, b=0, a=1},
    RED={r=1, g=0, b=0, a=1},
    GREEN={r=0, g=1, b=0, a=1},
    BLUE={r=0, g=0, b=1, a=1},
    DARK_BLUE={r=.5, g=.5, b=1, a=1},
    YELLOW={r=1, g=1, b=0, a=1},
    TEAL={r=0, g=1, b=1, a=1},
    PURPLE={r=1, g=0, b=1, a=1}
}
-- Gray -> Grey
colors.GREY         = colors.GRAY
colors.LIGHT_GREY   = colors.LIGHT_GRAY
colors.DARK_GREY    = colors.DARK_GRAY

-- Old functions
local oldSetColor   = love.graphics.setColor
local oldSetBGColor = love.graphics.setBackgroundColor
local oldCircle     = love.graphics.circle
local oldRect       = love.graphics.rectangle
local oldPrint      = love.graphics.print
local oldTranslate  = love.graphics.translate


function love.graphics.newColor(r, g, b, a)
    a = a or 1
    return {r=r, g=g, b=b, a=a}                                      
end
-- Functions to use colors instead of straight rgb values
function love.graphics.setColor(color)           oldSetColor(color.r, color.g, color.b, color.a)     end
function love.graphics.setBackgroundColor(color) oldSetBGColor(color.r, color.g, color.b, color.a)   end
-- Functions to use my vector class instead of individual x and y
function love.graphics.circle(mode, pos, radius) oldCircle(mode, pos.x, pos.y, radius)               end
function love.graphics.rectangle(mode, pos, size) oldRect(mode, pos.x, pos.y, size.x, size.y)        end
function love.graphics.translate(pos)oldTranslate(pos.x, pos.y)                                      end
function love.graphics.print(text, pos, rot, size)
    rot = rot or 0
    size = size or newVec2(1, 1)
    pos = pos or newVec2(1, 1)
    oldPrint(text, pos.x, pos.y, rot, size.x, size.y)
end

-- Bri'ish translations :puking:
love.graphics.newColour           = love.graphics.newColor
love.graphics.setColour           = love.graphics.setColor
love.graphics.setBackgroundColour = love.graphics.setBackgroundColor
