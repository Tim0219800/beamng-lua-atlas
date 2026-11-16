# `flowgraph_nodes_gameplay_blacklistWalking`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/blacklistWalking.lua` · VM: Game Engine (GE) · 61 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/blacklistWalking")` (file under extensions/ but not a regular extension)

Flowgraph node "Blacklist Walking" (depends on gameplay_walk). Allows or forbids entering a vehicle from walking mode, via the gameplay_walk blacklist. Input pins: flow, allow (removes from the list), deny (adds), vehId, clear (pulse, empties the list), fill (all vehicles of the project), fillAll (all BeamNGVehicle objects in the scene). Output: flow.

## Notes

- Bug: in fill, the code calls gameplay_walk.addVehicleToBlacklist(sortedIds) with the global variable (nil) instead of id; the list is therefore not filled correctly.
- fill and fillAll first empty the blacklist.

**Dependencies (loaded first):** `gameplay_walk`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init(mgr, ...)` | Empty. | 25 |
| `C:work(args)` | If flow is active, executes allow/deny (if vehId), clear, fill, fillAll. Copies flow to the output. | 28 |

## Calls into the engine (C++)

- `obj:` `getId`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/blacklistWalking.lua`.*
