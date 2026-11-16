# `flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptActive`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptActive.lua` · VM: Game Engine (GE) · 47 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptActive")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Recovery Prompt Active" (category once_instant). Enables or disables the mission recovery system (core_recoveryPrompt). To be used with "Set Recovery Prompt Enabled" to make the buttons selectable. Input pins: active (default true), enableAll (obsolete, hidden), flipMission, recoverMission (default true), submitMission, restartMission (default false). Depends on gameplay_walk and blocks the gameplay reset (blocksOnResetGameplay).

**Dependencies (loaded first):** `gameplay_walk`

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the flowgraph editor (ImGui). | 42 |
| `C:workOnce(args)` | If active is true: calls core_recoveryPrompt.setActive(true), disables all buttons then enables those whose pin is not nil. Otherwise calls core_recoveryPrompt.setActive(false). | 25 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptActive.lua`.*
