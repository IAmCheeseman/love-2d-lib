require("Tools/Vector");

local function move(self, dt) 
    local targetV = newVec2();
    if kb.isDown("w") then targetV.y = -1 end
    if kb.isDown("a") then targetV.x = -1 end
    if kb.isDown("s") then targetV.y =  1 end
    if kb.isDown("d") then targetV.x =  1 end

    -- Acceleration and friction
    local lerpVal = self.accel;
    if targetV == newVec2() then lerpVal = self.frict end

    -- Normalizing the input vector
    targetV = targetV:normalized();

    -- Applying the lerp
    self.vel.y = m.lerp(self.vel.y, targetV.y*self.speed, lerpVal * dt);
    self.vel.x = m.lerp(self.vel.x, targetV.x*self.speed, lerpVal * dt);

    -- Applying the velocity
    self.pos.y = self.pos.y + self.vel.y * dt;
    self.pos.x = self.pos.x + self.vel.x * dt;
end

-- Player update
local function update(self, dt)
    self:move(dt);
end

-- Player draw
local function draw(self)
    gfx.vcircle("fill", self.pos, 32); 
end


function newPlayer()
    return {
        pos = newVec2(50, 50),
        vel = newVec2(),
        speed=180,
        accel=10,
        frict=17,
        move=move,
        update=update,
        draw=draw
    };
end