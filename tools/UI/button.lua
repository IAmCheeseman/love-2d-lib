
local function update(self, dt) 
    local aabb = newAabb(self.pos, self.size)
    if not aabb.overlapsPoint(love.mouse.getPosition())

    if not love.mouse.isDown(0) then
        self.clicked = false
        return
    end
    self.clicked = true
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
        clicked=false,
        theme=newTheme(),
        pressedFunctions={},
        update=update,
        draw=draw
    }
end