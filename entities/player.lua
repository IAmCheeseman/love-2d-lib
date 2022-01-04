
-- player.lua is a script containing basic movement code,
-- with acceleration/friction applied


local function init(self)
    local newButton = newButton("Click to die", newVec2(50, 50), newVec2(130, 30))
    t.insert(newButton.pressedFunctions,
        {
            func=self.die,
            args={self}
        }
    )
    addObject(newButton)
end


local function move(self, dt) 
    local targetV = newVec2()
    if kb.isDown("w") then targetV.y = -1 end
    if kb.isDown("a") then targetV.x = -1 end
    if kb.isDown("s") then targetV.y =  1 end
    if kb.isDown("d") then targetV.x =  1 end

    -- Acceleration and friction
    local lerpVal = self.accel
    if targetV == newVec2() then lerpVal = self.frict end

    -- Normalizing the input vector
    targetV = targetV:normalized()
    targetV = targetV * self.speed

    -- Applying the lerp
    self.vel = self.vel:moveTo(targetV, lerpVal * dt)

    -- Applying the velocity
    self.pos = self.pos + (self.vel * dt)
end

-- Player update
local function update(self, dt)
    self:move(dt)
end

local function die(args)
    removeObject(args[1])
end

-- Player draw
local function draw(self)
    gfx.setColor(gfx.newColor(1, 1, 0))
    gfx.circle("fill", self.pos, 32) 
    gfx.setColor(colors.WHITE)
end


function newPlayer() -- Creates a new player object
    return {
        pos = newVec2(50, 50),
        vel = newVec2(),
        speed=360,
        accel=10,
        frict=17,
        move=move,
        die=die,
        init=init,
        update=update,
        draw=draw,
    }
end