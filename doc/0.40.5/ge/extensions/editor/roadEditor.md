# `editor_roadEditor`

*File: `lua/ge/extensions/editor/roadEditor.lua` · VM: Game Engine (GE) · 2367 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadEditor`: `extensions.load("editor_roadEditor")`, then the global `editor_roadEditor`

Decal road (DecalRoad) editor of the World Editor: "Edit Road" edit mode (create_road_decal icon) to create roads (Alt + left click), select roads and nodes (Ctrl for multi-selection, Ctrl+Shift+drag for rectangle selection), move nodes, adjust width, duplicate, copy/paste properties, delete, with undo history. It also registers the "roadEditor.general.*" preferences and a material filter for DecalRoad (tag "RoadAndPath"). The file is very long (about 2,400 lines): almost everything is local; only a few hooks and one function are exported.

## Notes

- Almost all the logic (creation, selection, undo/redo, node gizmos, debugDrawer drawing) is local to the file and hooked to the editor.editModes.roadEditMode edit mode; it cannot be called from outside.
- Registered preferences (roadEditor/general category): defaultWidth (10), dragWidth, aiRoadsSelectable, nonAiRoadsSelectable, overObjects, highlightNearbyRoads, highlightNearbyRoadsDistance (100 m, 0 to 10000), columnSizes (hidden).
- The updateDecalRoadsOnStaticMeshTransform preference is commented out in the preferences list, but the code still calls editor.getPreference('roadEditor.general.updateDecalRoadsOnStaticMeshTransform') (in onEditorInitialized): the value read does not exist (inferred from code).
- Roads located in a packed prefab are not editable: a modal window "Select and edit not allowed when road is inside packed prefab!" is displayed.
- The module reads extensions.editor_roadRiverGui when loaded (local roadRiverGui): this extension must exist at that moment.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadEditor.cycleHoveredRoadsAM(value)` | Called by the "RoadEditor" action map: cycles the choice among the overlapping hovered roads. 1 moves to the next road, 0 to the previous (looping). No effect if there is no hovered road. | 2150 |
| `editor_roadEditor.onEditorInitialized()` | Hook called when the editor initializes: creates the "Edit Road" edit mode with its shortcuts (LMB+Alt create/add a node, Ctrl+LMB multi-selection, Ctrl+Shift+drag rectangle selection, copy/paste/duplicate), registers the DecalRoad material filter, the error modal window, the road templates window, reloads the templates (editor_roadUtils.reloadTemplates) and applies the updateDecalRoadsOnStaticMeshTransform preference if the C++ API exists. *(internal)* *(hook)* | 2315 |
| `editor_roadEditor.onEditorInspectorHeaderGui(inspectorInfo)` | Hook called when the inspector draws its header. If the "Edit Road" mode is active, adds the position and width fields of the selected nodes (multi-edit when all values are equal) with recording in the history. *(internal)* *(hook)* | 1213 |
| `editor_roadEditor.onEditorObjectSelectionChanged()` | Hook called when the editor's object selection changes. If the "Edit Road" mode is active, finishes the road being created (if no selection), rebuilds the list of selected DecalRoads and only keeps the selected nodes of the roads that are still selected. *(internal)* *(hook)* | 2275 |
| `editor_roadEditor.onEditorPreferenceValueChanged(path, value)` | Hook called when a preference changes. For roadEditor.general.updateDecalRoadsOnStaticMeshTransform, passes the value to worldEditorCppApi.setUpdateDecalRoadsOnStaticMeshTransform (if available). *(internal)* *(hook)* | 2220 |
| `editor_roadEditor.onEditorRegisterPreferences(prefsRegistry)` | Hook called to register the preferences: creates the "roadEditor" category and the "general" subcategory with its settings (see notes). *(internal)* *(hook)* | 2226 |
| `editor_roadEditor.onExtensionLoaded()` | Hook called when the extension is loaded; only writes an "initialized" log (level D). *(internal)* *(hook)* | 2072 |
| `editor_roadEditor.onPreRender()` | Hook called before the rendering of each frame; returns immediately if the "Edit Road" mode is not active and does nothing else (empty body). *(internal)* *(hook)* | 2077 |

### Parameter details

#### `editor_roadEditor.cycleHoveredRoadsAM(value)`

Called by the "RoadEditor" action map: cycles the choice among the overlapping hovered roads. 1 moves to the next road, 0 to the previous (looping). No effect if there is no hovered road.

- `value` (*integer*) : 1 = next, 0 = previous.

#### `editor_roadEditor.onEditorInspectorHeaderGui(inspectorInfo)`

Hook called when the inspector draws its header. If the "Edit Road" mode is active, adds the position and width fields of the selected nodes (multi-edit when all values are equal) with recording in the history.

- `inspectorInfo` (*table*) : Inspector information supplied by the editor (inferred from code).

#### `editor_roadEditor.onEditorPreferenceValueChanged(path, value)`

Hook called when a preference changes. For roadEditor.general.updateDecalRoadsOnStaticMeshTransform, passes the value to worldEditorCppApi.setUpdateDecalRoadsOnStaticMeshTransform (if available).

- `path` (*string*) : Preference path.
- `value` (*any*) : New value.

#### `editor_roadEditor.onEditorRegisterPreferences(prefsRegistry)`

Hook called to register the preferences: creates the "roadEditor" category and the "general" subcategory with its settings (see notes).

- `prefsRegistry` (*table*) : Editor preferences registry.

## Calls into the engine (C++)

- `Engine.` `sceneGetCameraFrustum`
- `FS:` `fileExists`
- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`, `drawTriSolid`
- `scenetree.` `decalRoadContainsPoint`, `findObjectById`
- `worldEditorCppApi.` `setUpdateDecalRoadsOnStaticMeshTransform`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadEditor.lua`.*
