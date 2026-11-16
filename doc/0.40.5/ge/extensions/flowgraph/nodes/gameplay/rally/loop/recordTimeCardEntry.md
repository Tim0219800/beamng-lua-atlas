# `flowgraph_nodes_gameplay_rally_loop_recordTimeCardEntry`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/recordTimeCardEntry.lua` · VM: Game Engine (GE) · 39 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/loop/recordTimeCardEntry")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Loop Record Time Card Entry" (category once_instant, tag rally). Records a time card entry in the rally loop: rm:recordTimeCardEntry(name, time). Inputs: name (string) and time (number).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls rm:recordTimeCardEntry with the name and time pins. | 29 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/recordTimeCardEntry.lua`.*
