
local function dot(self, vector)
    return (self.x*self.x + self.y*self.y) + (vector.x*vector.x + vector.y*vector.y);
end
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
local function angleTo(self, vector)
    local dot = self:dot(vector);
    local v1Len = self:length();
    local v2Len = vector:length();
    return (dot/v1Len)/v2Len;
end
local function angle(self)
    return m.atan2(self.y, self.x);
end
local function moveTo(self, vector, t)
    return newVec2(
        m.lerp(self.x, vector.x, t),
        m.lerp(self.y, vector.y, t)
    );
end
local function add(self, vector) return newVec2(self.x+vector.x, self.y+vector.y) end
local function mult(self, n) return newVec2(self.x*n, self.y*n) end
local function vmutl(self, vector) return newVec2(self.x*vector.x, self.y*vector.y) end
local function div(self, n) return newVec2(self.x/n, self.y/n) end
local function vdiv(self, vector) return newVec2(self.x/vector.x, self.y/vector.y) end

function newVec2(x, y)
    x = x or 0;
    y = y or 0;
    local newVec = {
        x=x, y=y,
        length=length,
        normalized=normalized,
        directionTo=directionTo,
        distanceTo=distanceTo,
        angleTo=angleTo,
        angle=angle,
        moveTo=moveTo,
        add=add,
        mult=mult,
        vmult=vmult,
        div=div,
        vdiv=vdiv
    };

    return newVec;
end