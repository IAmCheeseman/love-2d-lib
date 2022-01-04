
local function update(self, dt) 
    for i, button in ipairs(self.pressedFunctions) do

    end
end

local function draw(self)
    gfx.setColor(self.theme.color)
    gfx.rectangle("fill", self.pos, self.size)
    gfx.setColor(self.theme.textColor)
    gfx.print(self.text, self.pos, 0, newVec2(self.theme.textSize, self.theme.textSize))
end

function newButton(text, pos, size) 
    return {
        text=text,
        pos=pos,
        size=size,
        hovered=false,
        theme=newTheme(),
        pressedFunctions={},
        update=update,
        draw=draw
    }
end