# `flowgraph_nodes_mission_blacklistParkingSpots`

*File: `lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua` · VM: Game Engine (GE) · 154 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/mission/blacklistParkingSpots")` (file under extensions/ but not a regular extension)

Flowgraph node 'Blacklist Parking Spots' (once_instant category). Marks as 'banned' the parking spots (gameplay_parking) located within a radius around given positions, so that parked cars do not use them, and teleports the vehicles already parked on them. Positions: posList list, pins pos_i (adjustable count) and, if 'auto', the active mission vehicles (excluding traffic/parked). The marks are removed on stop or reset.

## Notes

- workOnce adds the positions to the posList table of the input pin (if provided), so it modifies the caller's table.
- updatePins tests lnk.sourcePin whereas the pos_i pins are inputs: the links are not deleted.

## Class `C`

Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.

| Method | Description | Line |
|---|---|---|
| `C:_executionStopped()` | Calls reset(). | 33 |
| `C:_onDeserialized(res)` | Reads back count and recreates the pins. | 148 |
| `C:_onSerialize(res)` | Saves count. | 144 |
| `C:drawCustomProperties()` | Panel: number of position pins (Count). | 56 |
| `C:init()` | count=1, bannedSpots empty. | 24 |
| `C:onNodeReset()` | Calls reset(). | 37 |
| `C:postInit()` | Creates the pins pos_1..pos_count. | 29 |
| `C:reset()` | Removes the 'banned' tag from the spots banned by this node and clears the list. | 41 |
| `C:updatePins(old, new)` | Creates or deletes the pos_i pins. | 73 |
| `C:workOnce()` | Gathers the positions, looks for spots within the radius (default 5 m) with gameplay_parking.findParkingSpots, adds the 'banned' tag and forces the teleportation of the vehicles occupying them. | 94 |

## Calls into the engine (C++)

- `be:` `getObjectOOBBCenterXYZ`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/mission/blacklistParkingSpots.lua`.*
