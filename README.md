# Love2DBase
A base for love2D projects, so I don't need to set up the same systems every time I want to make a game. You can use this in your own projects, no credit needed. But this is purely a personal thing, so I won't be adding features unless I find a use for them, unless you add them yourself (Make a PR!). There may also be broken stuff and uncomplete stuff.

### Goals
√ Vector base

√ Timers

√ Color table

√ Particles

□ Animations

√ Full vector tables

□ Collision

□ Raycasts

## Shortened Names
I have shortened names for commonly used things

`t` - `table`

`m` - `math`

`lm` - `love.math`

`kb` - `love.keyboard`

`gfx` - `love.graphics`

## Math

All extra math functions are added to luas default `math` library.

`lerp(<from>, <to>, <weight>)` - lerps from `from` to `to`, `weight` controls how far along to move it

`deg2rad(<radian>)` - converts radians to degrees

`rad2deg(<degree>)` - converts degrees to radians


## Vectors
I have a vector class/table with some helpful functions. Call `require("tools/vector")` to get them and then `newVec2(<x>, <y>)` to get one.

**Vector Properties**

`x` - horizontal axis

`y` - vertical axis

**Vector Functions**

`vec:dot(<vector>)` - returns the dot product with another vector

`vec:length()` - returns the length

`vec:normalized()` - returns a normalized version

`vec:normalised()` - same as `vec:normalized`, just bri'ish

`vec:directionTo(<vector>)` - returns the direction (normalized) to another vector

`vec:distanceTo(<vector>)` - return the distance to another vector

`vec:angleTo(<vector>)` - returns the angle between two vectors

`vec:angle()` - returns the angle of the vector

`vec:rotated(<r>)` - returns the vector rotatated by `r` radians

`vec:rotatedDegrees(<d>)` - returns the vector rotatated by `d` degrees

`vec:moveTo(<vector>, <t>)` - returns `vec` lerped to `vector`

`vec:add(<vector>)` - returns a new vector with `vector` added to it

`vec:mult(<n>)` - returns a new vector multiplied by `n`

`vec:vmult(<vector>)` - returns a new vector mutliplied by another vector

`vec:div(<n>)` - returns a new vector divided by `n`

`vec:vdiv(<vector>)` - returns a new vector divided by another vector

**Related Functions**

`gfx.vcircle(<mode>, <pos>, <radius>)` - Draws a circle with a vector

`gfx.vrect()`

## Timers
There's a timer table which you can get with `require("tools/timer")` and then calling `newTimer(<time>)`.

**Timer Properties**

`time` - the time it counts down from

`timeLeft` - the time left in the current countdown

`printTime` - if true, prints out `timeLeft`

**Timer Functions**

`timer:isOver()` - returns whether the timer is over or not

`timer:reset()` - resets the timer

`timer:resetIfOver()` - resets the timer, but only if it's over

`timer:timeElapsed()` - returns `time - timeLeft`.

`timer:getPercentageOver()` - returns how much time is left in the form of a percentage (0-1)

## Colors
There's a color table which can be used to store rgb values. Call `gfx.newColor(<r>, <g>, <b>)`
to create a new color. Below you'll see `gfx` used, which is just `love.graphics`. You may also
use colour instead of color.

**Color Functions**

`gfx.csetColor(<color>)` - version of `setColor()` which uses my color system

## Particles
WIP - Gonna be very long
