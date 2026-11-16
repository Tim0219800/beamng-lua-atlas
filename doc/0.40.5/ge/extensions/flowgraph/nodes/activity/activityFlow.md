# `flowgraph_nodes_activity_activityFlow`

*File: `lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua` · VM: Game Engine (GE) · 113 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/activity/activityFlow")` (file under extensions/ but not a regular extension)

Flowgraph node "Activity Flow" (category logic, tag activity). Entry point of a mission graph: outputs flow once at start (pin "started"), every frame while the activity is running ("update"), then once at stop ("stopped"). Hidden output pins: dtReal, dtSim, dtRaw (delta times). Without an associated activity (standalone graph), it runs on onUpdate; with an activity, it is driven by the mission manager.

## Notes

- legacyPins renames the old output pins start -> started and stop -> stopped.
- The code still writes to self.pinOut.start/stop (old names); this works thanks to the legacyPins renaming.
- Also writes the delta times into self.mgr.dtReal, dtSim and dtRaw.
- On the 'stopped' state change with an activity: triggers stopped then calls gameplay_missions_missionManager.stop.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:changedRunningState(newState)` | Hook: when the graph becomes 'stopped', triggers stop() and stops the mission (if an activity is running). | 82 |
| `C:drawMiddle()` | Editor: shows whether an activity is associated and the end of its id. | 102 |
| `C:drawTooltip()` | Editor: tooltip showing the activity id or the limited compatibility mode. | 106 |
| `C:onExecutionStarted()` | Hook: when the graph starts, if an activity exists and is not running, starts it via gameplay_missions_missionManager.start; without an activity, calls start(). | 39 |
| `C:onStartActivity()` | Hook called when the activity starts; calls start(). | 48 |
| `C:onStopActivity()` | Hook called when the activity stops; calls stop(). | 95 |
| `C:onUpdate(...)` | Per-frame hook; calls update only if the graph has no activity. | 65 |
| `C:onUpdateActivity(...)` | Per-frame hook sent by the activity; calls update. | 70 |
| `C:start()` | Sets the "started" flow to true (update and stopped to false) and triggers the node. | 33 |
| `C:stop()` | Enables the "stopped" flow and triggers the node. | 75 |
| `C:update(dtReal, dtSim, dtRaw)` | Updates dtReal/dtSim/dtRaw (pins and manager), enables "update" and triggers the node. | 53 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/activity/activityFlow.lua`.*
