---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class; each instance represents a node in a graph.
---@class flowgraph_nodes_util_loadLevel_C
local flowgraph_nodes_util_loadLevel_C = {}

--- Resets the state to 1, flow to false and clears mgr.__delayedLoadingScreenFunctions.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua:34
function flowgraph_nodes_util_loadLevel_C:_executionStarted() end

--- Displays the current state in the node body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua:126
---@param builder table Node constructor.
---@param style table Node style.
function flowgraph_nodes_util_loadLevel_C:drawMiddle(builder, style) end

--- Initializes the state to 1, the flow pin to false and the default data (preventPlayerSpawning=true, forceLevelLoad=true, delayBufferFrames=0, noLoadInEdit=true, customLoadingScreen=false...).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua:23
function flowgraph_nodes_util_loadLevel_C:init() end

--- Hook called on the fade-out of the loading screen; goes to state 3 with the frame delay, unless already in state 4.
---Source: lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua:51
---@param missionFile string Loaded mission file (used for the log).
function flowgraph_nodes_util_loadLevel_C:onLoadingScreenFadeout(missionFile) end

--- Fills the templates of the levelPath pin with the sorted list from getAllLevelIdentifiers().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua:40
function flowgraph_nodes_util_loadLevel_C:postInit() end

--- Advances the state machine. If the requested level is already loaded (and forceLevelLoad is false or the editor is active with noLoadInEdit), goes directly to 4. Otherwise starts core_levels.startLevel (disabling the automatic player spawn according to the data), then finalizes in state 3.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/util/loadLevel.lua:59
function flowgraph_nodes_util_loadLevel_C:work() end

