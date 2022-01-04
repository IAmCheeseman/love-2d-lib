
local function init(self)
    for i=1,self.amount do
        local dir = self.dir:normalized():rotatedDegrees(lm.random(-self.spread, self.spread))
        t.insert(self._particles, {
            pos=newVec2(
                lm.random() * self.spawnRange,
                lm.random() * self.spawnRange
            ):normalized(),
            dir=dir,
            speed=self.speed * (1 - (lm.random() * self.speedRandom)),
            gravity=newVec2(),
            scaleRandom=1 - (lm.random() * self.scaleRandom),
            gravityLvl=0
        })
    end
end

local function update(self, dt)
    -- Making sure to remove it if need be
    self.lifetime:update(dt)
    if self.lifetime:isOver() then removeObject(self) end

    for i, particle in ipairs(self._particles) do 
        local particle = self._particles[i]
        -- Adding velocity
        particle.pos = (particle.pos + particle.dir * particle.speed * dt) + (particle.gravity * dt)
        -- Gravity
        particle.gravity = self.gravityDir * (self.gravity * particle.gravityLvl * dt)
        
        particle.gravityLvl = particle.gravityLvl + 1
        -- Damping
        particle.speed = m.lerp(particle.speed, 0, self.damping*dt)
    end
end

local function draw(self)
    gfx.setColor(self.color)
    for i, particle in ipairs(self._particles) do
        -- The position to draw at
        local drawPos = newVec2(
            particle.pos.x + self.pos.x,
            particle.pos.y + self.pos.y
        )
        if self.drawShape == "circle" then     -- Circle drawing
            gfx.circle(self.drawMode, drawPos, self.size*self.lifetime:percentageOver()*particle.scaleRandom)
        elseif self.drawShape == "rect" then   -- Rect drawing
            gfx.rectangle(self.drawMode, drawPos, newVec2(self.size*2, self.size*2)*(self.lifetime:percentageOver()*particle.scaleRandom))
        end
    end
    gfx.setColor(colors.WHITE)
end

function newParticles()
    local particles = {
        _particles={},                   -- The individual particles
        amount=8,                        -- Amount of particles
        pos=newVec2(),                   -- Particle object position
        spawnRange=16,                   -- Particle spawn range
        dir=newVec2(1, 0),               -- Particle force direction
        explosion=1,                     -- How quickly the particles spawn in, TODO
        gravityDir=newVec2(0, 1),        -- Direction of gravity
        gravity=620,                     -- Gravity multiplier
        spread=45,                       -- Particle direction spread
        speed=150,                       -- Particle speed
        speedRandom=0,                   -- Particle speed mod
        damping=0,                       -- Friction
        scaleLerp=1,                     -- Delta for scale lerping
        drawShape="circle",              -- Draw shape
        drawMode="fill",                 -- Draw mode
        size=12,                         -- Size of the particles
        scaleRandom=0,                   -- Size mod
        color=gfx.newColor(1, 1, 1),     -- Particle color
        -- Functions
        init=init,
        update=update,
        draw=draw,
        lifetime=newTimer(1)
    }

    return particles
end


