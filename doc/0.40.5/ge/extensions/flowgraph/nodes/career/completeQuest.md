# `flowgraph_nodes_career_completeQuest`

*File: `lua/ge/extensions/flowgraph/nodes/career/completeQuest.lua` · VM: Game Engine (GE) · 27 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/career/completeQuest")` (file under extensions/ but not a regular extension)

Flowgraph node "Complete Quest" (category once_instant, career color/icon). Completes the quest associated with the flowgraph via career_modules_questManager.completeQuest(mgr.quest.id), only if career is active and the graph has a quest (self.mgr.quest). Input pin: completeOnStop (bool, default true, hardCoded).

## Notes

- The completeOnStop pin is declared ("completes only when the manager stops, with a one-frame delay") but is not read in this file: the quest is completed immediately.
- The pin uses the key "hardCoded" (capital C) whereas the other nodes write "hardcoded".

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Calls completeQuest for the graph's quest if career is active. | 20 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/career/completeQuest.lua`.*
