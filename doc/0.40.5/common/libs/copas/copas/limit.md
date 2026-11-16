# `libs_copas_copas_limit`

*File: `lua/common/libs/copas/copas/limit.lua` · VM: Common (GE + vehicle) · 137 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("libs/copas/copas/limit")`

Submodule of the third-party Copas library: limits the number of tasks run simultaneously. Each added task is scheduled right away if there is room (otherwise queued); wait lets you wait for all of them to finish. The module returns { new = new }.

## Example

```lua
local limit = require("libs/copas/copas/limit")
local r = limit.new(5)
r:addthread(function(url) --[[ ... ]] end, "http://...")
r:wait()
```

## Notes

- The object returned by new has the methods addthread(task, ...), removethread(coro), next() and wait(); addthread returns the coroutine, and rethrows the error of a task that fails.
- Default value of maxt: 99999.

## Functions

| Function | Description | Line |
|---|---|---|
| `libs_copas_copas_limit.new(maxt)` | Creates a task runner with at most maxt simultaneous tasks. | 121 |

### Parameter details

#### `libs_copas_copas_limit.new(maxt)`

Creates a task runner with at most maxt simultaneous tasks.

- `maxt` (*integer|nil*) : Maximum simultaneous tasks (default 99999)
- **returns**: table Runner with addthread, removethread, next, wait

## Class `ll`

Internal linked list serving as the task queue.

| Method | Description | Line |
|---|---|---|
| `ll.new()` | Creates an empty list. | 57 |
| `ll:pop()` | Removes and returns the first element (nil if empty). | 28 |
| `ll:push(item)` | Adds an element at the end of the list. | 20 |
| `ll:remove(item)` | Removes a given element from the list. | 41 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/copas/copas/limit.lua`.*
