local lights = love.graphics.newShader("tools/lights/lights.fs")

local function update(self, dt)
    -- removeObject(self)
end
local function draw(self)
    gfx.setShader(lights)
    -- lights:send("sizeX", self.size.x)
    -- lights:send("sizeY", self.size.y)
    gfx.csetColor(colors.RED)
    gfx.vrect("fill", self.pos:sub(self.size:mult(.5)), self.size)
    gfx.csetColor(colors.WHITE)
    gfx.setShader()
end

function newLight(pos, size)
    return {
        pos=pos,
        size=size,
        update=update,
        draw=draw
    }
end