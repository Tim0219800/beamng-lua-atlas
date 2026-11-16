# `flowgraph_nodes_vehicle_isPlayerUsable`

*File: `lua/ge/extensions/flowgraph/nodes/vehicle/isPlayerUsable.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/vehicle/isPlayerUsable")` (file under extensions/ but not a regular extension)

Node "Is Player usable" (category `repeat_instant`). Reads `playerUsable` of a vehicle. Input pin: `vehId`; outputs: flow `true` and flow `false`.

## Notes

- Bug: if `vehId` is nil or 0, the `else` is empty, so `source` stays nil and `source.playerUsable` causes an error (no fallback to the player).
- The `legacyPins` table refers to `vehiId` (typo).

## Class `C`

Flowgraph node class (returned by `_flowgraph_createNode(C)`). Definition fields: name, description, category, pinSchema, tags.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty constructor. | 26 |
| `C:work()` | Sets `true` = `source.playerUsable` and `false` = its opposite. | 31 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/vehicle/isPlayerUsable.lua`.*
