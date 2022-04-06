
-- Old functions
local oldSetColor   = love.graphics.setColor
local oldSetBGColor = love.graphics.setBackgroundColor
local oldCircle     = love.graphics.circle
local oldRect       = love.graphics.rectangle
local oldPrint      = love.graphics.print
local oldTranslate  = love.graphics.translate


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

