# `flowgraph_nodes_macro_foreach`

*File: `lua/ge/extensions/flowgraph/nodes/macro/foreach.lua` · VM: Game Engine (GE) · 72 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/macro/foreach")` (file under extensions/ but not a regular extension)

Flowgraph node 'Foreach' (macro, logic category). For each element of the input table, loads a new flowgraph (.flow.json file given by 'elementFile') with core_flowgraphManager.loadManager, sets mgr.modules.foreach.key/value (read by the Get Foreach node) and starts execution. Does this only once (flag self.done).

## Notes

- BUG: work reads self.pinIn.filepath.value whereas the pin is named 'elementFile' (pinIn.filepath is nil, likely crash).
- BUG: in _executionStopped, the loop names the variable 'mrg' but uses 'mgr:setRunning(false)' (nil global variable) and removeNextFrame(self.mgr) (the parent manager, not the child).
- self.done is never set back to false.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | If destroyTargetOnStop, stops and deletes the created managers; clears targets. | 39 |
| `C:init(mgr, ...)` | data.destroyTargetOnStop=true, targets=nil. | 28 |
| `C:postInit()` | Restricts the elementFile pin to '.flow.json' files. | 33 |
| `C:work()` | On the first flow, creates and starts one manager per element of the table; self.done prevents starting again. | 52 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/macro/foreach.lua`.*
