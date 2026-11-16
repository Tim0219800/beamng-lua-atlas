# `libs_copas_copas_semaphore`

*File: `lua/common/libs/copas/copas/semaphore.lua` · VM: Common (GE + vehicle) · 169 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/copas/copas/semaphore")`

Submodule of the third-party Copas library: counting semaphore for Copas coroutines. take requests resources (and waits if they are lacking), give returns them. The module returns the table semaphore.

## Example

```lua
local sem = require("libs/copas/copas/semaphore").new(3, 3, 5)
sem:take()
-- work limited to 3 coroutines in parallel
sem:give()
```

## Notes

- new raises an error if max < 1 or if the timeout is negative; the default timeout is 10 s; start is 0 by default.
- give caps at max and returns the error "too many" on overflow.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_copas_copas_semaphore.get_count(self)` | Number of resources currently available. | 154 |
| `libs_copas_copas_semaphore.get_wait(self)` | Total shortfall of resources requested by the waiting coroutines. | 159 |
| `libs_copas_copas_semaphore.give(self, given)` | Gives resources back to the semaphore (and wakes the waiting coroutines). | 44 |
| `libs_copas_copas_semaphore.new(max, start, seconds)` | Creates a semaphore. | 17 |
| `libs_copas_copas_semaphore.take(self, requested, timeout)` | Requests resources; waits (yielding) as long as there are not enough. With timeout = 0, succeeds or fails immediately with "timeout". | 111 |

### Parameter details

#### `libs_copas_copas_semaphore.get_count(self)`

Number of resources currently available.

- `self` (*table*) : The semaphore
- **returns**: integer Counter

#### `libs_copas_copas_semaphore.get_wait(self)`

Total shortfall of resources requested by the waiting coroutines.

- `self` (*table*) : The semaphore
- **returns**: integer Total deficit

#### `libs_copas_copas_semaphore.give(self, given)`

Gives resources back to the semaphore (and wakes the waiting coroutines).

- `self` (*table*) : The semaphore
- `given` (*integer|nil*) : Number of resources (default 1)
- **returns**: boolean|nil true on success
- **returns**: string|nil "too many" if the maximum is exceeded (the counter is capped)

#### `libs_copas_copas_semaphore.new(max, start, seconds)`

Creates a semaphore.

- `max` (*integer*) : Maximum number of resources (must be greater than 0)
- `start` (*integer|nil*) : Resources available at the start (default 0)
- `seconds` (*number|nil*) : Default timeout in seconds (default 10)
- **returns**: table The semaphore

#### `libs_copas_copas_semaphore.take(self, requested, timeout)`

Requests resources; waits (yielding) as long as there are not enough. With timeout = 0, succeeds or fails immediately with "timeout".

- `self` (*table*) : The semaphore
- `requested` (*integer|nil*) : Number requested (default 1)
- `timeout` (*number|nil*) : Timeout in seconds (default: the semaphore's)
- **returns**: boolean|nil true on success
- **returns**: string|nil Error, e.g. "timeout"

## Fields

| Field | Type | Description |
|---|---|---|
| `__index` | table | Metatable of the semaphore objects. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/copas/copas/semaphore.lua`.*
