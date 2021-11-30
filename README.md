# Love2DBase
A base for love2D projects, so I don't need to set up the same systems every time I want to make a game.

## Vectors
I have a vector class/table with some helpful functions. Call `require("/tools/vector")` to use them.
`newVector(<x>, <y>)` - returns a vector table 
`vec:dot()` - returns the dot product
`vec:length()` - returns the length
`vec:normalized()` - returns a normalized version
`vec:directionTo(<vector>)` - returns the direction (normalized) to another vector
`vec:distanceTo(<vector>)` - return the distance to another vector
`vec:angle()` - returns the angle of the vector

## Timers
There's a timer table which you can get with `require("/tools/timer")` and then calling `newTimer(<time>)`.
`timer:isOver()` - returns whether the timer is over or not
`tiemr:reset()` - resets the timer
`timer:resetIfOver()` - resets the timer, but only if it's over

It has three properties:
`time` - the time it counts down from
`timeLeft` - the time left in the current countdown
`printTime` - if true, prints out `timeLeft`

## Particles
WIP
