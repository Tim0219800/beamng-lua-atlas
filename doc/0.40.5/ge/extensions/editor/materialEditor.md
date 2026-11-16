# `editor_materialEditor`

*File: `lua/ge/extensions/editor/materialEditor.lua` · VM: Game Engine (GE) · 3879 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_materialEditor`: `extensions.load("editor_materialEditor")`, then the global `editor_materialEditor`

World material editor ("materialEditor" window of the level editor). It lists the materials of the level and of art/, lets you edit their properties per layer (textures, colors, floats, checkboxes, animation, alpha blending, cubemap...), with undo/redo, 3D preview (cube from art/shapes/material_preview), texture problem detection, GPU size estimation, material usage in the scene, focus/isolation in the view and saving of modified materials. The exported functions are mostly used by other editor tools: select a material, change a property, reuse the widgets.

## Example

```lua
local me = extensions.editor_materialEditor
me.showMaterialEditor()
me.selectMaterialByName('road_asphalt_2lane', true)
```

## Notes

- setProperty modifies the current material (currentMaterial) if materialObj is nil, via editor.setMaterialProperty, then marks it dirty and refreshes the preview; it does not create a history entry (the widgets use setPropertyWithUndo internally).
- The exported widgets (inputFloat, colorEdit4, imageButton, deleteMapButton) read currentMaterial and the current layer o.layer[0] if layer is nil; they only make sense in an editor imgui context.
- Custom materials offered by default: 'Standard' and 'MetalicCarPaint' (customMaterialsArray).
- onFilesChanged reloads the materials list when a main.materials.json file under /levels/ or /art/ changes.
- Registered preferences (category materialEditor.general): thumbnailSize (32 to 256, default 64), maxMaterialPreviewSize (64 to 1024, default 256), textFilterResultsWithSameFirstCharAtTop (true), showEstimatedSizeInList (false), plus hidden columnSizes and levelMaterialNames; the selection is remembered per level in levelMaterialNames.
- onEditorObjectSelectionChanged and onEditorDeleteSelection are empty hooks.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_materialEditor.colorEdit4(label, property, id, layer, labelSameLine)` | imgui widget: RGBA color editor bound to a property of the current material; applies the value live and creates an undo entry at the end of the edit. | 1749 |
| `editor_materialEditor.deleteMapButton(label, property, layer)` | Draws an icon button that clears the property's texture (value "") with undo. | 1552 |
| `editor_materialEditor.imageButton(label, property, layer, additionalGuiFn)` | imgui widget: thumbnail of a property's texture, with preview, drag-and-drop and file selection; modifies the property with undo. | 1598 |
| `editor_materialEditor.inputFloat(label, property, float_step, float_step_fast, string_format, layer, tooltip)` | imgui widget: numeric field bound to a float property of the current material; applies live and adds an undo entry at the end of the edit. | 1869 |
| `editor_materialEditor.onEditorActivated()` | Hook called when the editor is activated: loads materials, ground models and preview meshes, prepares the 3D previews (cube_1m.dae) and the level path. *(internal)* *(hook)* | 3786 |
| `editor_materialEditor.onEditorDeactivated()` | Hook called when the editor is deactivated: removes the scene focus, frees the material lists, size caches and preview meshes. *(internal)* *(hook)* | 3816 |
| `editor_materialEditor.onEditorDeleteSelection()` | Selection deletion hook; empty. *(internal)* *(hook)* | 3846 |
| `editor_materialEditor.onEditorGui()` | Hook called every editor frame: draws the main window and the auxiliary windows (preview, material usage, creation, copy, materials by tag), handles focus and background jobs. *(internal)* *(hook)* | 3552 |
| `editor_materialEditor.onEditorInitialized()` | Editor initialization hook: adds the "Material Editor" menu, registers the six windows (five auxiliary ones hidden) and starts the tag mapping job. *(internal)* *(hook)* | 3827 |
| `editor_materialEditor.onEditorObjectSelectionChanged()` | Object selection change hook; empty. *(internal)* *(hook)* | 3843 |
| `editor_materialEditor.onEditorPreferenceValueChanged(path, value)` | Hook called when a preference changes; reacts to thumbnailSize, maxMaterialPreviewSize, textFilterResultsWithSameFirstCharAtTop (reloads the list) and showEstimatedSizeInList. *(internal)* *(hook)* | 3753 |
| `editor_materialEditor.onEditorRegisterPreferences(prefsRegistry)` | Preferences registration hook: creates the materialEditor category and the general subcategory. *(internal)* *(hook)* | 3771 |
| `editor_materialEditor.onFilesChanged(files)` | Hook called when files change on disk; reloads the materials if a main.materials.json under /levels/ or /art/ is concerned. *(internal)* *(hook)* | 3738 |
| `editor_materialEditor.onVehicleSwitched(oid, nid, player)` | Hook called when the player vehicle changes; if the window is visible and the editor active, restarts the tags job and reloads the materials. *(internal)* *(hook)* | 3729 |
| `editor_materialEditor.selectMaterialByName(matName, clearFilter)` | Selects in the list the material with this name, updates its displayed properties and remembers the choice for the current level in the levelMaterialNames preference. If the name is not found, the current index becomes 0. Does nothing while the list is not loaded (editor not activated). | 948 |
| `editor_materialEditor.setMaterialDirty(materialObj)` | Marks the material as modified (v.dirtyMaterials[name] = true) so that it gets saved. | 1247 |
| `editor_materialEditor.setProperty(materialObj, property, layer, value)` | Sets a property of a material layer via editor.setMaterialProperty; on success, marks dirty, invalidates the size estimate and redraws the preview. Remembers the previous value for undo. | 1254 |
| `editor_materialEditor.showMaterialEditor()` | Shows the material editor window, or gives it focus if it is already visible. | 3005 |

### Parameter details

#### `editor_materialEditor.colorEdit4(label, property, id, layer, labelSameLine)`

imgui widget: RGBA color editor bound to a property of the current material; applies the value live and creates an undo entry at the end of the edit.

- `label` (*string*) : Label (displayed if non-empty).
- `property` (*string*) : Color property ("r g b a" string).
- `id` (*string|nil*) : imgui id; property by default.
- `layer` (*integer|nil*) : Layer; o.layer[0] if nil.
- `labelSameLine` (*boolean|nil*) : If true, the widget is placed on the same line as the label.

#### `editor_materialEditor.deleteMapButton(label, property, layer)`

Draws an icon button that clears the property's texture (value "") with undo.

- `label` (*string*) : Label used in the "Remove ..." tooltip.
- `property` (*string*) : Texture property to clear.
- `layer` (*integer|nil*) : Layer; o.layer[0] if nil.

#### `editor_materialEditor.imageButton(label, property, layer, additionalGuiFn)`

imgui widget: thumbnail of a property's texture, with preview, drag-and-drop and file selection; modifies the property with undo.

- `label` (*string*) : Widget label.
- `property` (*string*) : Texture property.
- `layer` (*integer|nil*) : Layer; o.layer[0] if nil.
- `additionalGuiFn` (*function|nil*) : Additional draw function (inferred from code).

#### `editor_materialEditor.inputFloat(label, property, float_step, float_step_fast, string_format, layer, tooltip)`

imgui widget: numeric field bound to a float property of the current material; applies live and adds an undo entry at the end of the edit.

- `label` (*string*) : Label.
- `property` (*string*) : Float property.
- `float_step` (*number|nil*) : Step (0.01 by default).
- `float_step_fast` (*number|nil*) : Fast step (0.1 by default).
- `string_format` (*string|nil*) : Display format ("%.2f" by default).
- `layer` (*integer|nil*) : Layer; o.layer[0] if nil.
- `tooltip` (*string|nil*) : Help text displayed next to the label.

#### `editor_materialEditor.onEditorPreferenceValueChanged(path, value)`

Hook called when a preference changes; reacts to thumbnailSize, maxMaterialPreviewSize, textFilterResultsWithSameFirstCharAtTop (reloads the list) and showEstimatedSizeInList.

- `path` (*string*) : Preference path, e.g. materialEditor.general.thumbnailSize.
- `value` (*any*) : New value.

#### `editor_materialEditor.onEditorRegisterPreferences(prefsRegistry)`

Preferences registration hook: creates the materialEditor category and the general subcategory.

- `prefsRegistry` (*table*) : Editor preferences registry.

#### `editor_materialEditor.onFilesChanged(files)`

Hook called when files change on disk; reloads the materials if a main.materials.json under /levels/ or /art/ is concerned.

- `files` (*table[]*) : List of entries with a filename field.

#### `editor_materialEditor.onVehicleSwitched(oid, nid, player)`

Hook called when the player vehicle changes; if the window is visible and the editor active, restarts the tags job and reloads the materials.

- `oid` (*integer*) : Id of the old vehicle.
- `nid` (*integer*) : Id of the new vehicle.
- `player` (*integer*) : Player index (unused).

#### `editor_materialEditor.selectMaterialByName(matName, clearFilter)`

Selects in the list the material with this name, updates its displayed properties and remembers the choice for the current level in the levelMaterialNames preference. If the name is not found, the current index becomes 0. Does nothing while the list is not loaded (editor not activated).

- `matName` (*string*) : Material name.
- `clearFilter` (*boolean|nil*) : If true, first clears the text filter (otherwise the selection may fail).

#### `editor_materialEditor.setMaterialDirty(materialObj)`

Marks the material as modified (v.dirtyMaterials[name] = true) so that it gets saved.

- `materialObj` (*userdata|nil*) : Material object; current material if nil.

#### `editor_materialEditor.setProperty(materialObj, property, layer, value)`

Sets a property of a material layer via editor.setMaterialProperty; on success, marks dirty, invalidates the size estimate and redraws the preview. Remembers the previous value for undo.

- `materialObj` (*userdata|nil*) : Material to modify; current if nil.
- `property` (*string*) : Field name (e.g. diffuseMap, diffuseColor).
- `layer` (*integer*) : Material layer index.
- `value` (*any*) : New value.

## Fields

| Field | Type | Description |
|---|---|---|
| `customMaterialsArray` | string[] | Material classes offered: 'Standard', 'MetalicCarPaint'. |
| `customMaterialsArrayPtr` | any | imgui string array (ArrayCharPtrByTbl) built from customMaterialsArray. |
| `dbg` | boolean | Debug flag (copy of the initial local value, false). |
| `o` | table | imgui pointers of the editor options, notably o.layer (IntPtr, current layer) and o.reflectionMode. |
| `v` | table | Interface state: materialNameList, currentMaterialIndex, dirtyMaterials, materialUsage, inputWidgetHeight, style... |

## Calls into the engine (C++)

- `FS:` `directoryExists`, `fileExists`, `findFiles`, `isLinkFile`, `triggerFilesChanged`
- `obj:` `getField`, `getMaterialNames`, `getModelFile`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `worldEditorCppApi.` `getClassIsSelectable`, `setHoveredObjectId`, `setMaterialFocus`, `setMaterialFocusHighlight`, `setMaterialFocusIsolate`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/materialEditor.lua`.*
