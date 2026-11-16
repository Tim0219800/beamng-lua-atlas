---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/autoSave.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Autosave of the level editor. A timer (preference files.autoSave.interval, 120 s by default) calls editor.autoSaveLevel() when files.autoSave.active is true, with a countdown in the status bar during files.autoSave.noticeInterval seconds. An "AutoSave Restore" modal window lets you restore the scene tree from /temp/level_autosaves/<level>/; it opens by itself if the editor did not close cleanly on that level, or via the windows menu.
--- Access: extension `editor_autoSave`: `extensions.load("editor_autoSave")`, then the global `editor_autoSave`
---@class editor_autoSave
editor_autoSave = {}

--- Called every editor frame: shows the restore window if needed, decrements the timer, displays the warning and triggers editor.autoSaveLevel() when it reaches 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/autoSave.lua:110
---@param dtReal number Real frame time (s), used for the timer.
---@param dtSim number Simulated time (unused).
---@param dtRaw number Raw duration (unused).
function editor_autoSave.onEditorGui(dtReal, dtSim, dtRaw) end

--- Initializes the timer with files.autoSave.interval and adds the "AutoSave Restore" entry to the windows menu.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/autoSave.lua:133
function editor_autoSave.onEditorInitialized() end

--- Hook called when a preference changes: resets the timer for files.autoSave.interval and keeps noticeInterval <= interval.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/autoSave.lua:138
---@param path string Preference path, e.g. "files.autoSave.interval".
---@param value any New value.
function editor_autoSave.onEditorPreferenceValueChanged(path, value) end

--- Editor preferences registration hook: declares the "files" category and the "autoSave" subcategory.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/autoSave.lua:153
---@param prefsRegistry table Editor preferences registry (registerCategory / registerSubCategory).
function editor_autoSave.onEditorRegisterPreferences(prefsRegistry) end

