---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C
local flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C = {}

--- Clears self.flags after the node is triggered.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua:43
function flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C:_afterTrigger() end

--- Creates the empty self.flags table when execution starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua:51
function flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C:_executionStarted() end

--- Draws the central content of the node in the flowgraph editor (ImGui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua:47
---@param builder table editor node constructor (builder:Middle())
---@param style table node drawing style
function flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C:drawMiddle(builder, style) end

--- Initializes the node's internal state at creation (called by the flowgraph engine).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua:26
function flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C:init() end

--- Hook called when a recovery prompt button is pressed; stores the identifier in self.flags for the next work.
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua:55
---@param id any identifier of the pressed button (flipMission, recoverMission, submitMission, restartMission or custom)
function flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C:onRecoveryPromptButtonPressed(id) end

--- Resets all outputs to false, copies the flow input to the flow output, then activates the outputs whose button identifier is in self.flags, and clears the flags.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/onRecoveryPromptAction.lua:30
---@param args table arguments passed by the engine (unused)
function flowgraph_nodes_gameplay_recoveryPrompt_onRecoveryPromptAction_C:work(args) end

