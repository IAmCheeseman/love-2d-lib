
local function init(self)
    for i=1,self.amount do
        t.insert(self._particles, {
            pos=newVec2(
                lm.random() * self.spawnSize,
                lm.random() * self.spawnSize
            ):normalized(),
            dir=newVec2(),
            speed=self.speed,
        });
    end
end

local function update(self, dt)
    for i=1,#self._particles do 
        local particle = self._particles[i];
        particle.pos.x = particle.pos.x + particle.dir.x + (self.gravityDir.x * self.gravity);
        particle.pos.y = particle.pos.y + particle.dir.y + (self.gravityDir.y * self.gravity);
        particle.speed = m.lerp(particle.speed, 0, self.damping);
    end
end

local function draw(self)
    if self.drawMode == "circle-fill" then
        for i=1,#self._particles do
            local particle = self._particles[i];

            local drawPos = newVec2(
                particle.pos.x + self.pos.x,
                particle.pos.y + self.pos.y
            );
            gfx.vcircle("fill", drawPos, self.size);
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
        gravity=15,
        spread=45,
        speed=5,
        damping=0,
        drawMode="circle-fill", -- All values are listed below
        size=32,
        init=init,
        update=update,
        draw=draw,
        spawnSize=16
    };

    return particles;
end

-- PARITCLE DRAW MODES
-- circle-fill (default)
-- circle-line
-- rect-fill
-- rect-line
