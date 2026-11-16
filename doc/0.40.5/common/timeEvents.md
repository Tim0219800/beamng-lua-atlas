# `timeEvents`

*File: `lua/common/timeEvents.lua` · VM: Common (GE + vehicle) · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("timeEvents")`

Small scheduler: lets you schedule the execution of a function in X seconds, like `schedule()`. You create an event list with require('timeEvents').create(), add events to it, and call process(dt) on every update.

## Example

```lua
local events = require('timeEvents').create()
events:addEvent(5, function() print('hello world!') end) -- in 5 s
-- in the update loop:
events:process(dtSim)
```

## Notes

- The extracted page shows addEvent(fn) and process() without arguments, but the code is addEvent(time, fn) and process(dt).
- process(dt) subtracts dt from the time of each event, traversed from the last added to the first, and runs then removes the one whose time becomes STRICTLY below 0 (no guaranteed order between simultaneously expired events: reverse order of addition).
- An error in a scheduled function interrupts process (no pcall) and the event stays in the list.
- The object returned by create() is itself the events array ({fn=, time=}) with the metatable mt.

## Functions

| Function | Description | Line |
|---|---|---|
| `timeEvents.create()` | Creates and returns a new empty list of timed events. | 46 |

### Parameter details

#### `timeEvents.create()`

Creates and returns a new empty list of timed events.

- **returns**: table object with methods addEvent, clear, process

## Class `mt`

Object returned by create(). Events are stored as elements of the array.

| Method | Description | Line |
|---|---|---|
| `mt:addEvent(time, fn)` | Schedules fn in `time` seconds. | 27 |
| `mt:clear()` | Removes all pending events. | 31 |
| `mt:process(dt)` | To be called on every update: advances the delays by dt and runs the events that have expired. | 35 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/timeEvents.lua`.*
