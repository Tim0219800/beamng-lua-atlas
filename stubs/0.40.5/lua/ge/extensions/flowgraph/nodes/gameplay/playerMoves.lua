---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/playerMoves.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_playerMoves_C
local flowgraph_nodes_gameplay_playerMoves_C = {}

--- Resets the initial position and msgSent when the graph starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/playerMoves.lua:28
function flowgraph_nodes_gameplay_playerMoves_C:_executionStarted() end

--- Initializes initialPos to nil, msgSent to true and data.useScenarioRealtimeDisplay to true.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/playerMoves.lua:20
function flowgraph_nodes_gameplay_playerMoves_C:init() end

--- Every frame: handles reset, stores the vehicle's initial position, shows/clears the start message and sets success to true if the vehicle has moved more than 0.1 m.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/playerMoves.lua:33
---@param args table Flowgraph engine arguments (unused).
function flowgraph_nodes_gameplay_playerMoves_C:work(args) end

