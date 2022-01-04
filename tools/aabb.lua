

function overlaps(self, b)
	
end

function overlapsPoint(self, point)
	s = self.startPoint
	e = self.endPoint.add(s)
	return s.x < point.x and s.y < point.y and e.x > point.x and e.y > point.y
end

function newAabb(startPoint, endPoint)
	return {
		startPoint=startPoint,
		endPoint=endPoint,
		overlaps=overlaps,
		overlapsPoint=overlapsPoint
	}
end