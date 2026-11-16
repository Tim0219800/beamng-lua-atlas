---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/groupHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Object returned by the constructor; keeps the manager in self.mgr.
---@class flowgraph_groupHelper
local flowgraph_groupHelper = {}

--- Centers moveNodes on the center of the bounding rectangle of fixNodes.
---Source: lua/ge/extensions/flowgraph/groupHelper.lua:59
---@param fixNodes table[] reference nodes
---@param moveNodes table[] nodes to move
function flowgraph_groupHelper:centerMultiNodes(fixNodes, moveNodes) end

--- Repositions a set of nodes around a position while keeping their relative positions (grid alignment).
---Source: lua/ge/extensions/flowgraph/groupHelper.lua:39
---@param nodes table[] nodes to move
---@param pos number[] {x, y} target center
function flowgraph_groupHelper:centerNodes(nodes, pos) end

--- Groups the selection: groupStateNodes in a state graph, otherwise groupFlowNodes.
---Source: lua/ge/extensions/flowgraph/groupHelper.lua:93
---@return table|nil  grouping result
function flowgraph_groupHelper:createGroupingFromSelection() end

--- Computes the bounding rectangle of the nodes and its center.
---Source: lua/ge/extensions/flowgraph/groupHelper.lua:13
---@param nodes table[] nodes
---@return number[]  {minX, minY, maxX, maxY}
---@return number[]  {centerX, centerY}
function flowgraph_groupHelper:getRectCenter(nodes) end

--- Clones the selection into a new subgraph or sub-macro, copies the graph's variables, recreates the internal links and replaces the selection with a macro/integrated node connected to the incoming and outgoing links.
---Source: lua/ge/extensions/flowgraph/groupHelper.lua:172
---@return table  integrated node created
function flowgraph_groupHelper:groupFlowNodes() end

--- Moves the selected state nodes (except entry and exit) into a new 'new group' state graph and reconnects the incoming and outgoing links via the group node.
---Source: lua/ge/extensions/flowgraph/groupHelper.lua:101
function flowgraph_groupHelper:groupStateNodes() end

--- Stores the manager.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/groupHelper.lua:9
---@param mgr table flowgraph manager
function flowgraph_groupHelper:init(mgr) end

--- Ungroups the selection: ungroupStateNode in a state graph, otherwise ungroupFlowNode (nonexistent, see notes).
---Source: lua/ge/extensions/flowgraph/groupHelper.lua:415
function flowgraph_groupHelper:ungroupSelection() end

--- Moves the internal nodes (except entry/exit) of a selected group state up into the current graph and restores the links.
---Source: lua/ge/extensions/flowgraph/groupHelper.lua:423
function flowgraph_groupHelper:ungroupStateNode() end

