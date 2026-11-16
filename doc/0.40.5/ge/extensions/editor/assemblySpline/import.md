# `editor_assemblySpline_import`

*File: `lua/ge/extensions/editor/assemblySpline/import.lua` · VM: Game Engine (GE) · 674 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_assemblySpline_import`: `extensions.load("editor_assemblySpline_import")`, then the global `editor_assemblySpline_import`

Import for the Assembly Spline tool: converts TSStatic objects already placed in the level (compatible with the assembly kit, i.e. having anchors named 'nail.*') into an assembly spline. It rebuilds the assembly kit and the molecule from the meshes, fits a polyline on the root components (fitPoly), creates the spline, deletes the original TSStatics (and empty groups) and records the action in the undo history (undo/redo restores the saved TSStatics). Used by the scene tree right-click menu and by the tool's selection polygon.

## Notes

- A TSStatic is compatible if it has at least one anchor whose name starts with "nail.".
- At least 2 compatible TSStatics are required, and at least 2 root components that can be fitted to a polyline, otherwise a warning is logged (logtag assemblySpline.import) and nothing is converted.
- Variations are recognized by the file name containing "var" and of the form <base>_var...; the base name is rebuilt with the .dae extension.
- After the import the spline is marked dirty 2 frames later (handleDelayedSplineUpdates) because it must wait for the collision mesh update.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_assemblySpline_import.convertTSStatics2AssemblySpline(collection)` | Converts a selection of TSStatics into an assembly spline: filters the compatible ones, rebuilds the kit and the molecule, fits the polyline, creates the spline, deletes the original objects, reloads collision (be:reloadCollision) and records the action "Convert TSStatics to Assembly Spline" in editor.history. | 566 |
| `editor_assemblySpline_import.handleDelayedSplineUpdates()` | Deferred update after an import: after 2 calls, marks the last assembly spline as dirty to rebuild it once the collision is updated. Called every frame by onEditorGui of assemblySpline. *(internal)* | 42 |
| `editor_assemblySpline_import.importFromPolygon(polygon)` | Finds all TSStatics in the level whose position is inside the polygon and converts them via convertTSStatics2AssemblySpline. | 651 |
| `editor_assemblySpline_import.validateToolCompatibleTSStatic(obj)` | Indicates whether the object is a TSStatic with at least one anchor whose name starts with "nail.". | 145 |

### Parameter details

#### `editor_assemblySpline_import.convertTSStatics2AssemblySpline(collection)`

Converts a selection of TSStatics into an assembly spline: filters the compatible ones, rebuilds the kit and the molecule, fits the polyline, creates the spline, deletes the original objects, reloads collision (be:reloadCollision) and records the action "Convert TSStatics to Assembly Spline" in editor.history.

- `collection` (*integer[]|nil*) : Ids of the selected TSStatic objects.

#### `editor_assemblySpline_import.importFromPolygon(polygon)`

Finds all TSStatics in the level whose position is inside the polygon and converts them via convertTSStatics2AssemblySpline.

- `polygon` (*table*) : Selection polygon (list of points).

#### `editor_assemblySpline_import.validateToolCompatibleTSStatic(obj)`

Indicates whether the object is a TSStatic with at least one anchor whose name starts with "nail.".

- `obj` (*table|nil*) : Scene object.
- **returns**: boolean true if compatible.

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `Sim.` `upcast`
- `be:` `reloadCollision`
- `obj:` `delete`, `getAnchorNames`, `getClassName`, `getField`, `getGroup`, `getID`, `getName`, `getPosition`, `registerObject`, `setField`, `setPosition`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/assemblySpline/import.lua`.*
