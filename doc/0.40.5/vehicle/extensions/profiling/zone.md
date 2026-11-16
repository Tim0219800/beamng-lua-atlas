# `profiling_zone`

*File: `lua/vehicle/extensions/profiling/zone.lua` · VM: Vehicle · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/profiling/zone")` (file under extensions/ but not a regular extension)

Third-party library: LuaJIT's jit.zone (Mike Pall), copyright 2005-2016, MIT license. Implements a simple model of hierarchical zones (a stack of names) used by the LuaJIT profiler (mode z of profiling_p) to group samples by named zone. The module returns a callable table: zone('name') pushes a zone, zone() pops it.

## Example

```lua
local zone = require('extensions/profiling/zone')
zone('AI')
  zone('A*')
  print(zone:get()) --> 'A*'
  zone()
print(zone:get()) --> 'AI'
zone()
```

## Notes

- Popping an empty stack triggers the error "empty zone stack" (assert).
- The module is not a game extension: it is loaded by require on this path (the original example cited require('jit.zone')).
- No M function: the API is the returned table (methods flush and get, plus the __call metamethod).

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/vehicle/extensions/profiling/zone.lua`.*
