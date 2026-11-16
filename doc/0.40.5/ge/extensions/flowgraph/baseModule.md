# `flowgraph_baseModule`

*File: `lua/ge/extensions/flowgraph/baseModule.lua` · VM: Game Engine (GE) · 51 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `flowgraph_baseModule`: `extensions.load("flowgraph_baseModule")`, then the global `flowgraph_baseModule`

Base class of the flowgraph manager's modules (the "modules" attached to the manager, as opposed to nodes). It defines a class C with empty hooks (clear, onUpdate, executionStarted, executionStopped) that derived modules override. The file is not a usable extension on its own: it is used by flowgraph modules via M.use(mgr, derivedClass).

## Example

```lua
local base = require('/lua/ge/extensions/flowgraph/baseModule')
local module = base.use(mgr, {
  onUpdate = function(self, dtReal, dtSim, dtRaw) end,
})
```

## Notes

- C.moduleOrder = 0: module processing order, lower values come first.
- C.hooks is an empty table, meant to declare the hooks handled by the module.
- The preTrigger/afterTrigger functions are commented out in the code (not available).
- M.use calls o:init() a second time only if the derived class redefined init (without the mgr argument in that case).

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_baseModule.createBase(...)` | Creates an instance of the base class: a table with C as metatable, then calls init(...) (so init(mgr)). *(internal)* | 27 |
| `flowgraph_baseModule.use(mgr, derivedClass)` | Creates a base module, copies all fields/methods of derivedClass onto it (override), then calls init() again if the derived class redefined it. *(internal)* | 35 |

### Parameter details

#### `flowgraph_baseModule.createBase(...)`

Creates an instance of the base class: a table with C as metatable, then calls init(...) (so init(mgr)).

- `...` (*any*) : arguments passed to init, normally the flowgraph manager mgr
- **returns**: table base module instance

#### `flowgraph_baseModule.use(mgr, derivedClass)`

Creates a base module, copies all fields/methods of derivedClass onto it (override), then calls init() again if the derived class redefined it.

- `mgr` (*table*) : flowgraph manager that owns the module
- `derivedClass` (*table*) : table of methods/fields that replace those of the base
- **returns**: table module instance

## Class `C`

Base class of a flowgraph module. The empty methods are meant to be overridden.

| Method | Description | Line |
|---|---|---|
| `C:clear()` | Empty hook "usable" by derived modules to clear their state. | 15 |
| `C:executionStarted()` | Empty hook called when the flowgraph execution starts. | 18 |
| `C:executionStopped()` | Empty hook called when the flowgraph execution stops. | 17 |
| `C:init(mgr)` | Stores the manager in self.mgr. | 10 |
| `C:onClear()` | Calls self:executionStopped(). Serves as the reaction to the manager being cleared. | 19 |
| `C:onUpdate(dtReal, dtSim, dtRaw)` | Empty hook called on every manager update (overridden by modules). | 16 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/baseModule.lua`.*
