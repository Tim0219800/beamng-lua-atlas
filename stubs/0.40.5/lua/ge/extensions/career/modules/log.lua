---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/log.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small text log of the career. Modules call addLog to accumulate lines in memory; on each profile save, the lines are appended (append mode) to the career.log file of the save slot, then the list is emptied.
--- Access: extension `career_modules_log`: `extensions.load("career_modules_log")`, then the global `career_modules_log`
---@class career_modules_log
---@field dependencies table<integer, string> Extensions loaded before: career_saveSystem.
career_modules_log = {}

--- Adds a line to the in-memory log (written to career.log at the next save).
---Source: lua/ge/extensions/career/modules/log.lua:11
---@param message string Message text.
---@param origin string|nil Name of the emitting module ("" by default).
---@param severity string|nil Severity, "I" by default (the value is not validated).
function career_modules_log.addLog(message, origin, severity) end

--- Hook called when career becomes active: empties the list and adds "Loaded game <path>".
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/log.lua:30
---@param active boolean true on activation; nothing is done if false.
function career_modules_log.onCareerActive(active) end

--- Hook called when the profile is saved: adds a "Save game to ..." line then writes (append) all the lines to <saveRoot>/<slot>/career.log and empties the list.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/career/modules/log.lua:15
---@param currentSavePath string Path of the current save.
function career_modules_log.onSaveCurrentProfile(currentSavePath) end

