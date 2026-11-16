---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_logic_sequencer_C
local flowgraph_nodes_logic_sequencer_C = {}

--- index = 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:45
function flowgraph_nodes_logic_sequencer_C:_executionStarted() end

--- Reads back the settings, recreates the pins and the mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:140
---@param res any
function flowgraph_nodes_logic_sequencer_C:_onDeserialized(res) end

--- Saves mode, count, incMode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:134
---@param res any
function flowgraph_nodes_logic_sequencer_C:_onSerialize(res) end

--- Panel: increment mode, sequence mode (except select), number of outputs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:70
function flowgraph_nodes_logic_sequencer_C:drawCustomProperties() end

--- Displays the mode and the current index.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:179
---@param builder any
---@param style any
function flowgraph_nodes_logic_sequencer_C:drawMiddle(builder, style) end

--- count=1, mode='loop', incMode='auto', index=1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:38
function flowgraph_nodes_logic_sequencer_C:init() end

--- Adds/deletes the input pins according to the increment mode (index for select; next, reset, count for manual).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:50
---@param m string 'auto', 'manual' or 'select'
function flowgraph_nodes_logic_sequencer_C:updateMode(m) end

--- Creates or deletes the flow outputs value_i.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:117
---@param old integer old count
---@param new integer new count
function flowgraph_nodes_logic_sequencer_C:updatePins(old, new) end

--- Updates the index according to the increment mode, computes the active output, sets value_i to (i == active), writes currentIndex, maxIndex, totalIndex; flow equals the input flow.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/sequencer.lua:148
function flowgraph_nodes_logic_sequencer_C:work() end

