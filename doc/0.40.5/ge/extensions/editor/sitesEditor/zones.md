# `editor_sitesEditor_zones`

*File: `lua/ge/extensions/editor/sitesEditor/zones.lua` · VM: Game Engine (GE) · 412 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/sitesEditor/zones")` (file under extensions/ but not a regular extension)

'Zones' sub-editor of the sites editor. The module returns a class constructor C. A zone is a polygon of vertices with optional top and bottom planes (top, bot). The editor can add a vertex (Shift+click), insert a vertex in the middle of an edge (Alt+click), select vertices (click, Ctrl to add), move them with the gizmo (with terrain snapping, enabled by default), delete vertices, generate the planes automatically and subdivide the fence. It also displays vertices, area and whether the player is inside the zone.

## Notes

- Terrain snapping uses core_terrain.getTerrainHeight; without core_terrain, dropToTerrain returns false.
- In dragging, the gizmo movement is divided by 2 then added several times (vertex.pos + posOffset, then dropToTerrain(vertex.pos + posOffset)): behavior as in the code.
- findZone chooses the zone for which rayIntersectsZone gives the smallest distance.
- Vertex creation, deletion and move actions go through editor.history.

## Class `C`

Object returned by the constructor. Fields: sitesEditor, key, current (zone), currentVertices (selected vertices), currentPlane (top or bot plane being edited).

The module returns a constructor: `local obj = require("editor_sitesEditor_zones")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:beginDrag()` | Start of drag: stores the gizmo position, the vertices' position and the plane rotation. | 154 |
| `C:create()` | Creates a zone (undoable action 'Create Zone') and returns it. | 294 |
| `C:dragging()` | During the drag: translation or rotation of the vertices (around their centroid), of the plane, with terrain snapping. | 167 |
| `C:drawElement(zone)` | Draws the zone editor: gizmo, buttons (Select All Vertices, Delete Current Vertices, Auto Planes, Divide), checkboxes Snap To Terrain, Top Plane, Bottom Plane, and info (vertex count, area, computation time, player inside). | 307 |
| `C:dropToTerrain(pos)` | Projects a position onto the terrain height. | 234 |
| `C:endDragging()` | End of drag: snaps to the terrain, recomputes the vertices (processVertices) and records the undoable action 'Dragged Vertices'. | 257 |
| `C:findVert(mouseInfo, objects)` | Draws a sphere per vertex (orange if selected) and returns the vertex closest to the camera hit by the mouse ray (sphere radius = camera distance / 40). | 33 |
| `C:findZone(mouseInfo, objects)` | Returns the zone crossed by the mouse ray at the smallest distance (obj:rayIntersectsZone). | 389 |
| `C:init(sitesEditor, key)` | Constructor: stores sitesEditor, the key and an empty vertex selection. | 11 |
| `C:input(mouseInfo)` | Handles the mouse: zone selection by click (Ctrl to toggle), vertex addition with Shift, insertion with Alt, otherwise vertex selection. | 88 |
| `C:remove(zone)` | Removes a zone (undoable action 'Remove Zone'). | 301 |
| `C:select(zone)` | Selects a zone, repositions the gizmo and clears the vertex and plane selection. | 24 |
| `C:setSites(sites)` | Sets the edited sites and deselects. | 18 |
| `C:tryInsert(mouseInfo)` | With Alt: tests the edge midpoints and, on click, inserts a vertex there. | 67 |
| `C:updateTransform()` | Places the gizmo at the centroid of the selected vertices, or on the plane being edited (local or world orientation). | 128 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`
- `obj:` `rayIntersectsZone`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/sitesEditor/zones.lua`.*
