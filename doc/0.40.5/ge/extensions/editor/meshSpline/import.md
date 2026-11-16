# `editor_meshSpline_import`

*File: `lua/ge/extensions/editor/meshSpline/import.lua` · VM: Game Engine (GE) · 648 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_meshSpline_import`: `extensions.load("editor_meshSpline_import")`, then the global `editor_meshSpline_import`

Import into the Mesh Spline tool: turns TSStatic objects already placed in the level into an equivalent mesh spline. The TSStatic are ordered into a polyline (editor/toolUtilities/fitPoly), simplified (RDP), analyzed (mesh pattern, start and end caps) then converted; the original objects are deleted, along with their empty groups, and the operation is recorded in the history (undo/redo). Called from meshSpline.lua (scenetree context menu or selection polygon).

## Notes

- At least 2 TSStatic with a non-empty shapeName are required, otherwise the import stops with a warning in the log.
- After the import, be:reloadCollision() is called and the last spline is marked "dirty" 2 frames later (handleDelayedSplineUpdates), while the collision updates: handleDelayedSplineUpdates must be called every frame (meshSpline.onEditorGui does it).
- The deleted TSStatic are saved (id, name, shapeName, position, rotation, scale, group) to allow undo.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_meshSpline_import.convertTSStatics2MeshSpline(collection)` | Converts the given TSStatic into a mesh spline: filters the valid TSStatic, orders them into a polyline, creates the spline, deletes the original objects (and their groups that became empty), records the history action and triggers the collision reload. | 508 |
| `editor_meshSpline_import.handleDelayedSplineUpdates()` | Handles the deferred update after an import: if an import has just happened, counts frames; at the 2nd, marks the last mesh spline as isDirty to force its rebuild once the collision is reloaded. *(internal)* | 35 |
| `editor_meshSpline_import.importFromPolygon(polygon)` | Imports a mesh spline from a selection polygon drawn by the user: collects the TSStatic whose position is inside the polygon (pos:inPolygon) then converts them. | 627 |

### Parameter details

#### `editor_meshSpline_import.convertTSStatics2MeshSpline(collection)`

Converts the given TSStatic into a mesh spline: filters the valid TSStatic, orders them into a polyline, creates the spline, deletes the original objects (and their groups that became empty), records the history action and triggers the collision reload.

- `collection` (*integer[]*) : Object identifiers (typically editor.selection.object).

#### `editor_meshSpline_import.importFromPolygon(polygon)`

Imports a mesh spline from a selection polygon drawn by the user: collects the TSStatic whose position is inside the polygon (pos:inPolygon) then converts them.

- `polygon` (*table*) : Selection polygon (list of points) provided by toolUtilities/polygon.

## Calls into the engine (C++)

- `Sim.` `upcast`
- `be:` `reloadCollision`
- `obj:` `delete`, `getClassName`, `getField`, `getGroup`, `getID`, `getName`, `getObjBox`, `getPosition`, `getWorldBox`, `registerObject`, `setField`, `setPosRot`, `setPosition`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/meshSpline/import.lua`.*
