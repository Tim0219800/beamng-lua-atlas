---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/levelValidator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor "Level Validator" tool (Window > Debug menu). The "Find issues" button starts a job that searches the level for duplicated objects, floating objects (not planted on the terrain), misconfigured splines (fewer than 2 nodes) and zero or near-zero scales, for scene objects and forest items. The results are sortable, ignorable, and some are fixable (deleting duplicates, no undo possible). The results can be read by other modules via getLevelLogs.
--- Access: extension `editor_levelValidator`: `extensions.load("editor_levelValidator")`, then the global `editor_levelValidator`
---@class editor_levelValidator
---@field dependencies table<integer, string> {"core_forest"}.
editor_levelValidator = {}

--- Returns the raw list of issues found (entries with logLevel, type, objectId, message...).
---Source: lua/ge/extensions/editor/levelValidator.lua:894
---@return table  levelLogs.
function editor_levelValidator.getLevelLogs() end

--- Returns the issues grouped by readable type (Duplicated Object, Floating Object, Spline Misconfigured, Duplicated Forest Item, Floating Forest Item, and "Zero or Near-Zero Scale"). Each entry is enriched with the object's name and position, and a camera position/rotation (15 m behind the object).
---Source: lua/ge/extensions/editor/levelValidator.lua:897
---@return table  {elementsByType = {[i] = {type, count, elements}}}.
function editor_levelValidator.getLevelLogsAggregated() end

--- Called when a level starts: resets the terrain dimensions, the logs and the check state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/levelValidator.lua:876
function editor_levelValidator.onClientStartMission() end

--- Called after the level is saved. Empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/levelValidator.lua:884
---@param state any Not used.
function editor_levelValidator.onEditorAfterSaveLevel(state) end

--- Draws the tool window (Find issues button, filterable and sortable list, actions).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/levelValidator.lua:578
function editor_levelValidator.onEditorGui() end

--- Registers the "levelValidator" window and the "Level Validator" menu entry (Debug group).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/levelValidator.lua:856
function editor_levelValidator.onEditorInitialized() end

--- If extendedLogs changes, clears the results and resets the check state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/levelValidator.lua:888
---@param path string Preference path.
---@param value any New value.
function editor_levelValidator.onEditorPreferenceValueChanged(path, value) end

--- Registers the levelValidator.general preferences category (extendedLogs, hidden columnSizes).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/levelValidator.lua:865
---@param prefsRegistry table Editor preferences registry.
function editor_levelValidator.onEditorRegisterPreferences(prefsRegistry) end

--- Load hook: writes a Debug log "initialized".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/levelValidator.lua:861
function editor_levelValidator.onExtensionLoaded() end

--- Starts the level validation in a job (core_jobsystem, period 0.04) and sets the state to "search in progress".
---Source: lua/ge/extensions/editor/levelValidator.lua:567
function editor_levelValidator.startLevelValidation() end

--- Sort comparators for the result list columns (a and b are two log entries).
---@class editor_levelValidator_sortingFunctions
local editor_levelValidator_sortingFunctions = {}

--- Sort by uniqueErrorCode (0 if absent).
---Source: lua/ge/extensions/editor/levelValidator.lua:45
---@param a table Log entry.
---@param b table Log entry.
---@return boolean  a before b.
function editor_levelValidator_sortingFunctions.Code(a, b) end

--- Sort by message.
---Source: lua/ge/extensions/editor/levelValidator.lua:51
---@param a table Log entry.
---@param b table Log entry.
---@return boolean  a before b.
function editor_levelValidator_sortingFunctions.Description(a, b) end

--- Sort by filename field.
---Source: lua/ge/extensions/editor/levelValidator.lua:71
---@param a table Log entry.
---@param b table Log entry.
---@return boolean  a before b.
function editor_levelValidator_sortingFunctions.File(a, b) end

--- Sort by lineNumber field (0 if absent).
---Source: lua/ge/extensions/editor/levelValidator.lua:77
---@param a table Log entry.
---@param b table Log entry.
---@return boolean  a before b.
function editor_levelValidator_sortingFunctions.Line(a, b) end

--- Sort by logLevel (string).
---Source: lua/ge/extensions/editor/levelValidator.lua:39
---@param a table Log entry.
---@param b table Log entry.
---@return boolean  a before b.
function editor_levelValidator_sortingFunctions.LogLevel(a, b) end

--- Sort by the name of object a.object (empty string if absent).
---Source: lua/ge/extensions/editor/levelValidator.lua:63
---@param a table Log entry.
---@param b table Log entry.
---@return boolean  a before b.
function editor_levelValidator_sortingFunctions.ObjectName(a, b) end

--- Sort by origin field (empty string if absent).
---Source: lua/ge/extensions/editor/levelValidator.lua:57
---@param a table Log entry.
---@param b table Log entry.
---@return boolean  a before b.
function editor_levelValidator_sortingFunctions.Origin(a, b) end

