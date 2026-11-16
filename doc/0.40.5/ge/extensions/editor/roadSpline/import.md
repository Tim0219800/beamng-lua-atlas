# `editor_roadSpline_import`

*File: `lua/ge/extensions/editor/roadSpline/import.lua` · VM: Game Engine (GE) · 451 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadSpline_import`: `extensions.load("editor_roadSpline_import")`, then the global `editor_roadSpline_import`

Import of existing DecalRoads into the Road Spline tool. Estimates a reference centerline (nodes, widths, normals) from the chosen roads by searching for their edges (exponential search then bisection, up to 50 m laterally), simplifies it with RDP, creates a new Road Spline group "Import N" and recreates the original roads as layers relative to that line. The source DecalRoads are then deleted (undo possible).

## Notes

- BUG: importSelectedIntoNewGroup calls groupMgr.getSplineMap(), which does not exist in groupMgr (the function is called getIdToIdxMap). The call therefore crashes with an "attempt to call a nil value" error after the group is created; the import via context menu or polygon cannot succeed as is (same call at lines 116 and 138 for the undo functions).
- All imported layers are created with the automatic layers disabled (tire marks, lines, fades, etc.).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadSpline_import.importFromPolygon(polygon)` | Imports all DecalRoads with at least one node inside the polygon, then calls importSelectedIntoNewGroup with them. | 425 |
| `editor_roadSpline_import.importSelectedIntoNewGroup(decalRoads)` | Converts the given DecalRoads into a new Road Spline group: computes the reference spline, creates the group, generates the layers, deletes the DecalRoads (and their scene groups that became empty) and records an undo action. Returns without doing anything if the list is empty. | 351 |

### Parameter details

#### `editor_roadSpline_import.importFromPolygon(polygon)`

Imports all DecalRoads with at least one node inside the polygon, then calls importSelectedIntoNewGroup with them.

- `polygon` (*table*) : Selection polygon (list of points) drawn by the user.

#### `editor_roadSpline_import.importSelectedIntoNewGroup(decalRoads)`

Converts the given DecalRoads into a new Road Spline group: computes the reference spline, creates the group, generates the layers, deletes the DecalRoads (and their scene groups that became empty) and records an undo action. Returns without doing anything if the list is empty.

- `decalRoads` (*table*) : List of DecalRoad objects (scenetree), e.g. the editor selection.

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `Sim.` `getUniqueName`, `upcast`
- `obj:` `delete`, `getID`, `registerObject`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadSpline/import.lua`.*
