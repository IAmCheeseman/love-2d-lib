require("Tools/Vector");


local function update(self, dt)

end

local function draw(self)

end


function newBullet()
    return {
        pos=newVec(),
        dir=newVec(),
        update=update,
        draw=draw
    }
end