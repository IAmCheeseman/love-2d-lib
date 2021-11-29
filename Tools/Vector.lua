

local function length(self)
    return math.sqrt(self.x*self.x + self.y*self.y);
end
local function normalized(self)
    local length = self:length();
    if length ~= 0 then
        return newVec2(self.x/length, self.y/length);
    else
        return newVec2(0, 0);
    end
end
local function directionTo(self, vector)
    return newVec2(self.x-vector.x, self.y-vector.y):normalized();
end
local function distanceTo(self, vector)
    return newVec2(self.x-vector.x, self.y-vector.y):length();
end


function newVec2(x, y) 
    x = x or 0;
    y = y or 0;
    local newVec = {
        x=x, y=y,
        length=length,
        normalized=normalized,
        directionTo=directionTo,
        distanceTo=distanceTo
    };

    return newVec;
end