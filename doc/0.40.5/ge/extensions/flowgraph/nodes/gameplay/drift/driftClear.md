# `flowgraph_nodes_gameplay_drift_driftClear`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftClear.lua` · VM: Game Engine (GE) · 26 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/drift/driftClear")` (file under extensions/ but not a regular extension)

Flowgraph node "Clear Drift" (tags gameplay/utils). Clears the drift system: stunt zones, scores and other systems, via gameplay_drift_general.clear(). Input pin: clearDrift (flow).

## Notes

- work tests self.pinIn.flow.value while the declared pin is called clearDrift: the node's standard "flow" pin serves as the trigger, clearDrift is not read.
- Empty category (C.category = '').

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls gameplay_drift_general.clear() if the input flow is active. | 20 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftClear.lua`.*
