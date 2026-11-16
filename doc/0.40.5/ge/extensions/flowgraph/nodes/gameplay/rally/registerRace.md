# `flowgraph_nodes_gameplay_rally_registerRace`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/registerRace.lua` · VM: Game Engine (GE) · 25 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/registerRace")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Mode Register Race" (category once_instant, tag rally). Passes the race data to rally mode by triggering extensions.hook('onRallyRegisterRace', raceData). Input: raceData (table).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Emits the onRallyRegisterRace hook with raceData. | 20 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onRallyRegisterRace` — listened to by 1 module(s)

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/registerRace.lua`.*
