# `flowgraph_nodes_gameplay_drift_setDriftBounds`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftBounds.lua` · VM: Game Engine (GE) · 28 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/drift/setDriftBounds")` (file under extensions/ but not a regular extension)

Flowgraph node "Drift Bounds" (category repeat_instant, drift). Uses a sites file (sitesPath pin) to create the bounds of the drift mission via gameplay_drift_bounds.setBounds.

## Notes

- The path is resolved with mgr:getRelativeAbsolutePath; nothing is done if it is invalid.
- Called every frame as long as the node is reached.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Resolves the sites file path then calls gameplay_drift_bounds.setBounds(file). | 21 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftBounds.lua`.*
