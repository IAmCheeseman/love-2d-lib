
local function isOver(self) 
    return self.timeLeft <= 0;
end
local function reset(self)
    self.timeLeft = self.time;
end
local function resetIfOver(self)
    if self:isOver() then
        self:reset();
    end
end
local function update(self, dt) 
    self.timeLeft = self.timeLeft - dt;
end
local function draw(self)
    if self.printTime then
        gfx.print(self.timeLeft);
    end
end

function newTimer(time) 
    return {
        time=time,
        timeLeft=time,
        printTime=false,
        isOver=isOver,
        reset=reset,
        resetIfOver=resetIfOver,
        update=update,
        draw=draw
    };
end