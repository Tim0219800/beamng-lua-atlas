# `editor_dragRaceEditor_zones`

*File: `lua/ge/extensions/editor/dragRaceEditor/zones.lua` · VM: Game Engine (GE) · 342 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_dragRaceEditor_zones`: `extensions.load("editor_dragRaceEditor_zones")`, then the global `editor_dragRaceEditor_zones`

Drag race zone editor (strip zone or lane zone), following the same principle as the crawl editor boundaries. It relies on the gameplay/sites/zone class: mouse vertex selection, adding/inserting vertices, moving and rotating with the editor's axis gizmo, optional terrain snapping, undo/redo via editor.history. init() returns an editor instance; zoneFromData/zoneToData convert between a serialized table and a Zone object.

## Example

```lua
local zones = require('/lua/ge/extensions/editor/dragRaceEditor/zones')
local ed = zones.init()
ed:setZone(zones.zoneFromData(strip.stripZone), {type='stripZone', strip=strip})
-- every frame: ed:draw(mouseInfo)
ed:syncBack()
```

## Notes

- Shortcuts: Shift+click adds a vertex (the first click adds a vertex if the zone is empty), Alt+click inserts at the middle of an edge, Ctrl+click adds a vertex to the selection.
- The target is {type='stripZone', strip=...} or {type='laneZone', strip=..., lane=...}; syncBack writes the serialized zone to strip.stripZone or lane.zone and marks the strip _dirty.
- In dragging(), the gizmo offset is divided by 2 (posOffset = delta/2): behavior as-is in the code, to re-check if the vertices seem to follow the gizmo at half speed.
- snapToTerrain is enabled by default (height via core_terrain.getTerrainHeight).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_dragRaceEditor_zones.init()` | Creates and returns an initialized zone editor instance (class C). | 334 |

### Parameter details

#### `editor_dragRaceEditor_zones.init()`

Creates and returns an initialized zone editor instance (class C).

- **returns**: table instance with the methods setZone, clearZone, syncBack, draw...

## Fields

| Field | Type | Description |
|---|---|---|
| `zoneFromData` | function | Alias of C.zoneFromData. |
| `zoneToData` | function | Alias of C.zoneToData. |

## Class `C`

Zone editor returned by init(). Fields: zone, target, currentVertices (selected vertices), currentPlane, snapToTerrain.

| Method | Description | Line |
|---|---|---|
| `C:beginDrag()` | Start of gizmo move: stores the starting positions. | 226 |
| `C:clearZone()` | Forgets the current zone and target. | 75 |
| `C:dragging()` | During gizmo move: translates (with terrain snapping) or rotates the selected vertices around their centroid. | 237 |
| `C:draw(mouseInfo)` | To be called every frame in zone edit mode: updates/displays the gizmo, handles input and draws the zone as debug. | 318 |
| `C:dropToTerrain(pos)` | Projects a position onto the terrain height (core_terrain.getTerrainHeight). | 129 |
| `C:endDragging()` | End of move: re-snaps to terrain if enabled and records the history action "Manipulate Zone Vertices". | 295 |
| `C:findVert(mouseInfo, objects)` | Among objects {pos, index}, finds the one hit by the mouse ray (selection radius = camera distance/40) that is closest to the camera; also draws the spheres (orange if already selected). | 99 |
| `C:init()` | Initializes the fields (no zone, snapToTerrain=true). | 57 |
| `C:input(mouseInfo)` | Handles mouse input: vertex addition (Shift or empty zone), insertion (Alt), otherwise single or multiple (Ctrl) vertex selection. | 157 |
| `C:setZone(zoneInstance, target)` | Sets the edited zone and its target; resets the vertex selection. | 68 |
| `C:syncBack()` | Writes the zone back to strip.stripZone or lane.zone, marks the strip _dirty and flags unsaved changes. No effect if there is no zone or target. | 83 |
| `C:tryInsert(mouseInfo)` | Finds the hovered edge midpoint; on click, inserts a vertex there (history action "Insert Zone Vertex"). Requires at least 2 vertices. | 138 |
| `C:updateTransform()` | Places the axis gizmo at the centroid of the selected vertices (or at the point of the current plane). | 201 |
| `C.zoneFromData(data)` | Static function: builds a Zone from a serialized table (deep copy; vertices and customFields default to empty, so an empty zone is allowed). | 41 |
| `C.zoneToData(zone)` | Static function: serializes a Zone via zone:onSerialize(). | 52 |

## Calls into the engine (C++)

- `debugDrawer:` `drawSphere`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/dragRaceEditor/zones.lua`.*
