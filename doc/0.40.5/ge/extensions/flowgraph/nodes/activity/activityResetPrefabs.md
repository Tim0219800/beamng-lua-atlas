# `flowgraph_nodes_activity_activityResetPrefabs`

*File: `lua/ge/extensions/flowgraph/nodes/activity/activityResetPrefabs.lua` · VM: Game Engine (GE) · 20 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/activity/activityResetPrefabs")` (file under extensions/ but not a regular extension)

Flowgraph node "Activity Reset Prefab" (category once_p_duration, tag activity). Puts the vehicles contained in all prefabs loaded by the associated activity back at their original position, via gameplay_missions_missionManager.resetActivityPrefabVehicles. No custom pins.

## Notes

- Passes self.mgr.activity without checking: without an associated activity, the value is nil.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls resetActivityPrefabVehicles for the graph's activity. | 16 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/activity/activityResetPrefabs.lua`.*
