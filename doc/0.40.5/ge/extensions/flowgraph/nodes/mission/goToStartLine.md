# `flowgraph_nodes_mission_goToStartLine`

*File: `lua/ge/extensions/flowgraph/nodes/mission/goToStartLine.lua` · VM: Game Engine (GE) · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/goToStartLine")` (file under extensions/ but not a regular extension)

Flowgraph node 'Check Players Position' (repeat_instant category, file goToStartLine). Classifies the vehicle's position relative to the start line according to the 'distance' pin: > 0.35 = outLineForward (too far ahead), < 0 = outLineBackward (too far behind), otherwise inLine (well positioned). The impulse pin 'reset' resets the outputs to false.

## Notes

- The output pin 'flow' is never written in work.
- The 'velocity' pins and the retrieved vehicle are not used.
- The two outputs outLineForward and outLineBackward have the same description ('Outflow when the vehicle is not in position').

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Gets the vehicle via self.mgr.modules.vehicle:getVehicle(vehId). | 31 |
| `C:init()` | vehicle = nil. | 35 |
| `C:work()` | On reset: everything false. Otherwise sets inLine/outLineForward/outLineBackward according to distance. | 39 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/goToStartLine.lua`.*
