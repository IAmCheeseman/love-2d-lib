
function math.lerp(a, b, t) return (b-a)*t+a end
function math.rad2deg(r)  return r*180 /m.pi end
function math.deg2rad(d)  return d*m.pi/ 180 end


-- Gets a random value between a min and max, returns a float
function love.math.randRange(min, max)
	local value = love.math.random() * 1000000 -- hehe
	value = value % (max - min)
	value = value + min

	return value
end