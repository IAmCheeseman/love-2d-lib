local oldMGetPos = love.mouse.getPosition

function love.mouse.getPosition() -- Making mouse.getPosition() return a vector, instead of x/y
	local x, y = oldMGetPos()
	return newVec2(x, y)
end