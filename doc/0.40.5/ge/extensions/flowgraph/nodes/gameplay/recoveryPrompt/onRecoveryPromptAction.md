# `flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction`

*File: `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua` · VM: Game Engine (GE) · 60 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction")` (file under extensions/ but not a regular extension)

Flowgraph node "On Recovery Prompt Action" (category logic). Lets flow through when a button of the recovery prompt menu has been pressed. Pins: input flow; outputs flow, flipMission, recoverMission, submitMission, restartMission (each true once when the corresponding button is pressed). Custom flow output pins are allowed (allowCustomOutPins) and saved. Receives the event via the onRecoveryPromptButtonPressed hook.

## Class `C`

Flowgraph node class (created via `_flowgraph_createNode(C)`).

| Method | Description | Line |
|---|---|---|
| `C:_afterTrigger()` | Clears self.flags after the node is triggered. | 43 |
| `C:_executionStarted()` | Creates the empty self.flags table when execution starts. | 51 |
| `C:drawMiddle(builder, style)` | Draws the central content of the node in the flowgraph editor (ImGui). | 47 |
| `C:init()` | Initializes the node's internal state at creation (called by the flowgraph engine). | 26 |
| `C:onRecoveryPromptButtonPressed(id)` | Hook called when a recovery prompt button is pressed; stores the identifier in self.flags for the next work. | 55 |
| `C:work(args)` | Resets all outputs to false, copies the flow input to the flow output, then activates the outputs whose button identifier is in self.flags, and clears the flags. | 30 |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua`.*
