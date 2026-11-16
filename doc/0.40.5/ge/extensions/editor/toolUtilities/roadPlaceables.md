# `editor_toolUtilities_roadPlaceables`

*File: `lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua` · VM: Game Engine (GE) · 345 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_toolUtilities_roadPlaceables`: `extensions.load("editor_toolUtilities_roadPlaceables")`, then the global `editor_toolUtilities_roadPlaceables`

Shared controller of "placeable" items for the editor's spline road tools: placing, selecting, dragging and editing items positioned along a road's axis (for example pedestrian crossings, repair groups). A tool can carry several kinds; each registers its "host" table with setHost, and placement, selection, dragging and handles are indexed by kind. The module has no dependency on an unshipped tool folder. The state is global to the module: only one road tool active at a time, each tool calls reset() on activation and deactivation.

## Example

```lua
local rp = extensions.editor_toolUtilities_roadPlaceables
-- tool's onActivate:
rp.reset()
rp.setHost({kind = 'crossing', label = 'Crossing', getGroups = getGroups, isRoad = isRoad, itemsOf = itemsOf,
  extentOf = extentOf, frameAt = frameAt, tForPoint = tForPoint, clampT = clampT,
  addItem = addItem, removeItem = removeItem, deepCopy = deepCopy, undo = undo, redo = redo, defaultDepthM = 4})
-- every frame:
rp.handlePlacement(groups); rp.drawHandles(groups, selGroup, false)
```

## Notes

- Required host fields: kind (unique string), label (name for prompts and undo names), getGroups(), isRoad(g), itemsOf(g), extentOf(item), frameAt(g, t01) -> center, p0, p1 (nil if not ready), tForPoint(g, worldPt, extentM) -> t01, clampT(g, t01, extentM) -> t01, addItem(g, t01) -> item|nil, removeItem(g, idx), deepCopy(g), undo, redo (editor.history:commitAction callbacks), defaultDepthM.
- Items carry their normalized position t (0..1, default 0.5) along the road; the handles are at the roadway edges (p0/p1), not on the axis.
- The kind parameter is optional everywhere: it resolves to the explicit kind, otherwise the last hovered kind, otherwise the first registered kind.
- The handle selection radius is adaptive (0.2 * sqrt(distance) * 0.9) and must stay aligned with splineInput.
- drawEditor displays an ImGui editor for a pedestrian-crossing item (title "Pedestrian Crossing", depth slider 1.5 to 8 m, lateral extent, deletion): only useful for a host with depthM and lateral.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_toolUtilities_roadPlaceables.clickHandle(groups, gi, ci, ctrlDown, kind)` | Routes a click on a handle: CTRL deletes it (with an undo entry); a simple click selects it and starts dragging along the road (a single click-drag moves it). | 127 |
| `editor_toolUtilities_roadPlaceables.drawEditor()` | Compact ImGui editor of the selected pedestrian-crossing item (depth, lateral extent, deletion). | 268 |
| `editor_toolUtilities_roadPlaceables.drawHandles(groups, selGroup, showSelected)` | Draws handles and highlight of the existing items, all kinds together, only for the selected road or the road owning the selected item. | 222 |
| `editor_toolUtilities_roadPlaceables.drawHover(groups, gi, ci, kind)` | Hover glow and prompt for the item under the cursor this frame (prompt "drag to move, or CTRL to delete"). | 251 |
| `editor_toolUtilities_roadPlaceables.getSelection()` | Returns the current selection. | 83 |
| `editor_toolUtilities_roadPlaceables.handlePlacement(groups)` | Ghost preview and click to add while placement mode is active (roads only; aimed by camera ray against the axis, so also on elevated sections). Selects the added item. | 147 |
| `editor_toolUtilities_roadPlaceables.handleSelectDrag(groups)` | Dragging the selected handle along the road; the selection starts the drag. | 194 |
| `editor_toolUtilities_roadPlaceables.hasSelection(kind)` | True if an item is selected (of the given kind if kind is provided). | 79 |
| `editor_toolUtilities_roadPlaceables.isDragging()` | True during a drag along the road. | 78 |
| `editor_toolUtilities_roadPlaceables.isPlaceMode(kind)` | Tells whether placement mode is active (for this kind if kind is given, otherwise for any). The host tool owns the Add button and drives these accessors. | 76 |
| `editor_toolUtilities_roadPlaceables.reset()` | Clears everything: host registry, placement mode, selection and dragging. To be called in the host tool's onActivate and onDeactivate. | 86 |
| `editor_toolUtilities_roadPlaceables.select(kind, gi, ci)` | Selects an item so that a host list can highlight it. | 82 |
| `editor_toolUtilities_roadPlaceables.setHost(host)` | Registers the host of a placeable item kind. To be called in the tool's onActivate, after reset(). | 58 |
| `editor_toolUtilities_roadPlaceables.setPlaceMode(on, kind)` | Enables or disables placement mode for a kind (kind resolved: explicit, hovered or sole). | 77 |
| `editor_toolUtilities_roadPlaceables.underMouse()` | Finds the closest item handle under the cursor among all kinds (camera ray against spheres at the roadway edges). Also remembers the hovered kind. | 95 |

### Parameter details

#### `editor_toolUtilities_roadPlaceables.clickHandle(groups, gi, ci, ctrlDown, kind)`

Routes a click on a handle: CTRL deletes it (with an undo entry); a simple click selects it and starts dragging along the road (a single click-drag moves it).

- `groups` (*table*) : Groups (roads).
- `gi` (*integer*) : Group index.
- `ci` (*integer*) : Item index.
- `ctrlDown` (*boolean*) : CTRL held.
- `kind` (*string|nil*) : Kind; otherwise hovered or sole.
- **returns**: string 'deleted', 'selected' or 'none'.

#### `editor_toolUtilities_roadPlaceables.drawEditor()`

Compact ImGui editor of the selected pedestrian-crossing item (depth, lateral extent, deletion).

- **returns**: boolean false when the selection has disappeared (the host then resets its selection kind).

#### `editor_toolUtilities_roadPlaceables.drawHandles(groups, selGroup, showSelected)`

Draws handles and highlight of the existing items, all kinds together, only for the selected road or the road owning the selected item.

- `groups` (*table*) : Groups (roads).
- `selGroup` (*integer|nil*) : Index of the selected road.
- `showSelected` (*boolean*) : true if the host's global selection is currently one of these items (selected style versus hover).

#### `editor_toolUtilities_roadPlaceables.drawHover(groups, gi, ci, kind)`

Hover glow and prompt for the item under the cursor this frame (prompt "drag to move, or CTRL to delete").

- `groups` (*table*) : Groups (roads).
- `gi` (*integer*) : Group index.
- `ci` (*integer*) : Item index.
- `kind` (*string|nil*) : Kind; otherwise hovered or sole.

#### `editor_toolUtilities_roadPlaceables.getSelection()`

Returns the current selection.

- **returns**: string|nil kind.
- **returns**: integer|nil gi.
- **returns**: integer|nil ci.

#### `editor_toolUtilities_roadPlaceables.handlePlacement(groups)`

Ghost preview and click to add while placement mode is active (roads only; aimed by camera ray against the axis, so also on elevated sections). Selects the added item.

- `groups` (*table*) : Groups (roads).
- **returns**: boolean true if an item was added this frame.

#### `editor_toolUtilities_roadPlaceables.handleSelectDrag(groups)`

Dragging the selected handle along the road; the selection starts the drag.

- `groups` (*table*) : Groups (roads).
- **returns**: boolean true while the module owns the frame (the host then skips the default node/aux drag).

#### `editor_toolUtilities_roadPlaceables.hasSelection(kind)`

True if an item is selected (of the given kind if kind is provided).

- `kind` (*string|nil*) : Kind to test.
- **returns**: boolean true if selection.

#### `editor_toolUtilities_roadPlaceables.isDragging()`

True during a drag along the road.

- **returns**: boolean true if a drag is in progress.

#### `editor_toolUtilities_roadPlaceables.isPlaceMode(kind)`

Tells whether placement mode is active (for this kind if kind is given, otherwise for any). The host tool owns the Add button and drives these accessors.

- `kind` (*string|nil*) : Kind to test.
- **returns**: boolean true if in placement mode.

#### `editor_toolUtilities_roadPlaceables.select(kind, gi, ci)`

Selects an item so that a host list can highlight it.

- `kind` (*string*) : Kind of the item.
- `gi` (*integer*) : Group (road) index.
- `ci` (*integer*) : Index of the item in the group.

#### `editor_toolUtilities_roadPlaceables.setHost(host)`

Registers the host of a placeable item kind. To be called in the tool's onActivate, after reset().

- `host` (*table*) : Host table with kind, label, getGroups, isRoad, itemsOf, extentOf, frameAt, tForPoint, clampT, addItem, removeItem, deepCopy, undo, redo, defaultDepthM.

#### `editor_toolUtilities_roadPlaceables.setPlaceMode(on, kind)`

Enables or disables placement mode for a kind (kind resolved: explicit, hovered or sole).

- `on` (*boolean*) : true to arm.
- `kind` (*string|nil*) : Kind to arm.

#### `editor_toolUtilities_roadPlaceables.underMouse()`

Finds the closest item handle under the cursor among all kinds (camera ray against spheres at the roadway edges). Also remembers the hovered kind.

- **returns**: integer|nil gi, group index.
- **returns**: integer|nil ci, item index.
- **returns**: string|nil kind.

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/toolUtilities/roadPlaceables.lua`.*
