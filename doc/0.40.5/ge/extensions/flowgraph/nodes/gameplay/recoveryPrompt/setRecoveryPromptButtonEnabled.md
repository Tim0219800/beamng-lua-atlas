# `flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptButtonEnabled`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptButtonEnabled.lua` · VM: Game Engine (GE) · 31 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptButtonEnabled")` (file under extensions/ but not a regular extension)

Flowgraph node "Set Recovery Prompt Button Enabled" (category once_instant). Enables or disables a recovery prompt button by id; if the button was inactive and is to be enabled, it is also activated. Input pins: id (suggested templates: flipMission, recoverMission, submitMission, restartMission), enabled.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:postInit()` | Sets the predefined values (hardTemplates) of the id pin: the four standard buttons. | 21 |
| `C:workOnce()` | Calls core_recoveryPrompt.setButtonEnabledById(id, enabled or false). | 17 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptButtonEnabled.lua`.*
