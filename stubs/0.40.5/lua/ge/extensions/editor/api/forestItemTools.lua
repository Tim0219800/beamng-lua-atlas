---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/forestItemTools.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_forestItemTools` : `extensions.load("editor_api_forestItemTools")`, puis la globale `editor_api_forestItemTools`
---@class editor_api_forestItemTools
---@field PARALLAX_ITEM_PREFIX string
editor_api_forestItemTools = {}

---Source : lua/ge/extensions/editor/api/forestItemTools.lua:139
---@param forestData any
---@param items any
---@param dontCallRedo any
function editor_api_forestItemTools.addItems(forestData, items, dontCallRedo) end

---Source : lua/ge/extensions/editor/api/forestItemTools.lua:70
---@param forestData any
function editor_api_forestItemTools.clearSelection(forestData) end

--- Returns a new list with only the items for which keep(item) is true (nil list -> empty list).
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:679
---@param items any
---@param keep any
function editor_api_forestItemTools.filterItems(items, keep) end

---Source : lua/ge/extensions/editor/api/forestItemTools.lua:43
function editor_api_forestItemTools.getSelection() end

--- Drive + draw the axis gizmo for the current selection. Call once per frame from the tool's onUpdate.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:295
---@param forest any
function editor_api_forestItemTools.handleGizmo(forest) end

--- Same test on a ForestItemData datablock object (from scenetree.findObject), for filtering the mesh
---  palette: true when the datablock's name / internalName starts with the parallax_ prefix.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:667
---@param cobj any
function editor_api_forestItemTools.isParallaxDataObject(cobj) end

--- Convenience predicate for the select filters: is this a parallax window item?
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:660
---@param item any
function editor_api_forestItemTools.isParallaxItem(item) end

--- Shared mesh-list row for both the Forest Editor and the Parallax Interior Editor: a datablock icon
---  plus a full-width selectable that highlights when selected. Returns true on click; the caller owns
---  selection state. `uniqueId` (the datablock id) disambiguates the imgui id. `icon` optionally
---  overrides the default datablock icon (the Parallax Interior Editor passes crop_din for its windows).
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:625
---@param uniqueId any
---@param label any
---@param isSelected any
---@param icon any
function editor_api_forestItemTools.itemDataSelectable(uniqueId, label, isSelected, icon) end

--- True when a forest item's datablock name (or internalName) starts with `prefix`. Checks both to
---  match listItemDatas, since a datablock can be identified by either.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:647
---@param item any
---@param prefix any
function editor_api_forestItemTools.itemMatchesPrefix(item, prefix) end

--- ForestItemData datablock discovery, filtered by a name prefix. matchPrefix=true returns only
---  datablocks whose name (or internalName) starts with `prefix` - the Parallax Interior Editor lists
---  these; matchPrefix=false returns the rest - the Forest Editor, so parallax windows stay out of its
---  mesh palette. Returns a name-sorted list of { id, name }.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:601
---@param prefix any
---@param matchPrefix any
function editor_api_forestItemTools.listItemDatas(prefix, matchPrefix) end

--- (setId, emissive) -> customData. setId < 0 yields -1 (disabled; the C++ save drops customData < 0).
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:709
---@param setId any
---@param emissive any
function editor_api_forestItemTools.packParallaxData(setId, emissive) end

--- Click-pick the rendered forest item under the mouse. filterFn(item) can reject items that aren't
---  ours (e.g. keep the parallax tool from selecting ordinary forest items).
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:186
---@param forest any
---@param rayRange any
---@param filterFn any
function editor_api_forestItemTools.pick(forest, rayRange, filterFn) end

--- Instantiate one item from a datablock template at the given transform and return the final handle.
---  afterCreate(item, forestData) optionally mutates the fresh item (e.g. set per-instance parallax data)
---  and returns the final handle. This does NOT record undo history: the caller commits (updateInstantiate-
---  Mode batches a whole array into a single addItems action so one undo removes the lot). The final handle
---  is what the caller stores, so redo (via addItem) restores those per-instance fields.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:173
---@param forest any
---@param itemData any
---@param transform any
---@param scale any
---@param afterCreate any
function editor_api_forestItemTools.place(forest, itemData, transform, scale, afterCreate) end

--- Placement basis for the array + each item's orientation. Returns unit (right, up, forward); the item
---  transform columns are X=right, Y=forward (the window's facing), Z=up (the forest item convention), and
---  the array steps along right (columns) and up (rows). World mode is the identity axes yawed around world
---  Z, so a row runs along +X rotated by yawRad. alignToNormal instead faces the window along the surface
---  normal, lays the array in that surface's plane and treats yawRad as an in-plane spin. flip reverses the
---  facing (window faces the other way) - the fix when a wall's normal points the wrong side.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:453
---@param hitNormal any
---@param yawRad any
---@param alignToNormal any
---@param flip any
function editor_api_forestItemTools.placementBasis(hitNormal, yawRad, alignToNormal, flip) end

---Source : lua/ge/extensions/editor/api/forestItemTools.lua:145
---@param forestData any
---@param items any
---@param dontCallRedo any
function editor_api_forestItemTools.removeItems(forestData, items, dontCallRedo) end

--- Select the given forest items (nil/empty clears). addToSelection keeps the current selection.
---  Mirrors the Forest Editor's selection, minus its mesh-preview side effect.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:83
---@param forestData any
---@param forestItems any
---@param addToSelection any
function editor_api_forestItemTools.select(forestData, forestItems, addToSelection) end

--- customData -> (setId, emissive). setId is -1 when no parallax set is assigned (disabled).
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:698
---@param customData any
function editor_api_forestItemTools.unpackParallaxData(customData) end

--- One frame of the shared "instantiate item" interaction: raycast under the cursor and, on left click,
---  create forest item(s) from the datablock `itemDataId` at the hit (scale 1, undoable in one step). This
---  is the Forest Editor's Instantiate tool, reused so a second tool can place its own meshes.
---  opts (all optional):
---    rayRange                              pick distance (defaults to the forest tool preference).
---    cols, rows                            array size. The cursor cell is the pivot; columns grow along the
---                                          basis' right, rows along its up. Default 1x1 (single placement).
---    colGap, rowGap                        metres of empty space between neighbouring cells, measured edge
---                                          to edge on the mesh's own bounds (default 0, i.e. flush).
---    yaw                                   array rotation in degrees (see placementBasis).
---    alignToNormal                         face placed items along the surface normal under the cursor.
---    flipNormal                            reverse the facing (see placementBasis).
---    normalOffset                          metres to push each item off the surface along its facing (so a
---                                          wall-aligned window sits in front of the wall instead of inside).
---    scale                                 uniform scale applied to each placed item (default 1); the preview
---                                          box grows with it too.
---    afterCreate(item, forestData, index)  per-instance hook (e.g. stamp parallax customData); returns the
---                                          final handle stored in history. index is 1-based over the array.
---  Preview per cell: a small sphere + the mesh's real bounding box (read once via getMeshBox, cached) + a
---  facing line, with the pivot cell in orange, plus a red line from the surface to the offset position. On
---  click the whole array is committed as a single undo action and returned as a list, else nil.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:494
---@param forest any
---@param itemDataId any
---@param opts any
function editor_api_forestItemTools.updateInstantiateMode(forest, itemDataId, opts) end

--- One frame of the shared "select forest items" interaction, restricted to items that pass filterFn
---  (item -> bool; nil = all). Highlights the hovered item, left-click selects it (Ctrl adds to the
---  selection, empty click clears), drag-select a screen rectangle (Ctrl adds), draws the current
---  selection's boxes and drives the transform gizmo. This is the Forest Editor's Select tool, reused so a
---  second tool can select the same items with its own filter. rayRange defaults to the working-distance pref.
---Source : lua/ge/extensions/editor/api/forestItemTools.lua:327
---@param forest any
---@param filterFn any
---@param rayRange any
function editor_api_forestItemTools.updateSelectMode(forest, filterFn, rayRange) end

