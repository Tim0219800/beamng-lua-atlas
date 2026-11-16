# `flowgraph_nodes_gameplay_race_moveVehicleToStartposition`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/race/moveVehicleToStartposition.lua` · VM: Game Engine (GE) · 86 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/race/moveVehicleToStartposition")` (file under extensions/ but not a regular extension)

Flowgraph node "Move Veh to Start Position" (category repeat_instant, tags scenario and race). Moves (and repairs by default) a vehicle to a start position of a pathData. Position choice: id pin if provided, otherwise according to reverse/rolling among defaultStartPosition, reverseStartPosition, rollingStartPosition, rollingReverseStartPosition; the name pin, if set, takes precedence (findStartPositionByName). Inputs: vehId, name, lowPrecision, pathData, id, reverse, rolling, repair. Outputs: pos (vec3), rot (quat), exists (bool).

## Notes

- If the position cannot be found, a warning is logged (mgr:logEvent) and exists stays false.
- In the code, the repair pin contains the typo "hidde = true": it is therefore not hidden.
- The old pin vehID is redirected to vehId (legacyPins).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_executionStarted()` | Forgets the stored path. | 40 |
| `C:init(mgr, ...)` | Initializes self.path and disables clearOutPinsOnStart. | 35 |
| `C:work(args)` | Chooses the start position, calls sp:moveResetVehicleTo(vehId, lowPrecision, repair) and writes pos/rot to the output. | 44 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/race/moveVehicleToStartposition.lua`.*
