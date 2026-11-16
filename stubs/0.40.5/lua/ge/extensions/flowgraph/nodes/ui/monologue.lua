---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/monologue.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_monologue_C
local flowgraph_nodes_ui_monologue_C = {}

--- Resets index, time and current message.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:29
function flowgraph_nodes_ui_monologue_C:_executionStarted() end

--- Restores count and mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:120
---@param res table Node save table to fill.
function flowgraph_nodes_ui_monologue_C:_onDeserialized(res) end

--- Saves count and mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:115
---@param res table Node save table to fill.
function flowgraph_nodes_ui_monologue_C:_onSerialize(res) end

--- "Count" field.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:36
function flowgraph_nodes_ui_monologue_C:drawCustomProperties() end

--- count = 1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:25
function flowgraph_nodes_ui_monologue_C:init() end

--- Duration state 'inactive'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:79
function flowgraph_nodes_ui_monologue_C:onNodeReset() end

--- Adjusts the number of pin pairs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:53
---@param old integer Old number of elements.
---@param new integer New number of elements.
function flowgraph_nodes_ui_monologue_C:updatePins(old, new) end

--- Advances the simulation time and displays each message in turn; finishes after the last duration.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:88
function flowgraph_nodes_ui_monologue_C:work() end

--- time = 0, state 'started'.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/monologue.lua:83
function flowgraph_nodes_ui_monologue_C:workOnce() end

