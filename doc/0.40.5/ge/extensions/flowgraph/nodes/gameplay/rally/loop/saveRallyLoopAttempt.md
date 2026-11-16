# `flowgraph_nodes_gameplay_rally_loop_saveRallyLoopAttempt`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/saveRallyLoopAttempt.lua` · VM: Game Engine (GE) · 69 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/rally/loop/saveRallyLoopAttempt")` (file under extensions/ but not a regular extension)

Flowgraph node "Rally Loop Save Attempt" (category once_instant, tag rally). Records the rally loop attempt. With dnfType set ("restart" or "abandon"), creates a DNF attempt via RallyAttempts.createRallyLoopAttemptForDnf (unless the current mission is 'serviceOut', not counted). Without dnfType, creates the finish attempt (createRallyLoopAttemptForFinish) and outputs: change (change object) and outroTranslation ({txt = end text, context = copy of attempt.data}), the text coming from RallyLoopStars.getOutroText or otherwise from missionTypeData.endScreenText.

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:workOnce()` | Creates the DNF or finish attempt and fills the outputs change and outroTranslation (finish case only). | 39 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/rally/loop/saveRallyLoopAttempt.lua`.*
