# `flowgraph_nodes_gameplay_traffic_setupPursuitGameplay`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setupPursuitGameplay.lua` · VM: Game Engine (GE) · 41 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/traffic/setupPursuitGameplay")` (file under extensions/ but not a regular extension)

Flowgraph node "Setup Pursuit Gameplay" (once_instant). Configures pursuit gameplay via gameplay_police.setupPursuitGameplay(suspectId, policeIds, {pursuitMode, preventAutoStart}). suspectId defaults to the player vehicle; mainPoliceId (if provided) replaces the policeIds list. Outputs success/fail. On success, marks the suspect and police as ignoreForceTeleport so that traffic "scatter" does not teleport them.

## Notes

- If policeIds is nil (no pin connected) and the setup succeeds, `ipairs(policeIds)` raises a Lua error.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Starts the pursuit setup, writes success/fail and sets ignoreForceTeleport on the vehicles concerned. | 25 |

## Calls into the engine (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/setupPursuitGameplay.lua`.*
