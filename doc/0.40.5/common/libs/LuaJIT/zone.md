# `zone`

*File: `lua/common/libs/LuaJIT/zone.lua` · VM: Common (GE + vehicle) · 45 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `zone`

LuaJIT's jit.zone module (Mike Pall, MIT license): hierarchical stack of named "zones", used by the LuaJIT profiler to label portions of code. The module returns a callable table: zone("name") pushes a zone, zone() pops one and returns it. A modder normally does not need it.

## Example

```lua
local zone = require("jit.zone")
zone("AI")
  print(zone:get()) --> "AI"
zone()
```

## Notes

- zone() with no argument pops; on an empty stack, assert fails with "empty zone stack".

## Functions

| Function | Description | Line |
|---|---|---|
| `zone.flush(t)` | Empties the zone stack (method: zone:flush()). (dynamically assigned) | dyn |
| `zone.get(t)` | Returns the current zone, i.e. the top of the stack (zone:get()), or nil if empty. (dynamically assigned) | dyn |

### Parameter details

#### `zone.flush(t)`

Empties the zone stack (method: zone:flush()). (dynamically assigned)

- `t` (*table*) : The zone table (self)

#### `zone.get(t)`

Returns the current zone, i.e. the top of the stack (zone:get()), or nil if empty. (dynamically assigned)

- `t` (*table*) : The zone table (self)
- **returns**: string|nil Name of the current zone

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/libs/LuaJIT/zone.lua`.*
