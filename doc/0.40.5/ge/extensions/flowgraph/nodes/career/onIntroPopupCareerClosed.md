# `flowgraph_nodes_career_onIntroPopupCareerClosed`

*File: `lua/ge/extensions/flowgraph/nodes/career/onIntroPopupCareerClosed.lua` · VM: Game Engine (GE) · 53 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/onIntroPopupCareerClosed")` (file under extensions/ but not a regular extension)

Flowgraph node "On introPopupCareerClosed" (category repeat_instant, ui color/icon). Detects the closing of the career intro window. Outputs: closed (one-frame impulse) and id (any, id of the closed window, nil otherwise).

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Clears the flags after the trigger. | 44 |
| `C:init()` | Creates the flag table. | 22 |
| `C:onIntroPopupCareerClosed(id)` | Hook: raises closed and stores the window id if provided. | 36 |
| `C:work(args)` | Every frame: closed to false and id to nil, then applies and clears the flags. | 27 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/onIntroPopupCareerClosed.lua`.*
