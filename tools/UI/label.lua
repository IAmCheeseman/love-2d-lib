
local function update(self, dt) end
local function draw(self)
    gfx.print(self.text, self.pos.x, self.pos.y, 0, self.size.x, self.size.y);
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