-- player.lua is a script containing basic movement code,
-- with acceleration/friction applied


local function init(self)
    addObject(self.dropTimer)
end

local function move(self, dt) 
    local targetV = vec.new()
    if kb.isDown("w") then targetV.y = -1 end
    if kb.isDown("a") then targetV.x = -1 end
    if kb.isDown("s") then targetV.y =  1 end
    if kb.isDown("d") then targetV.x =  1 end

    -- Acceleration and friction
    local lerpVal = self.accel
    if targetV == vec.new() then lerpVal = self.frict end

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

    if kb.isDown("l") and self.dropTimer:isOver() then
        -- You can create tiny throwaway objects in the same file :)
        local newDrop = {
            pos=self.pos:copy(),
            draw=function(self) 
                gfx.setColor()
                gfx.circle("fill", self.pos, 8)
            end
        }

        print("oI!")
        addObject(newDrop)

        self.dropTimer.reset()
    end
end

local function die(args)
    removeObject(args[1])
end

-- Player draw
local function draw(self)
    gfx.setColor(colors.YELLOW)
    gfx.circle("fill", self.pos, 32) 
    gfx.setColor(colors.WHITE)
end


local function new() -- Creates a new player object
    return {
        pos=vec.new(50, 50),
        vel=vec.new(),
        speed=420,
        accel=10,
        frict=17,
        dropTimer=timer.new(5),
        move=move,
        die=die,
        init=init,
        update=update,
        draw=draw,
    }
end

return {
    new=new
}