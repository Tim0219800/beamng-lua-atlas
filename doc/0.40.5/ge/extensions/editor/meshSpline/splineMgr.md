# `editor_meshSpline_splineMgr`

*File: `lua/ge/extensions/editor/meshSpline/splineMgr.lua` · VM: Game Engine (GE) · 1410 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_meshSpline_splineMgr`: `extensions.load("editor_meshSpline_splineMgr")`, then the global `editor_meshSpline_splineMgr`

State manager of the Mesh Spline tool: holds the list of mesh splines (meshSplines) and the id-to-index table (splineMap). It creates, copies, cuts, joins, deletes, serializes and rebuilds the splines, applies presets, manages the links with the Master Spline and provides the editor's undo/redo callbacks. Each spline has a SimGroup folder in MissionGroup (not saved until it is "baked") and receives a UUID via Engine.generateUUID().

## Notes

- A spline is a table: nodes, widths, nmls (source data) and divPoints, divWidths, tangents, binormals, normals, discMap (derived geometry, recomputed). isDirty = true requests a rebuild at the next updateDirtyMeshSplines.
- isEnabled = false means locked (baked) spline: its meshes stay in the scene.
- isLink / linkId mark a spline driven by a Master Spline; removeAllMeshSplines(false) only deletes active, non-linked splines.
- deepCopyMeshSpline goes through buffer.encode/decode and clears the copy's derived tables.
- The default preset of a new spline is 'concrete_barrier'.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_meshSpline_splineMgr.addNewMeshSpline()` | Adds a new empty mesh spline: unique name, UUID, scene folder, default flags (isEnabled, normalMode = 2, isAliasRoundRobin...), then applies the 'concrete_barrier' preset and updates the id-to-index table. | 610 |
| `editor_meshSpline_splineMgr.conformNodesToTerrain(spline)` | One-shot action: places the control nodes on the surface below (vertical raycast) then marks the spline dirty. Construction stays free in 3D; rerun it after terraforming to re-snap. | 1246 |
| `editor_meshSpline_splineMgr.convertPathsToMeshSplines(paths)` | Converts paths drawn from a bitmap into mesh splines: one spline per path, points converted to world coordinates via the terrain editor, normals taken from the terrain. A path that is too small is not imported (the empty spline created stays in the list). | 1256 |
| `editor_meshSpline_splineMgr.copyMeshSplineProfile(spline)` | Copies a spline's profile (all its parameters without the nodes, widths, normals or derived geometry) to paste it onto another. | 1083 |
| `editor_meshSpline_splineMgr.deepCopyMeshSpline(spline)` | Deep copy of a spline (buffer.encode/decode), with the derived geometry tables cleared. | 707 |
| `editor_meshSpline_splineMgr.deepCopyMeshSplineState()` | Deep copy of the full list of splines (for undo/redo history). | 719 |
| `editor_meshSpline_splineMgr.deserializeMeshSpline(data, isCreateObject)` | Deserializes a spline. data is either the editor's encoded blob (string) or a table from a JSON session file; in the latter case the derived tables are created empty and the {x,y,z} positions become vec3 again before the first rebuild. | 1180 |
| `editor_meshSpline_splineMgr.findMeshSpline(id)` | Finds a live spline by its id. | 672 |
| `editor_meshSpline_splineMgr.getCurrentMeshSplineList()` | Returns the simplified list of active splines (isEnabled) for the interface: name, id and type. | 1289 |
| `editor_meshSpline_splineMgr.getDefaultSliderParams()` | Returns the default parameters of the interface sliders (bounds, values). | 607 |
| `editor_meshSpline_splineMgr.getEditModeKey()` | Returns the tool's edit mode key. | 476 |
| `editor_meshSpline_splineMgr.getMeshSplines()` | Returns the live table of mesh splines (not copied). | 479 |
| `editor_meshSpline_splineMgr.getSplineMap()` | Returns the live id-to-index table of the splines. | 482 |
| `editor_meshSpline_splineMgr.getToolPrefixStr()` | Returns the tool's name prefix ("Mesh Spline"). | 473 |
| `editor_meshSpline_splineMgr.isLinked(id)` | Tells whether the spline with the given id is linked to a Master Spline. | 1303 |
| `editor_meshSpline_splineMgr.joinMeshSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)` | Joins two open mesh splines into one: the concatenated geometry (geom.joinSplineGeometry) is written into the first, the second is deleted. Does nothing if an index is invalid or if the nodes do not allow the join. | 885 |
| `editor_meshSpline_splineMgr.objectSelectRedo(data)` | Redo callback for an object selection operation: puts data.new back in place of the spline with the same id. *(internal)* | 1080 |
| `editor_meshSpline_splineMgr.objectSelectUndo(data)` | Undo callback for an object selection operation: puts data.old back in place of the spline with the same id, removes its meshes and marks it dirty. *(internal)* | 1077 |
| `editor_meshSpline_splineMgr.pasteMeshSplineProfile(spline, profile)` | Pastes a profile onto the spline: first removes its meshes, takes the profile's parameters (normalMode, spacing, jitter, vertical offset, etc.) and marks the spline dirty. | 1098 |
| `editor_meshSpline_splineMgr.presetSelectionRedo(meshSplineData)` | Redoes the choice of a preset (removes the meshes before applying the new state). *(internal)* | 1029 |
| `editor_meshSpline_splineMgr.presetSelectionUndo(meshSplineData)` | Undoes the choice of a preset (removes the meshes before applying the old state). *(internal)* | 1015 |
| `editor_meshSpline_splineMgr.recomputeIdMap()` | Recomputes the id-to-index table (called by the session utility after a load that adds splines). | 1063 |
| `editor_meshSpline_splineMgr.removeAllMeshSplines(isIncludeDisabled)` | Deletes all the splines. With isIncludeDisabled true, including locked and linked ones; otherwise only the active non-linked ones. | 688 |
| `editor_meshSpline_splineMgr.removeLinkedMeshSpline(splineId)` | Deletes a linked spline by its id (called when a Master Spline layer is removed). Does nothing if the id is unknown. | 678 |
| `editor_meshSpline_splineMgr.removeMeshSpline(idx)` | Deletes the spline at the given index: its meshes, its scene folder, then the list entry; updates the id-to-index table. Crashes if the index does not exist (the spline is read without a test before tryRemove). | 656 |
| `editor_meshSpline_splineMgr.serializeMeshSpline(spline)` | Serializes a spline for the editor buffer: first clears the derived tables of the live spline (which is therefore modified), then returns buffer.encode(spline). | 1158 |
| `editor_meshSpline_splineMgr.serializeMeshSplineToTable(spline)` | Serializes a spline into a simple, portable table for a session file (toolUtilities/session). Deep copy via the codec so the live spline is never modified; the derived geometry is cleared (rebuilt afterwards) and the scene handle removed. | 1171 |
| `editor_meshSpline_splineMgr.setLink(id, groupId, isLink)` | Enables or disables a spline's link (isLink, linkId), removes its meshes and marks it dirty. Does nothing if the id is unknown. | 1309 |
| `editor_meshSpline_splineMgr.setMeshSpline(spline, idx)` | Places the spline at the given index, creates its scene folder (SimGroup in MissionGroup, cansave = false) if it does not exist and marks it dirty. | 485 |
| `editor_meshSpline_splineMgr.setMeshSplines(splines)` | Registers all the splines of the table at their indices (calls setMeshSpline for each). | 505 |
| `editor_meshSpline_splineMgr.setPreset(spline, presetStr)` | Applies a preset (central mesh, caps, spacing, offsets, etc., from the presets table) to the spline: first removes its meshes from the scene, copies the preset parameters, measures the mesh and marks the spline dirty. Does nothing if the spline or the name is nil; an unknown name just clears it and marks it dirty. | 512 |
| `editor_meshSpline_splineMgr.singleSplineEditRedo(meshSplineData)` | Redo callback for the edit of a single spline. *(internal)* | 1007 |
| `editor_meshSpline_splineMgr.singleSplineEditUndo(meshSplineData)` | Undo callback for the edit of a single spline (editor history). *(internal)* | 999 |
| `editor_meshSpline_splineMgr.splitMeshSpline(selectedSplineIdx, selectedNodeIdx)` | Cuts the selected spline in two at the selected node. A looped spline is simply opened at the cut point. Otherwise the original spline is deleted and replaced by two new splines named <name>_split_A and <name>_split_B that take over its parameters. | 728 |
| `editor_meshSpline_splineMgr.transSplineEditRedo(data)` | Redoes a cross-cutting edit across several mesh splines. *(internal)* | 1053 |
| `editor_meshSpline_splineMgr.transSplineEditUndo(data)` | Undoes a cross-cutting edit across several mesh splines. *(internal)* | 1043 |
| `editor_meshSpline_splineMgr.unlinkAll()` | Unlinks all the mesh splines (isLink = false, linkId = nil) and marks them dirty. | 1347 |
| `editor_meshSpline_splineMgr.updateDirtyMeshSplines()` | Rebuilds the splines marked dirty: fewer than 2 nodes, removes meshes and geometry; otherwise recomputes the geometry (populationEngine.updateGeometry), repopulates the meshes (populate.populateMeshSpline) and updates roadLength. Then signals an edit to the "meshSpline" session. | 1218 |
| `editor_meshSpline_splineMgr.updateLinkedMeshSpline(id, points, widths, nmls, isLoop, isConformToTerrain)` | Updates a linked spline with the Master Spline's geometry (nodes, widths, nmls, isLoop, isConformToTerrain). If there are fewer than 2 points, clears the derived geometry and removes the meshes. Marks the spline dirty. | 1324 |

### Parameter details

#### `editor_meshSpline_splineMgr.conformNodesToTerrain(spline)`

One-shot action: places the control nodes on the surface below (vertical raycast) then marks the spline dirty. Construction stays free in 3D; rerun it after terraforming to re-snap.

- `spline` (*table*) : Spline to modify.

#### `editor_meshSpline_splineMgr.convertPathsToMeshSplines(paths)`

Converts paths drawn from a bitmap into mesh splines: one spline per path, points converted to world coordinates via the terrain editor, normals taken from the terrain. A path that is too small is not imported (the empty spline created stays in the list).

- `paths` (*table[]*) : Paths with points ({x,y} in grid) and widths.

#### `editor_meshSpline_splineMgr.copyMeshSplineProfile(spline)`

Copies a spline's profile (all its parameters without the nodes, widths, normals or derived geometry) to paste it onto another.

- `spline` (*table*) : Source spline.
- **returns**: table Copied profile.

#### `editor_meshSpline_splineMgr.deepCopyMeshSpline(spline)`

Deep copy of a spline (buffer.encode/decode), with the derived geometry tables cleared.

- `spline` (*table*) : Spline to copy.
- **returns**: table Independent copy.

#### `editor_meshSpline_splineMgr.deepCopyMeshSplineState()`

Deep copy of the full list of splines (for undo/redo history).

- **returns**: table List of copies.

#### `editor_meshSpline_splineMgr.deserializeMeshSpline(data, isCreateObject)`

Deserializes a spline. data is either the editor's encoded blob (string) or a table from a JSON session file; in the latter case the derived tables are created empty and the {x,y,z} positions become vec3 again before the first rebuild.

- `data` (*string|table*) : Blob or session table.
- `isCreateObject` (*boolean*) : true to create the spline's scene SimGroup folder (unless a locked spline already keeps one after a Lua reload).
- **returns**: table The deserialized spline.

#### `editor_meshSpline_splineMgr.findMeshSpline(id)`

Finds a live spline by its id.

- `id` (*string*) : UUID of the spline.
- **returns**: table|nil The spline, or nil if absent.

#### `editor_meshSpline_splineMgr.getCurrentMeshSplineList()`

Returns the simplified list of active splines (isEnabled) for the interface: name, id and type.

- **returns**: table[] Elements {name, id, type}.

#### `editor_meshSpline_splineMgr.getDefaultSliderParams()`

Returns the default parameters of the interface sliders (bounds, values).

- **returns**: table Slider parameters.

#### `editor_meshSpline_splineMgr.getEditModeKey()`

Returns the tool's edit mode key.

- **returns**: string Edit mode key.

#### `editor_meshSpline_splineMgr.getMeshSplines()`

Returns the live table of mesh splines (not copied).

- **returns**: table List of splines, 1-based.

#### `editor_meshSpline_splineMgr.getSplineMap()`

Returns the live id-to-index table of the splines.

- **returns**: table<string, integer> Index by id.

#### `editor_meshSpline_splineMgr.getToolPrefixStr()`

Returns the tool's name prefix ("Mesh Spline").

- **returns**: string Tool prefix.

#### `editor_meshSpline_splineMgr.isLinked(id)`

Tells whether the spline with the given id is linked to a Master Spline.

- `id` (*string*) : UUID of the spline.
- **returns**: boolean true if linked, false otherwise (or if absent).

#### `editor_meshSpline_splineMgr.joinMeshSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)`

Joins two open mesh splines into one: the concatenated geometry (geom.joinSplineGeometry) is written into the first, the second is deleted. Does nothing if an index is invalid or if the nodes do not allow the join.

- `splineIdx1` (*integer*) : Index of the first spline.
- `nodeIdx1` (*integer*) : End node of the first.
- `splineIdx2` (*integer*) : Index of the second spline.
- `nodeIdx2` (*integer*) : End node of the second.

#### `editor_meshSpline_splineMgr.objectSelectRedo(data)`

Redo callback for an object selection operation: puts data.new back in place of the spline with the same id.

- `data` (*table*) : Action data with old and new.

#### `editor_meshSpline_splineMgr.objectSelectUndo(data)`

Undo callback for an object selection operation: puts data.old back in place of the spline with the same id, removes its meshes and marks it dirty.

- `data` (*table*) : Action data with old and new.

#### `editor_meshSpline_splineMgr.pasteMeshSplineProfile(spline, profile)`

Pastes a profile onto the spline: first removes its meshes, takes the profile's parameters (normalMode, spacing, jitter, vertical offset, etc.) and marks the spline dirty.

- `spline` (*table*) : Target spline.
- `profile` (*table*) : Profile returned by copyMeshSplineProfile.

#### `editor_meshSpline_splineMgr.presetSelectionRedo(meshSplineData)`

Redoes the choice of a preset (removes the meshes before applying the new state).

- `meshSplineData` (*table*) : Action data.

#### `editor_meshSpline_splineMgr.presetSelectionUndo(meshSplineData)`

Undoes the choice of a preset (removes the meshes before applying the old state).

- `meshSplineData` (*table*) : Action data.

#### `editor_meshSpline_splineMgr.removeAllMeshSplines(isIncludeDisabled)`

Deletes all the splines. With isIncludeDisabled true, including locked and linked ones; otherwise only the active non-linked ones.

- `isIncludeDisabled` (*boolean*) : true to delete everything.

#### `editor_meshSpline_splineMgr.removeLinkedMeshSpline(splineId)`

Deletes a linked spline by its id (called when a Master Spline layer is removed). Does nothing if the id is unknown.

- `splineId` (*string*) : UUID of the spline.

#### `editor_meshSpline_splineMgr.removeMeshSpline(idx)`

Deletes the spline at the given index: its meshes, its scene folder, then the list entry; updates the id-to-index table. Crashes if the index does not exist (the spline is read without a test before tryRemove).

- `idx` (*integer*) : Spline index (1-based).

#### `editor_meshSpline_splineMgr.serializeMeshSpline(spline)`

Serializes a spline for the editor buffer: first clears the derived tables of the live spline (which is therefore modified), then returns buffer.encode(spline).

- `spline` (*table*) : Spline to serialize.
- **returns**: string Encoded data (inferred from code).

#### `editor_meshSpline_splineMgr.serializeMeshSplineToTable(spline)`

Serializes a spline into a simple, portable table for a session file (toolUtilities/session). Deep copy via the codec so the live spline is never modified; the derived geometry is cleared (rebuilt afterwards) and the scene handle removed.

- `spline` (*table*) : Spline to serialize.
- **returns**: table JSON-compatible table.

#### `editor_meshSpline_splineMgr.setLink(id, groupId, isLink)`

Enables or disables a spline's link (isLink, linkId), removes its meshes and marks it dirty. Does nothing if the id is unknown.

- `id` (*string*) : UUID of the spline.
- `groupId` (*string*) : Identifier of the link group, used as linkId if isLink is true.
- `isLink` (*boolean*) : true to link, false to unlink.

#### `editor_meshSpline_splineMgr.setMeshSpline(spline, idx)`

Places the spline at the given index, creates its scene folder (SimGroup in MissionGroup, cansave = false) if it does not exist and marks it dirty.

- `spline` (*table*) : Spline to register.
- `idx` (*integer*) : Destination index (1-based).

#### `editor_meshSpline_splineMgr.setMeshSplines(splines)`

Registers all the splines of the table at their indices (calls setMeshSpline for each).

- `splines` (*table*) : List of splines.

#### `editor_meshSpline_splineMgr.setPreset(spline, presetStr)`

Applies a preset (central mesh, caps, spacing, offsets, etc., from the presets table) to the spline: first removes its meshes from the scene, copies the preset parameters, measures the mesh and marks the spline dirty. Does nothing if the spline or the name is nil; an unknown name just clears it and marks it dirty.

- `spline` (*table*) : Target spline.
- `presetStr` (*string*) : Preset name, for example 'concrete_barrier'.

#### `editor_meshSpline_splineMgr.singleSplineEditRedo(meshSplineData)`

Redo callback for the edit of a single spline.

- `meshSplineData` (*table*) : Action data containing the new state.

#### `editor_meshSpline_splineMgr.singleSplineEditUndo(meshSplineData)`

Undo callback for the edit of a single spline (editor history).

- `meshSplineData` (*table*) : Action data containing the old state.

#### `editor_meshSpline_splineMgr.splitMeshSpline(selectedSplineIdx, selectedNodeIdx)`

Cuts the selected spline in two at the selected node. A looped spline is simply opened at the cut point. Otherwise the original spline is deleted and replaced by two new splines named <name>_split_A and <name>_split_B that take over its parameters.

- `selectedSplineIdx` (*integer*) : Spline index (1-based).
- `selectedNodeIdx` (*integer*) : Index of the cut node (1-based).

#### `editor_meshSpline_splineMgr.transSplineEditRedo(data)`

Redoes a cross-cutting edit across several mesh splines.

- `data` (*table*) : Action data.

#### `editor_meshSpline_splineMgr.transSplineEditUndo(data)`

Undoes a cross-cutting edit across several mesh splines.

- `data` (*table*) : Action data.

#### `editor_meshSpline_splineMgr.updateLinkedMeshSpline(id, points, widths, nmls, isLoop, isConformToTerrain)`

Updates a linked spline with the Master Spline's geometry (nodes, widths, nmls, isLoop, isConformToTerrain). If there are fewer than 2 points, clears the derived geometry and removes the meshes. Marks the spline dirty.

- `id` (*string*) : UUID of the linked spline.
- `points` (*table*) : Nodes.
- `widths` (*table*) : Widths per node.
- `nmls` (*table*) : Normals per node.
- `isLoop` (*boolean*) : Looped spline.
- `isConformToTerrain` (*boolean*) : Conforms to the surface below.

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/meshSpline/splineMgr.lua`.*
