---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/routeData/common.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Tools shared by the pause menu routeData providers: navigation by state sequence, button registration via ui_pause_actions, exit confirmation (level or game) adapted to career, execution of an exit with prior save, and building of rail groups. The confirmation text ids are exposed in ExitLevelTexts and ExitGameTexts.
--- Access: extension `ui_pause_providers_routeData_common`: `extensions.load("ui_pause_providers_routeData_common")`, then the global `ui_pause_providers_routeData_common`
---@class ui_pause_providers_routeData_common
---@field ExitGameTexts table<string, string> Translation ids for quitting the game: default, career, notSaved.
---@field ExitLevelTexts table<string, string> Translation ids for quitting the level: default, career, notSaved.
ui_pause_providers_routeData_common = {}

--- Creates a rail group {id, actions}, or nil if the list is empty.
---Source: lua/ge/extensions/ui/pause/providers/routeData/common.lua:81
---@param id string Group id.
---@param actions table[]|nil Group buttons.
---@return table|nil  Group or nil.
function ui_pause_providers_routeData_common.asRailGroup(id, actions) end

--- Converts any value to a boolean (truthy -> true, otherwise false).
---Source: lua/ge/extensions/ui/pause/providers/routeData/common.lua:7
---@param value any Value to convert.
---@return boolean  Boolean.
function ui_pause_providers_routeData_common.bool(value) end

--- Registers a pause button: extracts button.callback, copies the rest of the metadata and calls ui_pause_actions.registerButton. Without a callback, uses a function that returns false.
---Source: lua/ge/extensions/ui/pause/providers/routeData/common.lua:21
---@param button table|nil Button metadata plus callback.
---@return table|nil  Registered metadata (with buttonId) or nil if button is nil.
function ui_pause_providers_routeData_common.registerPauseButton(button) end

--- Executes the exit function; if payload.saveFirst is true, first saves the career via ui_pause_actions.saveCareerThen.
---Source: lua/ge/extensions/ui/pause/providers/routeData/common.lua:72
---@param exitFn function Exit function _anon(returnToMainMenu, quit...).
---@param payload table|nil Button payload (field read: saveFirst).
function ui_pause_providers_routeData_common.runExit(exitFn, payload) end

--- Tries to navigate to each state via ui_router.navigate (in a pcall) until one succeeds (result.result ~= false).
---Source: lua/ge/extensions/ui/pause/providers/routeData/common.lua:11
---@param states string|string[]|nil State name or list of states to try in order.
---@return boolean  true if a navigation succeeded.
function ui_pause_providers_routeData_common.tryPushStateSequence(states) end

--- Completes an exit button with the confirmation fields (cancelLabel, confirmText, confirmSince, confirmLabel, altLabel...) depending on the mode (career or not) and the save state.
---Source: lua/ge/extensions/ui/pause/providers/routeData/common.lua:49
---@param button table Button metadata, modified in place.
---@param context table Pause context (field read: mode).
---@param texts table ExitLevelTexts or ExitGameTexts.
---@return table  The same button.
function ui_pause_providers_routeData_common.withExitConfirm(button, context, texts) end

