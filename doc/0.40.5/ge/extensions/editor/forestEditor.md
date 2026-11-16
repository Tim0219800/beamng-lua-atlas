# `editor_forestEditor`

*File: `lua/ge/extensions/editor/forestEditor.lua` · VM: Game Engine (GE) · 3222 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_forestEditor`: `extensions.load("editor_forestEditor")`, then the global `editor_forestEditor`

"Edit Forest" tool of the world editor: painting and editing of forest objects (ForestItem) with brushes (ForestBrush/ForestBrushElement brushes), selection, move, rotate, scale and terrain snapping tools. It also manages the ForestItemData inspector (mesh preview via ShapePreview), saving of the brushes (main.forestbrushes4.json) and of the forest when the level is saved. A modder mostly uses it to select items by script or change the brush size.

## Example

```lua
extensions.load('editor_forestEditor')
editor_forestEditor.selectToolByName('select')
editor_forestEditor.changeBrush(1, 0.5) -- enlarges the brush (or the pressure if Ctrl is held)
```

## Notes

- "Parallax window" items (parallax interior windows) are filtered: they belong to the Parallax Interior editor and are excluded from the selection and from the ForestItemData palette.
- The registered edit mode is called "Edit Forest" (actionMap forestTools). The preferences are in the forestEditor.general category (brushSize, brushPressure, brushHardness, brushDepthOffset, forceAlignToTerrain, snapAnyForestItemType, toolWorkingDistance 1000 to 50000 m, keyboard/wheel resize steps).
- Probable bug in onEditorInspectorFieldChanged: the condition `object and object:getClassName() == 'ForestBrushElement' or object:getClassName() == 'ForestBrush'` has incorrect operator precedence; if the object is nil, the second term calls a method on nil and raises an error.
- refreshForestItemDataList and selectBrushByIndex depend on the internal state (var) initialized by onEditorInitialized; do not call them before the editor is initialized.
- The module exports onDeserialize (without "d") while other modules use onDeserialized; here it just sets deserializeBrushes to false.

**Dependencies (loaded first):** `core_forest`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_forestEditor.beginChangeBrushSizeWithKeys(direction)` | Enables auto-repeat of the brush resize with the keyboard (keys [ ]): resets the timer to 0 and stores the direction. The per-frame update then calls changeBrush at the interval of the brushSizeChangeIntervalWithKeys preference. | 3215 |
| `editor_forestEditor.changeBrush(value, step)` | Changes the brush size, or its pressure (density) if the Ctrl key is held. The values are clamped then applied to the brush tool. | 1425 |
| `editor_forestEditor.clearForestItemsSelection()` | Clears the forest item selection, including the highlight in the viewport: sets each item's "selected" state to false then requests the rebuild of the instance data. Does nothing (no rebuild) if nothing is selected. | 208 |
| `editor_forestEditor.dumpBrushProperties()` | Debug: prints the size, pressure and hardness of the current brush to the console. | 144 |
| `editor_forestEditor.dumpForestBrushes()` | Debug: prints the list of forest brushes (var.forestBrushes) to the console. | 132 |
| `editor_forestEditor.dumpForestBrushesMap()` | Debug: prints the forest brush lookup table (var.forestBrushesMap) to the console. | 138 |
| `editor_forestEditor.endChangeBrushSizeWithKeys()` | Stops the auto-repeat of the brush resize with the keyboard and resets the timer to 0. | 3216 |
| `editor_forestEditor.onDeserialize(data)` | Hook called after a Lua reload (receives the data returned by onSerialize). Simply sets deserializeBrushes to false. *(internal)* *(hook)* | 3192 |
| `editor_forestEditor.onEditorAfterSaveLevel()` | Hook called after the level is saved. Saves the ForestBrushGroups to <level>/main.forestbrushes4.json if the brushes are modified, saves the forest (saveForest) if editor.forestDirty, and saves the modified ForestItemData datablocks. *(internal)* *(hook)* | 3111 |
| `editor_forestEditor.onEditorAxisGizmoAligmentChanged()` | Hook called when the axis gizmo alignment changes (local/world). Places the gizmo on the item (local alignment, single item) or on the selection centroid. The name contains the typo "Aligment" as in the engine. *(internal)* *(hook)* | 2881 |
| `editor_forestEditor.onEditorAxisGizmoModeChanged(mode)` | Hook called when the gizmo mode (move/rotate/scale) changes. If the active edit mode is "Edit Forest" and the current tool is not "select", switches to the "select" tool. *(internal)* *(hook)* | 3179 |
| `editor_forestEditor.onEditorGui()` | Hook called every frame by the editor: draws the tool window (toolbar, brush and ForestItemData palettes, inspector), handles inputs and the rendering of helpers (lines, spheres, bounding boxes). *(internal)* *(hook)* | 2040 |
| `editor_forestEditor.onEditorInitialized()` | Hook called at editor initialization: registers the "forestEditor" window, two modal dialogs, the forestItem type inspector, the custom field editors (shapeFile, ForestItemData) and the "Edit Forest" edit mode; then initializes brush, pressure, hardness and datablock tables. *(internal)* *(hook)* | 3073 |
| `editor_forestEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)` | Hook called when an inspector field is modified. Marks the brushes as modified (ForestBrush/ForestBrushElement) and updates the mesh preview when the shapeFile of a ForestItemData or the forestItemData of a ForestBrushElement changes. Only handles the case of a single selected object. *(internal)* *(hook)* | 3133 |
| `editor_forestEditor.onEditorRegisterPreferences(prefsRegistry)` | Hook called to declare the editor preferences: forestEditor category, general subcategory (size, pressure/density, hardness, depth offset, forced terrain alignment, snapping of all types, working distance). *(internal)* *(hook)* | 3159 |
| `editor_forestEditor.onSerialize()` | Hook called before a Lua reload: clears the item selection then returns true so that onDeserialize is triggered afterwards. *(internal)* *(hook)* | 3196 |
| `editor_forestEditor.refreshForestItemDataList()` | Rebuilds the var.forestItemData list from all ForestItemData class objects in the scene, excluding parallax window datablocks. | 1459 |
| `editor_forestEditor.selectBrushByIndex(index)` | Selects the brush tool of the given index in var.brushes (Lua index, starting at 1). | 3188 |
| `editor_forestEditor.selectForestItems(forestItems, addToSelection)` | Sets (or extends) the editor's forest item selection. Filters the parallax items, updates the highlight, the centroid, the axis gizmo and the mesh preview of the last item. | 219 |
| `editor_forestEditor.selectToolByName(toolName)` | Activates a toolbar tool or brush from its label (for example "select"). Does nothing if no label matches. | 367 |

### Parameter details

#### `editor_forestEditor.beginChangeBrushSizeWithKeys(direction)`

Enables auto-repeat of the brush resize with the keyboard (keys [ ]): resets the timer to 0 and stores the direction. The per-frame update then calls changeBrush at the interval of the brushSizeChangeIntervalWithKeys preference.

- `direction` (*number*) : Direction of the change (positive enlarges, negative shrinks); passed as is to changeBrush

#### `editor_forestEditor.changeBrush(value, step)`

Changes the brush size, or its pressure (density) if the Ctrl key is held. The values are clamped then applied to the brush tool.

- `value` (*number*) : Direction/multiplier of the change (inferred from code)
- `step` (*number*) : Step applied (units of the corresponding preference)

#### `editor_forestEditor.onDeserialize(data)`

Hook called after a Lua reload (receives the data returned by onSerialize). Simply sets deserializeBrushes to false.

- `data` (*any*) : Value returned by onSerialize (true)

#### `editor_forestEditor.onEditorAxisGizmoModeChanged(mode)`

Hook called when the gizmo mode (move/rotate/scale) changes. If the active edit mode is "Edit Forest" and the current tool is not "select", switches to the "select" tool.

- `mode` (*integer*) : New gizmo mode (not used)

#### `editor_forestEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex)`

Hook called when an inspector field is modified. Marks the brushes as modified (ForestBrush/ForestBrushElement) and updates the mesh preview when the shapeFile of a ForestItemData or the forestItemData of a ForestBrushElement changes. Only handles the case of a single selected object.

- `selectedIds` (*integer[]*) : Ids of the objects selected in the inspector
- `fieldName` (*string*) : Name of the modified field
- `fieldValue` (*any*) : New value
- `arrayIndex` (*integer|nil*) : Index in the array field (not used)

#### `editor_forestEditor.onEditorRegisterPreferences(prefsRegistry)`

Hook called to declare the editor preferences: forestEditor category, general subcategory (size, pressure/density, hardness, depth offset, forced terrain alignment, snapping of all types, working distance).

- `prefsRegistry` (*table*) : Editor preferences registry

#### `editor_forestEditor.onSerialize()`

Hook called before a Lua reload: clears the item selection then returns true so that onDeserialize is triggered afterwards.

- **returns**: boolean Always true

#### `editor_forestEditor.selectBrushByIndex(index)`

Selects the brush tool of the given index in var.brushes (Lua index, starting at 1).

- `index` (*integer*) : Index in the brush list

#### `editor_forestEditor.selectForestItems(forestItems, addToSelection)`

Sets (or extends) the editor's forest item selection. Filters the parallax items, updates the highlight, the centroid, the axis gizmo and the mesh preview of the last item.

- `forestItems` (*table|nil*) : List of forest items; nil to only deselect
- `addToSelection` (*boolean|nil*) : true to add to the existing selection, otherwise it is replaced

#### `editor_forestEditor.selectToolByName(toolName)`

Activates a toolbar tool or brush from its label (for example "select"). Does nothing if no label matches.

- `toolName` (*string*) : Label of the tool or brush

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions loaded before this module: {"core_forest"}. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorEditModeChanged` — listened to by 1 module(s)
- `onEditorObjectSelectionChanged` — listened to by 8 module(s)

## Calls into the engine (C++)

- `Engine.` `castRay`
- `FS:` `fileExists`
- `Sim.` `deserializeLineObjects`, `findObjectByIdNoUpcast`, `getDataBlockSet`, `getUniqueName`, `serializeToLineObjectsFile`
- `debugDrawer:` `drawLine`, `drawLineInstance`, `drawSphere`
- `obj:` `add`, `delete`, `getClassName`, `getData`, `getId`, `getInternalName`, `getKey`, `getName`, `getPosition`, `getScale`, `getTransform`, `getUid`, `getWorldBox`, `setField`, `setInternalName`, `setName`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `worldEditorCppApi.` `createObject`, `findDerivedDatablockClassname`, `getAxisGizmoScaleOffset`, `getAxisGizmoTotalRotateOffset`, `rebuildForestManagerInstanceData`, `renderForestBBs`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/forestEditor.lua`.*
