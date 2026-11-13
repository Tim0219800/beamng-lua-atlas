---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua
---@class flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C
local flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C = {}

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:214
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:_executionStarted() end

--- Create a vehicle entry from a config
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:69
---@param config any
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:createVehicleEntry(config) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:31
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:drawCustomProperties() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:36
---@param builder any
---@param style any
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:drawMiddle(builder, style) end

--- Filter vehicle configs to only include valid cars/trucks
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:50
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:filterValidVehicleConfigs() end

--- Generate opponents for bracket race mode
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:138
---@param vehConfigs any
---@param count any
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:generateBracketRaceOpponents(vehConfigs, count) end

--- Generate opponents with similar dial times
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:157
---@param vehConfigs any
---@param dial any
---@param count any
---@param currentVeh any
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:generateSimilarOpponents(vehConfigs, dial, count, currentVeh) end

--- Get player dial time from various sources
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:113
---@param currentVeh any
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:getPlayerDial(currentVeh) end

--- Generate opponents using player vehicle with different colors
---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:85
---@param count any
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:getPlayerVehicleAsFallback(count) end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:26
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:init() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:189
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:selectVehicle() end

---Source : lua/ge/extensions/flowgraph/nodes/gameplay/dragRace/generateDragOpponents.lua:219
function flowgraph_nodes_gameplay_dragRace_generateDragOpponents_C:workOnce() end

