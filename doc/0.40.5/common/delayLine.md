# `delayLine`

*File: `lua/common/delayLine.lua` · VM: Common (GE + vehicle) · 101 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("delayLine")`

Generic delay line: each data packet pushed into the line comes out after the same delay. Originally created to simulate the time unburnt fuel takes to travel through the exhaust before burning. The line must be polled regularly (pop/popSum) with the time step to retrieve what has reached the end.

## Example

```lua
local dl = require('delayLine').new(0.2)  -- delay 0.2 s
dl:push(5)
-- every frame:
local sum = dl:popSum(dt)
```

## Notes

- The internal time (currentTime) only advances in pop and popSum, not in peek.
- pop returns nil if the line is empty, otherwise an array (possibly empty). popSum returns 0 if empty; it assumes numeric data.
- Packets come out in the order they went in (same delay for all).

## Functions

| Function | Description | Line |
|---|---|---|
| `delayLine.new(delay)` | Creates a delay line. | 92 |

### Parameter details

#### `delayLine.new(delay)`

Creates a delay line.

- `delay` (*number*) : Delay in seconds applied to each packet.
- **returns**: table Object with the methods push, peek, pop, popSum, reset.

## Class `delayLine`

Object returned by new(delay). Fields: delay, length, currentTime, data, times.

| Method | Description | Line |
|---|---|---|
| `delayLine:peek(dt)` | Returns, without removing them or advancing time, the packets that would have arrived within dt seconds. | dyn |
| `delayLine:pop(dt)` | Advances time by dt, removes and returns all packets that are due. | dyn |
| `delayLine:popSum(dt)` | Like pop but returns the (numeric) sum of the arrived packets. | dyn |
| `delayLine:push(payload)` | Inserts a data packet; it will come out at currentTime + delay. | dyn |
| `delayLine:reset()` | Empties the line and resets the internal time to 0. | dyn |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/delayLine.lua`.*
