---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/logic/edgeDetect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (created by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_logic_edgeDetect_C
local flowgraph_nodes_logic_edgeDetect_C = {}

--- Displays the last stored value (dumpsz).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/edgeDetect.lua:58
---@param builder any
---@param style any
function flowgraph_nodes_logic_edgeDetect_C:drawMiddle(builder, style) end

--- Compares signal to lastSignal (numbers with threshold, tables element by element, other types by equality), sets pinOut.flow to true on change, then stores the signal.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/logic/edgeDetect.lua:33
function flowgraph_nodes_logic_edgeDetect_C:work() end

