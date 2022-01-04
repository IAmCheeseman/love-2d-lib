

local oldMGetPos = love.mouse.getPosition

function love.mouse.getPosition()
	local x, y = oldMGetPos()
	return newVec2(x, y)
end
