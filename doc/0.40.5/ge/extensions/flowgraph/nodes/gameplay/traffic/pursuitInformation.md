# `flowgraph_nodes_gameplay_traffic_pursuitInformation`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua` · VM: Game Engine (GE) · 89 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation")` (file under extensions/ but not a regular extension)

Flowgraph node "Pursuit Information" (repeat_instant). Gives the police pursuit state of a vehicle (vehId, otherwise the player) via gameplay_police.getPursuitData: active, arrest/evade (pulses), mode (0 off, 1-3 pursuit, -1 arrested), score, sightValue, arrestValue, evadeValue, timeElapsed, roadblocks, collisions, policeWrecks, offenses, uniqueOffenses, offensesList.

## Notes

- The values are kept one more frame after an arrest/evade (flags) before being refreshed.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls reset(). | 40 |
| `C:init()` | Calls reset(). | 36 |
| `C:onPursuitAction(id, action, data)` | Hook called by the police system; remembers 'arrest' or 'evade' if id matches the tracked vehicle. | 79 |
| `C:reset()` | Resets the vehicle, the flow outputs and the flags. | 44 |
| `C:work()` | Reads the pursuit data and updates the outputs; emits arrest/evade for one frame. | 53 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitInformation.lua`.*
