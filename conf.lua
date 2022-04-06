local windowSize = { x=320, y=180 }
local windowScale = 3 -- Scales the window up by X amount

function love.conf(t)
    t.window.title = "Unnamed" -- Window title
    
    t.window.width = windowSize.x * windowScale
    t.window.height = windowSize.y * windowScale
end

