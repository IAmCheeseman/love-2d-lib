# My Personal Love2D lib.
A base for love2D projects, so I don't need to set up the same systems every time I want to make a game. You can use this in your own projects, no credit needed. But this is purely a personal thing, so I won't be adding features unless I find a use for them, unless you add them yourself (Make a PR!). There may also be broken stuff and uncomplete stuff.

### Goals

√ Timers

√ Color table

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

All extra math functions are added to lua's default `math` library.

`lerp(<from>, <to>, <weight>)` - lerps from `from` to `to`, `weight` controls how far along to move it

`deg2rad(<radian>)` - converts radians to degrees

`rad2deg(<degree>)` - converts degrees to radians


## Vectors
I have a vector class/table with some helpful functions. Call `require("tools/vector")` to get them and then `vec.new(<x>=0, <y>=0)` to get one. You can do math on them like you would anything else. They can be used in expressions how you'd expect. In theory could be added to the objects table, but we don't talk about that.

**Vector Properties**

`x`, `y`

**Vector Functions**

`vec:dot(<vector>)` - returns the dot product with another vector

`vec:length()` - returns the length

`vec:normalized()` - returns a normalized version, can use `vec:normalised()` as well

`vec:directionTo(<vector>)` - returns the direction (normalized) to another vector

`vec:distanceTo(<vector>)` - return the distance to another vector

`vec:angleTo(<vector>)` - returns the angle between two vectors

`vec:angle()` - returns the angle of the vector

`vec:rotated(<r>)` - returns the vector rotated by `r` radians

`vec:rotatedDegrees(<d>)` - returns the vector rotated by `d` degrees

`vec:moveTo(<vector>, <t>)` - returns `vec` lerped to `vector`


**Related Functions**

`gfx.circle(<mode>, <pos>, <radius>)` - Draws a circle with a vector

`gfx.rectangle(<mode>, <pos>, <size>)` - Draws a rectangle

`love.mouse.getPosition()` - Returns the vector of the mouse position

## Timers
There's a timer table which you can get with `require("tools/timer")` and then calling `timer.new(<time=1>)`.

**Timer Properties**

`time` - the time it counts down from

`timeLeft` - the time left in the current countdown, *can* go below zero, so be aware of that

`printTime` - if true, prints out `timeLeft`

**Timer Functions**

`timer:isOver()` - returns whether the timer is over or not

`timer:reset()` - resets the timer

`timer:resetIfOver()` - resets the timer, but only if it's over

`timer:timeElapsed()` - returns `time - timeLeft`.

`timer:getPercentageOver()` - returns how much time is left in the form of a percentage (0-1)

## Colors
There's a color table which can be used to store rgb values. Call `color.new(<r>, <g>, <b>, <a=1>)`
to create a new color. You may also
use colour instead of color.

I have a `colors` table with a bunch of default colors, such as `colors.YELLOW`, or `colors.RED`. 

**Color Functions**

All color related functions have been wrapped in my color class.
