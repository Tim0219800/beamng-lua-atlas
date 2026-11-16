# `flowgraph_nodes_ui_onBigmapStateChange`

*File: `lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua` · VM: Game Engine (GE) · 54 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/onBigmapStateChange")` (file under extensions/ but not a regular extension)

Flowgraph node "On Bigmap State Change" (category repeat_instant): detects the opening and closing of the big map. Pulse outputs: "enteredStart", "enteredEnd", "exitedStart", "exitedEnd" (start/end of transition).

## Class `C`

Flowgraph node class (returned by _flowgraph_createNode(C)).

| Method | Description | Line |
|---|---|---|
| `C:init()` | Initializes the flags. | 24 |
| `C:onActivateBigMapCallback()` | Hook: end of the map opening. | 45 |
| `C:onBigmapStartTransition(activate, esc)` | Hook: start of transition; activate true = enter, false = exit. | 40 |
| `C:onDeactivateBigMapCallback()` | Hook: end of the map closing. | 48 |
| `C:work(args)` | Resets the pulses to false and applies the received flags. | 29 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/onBigmapStateChange.lua`.*
