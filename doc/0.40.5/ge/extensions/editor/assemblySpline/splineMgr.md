# `editor_assemblySpline_splineMgr`

*File: `lua/ge/extensions/editor/assemblySpline/splineMgr.lua` · VM: Game Engine (GE) · 863 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_assemblySpline_splineMgr`: `extensions.load("editor_assemblySpline_splineMgr")`, then the global `editor_assemblySpline_splineMgr`

Data manager of the Assembly Spline tool: holds the list of assembly splines (assemblySplines) and the id -> index table (splineMap), creates/deletes/splits/joins splines, applies kit presets (Wooden Fence, Telegraph Pole, Metal Crash Barrier), handles profile copy/paste, serialization, undo/redo callbacks, links with the Master Spline tool and the update of "dirty" splines (geometry recomputation then repopulation with meshes via populate). Each spline is a table (name, id, nodes, widths, nmls, divPoints, spacing, verticalOffset, normalMode, sag, preRot, jitter*, splineRandomSeed, kitFolderPath, meshKit, moleculeDescription, isEnabled, isDirty, isLink, linkId, sceneTreeFolderId...) and each spline has a SimGroup in MissionGroup (cansave = false until baked).

## Notes

- Presets (setPreset key): 'wooden_fence', 'telegraph_pole', 'metal_crash_barrier'; each defines a kit folder under assets/meshes/props/assembly_kit/, spacing, normalMode (1 = global up, 2 = terrain up), preRot (0, 1 = 90 deg, 2 = 180 deg around Z).
- Splines use a minimum of 100 subdivisions (minSplineDivisions); bitmap path import ignores outlines whose smallest AABB dimension is <= 10 m.
- A spline with fewer than 2 nodes has no mesh: updateDirtyAssemblySplines deletes its meshes and clears its secondary geometry.
- updateDirtyAssemblySplines calls session.markEdited('assemblySpline') when at least one spline was rebuilt.
- In convertPathsToAssemblySplines, the log message prints #paths - #assemblySplines as the number of skipped paths: the computation is wrong if splines already existed before the call, and splines created for paths that are too small remain in the list, empty (inferred from code).
- M.deepCopyAssemblySplineState is assigned twice in the public interface (harmless).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_assemblySpline_splineMgr.addNewAssemblySpline()` | Adds an empty spline (unique name "Assembly Spline N", UUID, SimGroup) with the default Wooden Fence kit. If the kit fails to load, a warning is logged and the kit is empty. Updates splineMap. | 174 |
| `editor_assemblySpline_splineMgr.conformNodesToTerrain(spline)` | Once places the control nodes on the surface below (vertical raycast) then marks the spline dirty. To be rerun after terraforming. | 702 |
| `editor_assemblySpline_splineMgr.convertPathsToAssemblySplines(paths)` | Converts paths drawn from a bitmap into assembly splines: grid coordinates -> world via the terrain editor, terrain normals for each node. Requires editor_terrainEditor. | 712 |
| `editor_assemblySpline_splineMgr.copyAssemblySplineProfile(spline)` | Copies the profile of a spline: deep copy without identity, nodes, widths, normals or derived geometry (what remains: parameters, kit, molecule, enabled states). | 554 |
| `editor_assemblySpline_splineMgr.deepCopyAssemblySpline(spline)` | Deep copy of a spline (string.buffer encode/decode), clearing the derived secondary geometry (divPoints, divWidths, tangents, binormals, normals, discMap). | 304 |
| `editor_assemblySpline_splineMgr.deepCopyAssemblySplineState()` | Deep copy of all splines (for the undo history). | 316 |
| `editor_assemblySpline_splineMgr.deserializeAssemblySpline(data, isCreateObject)` | Deserializes a spline from an encoded blob (string) or a session JSON table. On the JSON path, ensures the derived tables exist and rehydrates positions as vec3 before the first build. | 624 |
| `editor_assemblySpline_splineMgr.findAssemblySpline(id)` | Finds a live spline by id. | 269 |
| `editor_assemblySpline_splineMgr.getAssemblySplines()` | Returns the live table of assembly splines (not copied). | 94 |
| `editor_assemblySpline_splineMgr.getCurrentAssemblySplineList()` | List of enabled splines as {name, id, type = 'Assembly Spline'} (for the Master Spline tool). | 744 |
| `editor_assemblySpline_splineMgr.getDefaultSliderParams()` | Returns the default slider parameters (those of the Wooden Fence preset): spacing, verticalOffset, normalMode, sag, preRot, jitterForward/Right/Up, splineRandomSeed. | 127 |
| `editor_assemblySpline_splineMgr.getEditModeKey()` | Returns the edit mode key ('assemblySplineEditMode'). | 91 |
| `editor_assemblySpline_splineMgr.getSplineMap()` | Returns the id -> index table of the splines. | 97 |
| `editor_assemblySpline_splineMgr.getToolPrefixStr()` | Returns the global prefix of the tool ('Assembly Spline'). | 88 |
| `editor_assemblySpline_splineMgr.isLinked(id)` | Indicates whether the spline with the given id is linked to a Master Spline. | 758 |
| `editor_assemblySpline_splineMgr.joinAssemblySplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)` | Joins two open splines into one (spline1 modified, spline2 deleted) according to the given end nodes (geom.joinSplineGeometry). Does nothing if the splines or the join case are invalid. | 414 |
| `editor_assemblySpline_splineMgr.objectSelectRedo(data)` | Redo callback for an object selection (applies data.new). | 551 |
| `editor_assemblySpline_splineMgr.objectSelectUndo(data)` | Undo callback for an object selection operation (restores data.old). | 548 |
| `editor_assemblySpline_splineMgr.pasteAssemblySplineProfile(spline, profile)` | Applies a copied profile to a spline: first deletes its meshes, copies parameters/kit/molecule/enabled states, then marks it dirty. | 578 |
| `editor_assemblySpline_splineMgr.recomputeIdMap()` | Recomputes the id -> index table (called by the session helper after a load). | 659 |
| `editor_assemblySpline_splineMgr.removeAllAssemblySplines(isIncludeDisabled)` | Deletes all splines if isIncludeDisabled is true; otherwise only those that are enabled and not linked. | 285 |
| `editor_assemblySpline_splineMgr.removeAssemblySpline(idx)` | Deletes the spline at the given index: its meshes (pop.tryRemove), its SimGroup, then removes it from the list and updates splineMap. | 253 |
| `editor_assemblySpline_splineMgr.removeLinkedAssemblySpline(splineId)` | Deletes a linked spline by id (called when a Master Spline layer is deleted). | 275 |
| `editor_assemblySpline_splineMgr.serializeAssemblySpline(spline)` | Serializes a spline into an encoded blob (string.buffer) for editor persistence (see onSerialize). | 603 |
| `editor_assemblySpline_splineMgr.serializeAssemblySplineToTable(spline)` | Serializes a spline into a simple portable table for a session file (toolUtilities/session): derived geometry cleared, scene handle removed, live spline unmodified. | 615 |
| `editor_assemblySpline_splineMgr.setAssemblySpline(spline, idx)` | Places a spline at the given index, creates a SimGroup for it in MissionGroup if needed (unique name + UUID, cansave = false) and marks it dirty. | 100 |
| `editor_assemblySpline_splineMgr.setAssemblySplines(splines)` | Applies setAssemblySpline to each element of the list. | 120 |
| `editor_assemblySpline_splineMgr.setLink(id, groupId, isLink)` | Links or unlinks a spline (isLink, linkId = groupId), deletes its meshes and marks it dirty. | 764 |
| `editor_assemblySpline_splineMgr.setPreset(spline, presetStr)` | Applies a preset to the spline: deletes its meshes, reloads the kit (mol.getAssemblyKit), rebuilds the molecule and copies the preset parameters, then marks the spline dirty. Unknown key: only marked dirty. | 142 |
| `editor_assemblySpline_splineMgr.singleSplineEditRedo(assemblySplineData)` | Redo callback for an edit of a single spline. | 505 |
| `editor_assemblySpline_splineMgr.singleSplineEditUndo(assemblySplineData)` | Undo callback for an edit of a single spline. | 497 |
| `editor_assemblySpline_splineMgr.splitAssemblySpline(selectedSplineIdx, selectedNodeIdx)` | Splits the selected spline in two at the selected node. Does nothing if the spline is invalid. | 325 |
| `editor_assemblySpline_splineMgr.transSplineEditRedo(data)` | Redo callback for a cross-spline edit. | 525 |
| `editor_assemblySpline_splineMgr.transSplineEditUndo(data)` | Undo callback for a cross-spline edit (full state of the splines). | 513 |
| `editor_assemblySpline_splineMgr.unlinkAll()` | Unlinks all splines and marks them dirty. | 802 |
| `editor_assemblySpline_splineMgr.updateDirtyAssemblySplines()` | For each dirty spline: recomputes the geometry (Catmull-Rom with raycast if isConformToTerrain, otherwise free in 3D), repopulates with meshes (pop.populateAssemblySpline) and updates roadLength. Below 2 nodes, deletes the meshes. Called every frame by onEditorGui. | 662 |
| `editor_assemblySpline_splineMgr.updateLinkedAssemblySpline(id, points, widths, nmls, isLoop, isConformToTerrain)` | Updates the geometry of a linked spline from the master (nodes, widths, normals, loop, terrain conformity); below 2 points, clears the derived geometry and deletes the meshes; marks dirty. | 779 |

### Parameter details

#### `editor_assemblySpline_splineMgr.conformNodesToTerrain(spline)`

Once places the control nodes on the surface below (vertical raycast) then marks the spline dirty. To be rerun after terraforming.

- `spline` (*table*) : Spline.

#### `editor_assemblySpline_splineMgr.convertPathsToAssemblySplines(paths)`

Converts paths drawn from a bitmap into assembly splines: grid coordinates -> world via the terrain editor, terrain normals for each node. Requires editor_terrainEditor.

- `paths` (*table[]*) : List of {points = {{x,y}}, widths}.

#### `editor_assemblySpline_splineMgr.copyAssemblySplineProfile(spline)`

Copies the profile of a spline: deep copy without identity, nodes, widths, normals or derived geometry (what remains: parameters, kit, molecule, enabled states).

- `spline` (*table*) : Spline.
- **returns**: table Profile.

#### `editor_assemblySpline_splineMgr.deepCopyAssemblySpline(spline)`

Deep copy of a spline (string.buffer encode/decode), clearing the derived secondary geometry (divPoints, divWidths, tangents, binormals, normals, discMap).

- `spline` (*table*) : Spline.
- **returns**: table Copy.

#### `editor_assemblySpline_splineMgr.deepCopyAssemblySplineState()`

Deep copy of all splines (for the undo history).

- **returns**: table[] Copies.

#### `editor_assemblySpline_splineMgr.deserializeAssemblySpline(data, isCreateObject)`

Deserializes a spline from an encoded blob (string) or a session JSON table. On the JSON path, ensures the derived tables exist and rehydrates positions as vec3 before the first build.

- `data` (*string|table*) : Blob or table.
- `isCreateObject` (*boolean*) : Create the spline's scene SimGroup (inferred from code).
- **returns**: table Spline.

#### `editor_assemblySpline_splineMgr.findAssemblySpline(id)`

Finds a live spline by id.

- `id` (*string*) : Spline id (UUID).
- **returns**: table|nil Spline or nil.

#### `editor_assemblySpline_splineMgr.getAssemblySplines()`

Returns the live table of assembly splines (not copied).

- **returns**: table[] Splines.

#### `editor_assemblySpline_splineMgr.getCurrentAssemblySplineList()`

List of enabled splines as {name, id, type = 'Assembly Spline'} (for the Master Spline tool).

- **returns**: table[] Entries.

#### `editor_assemblySpline_splineMgr.getDefaultSliderParams()`

Returns the default slider parameters (those of the Wooden Fence preset): spacing, verticalOffset, normalMode, sag, preRot, jitterForward/Right/Up, splineRandomSeed.

- **returns**: table Parameters.

#### `editor_assemblySpline_splineMgr.getEditModeKey()`

Returns the edit mode key ('assemblySplineEditMode').

- **returns**: string Key.

#### `editor_assemblySpline_splineMgr.getSplineMap()`

Returns the id -> index table of the splines.

- **returns**: table<string, integer> splineMap.

#### `editor_assemblySpline_splineMgr.getToolPrefixStr()`

Returns the global prefix of the tool ('Assembly Spline').

- **returns**: string Prefix.

#### `editor_assemblySpline_splineMgr.isLinked(id)`

Indicates whether the spline with the given id is linked to a Master Spline.

- `id` (*string*) : Id.
- **returns**: boolean true if linked.

#### `editor_assemblySpline_splineMgr.joinAssemblySplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)`

Joins two open splines into one (spline1 modified, spline2 deleted) according to the given end nodes (geom.joinSplineGeometry). Does nothing if the splines or the join case are invalid.

- `splineIdx1` (*integer*) : First spline.
- `nodeIdx1` (*integer*) : Node of the first.
- `splineIdx2` (*integer*) : Second spline.
- `nodeIdx2` (*integer*) : Node of the second.

#### `editor_assemblySpline_splineMgr.objectSelectRedo(data)`

Redo callback for an object selection (applies data.new).

- `data` (*table*) : {old, new}.

#### `editor_assemblySpline_splineMgr.objectSelectUndo(data)`

Undo callback for an object selection operation (restores data.old).

- `data` (*table*) : {old, new}.

#### `editor_assemblySpline_splineMgr.pasteAssemblySplineProfile(spline, profile)`

Applies a copied profile to a spline: first deletes its meshes, copies parameters/kit/molecule/enabled states, then marks it dirty.

- `spline` (*table*) : Target spline.
- `profile` (*table*) : Profile from copyAssemblySplineProfile.

#### `editor_assemblySpline_splineMgr.removeAllAssemblySplines(isIncludeDisabled)`

Deletes all splines if isIncludeDisabled is true; otherwise only those that are enabled and not linked.

- `isIncludeDisabled` (*boolean*) : Include disabled (locked) and linked ones.

#### `editor_assemblySpline_splineMgr.removeAssemblySpline(idx)`

Deletes the spline at the given index: its meshes (pop.tryRemove), its SimGroup, then removes it from the list and updates splineMap.

- `idx` (*integer*) : Index.

#### `editor_assemblySpline_splineMgr.removeLinkedAssemblySpline(splineId)`

Deletes a linked spline by id (called when a Master Spline layer is deleted).

- `splineId` (*string*) : Spline id.

#### `editor_assemblySpline_splineMgr.serializeAssemblySpline(spline)`

Serializes a spline into an encoded blob (string.buffer) for editor persistence (see onSerialize).

- `spline` (*table*) : Spline.
- **returns**: string Encoded data.

#### `editor_assemblySpline_splineMgr.serializeAssemblySplineToTable(spline)`

Serializes a spline into a simple portable table for a session file (toolUtilities/session): derived geometry cleared, scene handle removed, live spline unmodified.

- `spline` (*table*) : Spline.
- **returns**: table JSON-serializable table.

#### `editor_assemblySpline_splineMgr.setAssemblySpline(spline, idx)`

Places a spline at the given index, creates a SimGroup for it in MissionGroup if needed (unique name + UUID, cansave = false) and marks it dirty.

- `spline` (*table*) : Spline.
- `idx` (*integer*) : Index.

#### `editor_assemblySpline_splineMgr.setAssemblySplines(splines)`

Applies setAssemblySpline to each element of the list.

- `splines` (*table[]*) : Splines.

#### `editor_assemblySpline_splineMgr.setLink(id, groupId, isLink)`

Links or unlinks a spline (isLink, linkId = groupId), deletes its meshes and marks it dirty.

- `id` (*string*) : Spline id.
- `groupId` (*string|nil*) : Id of the link group.
- `isLink` (*boolean*) : true to link.

#### `editor_assemblySpline_splineMgr.setPreset(spline, presetStr)`

Applies a preset to the spline: deletes its meshes, reloads the kit (mol.getAssemblyKit), rebuilds the molecule and copies the preset parameters, then marks the spline dirty. Unknown key: only marked dirty.

- `spline` (*table*) : Spline.
- `presetStr` (*string*) : 'wooden_fence', 'telegraph_pole' or 'metal_crash_barrier'.

#### `editor_assemblySpline_splineMgr.singleSplineEditRedo(assemblySplineData)`

Redo callback for an edit of a single spline.

- `assemblySplineData` (*table*) : History action data.

#### `editor_assemblySpline_splineMgr.singleSplineEditUndo(assemblySplineData)`

Undo callback for an edit of a single spline.

- `assemblySplineData` (*table*) : History action data.

#### `editor_assemblySpline_splineMgr.splitAssemblySpline(selectedSplineIdx, selectedNodeIdx)`

Splits the selected spline in two at the selected node. Does nothing if the spline is invalid.

- `selectedSplineIdx` (*integer*) : Spline index.
- `selectedNodeIdx` (*integer*) : Index of the split node.

#### `editor_assemblySpline_splineMgr.transSplineEditRedo(data)`

Redo callback for a cross-spline edit.

- `data` (*table*) : History action data.

#### `editor_assemblySpline_splineMgr.transSplineEditUndo(data)`

Undo callback for a cross-spline edit (full state of the splines).

- `data` (*table*) : History action data.

#### `editor_assemblySpline_splineMgr.updateLinkedAssemblySpline(id, points, widths, nmls, isLoop, isConformToTerrain)`

Updates the geometry of a linked spline from the master (nodes, widths, normals, loop, terrain conformity); below 2 points, clears the derived geometry and deletes the meshes; marks dirty.

- `id` (*string*) : Id.
- `points` (*vec3[]*) : Nodes.
- `widths` (*number[]*) : Widths.
- `nmls` (*vec3[]*) : Normals.
- `isLoop` (*boolean*) : Closed spline.
- `isConformToTerrain` (*boolean*) : Follow the terrain.

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/assemblySpline/splineMgr.lua`.*
