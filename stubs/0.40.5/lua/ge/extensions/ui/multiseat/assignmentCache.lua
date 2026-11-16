---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/assignmentCache.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- In-memory cache of multi-seat (multiseat) assignments. It keeps a deep copy of the value passed to set and returns a copy to get, logging the reason for each access. Its unload mode is "manual", so the cache survives the automatic unloading of extensions.
--- Access: extension `ui_multiseat_assignmentCache`: `extensions.load("ui_multiseat_assignmentCache")`, then the global `ui_multiseat_assignmentCache`
---@class ui_multiseat_assignmentCache
ui_multiseat_assignmentCache = {}

--- Returns a deep copy of the stored assignments and logs the reason.
---Source: lua/ge/extensions/ui/multiseat/assignmentCache.lua:16
---@param reason string|nil Reason, used only for the log.
---@return any  Copy of the assignments, nil if nothing was set.
function ui_multiseat_assignmentCache.get(reason) end

--- Extension initialization hook; sets the unload mode to "manual" via setExtensionUnloadMode and logs.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/ui/multiseat/assignmentCache.lua:6
function ui_multiseat_assignmentCache.onInit() end

--- Replaces the stored assignments with a deep copy of value and logs the reason.
---Source: lua/ge/extensions/ui/multiseat/assignmentCache.lua:11
---@param value any Assignments to store (copied with deepcopy).
---@param reason string|nil Reason, used only for the log.
function ui_multiseat_assignmentCache.set(value, reason) end

