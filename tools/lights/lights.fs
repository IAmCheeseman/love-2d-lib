
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ) {
    vec4 c = Texel(texture, texture_coords);
    // Getting distance to the center
    vec2 center = vec2(.5, .5);
    vec2 dist = texture_coords-center;
    float length = sqrt(dist.x*dist.x + dist.y*dist.y);

    // Applying the thingey
    return vec4(c.rgb, length);
}