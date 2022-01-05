
local windowSize = {x=320, y=180}
local windowScaling = 3 -- Scales the window up by X amount

function love.conf(t)
    t.window.title = "Unnamed" -- Window title
    
    t.window.width = windowSize.x*windowScaling
    t.window.height = windowSize.y*windowScaling 
end

