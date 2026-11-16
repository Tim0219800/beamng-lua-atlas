# `editor_inspector`

*File: `lua/ge/extensions/editor/inspector.lua` · VM: Game Engine (GE) · 2309 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_inspector`: `extensions.load("editor_inspector")`, then the global `editor_inspector`

World Editor Inspector window: displays and edits the fields (static, dynamic, arrays) of the selected object or objects, with specialized editors (vehicle metallic paint, GroundCover billboard UVs, light color/intensity/cookie, DecalData labels) and undo/redo via editor.history. Several instances can coexist, including instances locked to a selection. A modder uses it to register handlers per selection type or field modifiers.

## Example

```lua
editor.registerInspectorTypeHandler("my_type", function(inspectorInfo) ui_imgui.Text("My panel") end)
-- then: editor.selection = {}; editor.selection.my_type = {1}
```

## Notes

- The default selection type is "object" (handler objectInspectorGui).
- onEditorGui emits the hook onEditorInspectorHeaderGui(inspectorInfo) at the top of the window (used e.g. by editor_lightClassConverter).
- Instance indices are strings (JSON keys), not numbers.
- The class's editor.* functions are installed by onEditorRegisterApi / onExtensionLoaded (registerApi).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_inspector.onEditorActivated()` | Called when the editor is activated: resets the valueInspector tables and the shared context, then refreshes the selection. *(internal)* *(hook)* | 1590 |
| `editor_inspector.onEditorAfterOpenLevel()` | Called after a level is opened: reloads the datablock lists of the dropdown menus. *(internal)* *(hook)* | 2292 |
| `editor_inspector.onEditorDeactivated()` | Called when the editor is deactivated. Empty body. *(internal)* *(hook)* | 1596 |
| `editor_inspector.onEditorGui()` | Draws each inspector window every frame (closes the instances whose window is no longer visible) and handles the pending night lighting refresh. *(internal)* *(hook)* | 1484 |
| `editor_inspector.onEditorInitialized()` | Initializes the valueInspector, registers the "object" handler, the Window > Inspector menu entry and the custom field editors/labels (BeamNGVehicle.metallicPaintData, GroundCover.billboardUVs, DecalData.texRows/texCols, PointLight/SpotLight color, intensity, cookie). *(internal)* *(hook)* | 2234 |
| `editor_inspector.onEditorLoadGuiInstancerState(state)` | Restores the inspector instances from the editor's saved state. *(internal)* *(hook)* | 1599 |
| `editor_inspector.onEditorObjectSelectionChanged()` | Called when the selection changes: ends a possible "pickingLinkTo" or rebuilds the list of fields common to the selected objects (with usage counter). *(internal)* *(hook)* | 2262 |
| `editor_inspector.onEditorRegisterApi()` | Defines editor.checkEditorDirtyFlag and editor.requestInspectorScrollToTopOnceForSelection(selectionId). *(internal)* *(hook)* | 2227 |
| `editor_inspector.onEditorSaveGuiInstancerState(state)` | Writes the inspector instances into the editor state (key "inspectorInstances"). *(internal)* *(hook)* | 1607 |
| `editor_inspector.onExtensionLoaded()` | Called at load: initializes the collapsible groups and installs the editor.* API (addInspectorInstance, registerInspectorTypeHandler...). *(internal)* *(hook)* | 1007 |

### Parameter details

#### `editor_inspector.onEditorLoadGuiInstancerState(state)`

Restores the inspector instances from the editor's saved state.

- `state` (*table*) : Editor state.

#### `editor_inspector.onEditorSaveGuiInstancerState(state)`

Writes the inspector instances into the editor state (key "inspectorInstances").

- `state` (*table*) : State to complete.

## Class `editor`

Methods added to the global `editor` table by this module.

Object `editor` built inside the module (e.g. by `new`), with these methods:

| Method | Description | Line |
|---|---|---|
| `editor.addInspectorInstance(selection)` | Creates a new inspector window. With a selection, the instance is locked to it (own context); without, it follows the current selection. | 132 |
| `editor.checkEditorDirtyFlag()` | For each selected object, calls inspectUpdate(); if the object is modified (or isEditorDirty), marks the editor as modified (editor.setDirty). Does nothing if already dirty. | 100 |
| `editor.closeInspectorInstance(idx)` | Closes an inspector instance and unregisters its window. | 157 |
| `editor.getInspectorInstances()` | Returns the open inspector instances. | 163 |
| `editor.getInspectorTypeHandlers()` | Returns the handlers registered per selection type. | 167 |
| `editor.inspectorHasField(fieldName)` | Indicates whether the shared inspector currently displays a field of this name. | 986 |
| `editor.registerInspectorFieldModifier(uniqueName, callback)` | Registers a field modification callback, identified by a unique name. | 182 |
| `editor.registerInspectorTypeHandler(typeName, guiCallback)` | Registers the inspector rendering of a selection type (key of editor.selection). | 171 |
| `editor.unregisterInspectorFieldModifier(uniqueName)` | Removes a field modifier. | 188 |
| `editor.unregisterInspectorTypeHandler(typeName)` | Removes a type handler. | 178 |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorInspectorHeaderGui` — listened to by 8 module(s)

## Calls into the engine (C++)

- `FS:` `fileExists`, `isLinkFile`
- `core_environment.` `refreshnightLightsObjects`
- `obj:` `getClassDocString`, `getClassName`, `getDynDataFieldbyName`, `getGroup`, `getId`, `inspectUpdate`, `isEditorDirty`, `isSubClassOf`
- `scenetree.` `findObject`, `findObjectById`

**Loads extensions:** `editor_groundCoverEditor`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/inspector.lua`.*
