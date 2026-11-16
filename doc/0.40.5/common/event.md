# `event`

*File: `lua/common/event.lua` · VM: Common (GE + vehicle) · 46 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("event")`

Small event class (delegates) exposed as the global Event. Create an object with Event.new(), subscribe functions with add, and trigger them with call or by calling the object directly.

## Example

```lua
local ev = Event.new()
local function cb(x) print('received', x) end
ev:add(cb)
ev(42)      -- or ev:call(42)
ev:remove(cb)
```

## Notes

- Subscribers are stored as table keys: call order is not guaranteed and adding the same function twice counts it only once.
- add and remove raise error('Wrong parameter type: must be a function') if the argument is not a function.
- The functions are fields of the global Event table (':' notation recommended for calls).

**Globals assigned:** `Event`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/common/event.lua`.*
