# `editor_crawlEditor_boundaries`

*File: `lua/ge/extensions/editor/crawlEditor/boundaries.lua` · VM: Game Engine (GE) · 751 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** `require("extensions/editor/crawlEditor/boundaries")` (file under extensions/ but not a regular extension)

"Boundaries" subtool of the crawl editor: edits the boundary zones (gameplay/sites/zone objects) of a level or mission. The module returns a constructor: require('editor_crawlEditor_boundaries')(crawlEditor) creates an instance C. The tool lists the boundaries, shows the detail (name, file name, vertices, area, top/bottom height limits, custom fields), lets you add/insert/move/delete vertices with the gizmo or mouse, generate planes (autoPlanes) and a high-resolution fence, and create a DecalRoad following the outline. Vertex and plane modifications go through editor.history (undoable) and mark the boundary as modified (_dirty).

## Example

```lua
local boundaries = require('editor_crawlEditor_boundaries')(crawlEditorInstance)
boundaries:setBoundary(myZone)
-- every frame, with the mouseInfo table from crawlEditor/input:
boundaries:draw(mouseInfo)
```

## Notes

- Mouse controls in the view: Shift + click = adds a vertex at the end (at the click position); Alt + click on the middle of an edge = inserts a vertex; click = selects the vertex; Ctrl + click = adds to the selection. Vertices are shown as spheres of radius camera_distance/40.
- Moving vertices with the gizmo is snapped to the terrain by default (snapToTerrain = true); endDragging reapplies the snap and records "Manipulate Boundary Vertices".
- In dragging(), the gizmo translation offset is divided by 2 (posOffset = delta / 2): code behavior, probably an intentional compensation but not commented.
- dropToTerrain returns (pos, true) if core_terrain exists, even if getTerrainHeight returns nil (the original height is then kept); otherwise (pos, false).
- drawBoundaryDetail displays the vertex count and the area twice ("Live boundary stats" block then "Vertex Count / Area").
- The file name Rename button calls editor_crawlEditor.renameObjectFile(oldPath, newPath, 'boundary') if this function exists.
- "Create Decal Road" requires at least 3 vertices: creates a DecalRoad (material a_asphalt_01_a, looped, node width 0.1) in MissionGroup.

## Class `C`

Instance of the boundaries tool, created by the constructor returned by the module. Main fields: crawlEditor, boundary (zone being edited), currentVertices (selected vertices), currentPlane (selected height plane), snapToTerrain, fields (imgui buffers of the custom fields).

The module returns a constructor: `local obj = require("editor_crawlEditor_boundaries")(options)`.

| Method | Description | Line |
|---|---|---|
| `C:beginDrag()` | Start of gizmo manipulation: stores the gizmo position, those of the selected vertices and the plane rotation. | 506 |
| `C:clearSelection()` | Clears the vertex and plane selection. | 113 |
| `C:dragging()` | During manipulation: translates (with terrain snap) or rotates the selected vertices around the centroid, or moves/orients the selected plane, then recomputes the zone (processVertices). | 519 |
| `C:draw(mouseInfo)` | Called every frame: updates the axis gizmo (begin/end/dragging), draws it, processes mouse input and updates its transform. | 625 |
| `C:drawBoundariesList(allBoundaries, selection)` | Draws the list of boundaries with the "Add Boundary" button and a "Delete" context menu (right click). Fills selection.index and selection.clicked. | 118 |
| `C:drawBoundaryDetail(boundary)` | Draws the detail panel of a boundary: Goto, statistics, name, file name, vertices, Auto Planes, High Res Fence, Create Decal Road, top/bottom limits, mouse position, custom fields. | 158 |
| `C:drawBoundaryEditor()` | Draws the detail of the current boundary, or "No boundary selected". | 640 |
| `C:drawCustomFields(fields)` | Draws the custom fields editor (string, number, vec3 with 3D marker) with X, New String, New Number, Copy Fields and Paste Fields buttons. | 649 |
| `C:dropToTerrain(pos)` | Places a point at the terrain height. | 586 |
| `C:endDragging()` | End of manipulation: re-snaps to the terrain, records the "Manipulate Boundary Vertices" action in the history, marks the boundary as modified. | 595 |
| `C:findVert(mouseInfo, objects)` | Draws spheres on the given points (orange if selected) and returns the one closest to the camera whose mouse ray passes through the sphere. | 378 |
| `C:getNewBoundary()` | Creates a new empty zone named "New Boundary" via gameplay/sites/zone. | 374 |
| `C:init(crawlEditorParam)` | Initializes the instance (called by the constructor). | 88 |
| `C:input(mouseInfo)` | Processes mouse input: Shift = vertex add, Alt = insertion, otherwise vertex selection (Ctrl = multiple). | 436 |
| `C:setBoundary(boundaryParam)` | Sets the boundary being edited. | 109 |
| `C:setFields(boundary)` | Copies the boundary's name and file name into the imgui input buffers. | 102 |
| `C:tryInsert(mouseInfo)` | Looks for a click on the middle of an edge (Alt held) and, if found, inserts a vertex via the history ("Insert Boundary Vertex"). | 413 |
| `C:updateTransform()` | Places the axis gizmo at the centroid of the selected vertices, or on the selected height plane (oriented according to local/global alignment). | 478 |

## Calls into the engine (C++)

- `debugDrawer:` `drawLine`, `drawSphere`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/crawlEditor/boundaries.lua`.*
