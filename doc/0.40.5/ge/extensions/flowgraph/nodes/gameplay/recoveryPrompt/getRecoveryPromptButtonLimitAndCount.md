# `flowgraph_nodes_gameplay_recoveryPrompt_getRecoveryPromptButtonLimitAndCount`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/getRecoveryPromptButtonLimitAndCount.lua` · VM: Game Engine (GE) · 44 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/recoveryPrompt/getRecoveryPromptButtonLimitAndCount")` (file under extensions/ but not a regular extension)

Flowgraph node "Get Recovery Prompt Button Limit and Count" (category once_instant, recoveryPrompt color/icon, depends on gameplay_walk). Reads core_recoveryPrompt.getButtonLimitsAndCounts() and returns for the chosen button (id pin) its limit (limit) and its usage counter (count). Values -1 if absent from the button data, nil if the id is unknown. In the editor, the id pin offers the values flipMission, recoverMission, submitMission and restartMission.

**Dependencies (loaded first):** `gameplay_walk`

## Class `C`

Node class.

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Calls builder:Middle() without drawing anything. | 39 |
| `C:postInit()` | Sets the predefined values (hardTemplates) of the id pin. | 20 |
| `C:workOnce(args)` | Reads the limits/counters and fills limit and count for the given id. | 29 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/getRecoveryPromptButtonLimitAndCount.lua`.*
