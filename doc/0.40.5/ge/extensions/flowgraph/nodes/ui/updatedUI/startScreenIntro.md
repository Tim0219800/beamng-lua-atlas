# `flowgraph_nodes_ui_updatedUI_startScreenIntro`

*File: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenIntro.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenIntro")` (file under extensions/ but not a regular extension)

Node "StartScreen Intro" (repeat_instant, color ui). Combined node for the start screen: intro panel, then objectives and ratings. Inputs: flow, text (string or table), includeObjectives, objectivesPage (string, optional page, main by default), includeRatings. Output: flow (chainFlow).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Copies flow. If text is non-empty, adds an "Intro" textPanel (main page). If requested, adds the objectives (modules.ui:addObjectives, optionally on the objectivesPage page) and the ratings (addRatings). | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenIntro.lua`.*
