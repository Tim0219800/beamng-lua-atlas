# `flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptLimit`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptLimit.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptLimit")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Recovery Prompt Limits" (category once_instant). Limits the number of uses of each recovery prompt button (-1 = unlimited); with no use remaining the button is no longer selectable. Number input pins: flipMission (5), recoverMission (5), submitMission (-1), restartMission (-1); custom number pins are allowed and saved. Depends on gameplay_walk.

**Dependencies (loaded first):** `gameplay_walk`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the flowgraph editor (ImGui). | 42 |
| `C:init()` | Initializes the node's internal state at creation (called by the flowgraph engine). | 25 |
| `C:workOnce(args)` | Builds the limits table from the non-nil number pins, calls core_recoveryPrompt.setButtonLimits(limits) then resetButtonLimitCounters(counts) to reset the counters to zero. | 29 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptLimit.lua`.*
