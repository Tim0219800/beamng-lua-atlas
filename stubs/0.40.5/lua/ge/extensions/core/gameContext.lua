---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/gameContext.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_gameContext`: small relay to `gameplay_markerInteraction` (current game context) and to the UI (foreground mission change). Also provides the "experimental" warning label displayed for the career and rally missions.
--- Access: extension `core_gameContext`: `extensions.load("core_gameContext")`, then the global `core_gameContext`
---@class core_gameContext
core_gameContext = {}

--- Returns the game context provided by gameplay_markerInteraction.getGameContext(...), loading the extension if needed.
---Source: lua/ge/extensions/core/gameContext.lua:7
---@param ... any Arguments passed as is to gameplay_markerInteraction.getGameContext.
---@return table  Game context, or {} if the extension is unavailable.
function core_gameContext.getGameContext(...) end

--- Translation key of the "experimental" banner: 'ui.rally.experimentalWarning' if the foreground mission is of type rallyStage, rallyLoop or rallyLoop2 and the rallyHideExperimentalBanner setting is false; 'ui.career.experimentalWarning' if career is active; otherwise nil.
---Source: lua/ge/extensions/core/gameContext.lua:25
---@return string|nil  Translation key or nil.
function core_gameContext.getWIPWarningLabel() end

--- Hook called when a mission's state changes: forwards the guihooks event 'onAnyMissionChanged' (state, mission id) to the UI.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/gameContext.lua:21
---@param state string New state of the mission (value defined by the mission manager).
---@param mission table|nil Mission concerned; only mission.id is sent.
function core_gameContext.onAnyMissionChanged(state, mission) end

--- Does nothing (empty function).
---Source: lua/ge/extensions/core/gameContext.lua:17
function core_gameContext.toggleMenues() end

