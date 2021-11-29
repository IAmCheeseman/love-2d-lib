require("Master");

function love.update(dt)
    if #objects > 0 then
        for i=1,#objects do
            objects[i]:update(dt);
        end
    end

end

function love.draw()
    if #objects > 0 then
        for i=1,#objects do
            objects[i]:draw();
        end
    end
    gfx.print("("..globals.player.pos.x..", "..globals.player.pos.y..")")
end

