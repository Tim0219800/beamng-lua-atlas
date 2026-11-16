---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/gameplaySelector/tileGenerators/missionTiles.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gameplay selector tile generator for missions ("challenges" system). It adds one tile per mission from gameplay_missions_missions.getFilesData(true), computes its type label (dragster race, time trial, gymkhana...) and builds the details panel with a start button.
--- Access: extension `ui_gameplaySelector_tileGenerators_missionTiles`: `extensions.load("ui_gameplaySelector_tileGenerators_missionTiles")`, then the global `ui_gameplaySelector_tileGenerators_missionTiles`
---@class ui_gameplaySelector_tileGenerators_missionTiles
ui_gameplaySelector_tileGenerators_missionTiles = {}

--- Hook called when the details are opened. If itemDetails.missionId refers to a known mission, adds a block (title, description, preview, favorite, general and career specifications, labels) with a start button that calls gameplay_missions_missionManager.startWithLoadingLevel(mission, nil, nil, "gameplaySelector").
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/tileGenerators/missionTiles.lua:213
---@param itemDetails table showDetails data (missionId, key).
---@param details table List of details blocks to complete.
---@param buttonInstance table Object providing addButton.
---@param backend table Backend offering isFavourite and trackRecent.
function ui_gameplaySelector_tileGenerators_missionTiles.onGameplaySelectorGetDetails(itemDetails, details, buttonInstance, backend) end

--- Hook called when the selector collects its tiles. For the gameplaySelector backend, adds one tile per mission (name, preview, type, subgroup, level, beamNG icons, bug, cup, key mission_<id>). Always adds the "moreMissions" tile.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/gameplaySelector/tileGenerators/missionTiles.lua:25
---@param items table List of tiles to complete.
---@param backend table Calling backend; backendName must be "gameplaySelector".
function ui_gameplaySelector_tileGenerators_missionTiles.onGameplaySelectorGetTiles(items, backend) end

