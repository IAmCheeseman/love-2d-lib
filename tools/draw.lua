
colors = {
    RED={r=1, g=0, b=0},
    GREEN={r=0, g=1, b=0},
    BLUE={r=0, g=0, b=1},
    YELLOW={r=1, g=1, b=0},
    TEAL={r=0, g=1, b=1},
    PURPLE={r=1, g=0, b=1}
};

function love.graphics.newColor(r, g, b)
    return {r=r, g=g, b=b};
end

-- Functions to use colors instead of straight rgb values
function love.graphics.csetColor(color)
    love.graphics.setColor(color.r, color.g, color.b);
end
function love.graphics.csetBackgroundColor(color)
    love.graphics.setBackgroundColor(color.r, color.g, color.b);
end

-- Functions to use my vector class instead of individual x and y
function love.graphics.vcircle(mode, pos, radius)
    love.graphics.circle(mode, pos.x, pos.y, radius);
end
function love.graphics.vrect(mode, pos, size)
    love.graphics.rectangle(mode, pos.x, pos.y, size.x, size.x);
end

-- Bri'ish translations
love.graphics.newColour = love.graphics.newColor;
love.graphics.csetColour = love.graphics.csetColor;
love.graphics.csetBackgroundColour = love.graphics.csetBackgroundColor;
