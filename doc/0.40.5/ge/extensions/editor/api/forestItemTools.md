# `editor_api_forestItemTools`

*Fichier : `lua/ge/extensions/editor/api/forestItemTools.lua` · VM : Game Engine (GE) · 718 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_forestItemTools` : `extensions.load("editor_api_forestItemTools")`, puis la globale `editor_api_forestItemTools`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_forestItemTools.addItems(forestData, items, dontCallRedo)` |  | 139 |
| `editor_api_forestItemTools.clearSelection(forestData)` |  | 70 |
| `editor_api_forestItemTools.filterItems(items, keep)` | Returns a new list with only the items for which keep(item) is true (nil list -> empty list). | 679 |
| `editor_api_forestItemTools.getSelection()` |  | 43 |
| `editor_api_forestItemTools.handleGizmo(forest)` | Drive + draw the axis gizmo for the current selection. Call once per frame from the tool's onUpdate. | 295 |
| `editor_api_forestItemTools.isParallaxDataObject(cobj)` | Same test on a ForestItemData datablock object (from scenetree.findObject), for filtering the mesh<br> palette: true when the datablock's name / internalName starts with the parallax_ prefix. | 667 |
| `editor_api_forestItemTools.isParallaxItem(item)` | Convenience predicate for the select filters: is this a parallax window item? | 660 |
| `editor_api_forestItemTools.itemDataSelectable(uniqueId, label, isSelected, icon)` | Shared mesh-list row for both the Forest Editor and the Parallax Interior Editor: a datablock icon<br> plus a full-width selectable that highlights when selected. Returns true on click; the caller owns<br> selection state. `uniqueId` (the datablock id) disambiguates the imgui id. `icon` optionally<br> overrides the default datablock icon (the Parallax Interior Editor passes crop_din for its windows). | 625 |
| `editor_api_forestItemTools.itemMatchesPrefix(item, prefix)` | True when a forest item's datablock name (or internalName) starts with `prefix`. Checks both to<br> match listItemDatas, since a datablock can be identified by either. | 647 |
| `editor_api_forestItemTools.listItemDatas(prefix, matchPrefix)` | ForestItemData datablock discovery, filtered by a name prefix. matchPrefix=true returns only<br> datablocks whose name (or internalName) starts with `prefix` - the Parallax Interior Editor lists<br> these; matchPrefix=false returns the rest - the Forest Editor, so parallax windows stay out of its<br> mesh palette. Returns a name-sorted list of { id, name }. | 601 |
| `editor_api_forestItemTools.packParallaxData(setId, emissive)` | (setId, emissive) -> customData. setId < 0 yields -1 (disabled; the C++ save drops customData < 0). | 709 |
| `editor_api_forestItemTools.pick(forest, rayRange, filterFn)` | Click-pick the rendered forest item under the mouse. filterFn(item) can reject items that aren't<br> ours (e.g. keep the parallax tool from selecting ordinary forest items). | 186 |
| `editor_api_forestItemTools.place(forest, itemData, transform, scale, afterCreate)` | Instantiate one item from a datablock template at the given transform and return the final handle.<br> afterCreate(item, forestData) optionally mutates the fresh item (e.g. set per-instance parallax data)<br> and returns the final handle. This does NOT record undo history: the caller commits (updateInstantiate-<br> Mode batches a whole array into a single addItems action so one undo removes the lot). The final handle<br> is what the caller stores, so redo (via addItem) restores those per-instance fields. | 173 |
| `editor_api_forestItemTools.placementBasis(hitNormal, yawRad, alignToNormal, flip)` | Placement basis for the array + each item's orientation. Returns unit (right, up, forward); the item<br> transform columns are X=right, Y=forward (the window's facing), Z=up (the forest item convention), and<br> the array steps along right (columns) and up (rows). World mode is the identity axes yawed around world<br> Z, so a row runs along +X rotated by yawRad. alignToNormal instead faces the window along the surface<br> normal, lays the array in that surface's plane and treats yawRad as an in-plane spin. flip reverses the<br> facing (window faces the other way) - the fix when a wall's normal points the wrong side. | 453 |
| `editor_api_forestItemTools.removeItems(forestData, items, dontCallRedo)` |  | 145 |
| `editor_api_forestItemTools.select(forestData, forestItems, addToSelection)` | Select the given forest items (nil/empty clears). addToSelection keeps the current selection.<br> Mirrors the Forest Editor's selection, minus its mesh-preview side effect. | 83 |
| `editor_api_forestItemTools.unpackParallaxData(customData)` | customData -> (setId, emissive). setId is -1 when no parallax set is assigned (disabled). | 698 |
| `editor_api_forestItemTools.updateInstantiateMode(forest, itemDataId, opts)` | One frame of the shared "instantiate item" interaction: raycast under the cursor and, on left click,<br> create forest item(s) from the datablock `itemDataId` at the hit (scale 1, undoable in one step). This<br> is the Forest Editor's Instantiate tool, reused so a second tool can place its own meshes.<br> opts (all optional):<br>   rayRange                              pick distance (defaults to the forest tool preference).<br>   cols, rows                            array size. The cursor cell is the pivot; columns grow along the<br>                                         basis' right, rows along its up. Default 1x1 (single placement).<br>   colGap, rowGap                        metres of empty space between neighbouring cells, measured edge<br>                                         to edge on the mesh's own bounds (default 0, i.e. flush).<br>   yaw                                   array rotation in degrees (see placementBasis).<br>   alignToNormal                         face placed items along the surface normal under the cursor.<br>   flipNormal                            reverse the facing (see placementBasis).<br>   normalOffset                          metres to push each item off the surface along its facing (so a<br>                                         wall-aligned window sits in front of the wall instead of inside).<br>   scale                                 uniform scale applied to each placed item (default 1); the preview<br>                                         box grows with it too.<br>   afterCreate(item, forestData, index)  per-instance hook (e.g. stamp parallax customData); returns the<br>                                         final handle stored in history. index is 1-based over the array.<br> Preview per cell: a small sphere + the mesh's real bounding box (read once via getMeshBox, cached) + a<br> facing line, with the pivot cell in orange, plus a red line from the surface to the offset position. On<br> click the whole array is committed as a single undo action and returned as a list, else nil. | 494 |
| `editor_api_forestItemTools.updateSelectMode(forest, filterFn, rayRange)` | One frame of the shared "select forest items" interaction, restricted to items that pass filterFn<br> (item -> bool; nil = all). Highlights the hovered item, left-click selects it (Ctrl adds to the<br> selection, empty click clears), drag-select a screen rectangle (Ctrl adds), draws the current<br> selection's boxes and drives the transform gizmo. This is the Forest Editor's Select tool, reused so a<br> second tool can select the same items with its own filter. rayRange defaults to the working-distance pref. | 327 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `PARALLAX_ITEM_PREFIX` | string |  |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEditorObjectSelectionChanged` — écouté par 8 module(s)

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `debugDrawer:` `drawLine`, `drawSphere`
- `obj:` `delete`, `getData`, `getKey`, `getObjBox`, `getPosition`, `getScale`, `getTransform`, `getUid`, `registerObject`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`
- `ui_imgui.` `GetIO`, `GetMouseDragDelta`, `GetMousePos`, `IsMouseClicked`, `IsMouseDragging`, `IsMouseReleased`
- `worldEditorCppApi.` `getAxisGizmoScaleOffset`, `getAxisGizmoTotalRotateOffset`, `rebuildForestManagerInstanceData`, `renderForestBBs`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/forestItemTools.lua`.*
