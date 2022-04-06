
-- All these are fairly self explainitory, so not many comments.

local function isOver(self)         return self.timeLeft <= 0 end
local function reset(self)          self.timeLeft = self.time end
local function resetIfOver(self)    if self:isOver() then self:reset() end end
local function timeElapsed(self)    return self.time - self.timeLeft end
local function percentageOver(self) return 1 - (self:timeElapsed() / self.time) end

local function update(self, dt)     self.timeLeft = self.timeLeft - dt end
local function draw(self)           if self.printTime then gfx.print(self.timeLeft) end end

local function new(time) 
    return {
        time=time,
        timeLeft=time,
        printTime=false,
        isOver=isOver,
        reset=reset,
        resetIfOver=resetIfOver,
        timeElapsed=timeElapsed,
        percentageOver=percentageOver,
        update=update,
        draw=draw
    }
end

return {
    new=new
}