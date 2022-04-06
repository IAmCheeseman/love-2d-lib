-- Color objects
function new(r, g, b, a)
    a = a or 1
    return { r=r, g=g, b=b, a=a }                                      
end

return {
    new=new
}