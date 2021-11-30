# Love2DBase
A base for love2D projects, so I don't need to set up the same systems every time I want to make a game. You can use this in your own projects, no credit needed. But this is purely a personal thing, so I won't be adding features unless I find a use for them, unless you add them yourself (Make a PR!). There may also be broken stuff and uncomplete stuff.

### Goals
√ Vector base

√ Groups

√ Timers

□ Particles

□ Animations

□ Full vector tables

## Vectors
I have a vector class/table with some helpful functions. Call `require("/tools/vector")` to get them and then `newVec2(<x>, <y>)` to get one.

**Vector Properties**

`x` - horizontal axis

`y` - vertical axis

**Vector Functions**

`vec:dot()` - returns the dot product

`vec:length()` - returns the length

`vec:normalized()` - returns a normalized version

`vec:directionTo(<vector>)` - returns the direction (normalized) to another vector

`vec:distanceTo(<vector>)` - return the distance to another vector

`vec:angleTo(<vector>)` - returns the angle between two vectors

`vec:angle()` - returns the angle of the vector

## Timers
There's a timer table which you can get with `require("/tools/timer")` and then calling `newTimer(<time>)`.

**Timer Properties**

`time` - the time it counts down from

`timeLeft` - the time left in the current countdown

`printTime` - if true, prints out `timeLeft`

**Timer Functions**

`timer:isOver()` - returns whether the timer is over or not

`timer:reset()` - resets the timer

`timer:resetIfOver()` - resets the timer, but only if it's over

## Particles
WIP
