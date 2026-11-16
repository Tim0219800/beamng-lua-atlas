---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/forestItemTools.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared editor tools for placing, selecting, moving and undoing forest items (Forest / ForestData), extracted from forestEditor.lua so that a second tool (the parallax interior editor) reuses the same mechanics. Everything is parameterized by the `forest`/`forestData` handle (no scene state in the module); the selection is the global store `editor.selection.forestItem`, and modifications go through `editor.history` (undoable). Also contains the packing of the per-instance data of the "parallax" windows (32-bit integer customData) and filters on the `parallax_` prefix of ForestItemData datablocks.
--- Access: extension `editor_api_forestItemTools`: `extensions.load("editor_api_forestItemTools")`, then the global `editor_api_forestItemTools`
---@class editor_api_forestItemTools
---@field PARALLAX_ITEM_PREFIX string "parallax_" prefix of the name (or internalName) of a ForestItemData datablock identifying a parallax window; the parallax editor only touches these items, the forest editor the others.
editor_api_forestItemTools = {}

--- Adds items in an undoable way ("AddForestItems" action); redo selects the added items.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:139
---@param forestData userdata ForestData
---@param items table items to add
---@param dontCallRedo boolean|nil true if the items already exist (does not run the redo); default false
---@return any  result of editor.history:commitAction
function editor_api_forestItemTools.addItems(forestData, items, dontCallRedo) end

--- Deselects all selected forest items, rebuilds the instance data and clears the selection.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:70
---@param forestData userdata ForestData
function editor_api_forestItemTools.clearSelection(forestData) end

--- Returns a new list containing the items for which keep(item) is true (nil list = empty list).
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:679
---@param items table|nil list of items
---@param keep function function(item) -> boolean
---@return table  filtered list
function editor_api_forestItemTools.filterItems(items, keep) end

--- Returns the current selection of forest items (editor.selection.forestItem) or an empty table.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:43
---@return table  list of items
function editor_api_forestItemTools.getSelection() end

--- Drives and draws the axis gizmo for the current selection (translation with terrain snapping, rotation around the centroid, uniform scale, duplication via Shift). Records the undoable "SetForestItemTransform" action (or "AddForestItems" for a duplicate) at the end of the drag. To be called once per frame from the tool's onUpdate. Does nothing without a selection.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:295
---@param forest userdata Forest object
function editor_api_forestItemTools.handleGizmo(forest) end

--- Same test on a ForestItemData datablock object (from scenetree.findObject), to filter the mesh palette.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:667
---@param cobj userdata|nil datablock
---@return boolean  true if name/internalName starts with parallax_
function editor_api_forestItemTools.isParallaxDataObject(cobj) end

--- Convenience predicate for selection filters: is the item a parallax window (parallax_ prefix)?
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:660
---@param item userdata forest item
---@return boolean  result
function editor_api_forestItemTools.isParallaxItem(item) end

--- Shared mesh list row: datablock icon + full-width selectable, highlighted if selected. Returns true on click; the caller handles the selection state.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:625
---@param uniqueId any datablock id (distinguishes the ImGui id)
---@param label string displayed text
---@param isSelected boolean highlight
---@param icon any|nil fallback icon (default editor.icons.forest_brushelement)
---@return boolean  true if clicked
function editor_api_forestItemTools.itemDataSelectable(uniqueId, label, isSelected, icon) end

--- True if the name (or internalName) of the item's datablock starts with prefix.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:647
---@param item userdata forest item
---@param prefix string prefix
---@return boolean  result
function editor_api_forestItemTools.itemMatchesPrefix(item, prefix) end

--- Lists the ForestItemData datablocks filtered by name prefix (or internalName). matchPrefix = true: only those starting with prefix (parallax editor); false: all the others (forest editor). Sorted by name, case-insensitive.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:601
---@param prefix string prefix (used in a Lua pattern "^"..prefix)
---@param matchPrefix boolean true = keep the matching ones, false = the others
---@return table[]  list of {id, name}
function editor_api_forestItemTools.listItemDatas(prefix, matchPrefix) end

--- Encodes (setId, emissive) into customData. setId < 0 or nil gives -1 (disabled; the C++ does not save customData < 0).
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:709
---@param setId integer|nil texture set id (24 bits)
---@param emissive boolean|nil emissive flag
---@return integer  customData
function editor_api_forestItemTools.packParallaxData(setId, emissive) end

--- Returns the forest item rendered under the mouse (camera-mouse ray), or nil; filterFn can reject items that don't belong to the tool.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:186
---@param forest userdata Forest object
---@param rayRange number ray range in meters
---@param filterFn function|nil function(item) -> boolean
---@return userdata|nil  item hit
function editor_api_forestItemTools.pick(forest, rayRange, filterFn) end

--- Instantiates an item from a datablock at the given transform and returns the final handle. Does NOT record history: the caller commits (typically via addItems). afterCreate can modify the new item (e.g. parallax customData) and return the final handle to keep.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:173
---@param forest userdata Forest object
---@param itemData userdata ForestItemData datablock
---@param transform MatrixF world transform
---@param scale number scale
---@param afterCreate function|nil function(item, forestData) -> item|nil
---@return userdata  handle of the created item
function editor_api_forestItemTools.place(forest, itemData, transform, scale, afterCreate) end

--- Computes the placement basis of the array and the orientation of each item: unit (right, up, forward). Transform columns: X = right, Y = forward (window face), Z = up; the array advances along right (columns) and up (rows). World mode: world axes rotated by yawRad around Z. alignToNormal: the face follows the surface normal, the array lies in the surface plane and yawRad is a rotation in that plane. flip inverts the face.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:453
---@param hitNormal vec3 normal of the surface hit
---@param yawRad number rotation in radians
---@param alignToNormal boolean align to the normal
---@param flip boolean flip the face
---@return vec3  right
---@return vec3  up
---@return vec3  forward
function editor_api_forestItemTools.placementBasis(hitNormal, yawRad, alignToNormal, flip) end

--- Removes items in an undoable way ("RemoveForestItems" action). Does nothing if the list is empty.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:145
---@param forestData userdata ForestData
---@param items table items to remove
---@param dontCallRedo boolean|nil true = do not execute now; default false
---@return any  result of commitAction
function editor_api_forestItemTools.removeItems(forestData, items, dontCallRedo) end

--- Selects the given items (nil or empty = clear). Places the axis gizmo (on the item in local mode with a single item, otherwise on the centroid), rebuilds the instances and emits onEditorObjectSelectionChanged. Does not trigger the forest editor's mesh preview.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:83
---@param forestData userdata ForestData
---@param forestItems table|nil items to select
---@param addToSelection boolean|nil true = keep the current selection
function editor_api_forestItemTools.select(forestData, forestItems, addToSelection) end

--- Decodes the customData into (setId, emissive). setId is -1 if no parallax set is assigned.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:698
---@param customData integer|nil 32-bit integer of the item
---@return integer  texture set id, -1 if disabled
---@return boolean  emissive flag
function editor_api_forestItemTools.unpackParallaxData(customData) end

--- One frame of the "instantiate an item" interaction: raycast under the cursor, preview (sphere, the mesh's actual bounding box, face line; pivot cell in orange) and, on left click, creation of a cols x rows array of items of the itemDataId datablock (scale opts.scale, 1 by default), committed as ONE undoable action. Returns the list of items created on click, otherwise nil.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:494
---@param forest userdata Forest object
---@param itemDataId integer id of the ForestItemData datablock
---@param opts table|nil rayRange (default preference), cols/rows (1x1), colGap/rowGap (m, edge to edge on the mesh bounds, 0), yaw (degrees), alignToNormal, flipNormal, normalOffset (m, offset along the face), scale (1), afterCreate(item, forestData, index) (1-based index)
---@return table|nil  items placed (on click) or nil
function editor_api_forestItemTools.updateInstantiateMode(forest, itemDataId, opts) end

--- One frame of the "select forest items" interaction (the forest editor's Select tool): hover in white, click = select (Ctrl adds, click in empty space clears), selection rectangle (Ctrl adds), drawing of the selection boxes (orange) and the transform gizmo. Restricted to items passing filterFn.
---Source: lua/ge/extensions/editor/api/forestItemTools.lua:327
---@param forest userdata|nil Forest object (nothing is done if nil)
---@param filterFn function|nil function(item) -> boolean; nil = all
---@param rayRange number|nil ray range (default: working distance preference)
function editor_api_forestItemTools.updateSelectMode(forest, filterFn, rayRange) end

