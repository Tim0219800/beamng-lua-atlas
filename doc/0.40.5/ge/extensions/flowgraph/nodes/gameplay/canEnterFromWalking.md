# `flowgraph_nodes_gameplay_canEnterFromWalking`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/canEnterFromWalking.lua` · VM: Game Engine (GE) · 36 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/canEnterFromWalking")` (file under extensions/ but not a regular extension)

Flowgraph node "Can Enter From Walking" (category repeat_instant, depends on gameplay_walk). Checks that the player is walking and is near a stopped vehicle they can enter. Outputs: canEnter (flow), vehId (nearest vehicle or nil), closeButNotStopped (hidden flow, vehicle nearby but moving).

**Dependencies (loaded first):** `gameplay_walk`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Displays a green vehicle icon if entering is possible. | 28 |
| `C:work(args)` | Uses gameplay_walk.isWalking, getVehicleInFront and isAtParkingSpeed to fill the output pins. | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/canEnterFromWalking.lua`.*
