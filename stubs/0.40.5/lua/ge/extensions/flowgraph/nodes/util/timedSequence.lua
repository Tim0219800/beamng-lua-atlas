---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_timedSequence_C
local flowgraph_nodes_util_timedSequence_C = {}

--- Resets index, endTime, time and current to zero (the function is defined twice in the file, identically).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:35
function flowgraph_nodes_util_timedSequence_C:_executionStarted() end

--- Restores mode ("loop" by default) and count then recreates the pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:161
---@param res any
function flowgraph_nodes_util_timedSequence_C:_onDeserialized(res) end

--- Saves mode and count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:156
---@param res any
function flowgraph_nodes_util_timedSequence_C:_onSerialize(res) end

--- Draws the "Count" field; changing it calls updatePins. Returns the reason for the change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:48
function flowgraph_nodes_util_timedSequence_C:drawCustomProperties() end

--- Displays the elapsed time and the current section.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:145
---@param builder table Node constructor.
---@param style table Node style.
function flowgraph_nodes_util_timedSequence_C:drawMiddle(builder, style) end

--- Initializes count, index, endTime, time and current.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:23
function flowgraph_nodes_util_timedSequence_C:init() end

--- Resets the time to zero and the state to "inactive".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:98
function flowgraph_nodes_util_timedSequence_C:onNodeReset() end

--- Creates the pins of the first part (updatePins(0, 1)).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:31
function flowgraph_nodes_util_timedSequence_C:postInit() end

--- Adds or removes the duration_/start_/active_/complete_ pins to go from old to new parts and updates count.
---Source: lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:65
---@param old integer Current number of parts.
---@param new integer New number of parts.
function flowgraph_nodes_util_timedSequence_C:updatePins(old, new) end

--- While the state is started, advances the time, activates start/active/complete according to the current part; when the total time has elapsed, goes to "finished" and activates complete of the last part.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:103
function flowgraph_nodes_util_timedSequence_C:work() end

--- Sets the duration state to "started".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/timedSequence.lua:94
function flowgraph_nodes_util_timedSequence_C:workOnce() end

