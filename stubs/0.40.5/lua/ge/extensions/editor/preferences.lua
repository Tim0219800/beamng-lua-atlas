---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/preferences.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Preferences" window of the world editor. It displays on the left the list of pages (categories of the editor.preferencesRegistry registry) and on the right the preferences of the chosen page via a valueInspector, with a search filter and a "Reset All To Defaults" button. The module also registers the general, camera and ui categories with their default preferences (UI scale, free camera speed, etc.) and reacts to value changes. An editor tool modder can open the window with editor.showPreferences(category).
--- Access: extension `editor_preferences`: `extensions.load("editor_preferences")`, then the global `editor_preferences`
---@class editor_preferences
editor_preferences = {}

--- Called when the extension is reloaded (after a Lua reload) with the saved state; restores the current preferences page (currentCategoryName).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/preferences.lua:435
---@param state table Table returned by onSerialize ({currentCategoryName}).
function editor_preferences.onDeserialized(state) end

--- Called when the editor opens; applies the UI scale from the ui.general.scale preference.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/preferences.lua:447
function editor_preferences.onEditorActivated() end

--- Called when the editor closes; sets the UI scale back to 1 and, if the camera.general.setVehicleCameraWhenExitingEditor preference is true (and it is not the game's free camera nor editor.skipCameraOnExit), switches back to the game camera.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/preferences.lua:439
function editor_preferences.onEditorDeactivated() end

--- Called every frame by the editor. Draws the Preferences window: list of pages, search, page content (or all pages if "All") and the reset button.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/preferences.lua:237
function editor_preferences.onEditorGui() end

--- Registers the window (800x600), configures the valueInspector (name "preferencesInspector", class "Preferences", write callback via editor.setPreference), builds the pages and installs editor.showPreferences and editor.updatePreferencePages.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/preferences.lua:408
function editor_preferences.onEditorInitialized() end

--- Called when a preference changes. Immediately applies some values: ui.general.scale / dpiAware (UI scale), iconButtonSize, showCompleteSceneTree (refreshes the scene tree), and the free camera settings (speed, movement and rotation smoothing).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/preferences.lua:321
---@param path string Preference path, e.g. "camera.general.freeCameraMoveSpeed".
---@param value any New value.
function editor_preferences.onEditorPreferenceValueChanged(path, value) end

--- Called when preferences are registered: declares the categories general, camera, ui ("User Interface") and their subcategories with default values, descriptions and bounds.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/preferences.lua:341
---@param prefsRegistry table Editor preferences registry (registerCategory, registerSubCategory).
function editor_preferences.onEditorRegisterPreferences(prefsRegistry) end

--- Called when the extension loads; does nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/preferences.lua:309
function editor_preferences.onExtensionLoaded() end

--- Called before a Lua reload; returns {currentCategoryName = ...} to keep the displayed page.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/preferences.lua:431
---@param state table Not used.
---@return table  State to save.
function editor_preferences.onSerialize(state) end

--- The global editor table (not created here): the module installs two functions in it during onEditorInitialized.
---@class editor_preferences_editor
local editor_preferences_editor = {}

--- Opens the Preferences window. If categoryName is given, selects that page.
---Source: lua/ge/extensions/editor/preferences.lua:304
---@param categoryName string|nil Category name (e.g. "ui", "camera", "all").
function editor_preferences_editor.showPreferences(categoryName) end

--- Rebuilds the page list from the registry: registers the "general" category, keeps only categories with at least one non-hidden item, and adds the "All" page.
---Source: lua/ge/extensions/editor/preferences.lua:386
function editor_preferences_editor.updatePreferencePages() end

