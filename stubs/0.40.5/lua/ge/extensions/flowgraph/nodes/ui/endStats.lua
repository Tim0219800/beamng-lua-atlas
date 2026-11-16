---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/ui/endStats.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)).
---@class flowgraph_nodes_ui_endStats_C
local flowgraph_nodes_ui_endStats_C = {}

--- Empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:37
function flowgraph_nodes_ui_endStats_C:_executionStarted() end

--- Restores count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:105
---@param res table Node save table to fill.
function flowgraph_nodes_ui_endStats_C:_onDeserialized(res) end

--- Saves count.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:101
---@param res table Node save table to fill.
function flowgraph_nodes_ui_endStats_C:_onSerialize(res) end

--- "Count" field for the number of statistics.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:41
function flowgraph_nodes_ui_endStats_C:drawCustomProperties() end

--- Empty central area.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:32
---@param builder any Editor node builder (builder:Middle() opens the central area).
---@param style any Node display style provided by the editor.
function flowgraph_nodes_ui_endStats_C:drawMiddle(builder, style) end

--- count = 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:28
function flowgraph_nodes_ui_endStats_C:init() end

--- Adjusts the number of groups of 3 input pins (label, points, maxPoints).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:58
---@param old integer Old number of elements.
---@param new integer New number of elements.
function flowgraph_nodes_ui_endStats_C:updatePins(old, new) end

--- Takes the input list, adds an entry {label, points, maxPoints, relativePoints} per statistic and writes it to "statData".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/ui/endStats.lua:86
function flowgraph_nodes_ui_endStats_C:work() end

