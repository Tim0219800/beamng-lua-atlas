---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_race_filePath_C
local flowgraph_nodes_gameplay_race_filePath_C = {}

--- Forgets the loaded path when the graph stops.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua:64
function flowgraph_nodes_gameplay_race_filePath_C:_executionStopped() end

--- Editor properties panel: button to open the Race Editor, name of the opened file and "Hardcode to File Pin" button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua:42
function flowgraph_nodes_gameplay_race_filePath_C:drawCustomProperties() end

--- Initializes self.path to nil and disables clearOutPinsOnStart.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua:31
---@param mgr table Flowgraph manager.
---@param ... any
function flowgraph_nodes_gameplay_race_filePath_C:init(mgr, ...) end

--- Forgets the loaded path (self.path = nil) to force a reload.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua:60
function flowgraph_nodes_gameplay_race_filePath_C:onNodeReset() end

--- Restricts the file selector of the 'file' pin to "Race Files" (.race.json).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua:36
function flowgraph_nodes_gameplay_race_filePath_C:postInit() end

--- Loads the race file if it is not loaded yet, applies reverse/autoConfig and fills all output pins.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua:68
---@param args table Flowgraph engine arguments (unused).
function flowgraph_nodes_gameplay_race_filePath_C:work(args) end

