
local windowScaling = 3; -- Scales the window up by X amount

function love.conf(t)
    t.window.title = "Unnamed"; -- Window title
    
    t.window.width = 320*windowScaling;
    t.window.height = 180*windowScaling; 
end