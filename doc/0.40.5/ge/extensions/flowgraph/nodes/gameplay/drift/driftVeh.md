# `flowgraph_nodes_gameplay_drift_driftVeh`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftVeh.lua` · VM: Game Engine (GE) · 32 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/drift/driftVeh")` (file under extensions/ but not a regular extension)

Flowgraph node "Drift Veh" (category repeat_instant, drift). Sets the reference vehicle of the drift module; without a specified id, the player vehicle is used. Inputs: setVehId (pulse) and vehId. Output: current vehId (gameplay_drift_drift.getVehId()).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | On the setVehId pulse calls gameplay_drift_drift.setVehId(vehId); always writes the current id to the output. | 24 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftVeh.lua`.*
