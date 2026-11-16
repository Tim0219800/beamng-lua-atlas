# `flowgraph_nodes_vehicle_playerUsable`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/playerUsable.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/playerUsable")` (file under extensions/ but not a regular extension)

Node "Player Usable" (category `repeat_instant`). Sets whether a vehicle can be controlled by the player: `source.obj.playerUsable = controllable`. Input pins: `vehId`, `controllable` (bool).

## Notes

- `C.todo`: "PlayerUsable has bugs and only works the first time".
- Bug: `vehId` nil or 0 -> `source` nil -> error on access to `source.obj`; no fallback to the player.
- `legacyPins` references `vehiId` (typo).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty constructor. | 26 |
| `C:work()` | Writes `controllable` to the vehicle's `playerUsable`. | 31 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/playerUsable.lua`.*
