# `flowgraph_nodes_gameplay_drift_setDriftData`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftData.lua` · VM: Game Engine (GE) · 28 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/drift/setDriftData")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Drift Data" (category repeat_instant). Loads the drift data (for example stunt zones) from a file (driftDataFile pin) via gameplay_drift_saveLoad.loadDriftData.

## Notes

- Path resolved with mgr:getRelativeAbsolutePath; ignored if invalid.
- Called every frame as long as the node is reached.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Resolves the path then calls gameplay_drift_saveLoad.loadDriftData(file). | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftData.lua`.*
