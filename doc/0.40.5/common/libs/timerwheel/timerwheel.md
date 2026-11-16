# `libs_timerwheel_timerwheel`

*File: `lua/common/libs/timerwheel/timerwheel.lua` · VM: Common (GE + vehicle) · 305 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/timerwheel/timerwheel")`

Third-party library timerwheel (timer wheel, from the Kong/lua-resty ecosystem): timeout-type timers with O(1) insertion, cancellation and execution, at the cost of limited precision (size of a slot). The module provides no loop: the caller must call `wheel:step()` regularly (at least every `precision` seconds), for example from onUpdate.

## Example

```lua
local timerwheel = require('libs/timerwheel/timerwheel')
local wheel = timerwheel.new({precision = 0.05, now = function() return os.clock() end})
local id = wheel:set(2, function(arg) print('fini', arg) end, 'x')
-- chaque frame :
wheel:step()
wheel:cancel(id)
```

## Notes

- Call `timerwheel.new(opts)` with a dot (not `timerwheel:new`), otherwise an assertion fails.
- Without the `now` option, the default clock function is `ngx.now` or `socket.gettime` if the `socket` module can be loaded; otherwise no clock exists and `new` fails with "expected 'now' to be a function". In the game, passing `now` explicitly is safest.
- Callbacks are run in an xpcall; on error the default handler writes the stack to stderr.
- Timer identifiers are unique negative integers.
- A `set` with an already elapsed delay runs at the next `step` (the position cannot be in the past). A callback that creates a new timer does not see it run in the same slot.
- `wheel:peek` walks the wheel: O(n) operation.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_timerwheel_timerwheel.new(opts)` | Creates a timer wheel and returns the `wheel` object (methods step, count, set, cancel, peek). Validates the options with assertions. | 59 |

### Parameter details

#### `libs_timerwheel_timerwheel.new(opts)`

Creates a timer wheel and returns the `wheel` object (methods step, count, set, cancel, peek). Validates the options with assertions.

- `opts` (*table|nil*) : Options: precision (seconds per slot, default 0.050), ringsize (slots per ring, integer > 0, default 72000 = 1 h), now (function returning the time in seconds), err_handler (xpcall error handler).
- **returns**: table Wheel object.

## Class `wheel`

Object returned by new(opts). The methods are called with a colon.

| Method | Description | Line |
|---|---|---|
| `wheel:cancel(id)` | Cancels a timer. | dyn |
| `wheel:count()` | Number of pending timers. | dyn |
| `wheel:peek(max_ahead)` | Finds the next timer to expire (O(n) walk). | dyn |
| `wheel:set(expire_in, cb, arg)` | Schedules a timer that will call cb(arg) in `expire_in` seconds. Raises an error if `cb` is nil. | dyn |
| `wheel:step()` | Checks and runs the expired timers. To be called regularly by your loop (at least every `precision` seconds). | dyn |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/timerwheel/timerwheel.lua`.*
