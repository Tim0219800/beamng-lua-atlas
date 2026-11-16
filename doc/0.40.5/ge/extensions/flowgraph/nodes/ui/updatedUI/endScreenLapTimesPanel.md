# `flowgraph_nodes_ui_updatedUI_endScreenLapTimesPanel`

*File: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenLapTimesPanel.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/updatedUI/endScreenLapTimesPanel")` (file under extensions/ but not a regular extension)

Node "EndScreen Lap Times" (repeat_instant, color ui). Displays a vehicle's lap times on the end screen. Inputs: flow, race (race data table containing states[vehId]), vehId (number, vehicle; defaults to the player vehicle 0). Output: flow (chainFlow).

## Notes

- If vehId is given but matches no object, or if race.states has no entry for this vehicle, addLaptimesForVehicle receives nil.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Finds the vehicle (scenetree.findObjectById(vehId) or getPlayerVehicle(0)) then, if race is provided, adds the laps of race.states[veh:getID()] via modules.ui:addLaptimesForVehicle. | 24 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenLapTimesPanel.lua`.*
