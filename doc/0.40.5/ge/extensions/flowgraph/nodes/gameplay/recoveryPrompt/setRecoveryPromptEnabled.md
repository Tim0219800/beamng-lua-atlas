# `flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptEnabled`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptEnabled.lua` · VM: Game Engine (GE) · 35 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptEnabled")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Recovery Prompt Enabled" (category once_instant). Enables or disables the standard recovery prompt buttons; a disabled button stays visible but not selectable. Input pins: flipMission, recoverMission (default true), submitMission, restartMission (default false). Depends on gameplay_walk.

**Dependencies (loaded first):** `gameplay_walk`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the flowgraph editor (ImGui). | 30 |
| `C:workOnce(args)` | For each standard button whose pin is not nil, calls core_recoveryPrompt.setButtonEnabledById. | 22 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptEnabled.lua`.*
