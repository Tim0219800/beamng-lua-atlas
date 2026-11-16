# `flowgraph_nodes_activity_attemptVehicle`

*File: `lua/ge/extensions/flowgraph/nodes/activity/attemptVehicle.lua` · VM: Game Engine (GE) · 64 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/activity/attemptVehicle")` (file under extensions/ but not a regular extension)

Flowgraph node "Activity Attempt Vehicle" (category once_instant, tag activity). Adds a vehicle's information (jbeam model, partConfig configuration, isConfigFile if .pc) to an attempt under the key given by "vehKey" ("vehicle" by default). Inputs: vehKey (string), vehId (number, otherwise player vehicle 0), attempt (attemptData). Output: attempt. In career, adds originId/originKey (player's inventory or vehicle provided by the setup module).

## Notes

- If no vehicle is found, the attempt output pin is not updated.
- In career, the code reads self.mgr.activity.setupModules without a check: crashes without an associated activity.
- originKey is 'careerInventory' (player vehicle) or 'providedBySetupModule' (originId = _selectionIdx).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Empty. | 23 |
| `C:workOnce()` | Looks up the vehicle (vehId or player), builds {model, config, isConfigFile, originId, originKey} and writes it into attempt[vehKey]. | 27 |

## Calls into the engine (C++)

- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/activity/attemptVehicle.lua`.*
