# `flowgraph_nodes_gameplay_dragRace_setRacerDial`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setRacerDial.lua` · VM: Game Engine (GE) · 83 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/dragRace/setRacerDial")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Drag Racer Dial" (category once_instant). Sets the dial (announced time) of one or more drivers. Input pin: dials, table of entries {racerId = number, value = number}. Outputs: flow (pulse), success (all succeeded), count (number of valid dials). Calls dragBridge.setRacersDial.

## Notes

- count is computed before the call: it is the number of valid entries whose racerId exists in dragData.racers.
- Empty table: success false, count 0, but flow given.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Validates the entries, calls setRacersDial and fills success/count; reports a partial failure through a node error. | 26 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/setRacerDial.lua`.*
