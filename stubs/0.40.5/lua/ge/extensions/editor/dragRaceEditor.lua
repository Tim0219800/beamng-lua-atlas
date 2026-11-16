---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/dragRaceEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Main window of the drag race editor (Gameplay > Drag Race Editor menu). It assembles the dragRaceEditor/* submodules: list of strips and settings files (dragSettings) on the left, details of the selected strip or settings on the right. It also registers the "Edit Drag Zone" edit mode to edit zones (strip or lane) in the 3D view. On first display in a level, it loads all strips and settings.
--- Access: extension `editor_dragRaceEditor`: `extensions.load("editor_dragRaceEditor")`, then the global `editor_dragRaceEditor`
---@class editor_dragRaceEditor
---@field selectStrip function Alias of strips.selectStrip (selects a strip by index in the editor).
editor_dragRaceEditor = {}

--- Hook called after reload: restores the state returned by onSerialize (default values -1 for the indices).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor.lua:212
---@param data table|nil Table produced by onSerialize.
function editor_dragRaceEditor.onDeserialized(data) end

--- Hook called every frame by the editor: synchronizes the zone editor, draws the window (menu, lists, details) and the 3D preview of the strips. Loads the strips and settings only once if a level is loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor.lua:228
function editor_dragRaceEditor.onEditorGui() end

--- Editor hook: registers the window (1800x900), the menu entry, creates empty drag data if needed and declares the edit mode editor.editModes.dragZoneEditMode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor.lua:178
function editor_dragRaceEditor.onEditorInitialized() end

--- Hook called before a reload of the Lua extensions: returns the current folder/file name, the drag data, the unsaved changes flag and the selected strip/settings indices.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/dragRaceEditor.lua:201
---@return table  currentFileDir, currentFileName, dragRaceData, hasUnsavedChanges, selectedStripIndex, selectedSettingsIndex
function editor_dragRaceEditor.onSerialize() end

--- Clears the editor object selection and shows the "Drag Race Editor" window.
---Source: lua/ge/extensions/editor/dragRaceEditor.lua:223
function editor_dragRaceEditor.show() end

