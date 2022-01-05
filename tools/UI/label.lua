
local function update(self, dt) end
local function draw(self)
    local camPos = camera.pos or newVec2()
    gfx.print(self.text, self.pos - camPos, 0, self.size)
end

function newLabel(text, pos, size) 
    return {
        text=text,
        pos=pos,
        size=size,
        update=update,
        draw=draw
    }
end