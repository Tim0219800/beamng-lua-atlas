---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/saves.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Manages livery saves (dynamic decals editor) in settings/dynamicDecals/*.dynDecals.json. Allows listing, creating, renaming, deleting, saving and reloading a layer stack, and stores the name of the current save of the editing session. Relies on the editor_api_dynamicDecals extension for the actual serialization.
--- Access: extension `ui_liveries_saves`: `extensions.load("ui_liveries_saves")`, then the global `ui_liveries_saves`
---@class ui_liveries_saves
ui_liveries_saves = {}

--- Forgets the current save and the staged skin (stagedApplySkinName).
---Source: lua/ge/extensions/ui/liveries/saves.lua:115
function ui_liveries_saves.clearCurrentSave() end

--- Returns the name of the skin staged by a save with applySkin and clears it (single read, intended for when the editor exits).
---Source: lua/ge/extensions/ui/liveries/saves.lua:120
---@return string|nil  Name of the skin to apply, or nil.
function ui_liveries_saves.consumeStagedApplySkin() end

--- Writes the current layer stack to a new file via editor_api_dynamicDecals.saveLayerStackToFile. Does not check whether the file already exists and does not change the current save.
---Source: lua/ge/extensions/ui/liveries/saves.lua:52
---@param filename string Name without extension (validated).
---@return string|boolean  Path of the written file, or false if the name is invalid.
function ui_liveries_saves.create(filename) end

--- Deletes the save file. If it was the current save, resets the session state via clearCurrentSave (the staged skin is no longer applied).
---Source: lua/ge/extensions/ui/liveries/saves.lua:90
---@param filename string Name without extension.
---@return boolean  true if the file existed and was deleted.
function ui_liveries_saves.delete(filename) end

--- Returns whether a save with this name exists in settings/dynamicDecals/.
---Source: lua/ge/extensions/ui/liveries/saves.lua:32
---@param filename string Name without extension.
---@return boolean  true if the file exists.
function ui_liveries_saves.exists(filename) end

--- Lists all existing saves. Each entry contains name, location (path), created, modified and fileSize.
---Source: lua/ge/extensions/ui/liveries/saves.lua:36
---@return table[]  Array of entries {name, location, created, modified, fileSize}.
function ui_liveries_saves.getAll() end

--- Returns the name of the last save loaded or saved in this editing session.
---Source: lua/ge/extensions/ui/liveries/saves.lua:111
---@return string|nil  nil for a new unsaved livery.
function ui_liveries_saves.getCurrentSaveName() end

--- Extracts the save name (without folder or .dynDecals.json extension) from a file path.
---Source: lua/ge/extensions/ui/liveries/saves.lua:19
---@param file string Full path of a save file.
---@return string  Name without extension.
function ui_liveries_saves.getFilename(file) end

--- Loads a save into the editor via editor_api_dynamicDecals.loadLayerStackFromFile (called under pcall). Sets the current save and clears the staged skin.
---Source: lua/ge/extensions/ui/liveries/saves.lua:163
---@param filename string Name without extension (validated).
---@return boolean  true if loading succeeded.
function ui_liveries_saves.load(filename) end

--- Renames a save. Fails if the new name is invalid, the old file does not exist, the new name is already taken or the rename fails. Updates the current save name if it was this file.
---Source: lua/ge/extensions/ui/liveries/saves.lua:62
---@param filename string Current name.
---@param newFilename string New name (validated).
---@return boolean  true if the rename succeeded.
function ui_liveries_saves.rename(filename, newFilename) end

--- Saves the livery: refuses a name that is invalid or already taken by a save other than the current one, requires a player vehicle, writes the layer stack then exports the skin (exportSkin) under the same name. Then sets the current save and, if applySkin is true, stages the skin for when the editor exits.
---Source: lua/ge/extensions/ui/liveries/saves.lua:137
---@param filename string Name without extension (validated).
---@param applySkin boolean|nil If true, the exported skin will be applied when the editor exits (see consumeStagedApplySkin).
---@return string|boolean  Path of the written file, or false on failure (invalid name, duplicate, no vehicle).
function ui_liveries_saves.save(filename, applySkin) end

