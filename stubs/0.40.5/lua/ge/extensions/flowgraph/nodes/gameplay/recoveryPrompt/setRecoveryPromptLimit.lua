---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptLimit.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created via `_flowgraph_createNode(C)`).
---@class flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptLimit_C
local flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptLimit_C = {}

--- Draws the central content of the node in the flowgraph editor (ImGui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptLimit.lua:42
---@param builder table editor node constructor (builder:Middle())
---@param style table node drawing style
function flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptLimit_C:drawMiddle(builder, style) end

--- Initializes the node's internal state at creation (called by the flowgraph engine).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptLimit.lua:25
function flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptLimit_C:init() end

--- Builds the limits table from the non-nil number pins, calls core_recoveryPrompt.setButtonLimits(limits) then resetButtonLimitCounters(counts) to reset the counters to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/recoveryPrompt/setRecoveryPromptLimit.lua:29
---@param args table arguments passed by the engine (unused)
function flowgraph_nodes_gameplay_recoveryPrompt_setRecoveryPromptLimit_C:workOnce(args) end

