---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/fileDialog.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor ImGui file dialog (open / save a file or choose a folder) on the game's virtual file system (FS). It offers navigation, recent folders, favorites, column sorting, search, file type filters, image preview (jpg, jpeg, png, dds), folder creation and overwrite confirmation. An editor tool modder calls it via openFile / saveFile with a callback.
--- Access: extension `editor_fileDialog`: `extensions.load("editor_fileDialog")`, then the global `editor_fileDialog`
---@class editor_fileDialog
editor_fileDialog = {}

--- Editor activation hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/fileDialog.lua:918
function editor_fileDialog.onEditorActivated() end

--- Editor deactivation hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/fileDialog.lua:921
function editor_fileDialog.onEditorDeactivated() end

--- Hook called every editor GUI frame: draws the "fileDialog" window if it is visible (hides it if no file cache exists), plus the smart search window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/fileDialog.lua:409
function editor_fileDialog.onEditorGui() end

--- Hook called at editor initialization: registers the windows (fileDialog 640x480, recentDirsWindow, smartSearchItems), the image icons, restores column visibility and hides the window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/fileDialog.lua:924
function editor_fileDialog.onEditorInitialized() end

--- Hook called to declare the preferences of the "files / fileDialog" category.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/fileDialog.lua:956
---@param prefsRegistry table Editor preferences registry.
function editor_fileDialog.onEditorRegisterPreferences(prefsRegistry) end

--- Extension load hook; empty.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/fileDialog.lua:915
function editor_fileDialog.onExtensionLoaded() end

--- Opens the dialog in "Open" mode. Calls callbackFn with the information of the chosen file (or folder).
---Source: lua/ge/extensions/editor/fileDialog.lua:907
---@param callbackFn function function(data); data = {path, action, filename, filepath, filetype}.
---@param filenameSuffix table|nil Filters {{label, pattern}, ...}; default {{"Any files", "*"}}. Ignored if selectFolder.
---@param selectFolder boolean|nil true to choose a folder.
---@param defaultPath string|nil Starting folder (default "/").
---@param preview boolean|nil Show a file preview.
---@param caseSensitivePattern boolean|nil Case-sensitive pattern filter.
---@return boolean  true if the dialog opens, false if already open or invalid callback.
function editor_fileDialog.openFile(callbackFn, filenameSuffix, selectFolder, defaultPath, preview, caseSensitivePattern) end

--- Opens the dialog in "Save" mode (no preview). Appends the extension of the chosen filter to the typed name if missing and asks for confirmation on overwrite.
---Source: lua/ge/extensions/editor/fileDialog.lua:911
---@param callbackFn function function(data), same format as openFile.
---@param filenameSuffix table|nil Filters {{label, pattern}, ...}.
---@param selectFolder boolean|nil true to choose a folder.
---@param defaultPath string|nil Starting folder.
---@param overwriteDialogText string|nil Overwrite confirmation text (default: "Are you sure you want to overwrite this file").
---@return boolean  true if the dialog opens.
function editor_fileDialog.saveFile(callbackFn, filenameSuffix, selectFolder, defaultPath, overwriteDialogText) end

