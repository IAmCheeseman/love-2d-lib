
function math.lerp(a, b, t) return (b - a) * t + a end -- Linear interpolation
function math.rad2deg(r)    return r * 180  / m.pi end -- Radians to degrees
function math.deg2rad(d)    return d * m.pi /  180 end -- Degrees to radians

-- Gets a random value between a min and max, returns a float
function love.math.randRange(min, max)
	local value = love.math.random() * love.math.random(10000, 1000000)
	value = value % (max - min)
	value = value + min

	return value
end 