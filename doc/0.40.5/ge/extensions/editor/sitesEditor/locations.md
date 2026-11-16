# `editor_sitesEditor_locations`

*File: `lua/ge/extensions/editor/sitesEditor/locations.lua` · VM: Game Engine (GE) · 152 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/sitesEditor/locations")` (file under extensions/ but not a regular extension)

'Locations' sub-editor of the sites editor. The module returns a class constructor C (called with sitesEditor and the key 'locations'). It handles selection, the click test (sphere of radius node.radius), the translation and scale gizmo (the location's radius), creation and deletion with undoable history (editor.history). It is used with sortedListDisplay as the element editor.

## Example

```lua
local locations = require('/lua/ge/extensions/editor/sitesEditor/locations')(editor_sitesEditor, 'locations')
```

## Notes

- The minimum radius of a location is 0.1 (math.max(0.1, ...)).
- In drawElement, the 'Closest Road' text displays the two nodes returned by map.findClosestRoad.

## Class `C`

Object returned by the module constructor. Fields: sitesEditor, key, current (selected location), sites, list.

The module returns a constructor: `local obj = require("editor_sitesEditor_locations")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:beginDrag()` | Start of a gizmo drag: stores the starting position and radius. | 69 |
| `C:create(pos)` | Creates a location at the given position (undoable action 'Create Location') and returns it. | 121 |
| `C:dragging()` | During the drag: in translation mode updates pos, in scale mode recomputes radius (minimum 0.1) from the gizmo factor. | 74 |
| `C:drawElement(loc)` | Draws the element editor: gizmo (if allowGizmo) and the text of the closest road segment. | 134 |
| `C:endDragging()` | End of drag: records an undoable action 'Update Transform of ...' (old and new pos/radius). | 93 |
| `C:hitTest(mouseInfo, objects)` | Returns the location closest to the camera whose sphere (radius node.radius) is crossed by the mouse ray. | 28 |
| `C:init(sitesEditor, key)` | Constructor (called by the module): stores sitesEditor and the key, with no selection. | 9 |
| `C:remove(loc)` | Removes a location (undoable action 'Remove Location'). | 128 |
| `C:select(loc)` | Selects a location and places the gizmo on it. | 21 |
| `C:setSites(sites)` | Sets the edited sites, keeps the list sites[key] and deselects. | 15 |
| `C:updateTransform()` | Places the gizmo on the position of the current location. | 45 |

## Calls into the engine (C++)

- `worldEditorCppApi.` `getAxisGizmoScale`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/sitesEditor/locations.lua`.*
