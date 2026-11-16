# `editor_heroRoadEditor_import`

*File: `lua/ge/extensions/editor/heroRoadEditor/import.lua` · VM: Game Engine (GE) · 452 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_heroRoadEditor_import`: `extensions.load("editor_heroRoadEditor_import")`, then the global `editor_heroRoadEditor_import`

Import of existing DecalRoads into a new Hero Road group. From a selection of DecalRoads (or a selection polygon), the module estimates a reference centerline (middle of the left/right edges found by exponential search then bisection starting from the longest road), creates an 'Import N' group with these simplified (RDP) nodes and turns each DecalRoad into a layer (material, render priority, width, normalized lateral position, flip, fades). The used DecalRoads are deleted, with an undo/redo commit.

## Notes

- Constants: initial search step 0.1 m, 8 refinement iterations, max search distance 50 m, width tolerance 0.1 m (isTrackWidth), RDP tolerance 0.5.
- A layer's lateral position = average of (sign * distance * 2 / reference width) over its nodes; isFlip is decided by majority vote on the dot product of the tangents.
- Loops are not handled (tmpSpline.isLoop = false, TODO in the code).
- The created group disables all automatic layers (tire tracks, damaged asphalt, cracks, repairs, patches, center/edge/lane lines, edge fades).
- Undo recreates the deleted DecalRoads (name, fields, nodes, parent group); redo deletes them again by name.
- A DecalRoad in the polygon is enough to import the whole road as soon as one of its nodes is inside (pos:inPolygon).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_heroRoadEditor_import.importFromPolygon(polygon)` | Finds all DecalRoads with at least one node inside the polygon, then calls importSelectedIntoNewGroup with them. | 426 |
| `editor_heroRoadEditor_import.importSelectedIntoNewGroup(decalRoads)` | Imports the given DecalRoads into a new Hero Road group: computes the reference spline, creates the group, generates the layers, deletes the DecalRoads (and their parent groups that became empty) and records the 'Import DecalRoads into Hero Road' action in the history. Does nothing if the list is empty. | 351 |

### Parameter details

#### `editor_heroRoadEditor_import.importFromPolygon(polygon)`

Finds all DecalRoads with at least one node inside the polygon, then calls importSelectedIntoNewGroup with them.

- `polygon` (*table*) : Selection polygon (list of points) accepted by vec3:inPolygon.

#### `editor_heroRoadEditor_import.importSelectedIntoNewGroup(decalRoads)`

Imports the given DecalRoads into a new Hero Road group: computes the reference spline, creates the group, generates the layers, deletes the DecalRoads (and their parent groups that became empty) and records the 'Import DecalRoads into Hero Road' action in the history. Does nothing if the list is empty.

- `decalRoads` (*table*) : Array of scene DecalRoad objects.

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `Sim.` `getUniqueName`, `upcast`
- `obj:` `delete`, `getID`, `registerObject`, `setField`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/heroRoadEditor/import.lua`.*
