

local function overlaps(self, b)
	local a = 0
end

local function overlapsPoint(self, point)
	local s = self.startPoint
	local e = self.endPoint + s
	return s.x < point.x and s.y < point.y and e.x > point.x and e.y > point.y
end


function newAabb(startPoint, endPoint)
	assert(startPoint ~= nil) assert(endPoint ~= nil)
	return {
		startPoint=startPoint,
		endPoint=endPoint,
		overlaps=overlaps,
		overlapsPoint=overlapsPoint,
	}
end