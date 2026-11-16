# `libs_copas_copas_timer`

*File: `lua/common/libs/copas/copas/timer.lua` · VM: Common (GE + vehicle) · 87 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/copas/copas/timer")`

Submodule of the third-party Copas library: timers (one-shot or recurring) run in the Copas dispatcher. timer.new immediately arms a timer that will call callback(timer_obj, params) after the delay. The module returns the table timer.

## Example

```lua
local timer = require("libs/copas/copas/timer")
local t = timer.new({delay = 2, recurring = true, callback = function(self, p) print("tick") end})
t:cancel()
```

## Notes

- new raises an error (assert) if delay < 0 or if callback is not a function.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_copas_copas_timer.cancel(self)` | Cancels an active timer (removes its coroutine from the dispatcher). | 49 |
| `libs_copas_copas_timer.new(opts)` | Creates and arms a timer. | 72 |

### Parameter details

#### `libs_copas_copas_timer.cancel(self)`

Cancels an active timer (removes its coroutine from the dispatcher).

- `self` (*table*) : The timer (timer:cancel())
- **returns**: table|nil The timer, or nil + error if already cancelled

#### `libs_copas_copas_timer.new(opts)`

Creates and arms a timer.

- `opts` (*table*) : {delay (s), callback, recurring?, params?, initial_delay? (default delay)}
- **returns**: table Timer object

## Fields

| Field | Type | Description |
|---|---|---|
| `__index` | table | Metatable of the timer objects. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/copas/copas/timer.lua`.*
