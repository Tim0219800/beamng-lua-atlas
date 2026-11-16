# `libs_copas_copas_lock`

*File: `lua/common/libs/copas/copas/lock.lua` · VM: Common (GE + vehicle) · 194 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/copas/copas/lock")`

Submodule of the third-party Copas library: lock (mutex) between Copas coroutines. A coroutine that requests an already-held lock yields until it is released or the timeout expires. By default the lock is re-entrant and the timeout is 10 s. The module returns the table lock.

## Example

```lua
local lock = require("libs/copas/copas/lock").new(5)
local ok, err = lock:get()
-- critical section
lock:release()
```

## Notes

- get returns the wait time on success, or nil, error, wait time with the error among "timeout", "destroyed", "lock is not re-entrant".
- release returns nil + "cannot release a lock not owned" if the current coroutine is not the owner.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_copas_copas_lock.get(self, timeout)` | Acquires the lock; yields while another coroutine holds it. With timeout = 0, returns immediately without yielding. | 99 |
| `libs_copas_copas_lock.new(seconds, not_reentrant)` | Creates a lock. | 19 |
| `libs_copas_copas_lock.release(self)` | Releases the lock held by the current coroutine. | 153 |

### Parameter details

#### `libs_copas_copas_lock.get(self, timeout)`

Acquires the lock; yields while another coroutine holds it. With timeout = 0, returns immediately without yielding.

- `self` (*table*) : The lock (call lock:get)
- `timeout` (*number|nil*) : Timeout in seconds, takes precedence over the one from new
- **returns**: number|nil Wait time on success, otherwise nil
- **returns**: string|nil Error: timeout, destroyed or lock is not re-entrant
- **returns**: number|nil Wait time on failure

#### `libs_copas_copas_lock.new(seconds, not_reentrant)`

Creates a lock.

- `seconds` (*number|nil*) : Default acquisition timeout in seconds (default 10)
- `not_reentrant` (*boolean|nil*) : If true, a coroutine cannot re-acquire a lock it already holds
- **returns**: table The lock

#### `libs_copas_copas_lock.release(self)`

Releases the lock held by the current coroutine.

- `self` (*table*) : The lock (call lock:release)
- **returns**: boolean|nil true if released
- **returns**: string|nil Error message

## Fields

| Field | Type | Description |
|---|---|---|
| `__index` | table | Metatable of the lock objects (lock itself). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/copas/copas/lock.lua`.*
