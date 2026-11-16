# `editor_shapeEditor`

*File: `lua/ge/extensions/editor/shapeEditor.lua` · VM: Game Engine (GE) · 985 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_shapeEditor`: `extensions.load("editor_shapeEditor")`, then the global `editor_shapeEditor`

World editor Shape Editor: a window that previews a 3D model (.dae and others) through the C++ ShapePreview object, with an orbital camera and several tabs (Details, Render, Nodes, Sequence, Material, Imposter, and LOD WIP if createMeshLOD exists). It can export to Collada or Wavefront obj, read the nodes, animation sequences and materials, manage the imposter and generate LODs. The mesh constructor settings are stored in a .cs file next to the model ('//JSON:' prefix). A modder uses it to inspect a TSStatic or an asset.

## Example

```lua
extensions.editor_shapeEditor.showShapeEditorLoadFile('/levels/GridMap/art/shapes/buildings/busstop_grid.dae')
```

## Notes

- The window menu is in the 'Assets' group; the window shows 'too small' if its render area is smaller than 150 px.
- The 'Open in Shape Editor' button is added to the inspector header for a selected TSStatic.
- Preference shapeEditor.general.autoOpenSelectedObject (bool, true by default): automatically loads the model of the selected TSStatic if the window is visible.
- showShapeEditorLoadFile does not stop when the file does not exist: it logs 'File doesn't exist' then keeps loading.
- Some buttons (dumpShapeInfo, getTSShapeInfo) only appear if beamng_buildtype equals INTERNAL.
- onPreRender is commented out in the public interface: rendering is done in onEditorGui when the area is marked dirty.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_shapeEditor.onDeserialized(data)` | Restore hook after a Lua reload: recreates ShapePreview, reloads the model and the highlight material. *(internal)* *(hook)* | 927 |
| `editor_shapeEditor.onEditorDeactivated()` | Hook called when the editor is deactivated: restores the preview material and removes the highlight material. *(internal)* *(hook)* | 962 |
| `editor_shapeEditor.onEditorExitLevel()` | Hook called when leaving the level: clears the preview shape. *(internal)* *(hook)* | 938 |
| `editor_shapeEditor.onEditorGui()` | Draw hook called every frame: draws the window, the 3D render and the tabs. *(internal)* *(hook)* | 436 |
| `editor_shapeEditor.onEditorInitialized()` | Editor initialization hook: creates ShapePreview, adds the 'Shape Editor' menu entry (Assets group) and registers the window (800x600). *(internal)* *(hook)* | 67 |
| `editor_shapeEditor.onEditorInspectorHeaderGui(inspectorInfo)` | Hook called to draw the inspector header: adds the 'Open in Shape Editor' button for the first selected object if it is of class TSStatic. *(internal)* *(hook)* | 899 |
| `editor_shapeEditor.onEditorObjectSelectionChanged()` | Hook called when the selection changes: if the window is visible and the autoOpenSelectedObject preference is enabled, loads the model of the selected TSStatic. *(internal)* *(hook)* | 942 |
| `editor_shapeEditor.onEditorRegisterPreferences(prefsRegistry)` | Hook: registers the shapeEditor category and the general.autoOpenSelectedObject preference. *(internal)* *(hook)* | 952 |
| `editor_shapeEditor.onSerialize()` | Serialization hook (Lua reload): returns meshFile and highlightMaterialName. *(internal)* *(hook)* | 920 |
| `editor_shapeEditor.showShapeEditorLoadFile(filename)` | Loads a model into the preview: sets it in ShapePreview, resets the orbit, shows the window, reads the shape info (details/LODs, sequences), the mesh constructor .cs file and the imposter settings. | 907 |

### Parameter details

#### `editor_shapeEditor.onDeserialized(data)`

Restore hook after a Lua reload: recreates ShapePreview, reloads the model and the highlight material.

- `data` (*table*) : Data returned by onSerialize.

#### `editor_shapeEditor.onEditorInspectorHeaderGui(inspectorInfo)`

Hook called to draw the inspector header: adds the 'Open in Shape Editor' button for the first selected object if it is of class TSStatic.

- `inspectorInfo` (*table*) : Inspector info; its selection.object key contains the selected ids.

#### `editor_shapeEditor.onEditorRegisterPreferences(prefsRegistry)`

Hook: registers the shapeEditor category and the general.autoOpenSelectedObject preference.

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_shapeEditor.onSerialize()`

Serialization hook (Lua reload): returns meshFile and highlightMaterialName.

- **returns**: table {meshFile, highlightMaterialName}.

#### `editor_shapeEditor.showShapeEditorLoadFile(filename)`

Loads a model into the preview: sets it in ShapePreview, resets the orbit, shows the window, reads the shape info (details/LODs, sequences), the mesh constructor .cs file and the imposter settings.

- `filename` (*string*) : Path of the 3D model, e.g. /levels/.../x.dae.

## Calls into the engine (C++)

- `FS:` `fileExists`, `removeFile`
- `obj:` `deleteObject`, `getClassName`, `getModelFile`
- `scenetree.` `findObject`, `findObjectById`
- `ui_imgui.` `GetIO`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/shapeEditor.lua`.*
