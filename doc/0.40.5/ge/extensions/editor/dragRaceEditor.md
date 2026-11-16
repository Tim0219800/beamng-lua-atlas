# `editor_dragRaceEditor`

*File: `lua/ge/extensions/editor/dragRaceEditor.lua` · VM: Game Engine (GE) · 286 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dragRaceEditor`: `extensions.load("editor_dragRaceEditor")`, then the global `editor_dragRaceEditor`

Main window of the drag race editor (Gameplay > Drag Race Editor menu). It assembles the dragRaceEditor/* submodules: list of strips and settings files (dragSettings) on the left, details of the selected strip or settings on the right. It also registers the "Edit Drag Zone" edit mode to edit zones (strip or lane) in the 3D view. On first display in a level, it loads all strips and settings.

## Notes

- The File menu offers Save All (saves only the items marked _dirty), Clear All (removes unsaved items from the list) and Refresh Editor (reloads everything from disk).
- In Edit Drag Zone mode: Shift+left click adds a vertex, Alt+click inserts a vertex between two, Ctrl+click selects several vertices.
- M.selectStrip is a reference to strips.selectStrip taken at module load.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dragRaceEditor.onDeserialized(data)` | Hook called after reload: restores the state returned by onSerialize (default values -1 for the indices). *(internal)* *(hook)* | 212 |
| `editor_dragRaceEditor.onEditorGui()` | Hook called every frame by the editor: synchronizes the zone editor, draws the window (menu, lists, details) and the 3D preview of the strips. Loads the strips and settings only once if a level is loaded. *(internal)* *(hook)* | 228 |
| `editor_dragRaceEditor.onEditorInitialized()` | Editor hook: registers the window (1800x900), the menu entry, creates empty drag data if needed and declares the edit mode editor.editModes.dragZoneEditMode. *(internal)* *(hook)* | 178 |
| `editor_dragRaceEditor.onSerialize()` | Hook called before a reload of the Lua extensions: returns the current folder/file name, the drag data, the unsaved changes flag and the selected strip/settings indices. *(internal)* *(hook)* | 201 |
| `editor_dragRaceEditor.show()` | Clears the editor object selection and shows the "Drag Race Editor" window. | 223 |

### Parameter details

#### `editor_dragRaceEditor.onDeserialized(data)`

Hook called after reload: restores the state returned by onSerialize (default values -1 for the indices).

- `data` (*table|nil*) : Table produced by onSerialize.

#### `editor_dragRaceEditor.onSerialize()`

Hook called before a reload of the Lua extensions: returns the current folder/file name, the drag data, the unsaved changes flag and the selected strip/settings indices.

- **returns**: table currentFileDir, currentFileName, dragRaceData, hasUnsavedChanges, selectedStripIndex, selectedSettingsIndex

## Fields

| Field | Type | Description |
|---|---|---|
| `selectStrip` | function | Alias of strips.selectStrip (selects a strip by index in the editor). |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dragRaceEditor.lua`.*
