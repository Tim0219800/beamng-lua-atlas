---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/isWalking.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class, instantiated by _flowgraph_createNode(C).
---@class flowgraph_nodes_gameplay_isWalking_C
local flowgraph_nodes_gameplay_isWalking_C = {}

--- Called when the graph starts; stores the current walking state in self.prevWalk.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/isWalking.lua:23
function flowgraph_nodes_gameplay_isWalking_C:_executionStarted() end

--- Draws a walker icon in the editor, green if the player is walking, grayed out otherwise.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/isWalking.lua:35
---@param builder table Editor imgui node constructor.
---@param style table Node style.
function flowgraph_nodes_gameplay_isWalking_C:drawMiddle(builder, style) end

--- Every frame: reads gameplay_walk.isWalking() and fills the pins walking, nonWalking, enteredWalking, exitedWalking.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/isWalking.lua:27
---@param args table Flowgraph engine arguments (unused).
function flowgraph_nodes_gameplay_isWalking_C:work(args) end

