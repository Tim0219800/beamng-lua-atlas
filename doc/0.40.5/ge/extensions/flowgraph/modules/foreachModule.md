# `flowgraph_modules_foreachModule`

*File: `lua/ge/extensions/flowgraph/modules/foreachModule.lua` · VM: Game Engine (GE) · 30 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/modules/foreachModule")` (file under extensions/ but not a regular extension)

Flowgraph module (moduleOrder 1000, so executed last) reserved for child graphs created by a foreach loop. It contains only the fields parentGraphId, key and value, which the foreach node fills in for the child. All its execution methods are empty.

## Notes

- afterTrigger, executionStopped and executionStarted are empty (a debug log is commented out).

## Functions

| Function | Description | Line |
|---|---|---|
| `flowgraph_modules_foreachModule.afterTrigger()` | Called after the graph tick (does nothing). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_foreachModule.clear()` | Resets parentGraphId, key and value to nil. (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_foreachModule.executionStarted()` | Called when the project starts (does nothing). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_foreachModule.executionStopped()` | Called when the project stops (does nothing). (dynamically assigned) *(internal)* | dyn |
| `flowgraph_modules_foreachModule.init()` | Called when the module is created: calls clear(). (dynamically assigned) *(internal)* | dyn |

## Class `C`

| Method | Description | Line |
|---|---|---|
| `C:afterTrigger()` |  | 18 |
| `C:clear()` |  | 11 |
| `C:executionStarted()` |  | 26 |
| `C:executionStopped()` |  | 22 |
| `C:init()` |  | 7 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/modules/foreachModule.lua`.*
