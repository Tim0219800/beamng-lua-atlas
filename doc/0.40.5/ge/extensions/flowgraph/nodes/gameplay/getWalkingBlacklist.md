# `flowgraph_nodes_gameplay_getWalkingBlacklist`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/getWalkingBlacklist.lua` · VM: Game Engine (GE) · 37 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/getWalkingBlacklist")` (file under extensions/ but not a regular extension)

Flowgraph node "Is Walking Blacklisted" (category repeat_instant, depends on gameplay_walk). Indicates whether a vehicle (vehId pin) is allowed or forbidden for entry from walking mode. Outputs: allowed, denied (flow) and value (hidden bool).

## Notes

- Bug: work writes self.pinOut.bool.value, but no "bool" pin exists (the pin is called value): the access crashes as soon as vehId is set.

**Dependencies (loaded first):** `gameplay_walk`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work(args)` | Calls gameplay_walk.isVehicleBlacklisted(vehId) to fill allowed/denied; sets the outputs to nil if vehId is absent. | 23 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/getWalkingBlacklist.lua`.*
