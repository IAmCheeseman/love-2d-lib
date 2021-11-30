
local function init(self)
    for i=1,self.amount do
        local dir = newVec2((lm.random()*2)-1, (lm.random()*2)-1):normalized();
        t.insert(self._particles, {
            pos=newVec2(
                lm.random() * self.spawnSize,
                lm.random() * self.spawnSize
            ):normalized(),
            dir=dir,
            speed=self.speed,
            gravity=newVec2(),
            gravityLvl=0
        });
    end
end

local function update(self, dt)
    -- Making sure to remove it
    self.lifetime:update(dt);
    if self.lifetime:isOver() then
        removeObject(self);
    end

    for i, particle in ipairs(self._particles) do 
        local particle = self._particles[i];
        -- Adding velocity
        particle.pos.x = (particle.pos.x + particle.dir.x * particle.speed * dt) + (particle.gravity.x * dt);
        particle.pos.y = (particle.pos.y + particle.dir.y * particle.speed * dt) + (particle.gravity.y * dt);
        -- Gravity
        particle.gravity.x = self.gravityDir.x * (self.gravity * particle.gravityLvl * dt);
        particle.gravity.y = self.gravityDir.y * (self.gravity * particle.gravityLvl * dt);

        particle.gravityLvl = particle.gravityLvl + 1;
        -- Damping
        particle.speed = m.lerp(particle.speed, 0, self.damping*dt);
    end
end

local function draw(self)
    for i, particle in ipairs(self._particles) do

        local drawPos = newVec2(
            particle.pos.x + self.pos.x,
            particle.pos.y + self.pos.y
        );
        gfx.print("x"..particle.gravity.x..", y"..particle.gravity.y);
        if self.drawShape == "circle" then
            gfx.vcircle(self.drawMode, drawPos, self.size);
        elseif self.drawShape == "rect" then 
            gfx.vrect(self.drawMode, drawPos, newVec2(self.size*2, self.size*2));
        end
    end
end

function newParticles()
    local particles = {
        _particles={},
        amount=8,
        pos=newVec2(),
        dir=newVec2(1, 0),
        gravityDir=newVec2(0, 1),
        gravity=620,
        spread=45,
        speed=150,
        damping=0,
        drawShape="circle", -- "rect" for a rectangle
        drawMode="fill",
        size=12,
        init=init,
        update=update,
        draw=draw,
        spawnSize=16,
        lifetime=newTimer(1)
    };

    return particles;
end

