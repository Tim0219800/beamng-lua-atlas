# `flowgraph_nodes_ui_updatedUI_startScreenCrashAnalysisStepDetails`

*File: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenCrashAnalysisStepDetails.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/ui/updatedUI/startScreenCrashAnalysisStepDetails")` (file under extensions/ but not a regular extension)

Node "Start Screen Crash Analysis Step Details" (repeat_instant, color ui). Adds a crash analysis step details panel to the simple start screen. Inputs: flow, stepScoreData (table). Output: flow (chainFlow).

## Class `C`

Flowgraph node class; each instance represents a node in a graph.

| Method | Description | Line |
|---|---|---|
| `C:work()` | Copies flow then calls modules.ui:addCrashAnalysisStepDetails({stepScoreData = ...}). | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/ui/updatedUI/startScreenCrashAnalysisStepDetails.lua`.*
