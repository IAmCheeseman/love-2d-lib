

function update(self, dt)
	if self.smoothingEnabled then
		self.pos = self.pos:moveTo(-self.pin.pos:copy() + (WINDOW_SIZE / 2), self.smoothing * dt)
		return
	end
	self.pos = -self.pin.pos:copy() + (WINDOW_SIZE / 2)
end
function draw(self)
	gfx.translate(self.pos)
end


function newCamera(pinnedObject)
	assert(pinnedObject.pos, "Need a `pos` value in pin object")
	return {
		pin=pinnedObject,
		pos=newVec2(0, 0),
		smoothingEnabled=true,
		smoothing=5,
		update=update,
		draw=draw,
	}
end