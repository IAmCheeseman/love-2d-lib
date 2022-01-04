

local function update(self, dt)
    -- Checking if the mouse is over the button
    local aabb = newAabb(self.pos, self.size)
    if not aabb:overlapsPoint(love.mouse.getPosition()) then 
        self.hovered = false
        return
    end
    self.hovered = true

    -- Checking if it needs to execute the pressed functions
    if not love.mouse.isDown(1) then
        self.clicked = false
        return
    end
    self.clicked = true
    for i, button in ipairs(self.pressedFunctions) do
        button.func(button.args)
    end
end

local function draw(self)
    local padding = newVec2(self.theme.padding, self.theme.padding)
    local pos = self.pos - (padding / 2)
    local size = self.size + padding

    if self.hovered and not self.clicked then
        gfx.setColor(self.theme.colorHover)
        gfx.rectangle("fill", pos, size)
        gfx.setColor(self.theme.textColorHover)
        gfx.print(self.text, self.pos, 0, newVec2(self.theme.textSize, self.theme.textSize))
    else
        gfx.setColor(self.theme.color)
        gfx.rectangle("fill", pos, size)
        gfx.setColor(self.theme.textColor)
        gfx.print(self.text, self.pos, 0, newVec2(self.theme.textSize, self.theme.textSize))
    end
    gfx.setColor(colors.WHITE)
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
        draw=draw,
    }
end