# `flowgraph_nodes_gameplay_drift_driftInformation`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftInformation.lua` · VM: Game Engine (GE) · 86 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/drift/driftInformation")` (file under extensions/ but not a regular extension)

Flowgraph node "Drift Information" (category repeat_instant, drift). Gives the vehicle's drift state: drifting/notDrifting, pulses spinout, tapped, crashed, donutDetected, tightDriftDetected, driftCompleted (with driftCompletedAddedScore, driftCompletedCachedScore, driftCompletedCombo), and the measurements closestWallDistance, driftAngle, driftVelocity, totalDriftDeg, totalDriftDistance, totalDriftTime, driftUniformity. Source: gameplay_drift_drift.getDriftActiveData and callbacks of the flowgraph drift module.

## Notes

- Outside of drift, the measurements are -1.
- driftUniformity is declared but never filled in work.
- No general "flow" output is written apart from drifting/notDrifting.
- Code todo: tune driftCleanliness, clean up the raycast.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Copies the callbacks (ttl > 0) and the active drift data to the output pins. | 46 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/drift/driftInformation.lua`.*
