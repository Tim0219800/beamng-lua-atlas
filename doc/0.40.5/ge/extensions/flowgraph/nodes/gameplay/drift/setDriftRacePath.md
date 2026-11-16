# `flowgraph_nodes_gameplay_drift_setDriftRacePath`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftRacePath.lua` · VM: Game Engine (GE) · 33 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/drift/setDriftRacePath")` (file under extensions/ but not a regular extension)

Flowgraph node "Drift Race Path" (category repeat_instant, drift). Uses a race path (racePath pin) to define checkpoints, destination and start position via gameplay_drift_destination.setRacePath. Additional input pin: disableWrongWayAndDist (disables the wrong-way and remaining-distance messages). Outputs: pathData (path data for other nodes) and waypoints (table).

## Notes

- Path resolved with mgr:getRelativeAbsolutePath; outputs unchanged if it is invalid.
- Calls setRacePath again every frame as long as the node is reached.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Calls setRacePath({filePath, disableWrongWayAndDist}) then reads getWaypoints() and getPathData(file). | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/setDriftRacePath.lua`.*
