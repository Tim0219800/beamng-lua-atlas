# `zone`

*File: `lua/common/jit/zone.lua` · VM: Common (GE + vehicle) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** global `zone`

LuaJIT's jit.zone module (Mike Pall, MIT license, 2005-2026): hierarchical stack of named "zones" used by the profiler (jit.p with the z option) to group samples by logical zone. The module is a callable object: zone('name') pushes a zone, zone() with no argument pops one (error "empty zone stack" if empty).

## Example

```lua
local zone = require('jit.zone')
zone('IA')
  zone('A*')
  print(zone:get()) --> 'A*'
  zone()
print(zone:get()) --> 'IA'
zone()
```

## Notes

- The call zone() returns the popped zone.
- The profiler detects the current zone via the stack: every pushed zone must be popped, otherwise the following zones are skewed.

## Functions

| Function | Description | Line |
|---|---|---|
| `zone.flush(t)` | Completely empties the zone stack. (dynamically assigned) | dyn |
| `zone.get(t)` | Returns the name of the current zone (top of the stack), nil if the stack is empty. (dynamically assigned) | dyn |

### Parameter details

#### `zone.flush(t)`

Completely empties the zone stack. (dynamically assigned)

- `t` (*table*) : The module itself (called with ':' : zone:flush()).

#### `zone.get(t)`

Returns the name of the current zone (top of the stack), nil if the stack is empty. (dynamically assigned)

- `t` (*table*) : The module itself (call zone:get()).
- **returns**: string|nil Name of the current zone.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/jit/zone.lua`.*
