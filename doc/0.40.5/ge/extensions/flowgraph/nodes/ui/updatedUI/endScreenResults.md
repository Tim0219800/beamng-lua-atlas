# `flowgraph_nodes_ui_updatedUI_endScreenResults`

*File: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenResults.lua` · VM: Game Engine (GE) · 66 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/updatedUI/endScreenResults")` (file under extensions/ but not a regular extension)

Node "EndScreen Results" (repeat_instant, color ui). Adds the mission results panel to the end screen: formatted text of the attempt (change.formattedAttempt), optional subtext, then optionally objectives and ratings. Inputs: flow, text (string or table), change (attempt aggregate table), includeObjectives, includeRatings (bool). Output: flow (chainFlow).

## Notes

- If includeObjectives or includeRatings is true while change is nil, addObjectives/addRatings receive nil.

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:init()` | Does nothing. | 26 |
| `C:work()` | Copies flow. Adds a textPanel (header "ui.missions.results.title" only once) for change.formattedAttempt and/or for text, then calls modules.ui:addObjectives / addRatings with change if the options are checked. | 29 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/endScreenResults.lua`.*
