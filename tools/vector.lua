
local function dot(self, vector)
    return (self.x*self.x + self.y*self.y) + (vector.x*vector.x + vector.y*vector.y)
end
local function length(self)
    return math.sqrt(self.x*self.x + self.y*self.y)
end
local function normalized(self)
    local length = self:length()
    if length ~= 0 then
        return newVec2(self.x/length, self.y/length)
    else
        return newVec2(0, 0)
    end
end
local function directionTo(self, vector)
    return newVec2(self.x-vector.x, self.y-vector.y):normalized()
end
local function distanceTo(self, vector)
    return newVec2(self.x-vector.x, self.y-vector.y):length()
end
local function angleTo(self, vector)
    local dot = self:dot(vector)
    local v1Len = self:length()
    local v2Len = vector:length()
    return (dot/v1Len)/v2Len
end
local function angle(self)
    return m.atan2(self.y, self.x)
end
local function moveTo(self, vector, t)
    return newVec2(
        m.lerp(self.x, vector.x, t),
        m.lerp(self.y, vector.y, t)
    )
end
local function rotated(self, r) 
    local rot = self:angle()+r
    local length = self:length()
    return newVec2(m.cos(rot), m.sin(rot)) * length
end
local function rotatedDegrees(self, d) 
    return self:rotated(m.deg2rad(d))
end
local function copy(self)
    return newVec2(self.x, self.y)
end

function newVec2(x, y)
    x = x or 0
    y = y or 0
    local newVec = setmetatable({
        x=x, y=y,
        length=length,
        normalized=normalized,
        normalised=normalized, -- :puking:
        directionTo=directionTo,
        distanceTo=distanceTo,
        angleTo=angleTo,
        angle=angle,
        moveTo=moveTo,
        rotated=rotated,
        rotatedDegrees=rotatedDegrees,
        copy=copy,
    },
    {
        __add = function(vec1, vec2)
            return newVec2(vec1.x + vec2.x, vec1.y + vec2.y)
        end,
        __sub = function(vec1, vec2)
            return newVec2(vec1.x - vec2.x, vec1.y - vec2.y)
        end,
        __mul = function(vec1, vec2)
            if type(vec2) == "table" then
                return newVec2(vec1.x * vec2.x, vec1.y * vec2.y)
            else
                return newVec2(vec1.x * vec2, vec1.y * vec2)
            end
        end,
        __div = function(vec1, vec2)
            if type(vec2) == "table" then
                return newVec2(vec1.x / vec2.x, vec1.y / vec2.y)
            else
                return newVec2(vec1.x / vec2, vec1.y / vec2)
            end
        end,
        __unm = function(vec1)
            return vec1:copy() * -1
        end
    })

    return newVec
end