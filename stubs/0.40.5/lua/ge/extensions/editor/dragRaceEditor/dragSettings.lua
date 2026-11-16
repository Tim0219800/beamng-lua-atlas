---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages the drag settings files (*.dragSettings.json) in the drag race editor. A settings entry describes a race: id, stripId, dragType (headsUpRace/bracketRace), context (freeroam/activity), phases (stage, countdown, race, stop), timers and prefabs (starting tree, display board, paths, decorations). The module keeps in memory a single dragSettings object (the displayed settings) and the list of files found, lists, loads, creates, renames and saves these files, and draws the corresponding ImGui panels.
--- Access: extension `editor_dragRaceEditor_dragSettings`: `extensions.load("editor_dragRaceEditor_dragSettings")`, then the global `editor_dragRaceEditor_dragSettings`
---@class editor_dragRaceEditor_dragSettings
editor_dragRaceEditor_dragSettings = {}

--- Draws an ImGui "Drag Settings" panel (old presentation in a fixed 200 px high block).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:957
function editor_dragRaceEditor_dragSettings.drawDragSettingsSection() end

--- Draws the race phase editing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:1108
function editor_dragRaceEditor_dragSettings.drawPhasesSection() end

--- Draws the prefab editing (tree, board, paths, decorations).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:1041
function editor_dragRaceEditor_dragSettings.drawPrefabsSection() end

--- Draws the detail of the selected settings: Basics, Phases, Timers, Prefabs. Modifications call markDirty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:402
function editor_dragRaceEditor_dragSettings.drawSettingsDetails() end

--- Draws the "Drag Settings" section (list, Add button via save dialog, etc.). The buttons are disabled if there is no saved strip.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:236
function editor_dragRaceEditor_dragSettings.drawSettingsList() end

--- Returns the list of settings files.
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:189
---@return table  array of {type, path, name, _dirty...}
function editor_dragRaceEditor_dragSettings.getAllSettings() end

--- Returns the dragSettings object being edited.
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:834
---@return table  current settings
function editor_dragRaceEditor_dragSettings.getDragSettings() end

--- Returns the selected file entry.
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:201
---@return table|nil  entry or nil
function editor_dragRaceEditor_dragSettings.getSelectedSettings() end

--- Index (1-based) of the selected file, -1 if none.
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:193
---@return integer  index
function editor_dragRaceEditor_dragSettings.getSelectedSettingsIndex() end

--- Empties the list then fills it with the settings files of the current level and its dragStripRace / dragStripAPM missions. The displayed name is json.id if it exists, otherwise the file or folder name. Does nothing without a loaded level.
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:68
function editor_dragRaceEditor_dragSettings.loadAllSettings() end

--- Reads a JSON file into dragSettings, removes facilityId, fills in id (file name) and default timers, and resets _dirty to false for the corresponding file.
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:850
---@param filePath string path of the .dragSettings.json file
---@return boolean  false and error displayed if reading fails
function editor_dragRaceEditor_dragSettings.loadDragSettings(filePath) end

--- Marks the selected file as modified and copies dragSettings into its cache.
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:842
function editor_dragRaceEditor_dragSettings.markDirty() end

--- Validates then writes dragSettings (without facilityId) as JSON. Fixes the extension to .dragSettings.json, removes the characters *?<>|", renames the file if the id changed (level folder), creates the folder if needed and updates the selected entry.
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:876
---@param filePath string|nil target path; path of the selected entry if nil
---@return boolean  success
function editor_dragRaceEditor_dragSettings.saveDragSettings(filePath) end

--- Selects a file: caches the previous settings if modified, deselects the strip, then restores the cache, or loads the file from disk, or for a nonexistent file takes the name as id.
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:208
---@param index integer 1-based index
function editor_dragRaceEditor_dragSettings.selectSettings(index) end

--- Replaces the current dragSettings object (unchanged if nil).
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:838
---@param settings table|nil new settings
function editor_dragRaceEditor_dragSettings.setDragSettings(settings) end

--- Sets the selected index without loading data.
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:197
---@param index integer 1-based index or -1
function editor_dragRaceEditor_dragSettings.setSelectedSettingsIndex(index) end

--- Checks that a settings entry has a non-empty dragType and stripId.
---Source: lua/ge/extensions/editor/dragRaceEditor/dragSettings.lua:946
---@param settings table|nil settings
---@return boolean  validity
---@return string|nil  error message
function editor_dragRaceEditor_dragSettings.validateDragSettings(settings) end

