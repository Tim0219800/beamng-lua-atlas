---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/gameplay/race/raceAiParameters.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_gameplay_race_raceAiParameters_C
local flowgraph_nodes_gameplay_race_raceAiParameters_C = {}

--- Returns a uniform random number in [-scale, scale].
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceAiParameters.lua:27
---@param scale number|nil Amplitude (1 by default).
---@return number  Random value.
function flowgraph_nodes_gameplay_race_raceAiParameters_C:getRandomNumber(scale) end

--- Applies the AI parameters to each AI vehicle of the race (only once, on first flow).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/gameplay/race/raceAiParameters.lua:32
function flowgraph_nodes_gameplay_race_raceAiParameters_C:workOnce() end

