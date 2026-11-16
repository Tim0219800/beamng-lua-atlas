# `flowgraph_nodes_gameplay_rally_handleLapChange`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/handleLapChange.lua` · VM: Game Engine (GE) · 37 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/handleLapChange")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Mode Handle Lap Change" (tag rally). Intended to update the lap info. Inputs: lapChange (pulse), currLap, maxLap.

## Notes

- Empty node in practice: work() tests lapChange but executes nothing (empty if body, commented-out code).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Does nothing: the lap change handling is empty. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/handleLapChange.lua`.*
