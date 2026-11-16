# `editor_api_forestItemTools`

*File: `lua/ge/extensions/editor/api/forestItemTools.lua` · VM: Game Engine (GE) · 718 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_api_forestItemTools`: `extensions.load("editor_api_forestItemTools")`, then the global `editor_api_forestItemTools`

Shared editor tools for placing, selecting, moving and undoing forest items (Forest / ForestData), extracted from forestEditor.lua so that a second tool (the parallax interior editor) reuses the same mechanics. Everything is parameterized by the `forest`/`forestData` handle (no scene state in the module); the selection is the global store `editor.selection.forestItem`, and modifications go through `editor.history` (undoable). Also contains the packing of the per-instance data of the "parallax" windows (32-bit integer customData) and filters on the `parallax_` prefix of ForestItemData datablocks.

## Example

```lua
-- in a tool's onUpdate:
local tools = require("editor/api/forestItemTools")
tools.updateSelectMode(forest, tools.isParallaxItem)
tools.handleGizmo(forest)
```

## Notes

- The module is a regular `require` that returns M; it depends on an already initialized global `editor` (editor.createForestItem, editor.updateForestItem, editor.history, axis gizmo).
- Parallax customData: bits 0-23 = texture set id (0xFFFFFF = none/disabled), bits 24-31 = flags (bit 0 = emissive). Value < 0 = disabled and not saved on the C++ side. Must stay in sync with shaders/common/examples/parallaxInterior.h.hlsl.
- Shift at the start of a gizmo drag arms a duplicate: the clone is only created on the first drag frame, and everything is recorded as a single "AddForestItems" action (undo = deletion of the clones).
- In scale mode, the gizmo adds at most 0.1 per frame to each item's uniform scale.
- `removeItems` does nothing (returns nil) if the list is empty; `addItems`/`removeItems` return the result of commitAction.
- Emitted hook: onEditorObjectSelectionChanged (from select).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_api_forestItemTools.addItems(forestData, items, dontCallRedo)` | Adds items in an undoable way ("AddForestItems" action); redo selects the added items. | 139 |
| `editor_api_forestItemTools.clearSelection(forestData)` | Deselects all selected forest items, rebuilds the instance data and clears the selection. | 70 |
| `editor_api_forestItemTools.filterItems(items, keep)` | Returns a new list containing the items for which keep(item) is true (nil list = empty list). | 679 |
| `editor_api_forestItemTools.getSelection()` | Returns the current selection of forest items (editor.selection.forestItem) or an empty table. | 43 |
| `editor_api_forestItemTools.handleGizmo(forest)` | Drives and draws the axis gizmo for the current selection (translation with terrain snapping, rotation around the centroid, uniform scale, duplication via Shift). Records the undoable "SetForestItemTransform" action (or "AddForestItems" for a duplicate) at the end of the drag. To be called once per frame from the tool's onUpdate. Does nothing without a selection. | 295 |
| `editor_api_forestItemTools.isParallaxDataObject(cobj)` | Same test on a ForestItemData datablock object (from scenetree.findObject), to filter the mesh palette. | 667 |
| `editor_api_forestItemTools.isParallaxItem(item)` | Convenience predicate for selection filters: is the item a parallax window (parallax_ prefix)? | 660 |
| `editor_api_forestItemTools.itemDataSelectable(uniqueId, label, isSelected, icon)` | Shared mesh list row: datablock icon + full-width selectable, highlighted if selected. Returns true on click; the caller handles the selection state. | 625 |
| `editor_api_forestItemTools.itemMatchesPrefix(item, prefix)` | True if the name (or internalName) of the item's datablock starts with prefix. | 647 |
| `editor_api_forestItemTools.listItemDatas(prefix, matchPrefix)` | Lists the ForestItemData datablocks filtered by name prefix (or internalName). matchPrefix = true: only those starting with prefix (parallax editor); false: all the others (forest editor). Sorted by name, case-insensitive. | 601 |
| `editor_api_forestItemTools.packParallaxData(setId, emissive)` | Encodes (setId, emissive) into customData. setId < 0 or nil gives -1 (disabled; the C++ does not save customData < 0). | 709 |
| `editor_api_forestItemTools.pick(forest, rayRange, filterFn)` | Returns the forest item rendered under the mouse (camera-mouse ray), or nil; filterFn can reject items that don't belong to the tool. | 186 |
| `editor_api_forestItemTools.place(forest, itemData, transform, scale, afterCreate)` | Instantiates an item from a datablock at the given transform and returns the final handle. Does NOT record history: the caller commits (typically via addItems). afterCreate can modify the new item (e.g. parallax customData) and return the final handle to keep. | 173 |
| `editor_api_forestItemTools.placementBasis(hitNormal, yawRad, alignToNormal, flip)` | Computes the placement basis of the array and the orientation of each item: unit (right, up, forward). Transform columns: X = right, Y = forward (window face), Z = up; the array advances along right (columns) and up (rows). World mode: world axes rotated by yawRad around Z. alignToNormal: the face follows the surface normal, the array lies in the surface plane and yawRad is a rotation in that plane. flip inverts the face. | 453 |
| `editor_api_forestItemTools.removeItems(forestData, items, dontCallRedo)` | Removes items in an undoable way ("RemoveForestItems" action). Does nothing if the list is empty. | 145 |
| `editor_api_forestItemTools.select(forestData, forestItems, addToSelection)` | Selects the given items (nil or empty = clear). Places the axis gizmo (on the item in local mode with a single item, otherwise on the centroid), rebuilds the instances and emits onEditorObjectSelectionChanged. Does not trigger the forest editor's mesh preview. | 83 |
| `editor_api_forestItemTools.unpackParallaxData(customData)` | Decodes the customData into (setId, emissive). setId is -1 if no parallax set is assigned. | 698 |
| `editor_api_forestItemTools.updateInstantiateMode(forest, itemDataId, opts)` | One frame of the "instantiate an item" interaction: raycast under the cursor, preview (sphere, the mesh's actual bounding box, face line; pivot cell in orange) and, on left click, creation of a cols x rows array of items of the itemDataId datablock (scale opts.scale, 1 by default), committed as ONE undoable action. Returns the list of items created on click, otherwise nil. | 494 |
| `editor_api_forestItemTools.updateSelectMode(forest, filterFn, rayRange)` | One frame of the "select forest items" interaction (the forest editor's Select tool): hover in white, click = select (Ctrl adds, click in empty space clears), selection rectangle (Ctrl adds), drawing of the selection boxes (orange) and the transform gizmo. Restricted to items passing filterFn. | 327 |

### Parameter details

#### `editor_api_forestItemTools.addItems(forestData, items, dontCallRedo)`

Adds items in an undoable way ("AddForestItems" action); redo selects the added items.

- `forestData` (*userdata*) : ForestData
- `items` (*table*) : items to add
- `dontCallRedo` (*boolean|nil*) : true if the items already exist (does not run the redo); default false
- **returns**: any result of editor.history:commitAction

#### `editor_api_forestItemTools.clearSelection(forestData)`

Deselects all selected forest items, rebuilds the instance data and clears the selection.

- `forestData` (*userdata*) : ForestData

#### `editor_api_forestItemTools.filterItems(items, keep)`

Returns a new list containing the items for which keep(item) is true (nil list = empty list).

- `items` (*table|nil*) : list of items
- `keep` (*function*) : function(item) -> boolean
- **returns**: table filtered list

#### `editor_api_forestItemTools.getSelection()`

Returns the current selection of forest items (editor.selection.forestItem) or an empty table.

- **returns**: table list of items

#### `editor_api_forestItemTools.handleGizmo(forest)`

Drives and draws the axis gizmo for the current selection (translation with terrain snapping, rotation around the centroid, uniform scale, duplication via Shift). Records the undoable "SetForestItemTransform" action (or "AddForestItems" for a duplicate) at the end of the drag. To be called once per frame from the tool's onUpdate. Does nothing without a selection.

- `forest` (*userdata*) : Forest object

#### `editor_api_forestItemTools.isParallaxDataObject(cobj)`

Same test on a ForestItemData datablock object (from scenetree.findObject), to filter the mesh palette.

- `cobj` (*userdata|nil*) : datablock
- **returns**: boolean true if name/internalName starts with parallax_

#### `editor_api_forestItemTools.isParallaxItem(item)`

Convenience predicate for selection filters: is the item a parallax window (parallax_ prefix)?

- `item` (*userdata*) : forest item
- **returns**: boolean result

#### `editor_api_forestItemTools.itemDataSelectable(uniqueId, label, isSelected, icon)`

Shared mesh list row: datablock icon + full-width selectable, highlighted if selected. Returns true on click; the caller handles the selection state.

- `uniqueId` (*any*) : datablock id (distinguishes the ImGui id)
- `label` (*string*) : displayed text
- `isSelected` (*boolean*) : highlight
- `icon` (*any|nil*) : fallback icon (default editor.icons.forest_brushelement)
- **returns**: boolean true if clicked

#### `editor_api_forestItemTools.itemMatchesPrefix(item, prefix)`

True if the name (or internalName) of the item's datablock starts with prefix.

- `item` (*userdata*) : forest item
- `prefix` (*string*) : prefix
- **returns**: boolean result

#### `editor_api_forestItemTools.listItemDatas(prefix, matchPrefix)`

Lists the ForestItemData datablocks filtered by name prefix (or internalName). matchPrefix = true: only those starting with prefix (parallax editor); false: all the others (forest editor). Sorted by name, case-insensitive.

- `prefix` (*string*) : prefix (used in a Lua pattern "^"..prefix)
- `matchPrefix` (*boolean*) : true = keep the matching ones, false = the others
- **returns**: table[] list of {id, name}

#### `editor_api_forestItemTools.packParallaxData(setId, emissive)`

Encodes (setId, emissive) into customData. setId < 0 or nil gives -1 (disabled; the C++ does not save customData < 0).

- `setId` (*integer|nil*) : texture set id (24 bits)
- `emissive` (*boolean|nil*) : emissive flag
- **returns**: integer customData

#### `editor_api_forestItemTools.pick(forest, rayRange, filterFn)`

Returns the forest item rendered under the mouse (camera-mouse ray), or nil; filterFn can reject items that don't belong to the tool.

- `forest` (*userdata*) : Forest object
- `rayRange` (*number*) : ray range in meters
- `filterFn` (*function|nil*) : function(item) -> boolean
- **returns**: userdata|nil item hit

#### `editor_api_forestItemTools.place(forest, itemData, transform, scale, afterCreate)`

Instantiates an item from a datablock at the given transform and returns the final handle. Does NOT record history: the caller commits (typically via addItems). afterCreate can modify the new item (e.g. parallax customData) and return the final handle to keep.

- `forest` (*userdata*) : Forest object
- `itemData` (*userdata*) : ForestItemData datablock
- `transform` (*MatrixF*) : world transform
- `scale` (*number*) : scale
- `afterCreate` (*function|nil*) : function(item, forestData) -> item|nil
- **returns**: userdata handle of the created item

#### `editor_api_forestItemTools.placementBasis(hitNormal, yawRad, alignToNormal, flip)`

Computes the placement basis of the array and the orientation of each item: unit (right, up, forward). Transform columns: X = right, Y = forward (window face), Z = up; the array advances along right (columns) and up (rows). World mode: world axes rotated by yawRad around Z. alignToNormal: the face follows the surface normal, the array lies in the surface plane and yawRad is a rotation in that plane. flip inverts the face.

- `hitNormal` (*vec3*) : normal of the surface hit
- `yawRad` (*number*) : rotation in radians
- `alignToNormal` (*boolean*) : align to the normal
- `flip` (*boolean*) : flip the face
- **returns**: vec3 right
- **returns**: vec3 up
- **returns**: vec3 forward

#### `editor_api_forestItemTools.removeItems(forestData, items, dontCallRedo)`

Removes items in an undoable way ("RemoveForestItems" action). Does nothing if the list is empty.

- `forestData` (*userdata*) : ForestData
- `items` (*table*) : items to remove
- `dontCallRedo` (*boolean|nil*) : true = do not execute now; default false
- **returns**: any result of commitAction

#### `editor_api_forestItemTools.select(forestData, forestItems, addToSelection)`

Selects the given items (nil or empty = clear). Places the axis gizmo (on the item in local mode with a single item, otherwise on the centroid), rebuilds the instances and emits onEditorObjectSelectionChanged. Does not trigger the forest editor's mesh preview.

- `forestData` (*userdata*) : ForestData
- `forestItems` (*table|nil*) : items to select
- `addToSelection` (*boolean|nil*) : true = keep the current selection

#### `editor_api_forestItemTools.unpackParallaxData(customData)`

Decodes the customData into (setId, emissive). setId is -1 if no parallax set is assigned.

- `customData` (*integer|nil*) : 32-bit integer of the item
- **returns**: integer texture set id, -1 if disabled
- **returns**: boolean emissive flag

#### `editor_api_forestItemTools.updateInstantiateMode(forest, itemDataId, opts)`

One frame of the "instantiate an item" interaction: raycast under the cursor, preview (sphere, the mesh's actual bounding box, face line; pivot cell in orange) and, on left click, creation of a cols x rows array of items of the itemDataId datablock (scale opts.scale, 1 by default), committed as ONE undoable action. Returns the list of items created on click, otherwise nil.

- `forest` (*userdata*) : Forest object
- `itemDataId` (*integer*) : id of the ForestItemData datablock
- `opts` (*table|nil*) : rayRange (default preference), cols/rows (1x1), colGap/rowGap (m, edge to edge on the mesh bounds, 0), yaw (degrees), alignToNormal, flipNormal, normalOffset (m, offset along the face), scale (1), afterCreate(item, forestData, index) (1-based index)
- **returns**: table|nil items placed (on click) or nil

#### `editor_api_forestItemTools.updateSelectMode(forest, filterFn, rayRange)`

One frame of the "select forest items" interaction (the forest editor's Select tool): hover in white, click = select (Ctrl adds, click in empty space clears), selection rectangle (Ctrl adds), drawing of the selection boxes (orange) and the transform gizmo. Restricted to items passing filterFn.

- `forest` (*userdata|nil*) : Forest object (nothing is done if nil)
- `filterFn` (*function|nil*) : function(item) -> boolean; nil = all
- `rayRange` (*number|nil*) : ray range (default: working distance preference)

## Fields

| Field | Type | Description |
|---|---|---|
| `PARALLAX_ITEM_PREFIX` | string | "parallax_" prefix of the name (or internalName) of a ForestItemData datablock identifying a parallax window; the parallax editor only touches these items, the forest editor the others. |

## Emitted hooks

Events broadcast to extensions by `extensions.hook`:

- `onEditorObjectSelectionChanged` — listened to by 8 module(s)

## Calls into the engine (C++)

- `Sim.` `getUniqueName`
- `debugDrawer:` `drawLine`, `drawSphere`
- `obj:` `delete`, `getData`, `getKey`, `getObjBox`, `getPosition`, `getScale`, `getTransform`, `getUid`, `registerObject`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `ui_imgui.` `GetIO`, `GetMouseDragDelta`, `GetMousePos`, `IsMouseClicked`, `IsMouseDragging`, `IsMouseReleased`
- `worldEditorCppApi.` `getAxisGizmoScaleOffset`, `getAxisGizmoTotalRotateOffset`, `rebuildForestManagerInstanceData`, `renderForestBBs`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/api/forestItemTools.lua`.*
