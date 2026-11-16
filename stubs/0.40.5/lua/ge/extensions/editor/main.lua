---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/main.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Core of the World Editor: defines the global `editor` (editor = M). It loads all the extensions in lua/ge/extensions/editor/ (those containing "M.onEditor" or "M.onExtension", except editor_main), initializes the editor/api/* modules, manages the preferences (settings/editor/preferences.json), the state (settings/editor/currentState.json) and the activation/deactivation of the editor (free camera, action maps, hidden CEF, layout, audio). The other editor extensions add their functions to the `editor` table.
--- Access: extension `editor_main`: `extensions.load("editor_main")`, then the global `editor_main`
---@class editor_main
---@field active boolean True when the editor is active (open).
---@field additionalActionMaps table Additional action maps pushed when the editor is activated and popped when it is deactivated.
---@field allExtensionNames table<integer, string> Short names of all the editor extensions found on disk.
---@field dependencies table<integer, string> {"core_camera"}.
---@field extensionNames table<integer, string> Names (editor_xxx) of the editor extensions currently loaded.
---@field initialized boolean True when the editor extensions are loaded and initialized.
---@field preferencesRegistry any Preferences registry (editor/api/preferencesRegistry).
---@field safeMode boolean|nil True if the editor was launched in safe mode.
editor_main = {}

--- Loads and initializes the editor/api/* modules (gui, core, assets, camera, dataBlock, decal, gizmo, material, navigation, object, roadRiver, sketch, terrain, forest, proceduralContentGenerator), then emits onEditorModulesInitialized. No effect if already done.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/main.lua:294
function editor_main.initializeModules() end

--- Returns whether the editor is active.
---Source: lua/ge/extensions/editor/main.lua:594
---@return boolean  editor.active.
function editor_main.isEditorActive() end

--- Hot-loads an editor extension: registers its preferences, then calls its onEditorRegisterApi, onEditorInitialized and onEditorActivated.
---Source: lua/ge/extensions/editor/main.lua:140
---@param name string Extension name, e.g. "editor_myTool".
---@return table|nil  The extension table, or nil if loading failed.
function editor_main.loadEditorExtension(name) end

--- Loads several editor extensions at once (preferences registered first, then RegisterApi/Initialized/Activated hooks for each).
---Source: lua/ge/extensions/editor/main.lua:171
---@param names table<integer, string> Extension names.
function editor_main.loadEditorExtensions(names) end

--- Reads settings/editor/extensions.json into editor.extensionsSettings (empty table if absent).
---Source: lua/ge/extensions/editor/main.lua:85
function editor_main.loadExtensionsSettings() end

--- Reloads the preferences from settings/editor/preferences.json, defines editor.setPreference/getPreference and migrates the old preferences.
---Source: lua/ge/extensions/editor/main.lua:74
function editor_main.loadPreferences() end

--- Reads the editor state file (warns if the format version differs).
---Source: lua/ge/extensions/editor/main.lua:368
---@param filePath string|nil Source file; settings/editor/currentState.json by default.
---@return table  The state read, or an empty table.
function editor_main.loadState(filePath) end

--- Writes an Info-level message to the log, tag "editor".
---Source: lua/ge/extensions/editor/main.lua:50
---@param msg string Message.
function editor_main.log(msg) end

--- Debug-level message, tag "editor".
---Source: lua/ge/extensions/editor/main.lua:54
---@param msg string Message.
function editor_main.logDebug(msg) end

--- Error-level message, tag "editor".
---Source: lua/ge/extensions/editor/main.lua:58
---@param msg string Message.
function editor_main.logError(msg) end

--- Log alias (Info level, tag "editor").
---Source: lua/ge/extensions/editor/main.lua:50
---@param msg string Message.
function editor_main.logInfo(msg) end

--- Warning-level message, tag "editor".
---Source: lua/ge/extensions/editor/main.lua:62
---@param msg string Message.
function editor_main.logWarn(msg) end

--- Called at the end of a level: saves the state, shows the apps again (ShowApps), offers to save if modified, then shutdown().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/main.lua:623
function editor_main.onClientEndMission() end

--- Called when a level starts: sets initialized and modulesInitialized back to false and reapplies the current active state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/main.lua:608
function editor_main.onClientStartMission() end

--- Called after a Lua reload: restores active/dirty/headless/edit mode and exposes the data in editor_main.serializedData.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/main.lua:733
---@param data table Table returned by onSerialize.
function editor_main.onDeserialized(data) end

--- Called when the game exits: sets editor.active to false and saves the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/main.lua:678
function editor_main.onExit() end

--- Load hook. Empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/main.lua:683
function editor_main.onExtensionLoaded() end

--- Called on unload: editor.shutdown().
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/main.lua:686
function editor_main.onExtensionUnloaded() end

--- Called on the first update: reactivates the editor if it was active before the reload, and opens it automatically if the game was launched with -worldEditor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/main.lua:747
function editor_main.onFirstUpdate() end

--- Called before the game exits. Empty body.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/main.lua:620
function editor_main.onPreExit() end

--- Called before the game window closes: editor.checkDirtyAndSave() if available.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/main.lua:614
function editor_main.onPreWindowClose() end

--- Called before a Lua reload: saves the camera, active state, dirty, headless, edit mode, window positions and the cleanExit preference; deactivates the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/main.lua:690
---@return table  Data handed back to onDeserialized.
function editor_main.onSerialize() end

--- Called every frame: processes the activation/deactivation request (shows the editorSplash.png loading image for 3 frames, then applies).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/main.lua:634
function editor_main.onUpdate() end

--- Writes editor.extensionsSettings to settings/editor/extensions.json.
---Source: lua/ge/extensions/editor/main.lua:89
function editor_main.saveExtensionsSettings() end

--- Writes the preferences to settings/editor/preferences.json.
---Source: lua/ge/extensions/editor/main.lua:81
function editor_main.savePreferences() end

--- Saves the editor state: emits onEditorSaveState(state) then writes the JSON. No effect if the editor was not initialized in this session.
---Source: lua/ge/extensions/editor/main.lua:356
---@param filePath string|nil Target file; settings/editor/currentState.json by default.
function editor_main.saveState(filePath) end

--- Requests the activation or deactivation of the editor; applied in onUpdate after a few splash frames.
---Source: lua/ge/extensions/editor/main.lua:587
---@param activate boolean true to open, false to close.
---@param safeMode boolean|nil true to start in safe mode.
function editor_main.setEditorActive(activate, safeMode) end

--- Closes the editor, emits onEditorShutdown, unloads all the editor extensions and sets initialized/active back to false.
---Source: lua/ge/extensions/editor/main.lua:598
function editor_main.shutdown() end

--- Toggles the editor's active state (via setEditorActive).
---Source: lua/ge/extensions/editor/main.lua:674
---@param safeMode boolean|nil Safe mode on opening.
function editor_main.toggleActive(safeMode) end

--- Unloads a loaded editor extension: calls its onEditorDeactivated then onEditorShutdown, then extensions.unload.
---Source: lua/ge/extensions/editor/main.lua:213
---@param extName string Name of the loaded extension.
function editor_main.unloadEditorExtension(extName) end

---@type any
editor = nil
