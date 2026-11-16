---@meta
-- tim19Atlas stub generated from lua/console/console-lib.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Helper library of the console VM (BeamNG without the game): creates dummy Lua objects so that vehicle/physics code can run outside the full game, builds `ground_model` objects from the JSON description of ground materials, and reads art/groundmodels.json. Used by bananabench.
--- Access: `require("console-lib")`
---@class console_lib
local console_lib = {}

--- Creates and fills a native `ground_model()` object from a parameter table (friction coefficients, depth, roughness, fluid…) with the default values listed in the notes.
---Source: lua/console/console-lib.lua:27
---@param v table Description of a ground material (entry of art/groundmodels.json).
---@return userdata  Native ground_model object.
function console_lib.createGroundModel(v) end

--- Creates the dummy globals needed to run vehicle code outside the game (map, gameplay_statistic, core_sounds, physicsEngineEvent, vehicleReset).
---Source: lua/console/console-lib.lua:6
function console_lib.initConsole() end

--- Reads and returns the content of art/groundmodels.json.
---Source: lua/console/console-lib.lua:52
---@return table|nil  Decoded ground model tables.
function console_lib.readGroundModels() end

return console_lib
