# `flowgraph_nodes_gameplay_rally_trackRecovery`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackRecovery.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/trackRecovery")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Mode Track Recovery" (category repeat_instant, tag rally). Tracks flips and recoveries: every frame, computes recoveryType among 'flip', 'recovery', 'restart' (the last active pin wins) and calls extensions.hook('onRallyVehicleRecovery', recoveryType). Flow inputs: flip, recovery, restart.

## Notes

- The hook is called every frame, including with recoveryType = nil when no pin is active.
- The description of the restart pin is "A recovery" (copy-paste).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Determines the recovery type and emits the onRallyVehicleRecovery hook. | 22 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRallyVehicleRecovery` — listened to by 2 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/trackRecovery.lua`.*
