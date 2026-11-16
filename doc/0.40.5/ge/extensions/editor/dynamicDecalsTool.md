# `editor_dynamicDecalsTool`

*File: `lua/ge/extensions/editor/dynamicDecalsTool.lua` · VM: Game Engine (GE) · 1003 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dynamicDecalsTool`: `extensions.load("editor_dynamicDecalsTool")`, then the global `editor_dynamicDecalsTool`

Main window of the editor's Dynamic Decals tool (painting decals on the vehicle). Loads its 33 submodules via M.dependencies (editor_api_dynamicDecals API, widgets, layerStack, inspector, brushes, gizmo, vehicleColorPalette, loadSave, layerTypes_*, etc.) and acts as a hub: submodules register with it through setup(tool) using registerSection, registerToolbarToolItem, registerToolbarActionItem, registerEditorOnUpdateFn and registerOnEditorGuiFn. Also exposes the public interface called by keyboard/mouse actions (applyDecal, undo/redo, changeDecalSize/Rotation, depth/normal locking, brush mode, path layer).

## Notes

- The hooks onEditorGui, onEditorInitialized, onEditorActivated, etc. are commented out in the code ("DISABLED, SPAMS LOG, DEPENDENCIES NOT FOUND"): they are not exported by this module.
- applyDecal(value) expects 1 on press and another value on release. Priority: mask editing (currentMaskEditingLayerUid), active path layer, brushStroke mode, otherwise a simple decal (also adds the color to the color history).
- Sections with an order >= 1000 are placed in the "Advanced" section.
- M.toolModes = {none = 0, decal = 1, brushStroke = 2, path = 3}; toolMode is decal initially. M.version = {1,1,0}. M.directoryPath = "/art/dynamicDecals/".
- changeDecalSize/Rotation multiply the steps of the preferences dynamicDecalsTool.decalProperties.scaleStep and rotationStep (degrees converted to radians) by mod.

**Dependencies (loaded first):** `editor_api_dynamicDecals`, `editor_dynamicDecals_docs`, `editor_dynamicDecals_helper`, `editor_dynamicDecals_widgets`, `editor_dynamicDecals_notification`, `editor_dynamicDecals_news`, `editor_dynamicDecals_layerStack`, `editor_dynamicDecals_selection`, `editor_dynamicDecals_inspector`, `editor_dynamicDecals_inspector_utils`, `editor_dynamicDecals_browser`, `editor_dynamicDecals_textures`, `editor_dynamicDecals_export`, `editor_dynamicDecals_fonts`, `editor_dynamicDecals_brushes`, `editor_dynamicDecals_gizmo`, `editor_dynamicDecals_vehicleColorPalette`, `editor_dynamicDecals_colorPresets`, `editor_dynamicDecals_colorHistory`, `editor_dynamicDecals_camera`, `editor_dynamicDecals_loadSave`, `editor_dynamicDecals_settings`, `editor_dynamicDecals_history`, `editor_dynamicDecals_meshes`, `editor_dynamicDecals_layerTypes_decal`, `editor_dynamicDecals_layerTypes_brushStroke`, `editor_dynamicDecals_layerTypes_path`, `editor_dynamicDecals_layerTypes_fill`, `editor_dynamicDecals_layerTypes_textureFill`, `editor_dynamicDecals_layerTypes_group`, `editor_dynamicDecals_layerTypes_linkedSet`, `editor_dynamicDecals_debugTextures`, `editor_dynamicDecals_debugSection`

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dynamicDecalsTool.applyDecal(value)` | Public brush interface: places a decal, a path point, a brush stroke or a mask decal depending on the current mode. | 883 |
| `editor_dynamicDecalsTool.changeDecalRotation(clockwise, mod)` | Rotates the current decal. | 910 |
| `editor_dynamicDecalsTool.changeDecalSize(increase, mod)` | Enlarges or shrinks the current decal. | 909 |
| `editor_dynamicDecalsTool.dynamicDecals_moveLayer(from, fromParentUid, to, toParentUid)` | API hook called when a layer is moved: refreshes the destination parent layer if it is selected. *(internal)* | 939 |
| `editor_dynamicDecalsTool.dynamicDecals_onLayerUpdated(layerUid)` | API hook: when a layer is modified, copies its data into the inspector selection if it is displayed there. *(internal)* | 930 |
| `editor_dynamicDecalsTool.enableBrushStroke(value)` | Enables/disables the brush stroke; on disabling, adds a stroke layer (api.addBrushStrokeLayer). | 955 |
| `editor_dynamicDecalsTool.enablePathLayer(value)` | Enables/disables the path layer mode. | 963 |
| `editor_dynamicDecalsTool.finishPathLayer()` | Finishes the current path layer. | 967 |
| `editor_dynamicDecalsTool.getCurrentMaskEditingLayerUid()` | Uid of the layer whose mask is being edited, or nil. | 997 |
| `editor_dynamicDecalsTool.getIconSize()` | Icon size (integer, 20 by default). | 981 |
| `editor_dynamicDecalsTool.getIconSizeVec2()` | Icon size as an ImVec2. | 985 |
| `editor_dynamicDecalsTool.getMainScrollY()` | Current vertical scroll of the main window. | 989 |
| `editor_dynamicDecalsTool.getSectionOpenState(name)` | Open state of a section (or of "Advanced"). | 827 |
| `editor_dynamicDecalsTool.getSectionWindowName(section)` | ImGui window name of a section: "Dynamic Decals Tool - <section.windowName>". | 146 |
| `editor_dynamicDecalsTool.lockDepth(value)` | Locks or releases the decal projection depth. | 947 |
| `editor_dynamicDecalsTool.lockSurfaceNormal(value)` | Locks or releases the surface normal used for projection. | 951 |
| `editor_dynamicDecalsTool.onDeserialized(data)` | Deserialization hook: does nothing. *(internal)* *(hook)* | 864 |
| `editor_dynamicDecalsTool.onSerialize()` | Lua reload serialization hook: returns an empty table. *(internal)* *(hook)* | 859 |
| `editor_dynamicDecalsTool.onVehicleSwitched()` | Hook called on vehicle switch: updates the materials (settings.updateMaterials). *(internal)* *(hook)* | 975 |
| `editor_dynamicDecalsTool.redo()` | Redoes the undone action and refreshes the selected layers. | 921 |
| `editor_dynamicDecalsTool.registerEditorOnUpdateFn(name, onUpdateFn)` | Registers an update function called every frame by the tool (key = name). | 780 |
| `editor_dynamicDecalsTool.registerOnEditorGuiFn(name, guiFn)` | Registers an additional draw function executed with the editor UI. | 848 |
| `editor_dynamicDecalsTool.registerSection(name, guiFn, order, defaultOpen, window, buttons)` | Registers a UI section (and optionally a dedicated window). Sections are sorted by order; those >= 1000 go into "Advanced". | 801 |
| `editor_dynamicDecalsTool.registerToolbarActionItem(name, guiFn, order)` | Adds an item to the toolbar (actions part), sorted by order. | 843 |
| `editor_dynamicDecalsTool.registerToolbarToolItem(name, guiFn, order)` | Adds an item to the toolbar (tools part), sorted by order. | 838 |
| `editor_dynamicDecalsTool.removeLastPathLayerPoint()` | Removes the last point of the current path. | 971 |
| `editor_dynamicDecalsTool.setCurrentMaskEditingLayerUid(uid)` | Sets the layer whose mask is being edited (nil to leave this mode). | 993 |
| `editor_dynamicDecalsTool.setSectionOpenState(name, newState, setScroll)` | Opens or closes a section by its name (opening an advanced section also opens "Advanced"). | 805 |
| `editor_dynamicDecalsTool.undo()` | Undoes the last action of the dynamicDecals API, then refreshes the layers selected in editor.selection.dynamicDecalLayer. | 912 |
| `editor_dynamicDecalsTool.unregisterEditorOnUpdateFn(name)` | Removes a registered update function. | 784 |
| `editor_dynamicDecalsTool.unregisterOnEditorGuiFn(name)` | Removes a registered draw function. | 852 |

### Parameter details

#### `editor_dynamicDecalsTool.applyDecal(value)`

Public brush interface: places a decal, a path point, a brush stroke or a mask decal depending on the current mode.

- `value` (*integer*) : 1 on press, other (0) on release

#### `editor_dynamicDecalsTool.changeDecalRotation(clockwise, mod)`

Rotates the current decal.

- `clockwise` (*boolean*) : Clockwise
- `mod` (*number|nil*) : Step multiplier (default 1)

#### `editor_dynamicDecalsTool.changeDecalSize(increase, mod)`

Enlarges or shrinks the current decal.

- `increase` (*boolean*) : true to enlarge
- `mod` (*number|nil*) : Step multiplier (default 1)

#### `editor_dynamicDecalsTool.dynamicDecals_moveLayer(from, fromParentUid, to, toParentUid)`

API hook called when a layer is moved: refreshes the destination parent layer if it is selected.

- `from` (*integer*) : Original position
- `fromParentUid` (*any*) : Original parent
- `to` (*integer*) : Destination position
- `toParentUid` (*any*) : Destination parent

#### `editor_dynamicDecalsTool.dynamicDecals_onLayerUpdated(layerUid)`

API hook: when a layer is modified, copies its data into the inspector selection if it is displayed there.

- `layerUid` (*string|integer*) : Identifier of the modified layer (type inferred from code)

#### `editor_dynamicDecalsTool.enableBrushStroke(value)`

Enables/disables the brush stroke; on disabling, adds a stroke layer (api.addBrushStrokeLayer).

- `value` (*integer*) : 1 to enable

#### `editor_dynamicDecalsTool.enablePathLayer(value)`

Enables/disables the path layer mode.

- `value` (*integer*) : 1 to enable

#### `editor_dynamicDecalsTool.getCurrentMaskEditingLayerUid()`

Uid of the layer whose mask is being edited, or nil.

- **returns**: any|nil 

#### `editor_dynamicDecalsTool.getIconSize()`

Icon size (integer, 20 by default).

- **returns**: number 

#### `editor_dynamicDecalsTool.getIconSizeVec2()`

Icon size as an ImVec2.

- **returns**: ImVec2 

#### `editor_dynamicDecalsTool.getMainScrollY()`

Current vertical scroll of the main window.

- **returns**: number 

#### `editor_dynamicDecalsTool.getSectionOpenState(name)`

Open state of a section (or of "Advanced").

- `name` (*string*) : Section name
- **returns**: boolean|nil nil if the section is unknown

#### `editor_dynamicDecalsTool.getSectionWindowName(section)`

ImGui window name of a section: "Dynamic Decals Tool - <section.windowName>".

- `section` (*table*) : Section with windowName
- **returns**: string 

#### `editor_dynamicDecalsTool.lockDepth(value)`

Locks or releases the decal projection depth.

- `value` (*integer*) : 1 to lock

#### `editor_dynamicDecalsTool.lockSurfaceNormal(value)`

Locks or releases the surface normal used for projection.

- `value` (*integer*) : 1 to lock

#### `editor_dynamicDecalsTool.onDeserialized(data)`

Deserialization hook: does nothing.

- `data` (*table*) : Data

#### `editor_dynamicDecalsTool.onSerialize()`

Lua reload serialization hook: returns an empty table.

- **returns**: table {}

#### `editor_dynamicDecalsTool.registerEditorOnUpdateFn(name, onUpdateFn)`

Registers an update function called every frame by the tool (key = name).

- `name` (*string*) : Unique key
- `onUpdateFn` (*function*) : Called with (dtReal, dtSim, dtRaw)

#### `editor_dynamicDecalsTool.registerOnEditorGuiFn(name, guiFn)`

Registers an additional draw function executed with the editor UI.

- `name` (*string*) : Unique key
- `guiFn` (*function*) : Draw function

#### `editor_dynamicDecalsTool.registerSection(name, guiFn, order, defaultOpen, window, buttons)`

Registers a UI section (and optionally a dedicated window). Sections are sorted by order; those >= 1000 go into "Advanced".

- `name` (*string*) : Section name
- `guiFn` (*function*) : Draw function, called with a guiId (both in the section and in the window)
- `order` (*number|nil*) : Position (smaller = higher), default 1000
- `defaultOpen` (*boolean|nil*) : Open by default
- `window` (*table|nil*) : {windowSize = ImVec2} to create a dedicated window with an open button
- `buttons` (*table|nil*) : Header buttons {icon, tooltip, fn}

#### `editor_dynamicDecalsTool.registerToolbarActionItem(name, guiFn, order)`

Adds an item to the toolbar (actions part), sorted by order.

- `name` (*string*) : 
- `guiFn` (*function*) : Draw function
- `order` (*number|nil*) : Default 1000

#### `editor_dynamicDecalsTool.registerToolbarToolItem(name, guiFn, order)`

Adds an item to the toolbar (tools part), sorted by order.

- `name` (*string*) : 
- `guiFn` (*function*) : Draw function
- `order` (*number|nil*) : Default 1000

#### `editor_dynamicDecalsTool.setCurrentMaskEditingLayerUid(uid)`

Sets the layer whose mask is being edited (nil to leave this mode).

- `uid` (*any|nil*) : Layer uid

#### `editor_dynamicDecalsTool.setSectionOpenState(name, newState, setScroll)`

Opens or closes a section by its name (opening an advanced section also opens "Advanced").

- `name` (*string*) : Section name
- `newState` (*boolean*) : Open or closed
- `setScroll` (*boolean|nil*) : Scrolls to the section

#### `editor_dynamicDecalsTool.unregisterEditorOnUpdateFn(name)`

Removes a registered update function.

- `name` (*string*) : Key

#### `editor_dynamicDecalsTool.unregisterOnEditorGuiFn(name)`

Removes a registered draw function.

- `name` (*string*) : Key

## Fields

| Field | Type | Description |
|---|---|---|
| `dependencies` | string[] | List of extensions loaded before this module. |
| `directoryPath` | string | Data folder: "/art/dynamicDecals/". |
| `doApiUpdate` | boolean | If true (default), the tool calls the API update every frame; can be changed via a debug checkbox. |
| `toolMode` | integer | Current mode (decal by default). |
| `toolModes` | table<string, integer> | none=0, decal=1, brushStroke=2, path=3. |
| `version` | integer[] | Tool version {1,1,0}. |

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dynamicDecalsTool.lua`.*
