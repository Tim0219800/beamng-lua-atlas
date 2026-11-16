# `editor_drivePathEditor_splineMgr`

*File: `lua/ge/extensions/editor/drivePathEditor/splineMgr.lua` · VM: Game Engine (GE) · 1048 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_drivePathEditor_splineMgr`: `extensions.load("editor_drivePathEditor_splineMgr")`, then the global `editor_drivePathEditor_splineMgr`

Spline manager of the Drive Path Editor (prefix "Drive Path Spline", edit mode drivePathSplineEditMode). A path spline describes a route for an AI: nodes, widths, normals, speeds (vels) and speed limits (velLimits) in free mode, or a list of navgraph nodes (graphNodes/graphPath) in graph mode. The module holds the list of splines and the id-to-index table, handles creation, deletion, splitting, joining, reversing, undo/redo, serialization, spline-vehicle links (which move the vehicle back to the start) and the map's navgraph cache (map.getGraphpath()).

## Notes

- Default spline parameters: isFreeMode true, delayTime 0 s, aggression 0.3, numLaps 1, routeSpeed 31.3 (m/s), routeSpeedMode 'off', isAvoidCars true, isDriveInLane true, isLoop false, startingNode 1, speedProfileMode 0 (0 none, 1 target speeds, 2 speed limits, free script only).
- Constants: minimum subdivisions 10; gap at split 1.0 m; minimum import size 10 m; vehicle vertical offset 0.3 m (vehShiftZ); ribbon points sampled by raycast with zExtra 3.0 and zFloat 0.15.
- A scene vehicle is a table {vid, veh, name, isLink, linkSplineId}; a linked spline has isVehicleLink and linkVehId. linkSpline immediately moves the vehicle to the start and stores its original pose; unlinkSpline restores it.
- Splines are recomputed by updateDirtyDrivePathSplines when isDirty is true. In graph mode, a spline stays dirty as long as the navgraph is not available.
- getNavGraph returns nil until map.getGraphpath() exists; otherwise it caches {graph, nodes (positions), widths (radius), lines} for all edges (once per edge).
- convertPathsToDrivePathSplines creates one spline per path even if too small (it stays empty) and its log counts #paths - #drivePathSplines (inexact if splines already existed).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_drivePathEditor_splineMgr.addNewDrivePathSpline()` | Appends a new empty spline with a unique name, an Engine.generateUUID() UUID and the default parameters. | 202 |
| `editor_drivePathEditor_splineMgr.computeActiveVehicles()` | Rebuilds the list of active scene vehicles (activeVehiclesIterator) with vid, veh, name and links reset. | 84 |
| `editor_drivePathEditor_splineMgr.convertPathsToDrivePathSplines(paths)` | Converts paths from an image into splines (see notes for the cases of paths that are too small). | 967 |
| `editor_drivePathEditor_splineMgr.deepCopyDrivePathSpline(spline)` | Deep copy of a spline (for history). | 283 |
| `editor_drivePathEditor_splineMgr.deepCopyDrivePathSplineState()` | Deep copy of all splines. | 350 |
| `editor_drivePathEditor_splineMgr.deserializeDrivePathSpline(data)` | Rebuilds a spline from a serialized table. | 811 |
| `editor_drivePathEditor_splineMgr.flipSpline(spline)` | Reverses the direction of a spline: nodes, widths, normals, speeds and speed limits are reversed. | 577 |
| `editor_drivePathEditor_splineMgr.getActiveVehicles(isForce)` | Returns the list of active vehicles; recomputes it if it is empty or if isForce is true. | 94 |
| `editor_drivePathEditor_splineMgr.getDefaultSliderParams()` | Returns the default values of the spline parameters. | 183 |
| `editor_drivePathEditor_splineMgr.getDrivePathSplines()` | Returns the splines table (reference). | 65 |
| `editor_drivePathEditor_splineMgr.getEditModeKey()` | Returns the edit mode key ("drivePathSplineEditMode"). | 62 |
| `editor_drivePathEditor_splineMgr.getNavGraph()` | Returns the map's navgraph data (cache), computing it on the first call if possible. | 141 |
| `editor_drivePathEditor_splineMgr.getSplineMap()` | Returns the spline id to index table. | 68 |
| `editor_drivePathEditor_splineMgr.getToolPrefixStr()` | Returns the tool prefix ("Drive Path Spline"). | 59 |
| `editor_drivePathEditor_splineMgr.getVehicleById(vid)` | Looks for a vehicle in the already computed list (without recomputing it). | 102 |
| `editor_drivePathEditor_splineMgr.joinDrivePathSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)` | Joins two non-looped splines: the first receives the concatenated geometry, the second is removed. | 486 |
| `editor_drivePathEditor_splineMgr.linkSpline(spline, vehicle)` | Links a spline to a vehicle (isVehicleLink, linkVehId, linkSplineId) and moves the vehicle back to the start. | 635 |
| `editor_drivePathEditor_splineMgr.relinkAllVehiclesToSplines()` | Relinks all splines to their vehicle (via linkVehId) by searching the computed vehicle list. | 673 |
| `editor_drivePathEditor_splineMgr.removeAllDrivePathSplines(isIncludeDisabled)` | Removes splines. With isIncludeDisabled true, all of them; otherwise only the enabled ones. | 264 |
| `editor_drivePathEditor_splineMgr.removeDrivePathSpline(idx)` | Removes the spline at the given index and updates the index table. | 256 |
| `editor_drivePathEditor_splineMgr.resetGeometry(spline)` | Clears all the geometry of a spline (nodes, widths, nmls, vels, velLimits, graphNodes, graphPath) and marks it isDirty. | 186 |
| `editor_drivePathEditor_splineMgr.resetVehiclePose(spline, vehicle)` | Places the vehicle at the spline's start node (startingNode), oriented along the neighboring nodes, with a 0.3 m vertical offset. Stores its original pose only once. In graph mode, uses the navgraph nodes (requires the cache). | 602 |
| `editor_drivePathEditor_splineMgr.serializeDrivePathSpline(spline)` | Serializes a spline into a table. | 756 |
| `editor_drivePathEditor_splineMgr.setDrivePathSpline(spline, idx)` | Places a spline at an index and marks it isDirty. | 71 |
| `editor_drivePathEditor_splineMgr.setDrivePathSplines(splines)` | Places all splines of an array (each marked isDirty). | 77 |
| `editor_drivePathEditor_splineMgr.singleSplineEditRedo(drivePathSplineData)` | Redoes a single spline edit from drivePathSplineData.new. *(internal)* | 724 |
| `editor_drivePathEditor_splineMgr.singleSplineEditUndo(drivePathSplineData)` | Undoes a single spline edit from drivePathSplineData.old, then relinks the vehicles. *(internal)* | 716 |
| `editor_drivePathEditor_splineMgr.splitDrivePathSpline(selectedSplineIdx, selectedNodeIdx)` | Splits a spline in two at the given node (1.0 m gap between the two parts). | 360 |
| `editor_drivePathEditor_splineMgr.transSplineEditRedo(data)` | Redoes a global edit with data.new. *(internal)* | 744 |
| `editor_drivePathEditor_splineMgr.transSplineEditUndo(data)` | Undoes a global edit (all splines) with data.old. *(internal)* | 732 |
| `editor_drivePathEditor_splineMgr.unlinkSpline(spline, vehicle)` | Removes the spline-vehicle link and gives the vehicle back its stored original pose. | 646 |
| `editor_drivePathEditor_splineMgr.updateDirtyDrivePathSplines()` | Recomputes the geometry of isDirty splines (terrain raycasts, speed bars, ribbon in free mode; graph path in navgraph mode). Called every frame by onEditorGui. *(internal)* | 913 |

### Parameter details

#### `editor_drivePathEditor_splineMgr.convertPathsToDrivePathSplines(paths)`

Converts paths from an image into splines (see notes for the cases of paths that are too small).

- `paths` (*table*) : array of {points, widths}

#### `editor_drivePathEditor_splineMgr.deepCopyDrivePathSpline(spline)`

Deep copy of a spline (for history).

- `spline` (*table*) : spline
- **returns**: table copy

#### `editor_drivePathEditor_splineMgr.deepCopyDrivePathSplineState()`

Deep copy of all splines.

- **returns**: table array of copies

#### `editor_drivePathEditor_splineMgr.deserializeDrivePathSpline(data)`

Rebuilds a spline from a serialized table.

- `data` (*table*) : table produced by serializeDrivePathSpline
- **returns**: table spline

#### `editor_drivePathEditor_splineMgr.flipSpline(spline)`

Reverses the direction of a spline: nodes, widths, normals, speeds and speed limits are reversed.

- `spline` (*table*) : spline

#### `editor_drivePathEditor_splineMgr.getActiveVehicles(isForce)`

Returns the list of active vehicles; recomputes it if it is empty or if isForce is true.

- `isForce` (*boolean|nil*) : force recomputation
- **returns**: table array of {vid, veh, name, isLink, linkSplineId}

#### `editor_drivePathEditor_splineMgr.getDefaultSliderParams()`

Returns the default values of the spline parameters.

- **returns**: table default parameters

#### `editor_drivePathEditor_splineMgr.getDrivePathSplines()`

Returns the splines table (reference).

- **returns**: table array of splines

#### `editor_drivePathEditor_splineMgr.getEditModeKey()`

Returns the edit mode key ("drivePathSplineEditMode").

- **returns**: string key

#### `editor_drivePathEditor_splineMgr.getNavGraph()`

Returns the map's navgraph data (cache), computing it on the first call if possible.

- **returns**: table|nil {graph, nodes, widths, lines} or nil if the graph is not yet available

#### `editor_drivePathEditor_splineMgr.getSplineMap()`

Returns the spline id to index table.

- **returns**: table<string, integer> id to index

#### `editor_drivePathEditor_splineMgr.getToolPrefixStr()`

Returns the tool prefix ("Drive Path Spline").

- **returns**: string prefix

#### `editor_drivePathEditor_splineMgr.getVehicleById(vid)`

Looks for a vehicle in the already computed list (without recomputing it).

- `vid` (*integer*) : vehicle id
- **returns**: table|nil vehicle entry

#### `editor_drivePathEditor_splineMgr.joinDrivePathSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)`

Joins two non-looped splines: the first receives the concatenated geometry, the second is removed.

- `splineIdx1` (*integer*) : spline kept
- `nodeIdx1` (*integer*) : end node of the first
- `splineIdx2` (*integer*) : spline removed
- `nodeIdx2` (*integer*) : end node of the second

#### `editor_drivePathEditor_splineMgr.linkSpline(spline, vehicle)`

Links a spline to a vehicle (isVehicleLink, linkVehId, linkSplineId) and moves the vehicle back to the start.

- `spline` (*table*) : spline
- `vehicle` (*table*) : vehicle entry

#### `editor_drivePathEditor_splineMgr.removeAllDrivePathSplines(isIncludeDisabled)`

Removes splines. With isIncludeDisabled true, all of them; otherwise only the enabled ones.

- `isIncludeDisabled` (*boolean*) : include disabled splines

#### `editor_drivePathEditor_splineMgr.removeDrivePathSpline(idx)`

Removes the spline at the given index and updates the index table.

- `idx` (*integer*) : index (1-based)

#### `editor_drivePathEditor_splineMgr.resetGeometry(spline)`

Clears all the geometry of a spline (nodes, widths, nmls, vels, velLimits, graphNodes, graphPath) and marks it isDirty.

- `spline` (*table|nil*) : spline

#### `editor_drivePathEditor_splineMgr.resetVehiclePose(spline, vehicle)`

Places the vehicle at the spline's start node (startingNode), oriented along the neighboring nodes, with a 0.3 m vertical offset. Stores its original pose only once. In graph mode, uses the navgraph nodes (requires the cache).

- `spline` (*table*) : spline
- `vehicle` (*table*) : vehicle entry {vid, veh...}

#### `editor_drivePathEditor_splineMgr.serializeDrivePathSpline(spline)`

Serializes a spline into a table.

- `spline` (*table*) : spline
- **returns**: table serialized data

#### `editor_drivePathEditor_splineMgr.setDrivePathSpline(spline, idx)`

Places a spline at an index and marks it isDirty.

- `spline` (*table*) : spline
- `idx` (*integer*) : index (1-based)

#### `editor_drivePathEditor_splineMgr.setDrivePathSplines(splines)`

Places all splines of an array (each marked isDirty).

- `splines` (*table*) : array of splines

#### `editor_drivePathEditor_splineMgr.singleSplineEditRedo(drivePathSplineData)`

Redoes a single spline edit from drivePathSplineData.new.

- `drivePathSplineData` (*table*) : {old, new}

#### `editor_drivePathEditor_splineMgr.singleSplineEditUndo(drivePathSplineData)`

Undoes a single spline edit from drivePathSplineData.old, then relinks the vehicles.

- `drivePathSplineData` (*table*) : {old, new}

#### `editor_drivePathEditor_splineMgr.splitDrivePathSpline(selectedSplineIdx, selectedNodeIdx)`

Splits a spline in two at the given node (1.0 m gap between the two parts).

- `selectedSplineIdx` (*integer*) : spline index
- `selectedNodeIdx` (*integer*) : index of the split node

#### `editor_drivePathEditor_splineMgr.transSplineEditRedo(data)`

Redoes a global edit with data.new.

- `data` (*table*) : {old, new}

#### `editor_drivePathEditor_splineMgr.transSplineEditUndo(data)`

Undoes a global edit (all splines) with data.old.

- `data` (*table*) : {old, new}

#### `editor_drivePathEditor_splineMgr.unlinkSpline(spline, vehicle)`

Removes the spline-vehicle link and gives the vehicle back its stored original pose.

- `spline` (*table*) : spline
- `vehicle` (*table*) : vehicle entry

## Calls into the engine (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/drivePathEditor/splineMgr.lua`.*
