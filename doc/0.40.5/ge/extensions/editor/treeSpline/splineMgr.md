# `editor_treeSpline_splineMgr`

*File: `lua/ge/extensions/editor/treeSpline/splineMgr.lua` · VM: Game Engine (GE) · 470 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_treeSpline_splineMgr`: `extensions.load("editor_treeSpline_splineMgr")`, then the global `editor_treeSpline_splineMgr`

Data manager of the Tree Spline tool: holds the list of tree splines (treeSplines) and the id -> index table (splineMap), creates/deletes/copies/splits splines, handles serialization (Lua reload and JSON session files), undo/redo, the links with the Master Spline and the rebuild of dirty splines (geometry then replanting via editor/treeSpline/populate). Used by editor/treeSpline.lua and by the shared tools (splineInput, session).

## Notes

- Each spline carries: name, id (UUID), isDirty, isLoop, isEnabled (false = locked), isConformToTerrain (always true), isLink/linkId, avoidInfrastructure, nodes/widths/nmls, divPoints/divWidths/tangents/binormals/normals/discMap, items/count (Forest instances, runtime only) and the foliage parameters (class, spacingM, posVariance, scaleVariance, alignToNormal, slopeMaxDeg, seed, species, speciesWeights).
- Foliage default values: posVariance 0.25, slopeMaxDeg 89, the rest comes from scatter.getDefaultDistribution(); a single species is checked by default so that the spline plants.
- A linked spline (isLink) takes its geometry from the Master Spline; its terrain conformity flag is deliberately ignored.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_treeSpline_splineMgr.addNewTreeSpline()` | Adds a new empty spline (unique name, UUID Engine.generateUUID, isConformToTerrain = true); the user then places its nodes by clicking on the terrain. | 83 |
| `editor_treeSpline_splineMgr.copyTreeSplineProfile(spline)` | Copies the profile (foliage parameters only, not the geometry); callback required by splineInput. | 259 |
| `editor_treeSpline_splineMgr.deepCopyTreeSpline(spline)` | Deep copy of a spline, without the derived geometry or the runtime handles (rebuilt from the nodes and parameters). | 142 |
| `editor_treeSpline_splineMgr.deepCopyTreeSplineState()` | Deep copy of the whole list (for cross-spline undo/redo). | 162 |
| `editor_treeSpline_splineMgr.deserializeTreeSpline(data)` | Rebuilds a spline from an encoded blob (string) or a JSON table. Resets the derived tables, marks the spline dirty, rehydrates the vec3 (nodes, nmls) and takes back the kept trees (keptObjects) via pop.adopt. | 296 |
| `editor_treeSpline_splineMgr.getCurrentTreeSplineList()` | List of active splines as {name, id, type} for the link with the Master Spline. | 364 |
| `editor_treeSpline_splineMgr.getEditModeKey()` | Returns the tool's edit mode key. | 49 |
| `editor_treeSpline_splineMgr.getFoliageParamDefaults()` | Default numeric distribution values for a new spline (no scenetree access, safe at module load). | 58 |
| `editor_treeSpline_splineMgr.getSplineMap()` | Returns the id -> index table of the splines. | 55 |
| `editor_treeSpline_splineMgr.getState()` | Full snapshot (all splines) as plain data, for onSerialize. | 317 |
| `editor_treeSpline_splineMgr.getToolPrefixStr()` | Returns the tool's name prefix (used to name splines and identify the type in the Master Spline). | 46 |
| `editor_treeSpline_splineMgr.getTreeSplines()` | Returns the list (live, not copied) of tree splines. | 52 |
| `editor_treeSpline_splineMgr.isLinked(id)` | Tells whether the spline with the given identifier is linked to a Master Spline. | 377 |
| `editor_treeSpline_splineMgr.makeFoliageDefaults()` | Builds the default foliage distribution of a new spline: the numeric values plus one checked species (species) with its weight 1.0 (speciesWeights). | 72 |
| `editor_treeSpline_splineMgr.pasteTreeSplineProfile(spline, profile)` | Applies a foliage profile to a spline; the geometry stays unchanged. | 265 |
| `editor_treeSpline_splineMgr.recomputeIdMap()` | Recomputes the id -> index table; called by the session helper after a load that adds splines. *(internal)* | 314 |
| `editor_treeSpline_splineMgr.removeAllTreeSplines(isIncludeDisabled)` | Deletes all splines (and their trees). Without isIncludeDisabled, only active, non-linked splines are deleted. | 131 |
| `editor_treeSpline_splineMgr.removeLinkedTreeSpline(splineId)` | Deletes a linked spline by id (called when a Master Spline layer is removed). | 414 |
| `editor_treeSpline_splineMgr.removeTreeSpline(idx)` | Deletes the spline at the given index and removes its planted trees. No effect if the index is invalid. | 122 |
| `editor_treeSpline_splineMgr.serializeTreeSpline(spline)` | Serializes a spline (whitelist of primary fields, without derived geometry) into an encoded blob, for persistence across Lua reload. | 274 |
| `editor_treeSpline_splineMgr.serializeTreeSplineToTable(spline)` | Plain portable table for a session file (toolUtilities/session): decodes the blob from serializeTreeSpline; jsonWriteFile flattens the vec3 nodes. | 290 |
| `editor_treeSpline_splineMgr.setLink(id, groupId, isLink)` | Links or unlinks the spline to a Master Spline group (linkId), removes its trees and marks it dirty. | 383 |
| `editor_treeSpline_splineMgr.setState(state)` | Restores the whole list from a snapshot (deletes everything first); the splines are marked dirty and replanted. | 324 |
| `editor_treeSpline_splineMgr.setTreeSpline(spline, idx)` | Replaces a spline's record (undo path of object selection in splineInput). | 203 |
| `editor_treeSpline_splineMgr.setTreeSplines(splines)` | Replaces the whole list of splines (cross-spline undo/redo). | 215 |
| `editor_treeSpline_splineMgr.singleSplineEditRedo(splineData)` | Redoes the edit of a single spline (history callback). *(internal)* | 244 |
| `editor_treeSpline_splineMgr.singleSplineEditUndo(splineData)` | Undoes the edit of a single spline (editor history callback). *(internal)* | 243 |
| `editor_treeSpline_splineMgr.splitTreeSpline(selIdx, nodeIdx)` | Cuts the selected spline in two at the chosen node (open splines), or unrolls a loop in place. Both halves inherit the foliage parameters and the conformity setting. | 180 |
| `editor_treeSpline_splineMgr.transSplineEditRedo(data)` | Redoes a cross-spline edit. *(internal)* | 252 |
| `editor_treeSpline_splineMgr.transSplineEditUndo(data)` | Undoes a cross-spline edit (add, delete, reorder across the whole list). *(internal)* | 247 |
| `editor_treeSpline_splineMgr.unlinkAll()` | Unlinks all linked splines and marks them dirty. | 422 |
| `editor_treeSpline_splineMgr.updateDirtyTreeSplines()` | Rebuilds the geometry and replants dirty splines; may be called every frame. Reports the edit to the session (session.markEdited). *(internal)* | 332 |
| `editor_treeSpline_splineMgr.updateLinkedTreeSpline(id, points, widths, nmls, isLoop, isConformToTerrain)` | Updates a linked spline with the geometry pushed by the Master Spline (nodes, widths, normals, loop); empties the derived geometry and the trees if fewer than 2 points. The isConformToTerrain parameter is ignored. | 395 |

### Parameter details

#### `editor_treeSpline_splineMgr.addNewTreeSpline()`

Adds a new empty spline (unique name, UUID Engine.generateUUID, isConformToTerrain = true); the user then places its nodes by clicking on the terrain.

- **returns**: integer Index of the new spline.

#### `editor_treeSpline_splineMgr.copyTreeSplineProfile(spline)`

Copies the profile (foliage parameters only, not the geometry); callback required by splineInput.

- `spline` (*table*) : Source spline.
- **returns**: table Copied profile.

#### `editor_treeSpline_splineMgr.deepCopyTreeSpline(spline)`

Deep copy of a spline, without the derived geometry or the runtime handles (rebuilt from the nodes and parameters).

- `spline` (*table*) : Spline to copy.
- **returns**: table Copy.

#### `editor_treeSpline_splineMgr.deepCopyTreeSplineState()`

Deep copy of the whole list (for cross-spline undo/redo).

- **returns**: table Copied list.

#### `editor_treeSpline_splineMgr.deserializeTreeSpline(data)`

Rebuilds a spline from an encoded blob (string) or a JSON table. Resets the derived tables, marks the spline dirty, rehydrates the vec3 (nodes, nmls) and takes back the kept trees (keptObjects) via pop.adopt.

- `data` (*string|table*) : Editor blob or table from a session file.
- **returns**: table Rebuilt spline.

#### `editor_treeSpline_splineMgr.getCurrentTreeSplineList()`

List of active splines as {name, id, type} for the link with the Master Spline.

- **returns**: table[] Entries {name, id, type = tool prefix}.

#### `editor_treeSpline_splineMgr.getEditModeKey()`

Returns the tool's edit mode key.

- **returns**: string Edit mode key.

#### `editor_treeSpline_splineMgr.getFoliageParamDefaults()`

Default numeric distribution values for a new spline (no scenetree access, safe at module load).

- **returns**: table class, spacingM, posVariance, scaleVariance, alignToNormal, slopeMaxDeg, seed.

#### `editor_treeSpline_splineMgr.getSplineMap()`

Returns the id -> index table of the splines.

- **returns**: table<string, integer> Table id to index.

#### `editor_treeSpline_splineMgr.getState()`

Full snapshot (all splines) as plain data, for onSerialize.

- **returns**: table List of serialized blobs.

#### `editor_treeSpline_splineMgr.getToolPrefixStr()`

Returns the tool's name prefix (used to name splines and identify the type in the Master Spline).

- **returns**: string Tool prefix.

#### `editor_treeSpline_splineMgr.getTreeSplines()`

Returns the list (live, not copied) of tree splines.

- **returns**: table List of splines.

#### `editor_treeSpline_splineMgr.isLinked(id)`

Tells whether the spline with the given identifier is linked to a Master Spline.

- `id` (*string*) : Spline identifier.
- **returns**: boolean True if linked.

#### `editor_treeSpline_splineMgr.makeFoliageDefaults()`

Builds the default foliage distribution of a new spline: the numeric values plus one checked species (species) with its weight 1.0 (speciesWeights).

- **returns**: table Foliage parameters.

#### `editor_treeSpline_splineMgr.pasteTreeSplineProfile(spline, profile)`

Applies a foliage profile to a spline; the geometry stays unchanged.

- `spline` (*table*) : Target spline.
- `profile` (*table*) : Profile returned by copyTreeSplineProfile.

#### `editor_treeSpline_splineMgr.removeAllTreeSplines(isIncludeDisabled)`

Deletes all splines (and their trees). Without isIncludeDisabled, only active, non-linked splines are deleted.

- `isIncludeDisabled` (*boolean*) : True to include locked or linked splines.

#### `editor_treeSpline_splineMgr.removeLinkedTreeSpline(splineId)`

Deletes a linked spline by id (called when a Master Spline layer is removed).

- `splineId` (*string*) : Identifier.

#### `editor_treeSpline_splineMgr.removeTreeSpline(idx)`

Deletes the spline at the given index and removes its planted trees. No effect if the index is invalid.

- `idx` (*integer*) : Spline index.

#### `editor_treeSpline_splineMgr.serializeTreeSpline(spline)`

Serializes a spline (whitelist of primary fields, without derived geometry) into an encoded blob, for persistence across Lua reload.

- `spline` (*table*) : Spline.
- **returns**: string Encoded blob.

#### `editor_treeSpline_splineMgr.serializeTreeSplineToTable(spline)`

Plain portable table for a session file (toolUtilities/session): decodes the blob from serializeTreeSpline; jsonWriteFile flattens the vec3 nodes.

- `spline` (*table*) : Spline.
- **returns**: table JSON-serializable table.

#### `editor_treeSpline_splineMgr.setLink(id, groupId, isLink)`

Links or unlinks the spline to a Master Spline group (linkId), removes its trees and marks it dirty.

- `id` (*string*) : Spline identifier.
- `groupId` (*string*) : Master Spline group identifier.
- `isLink` (*boolean*) : True to link.

#### `editor_treeSpline_splineMgr.setState(state)`

Restores the whole list from a snapshot (deletes everything first); the splines are marked dirty and replanted.

- `state` (*table|nil*) : Snapshot from getState.

#### `editor_treeSpline_splineMgr.setTreeSpline(spline, idx)`

Replaces a spline's record (undo path of object selection in splineInput).

- `spline` (*table*) : New spline.
- `idx` (*integer*) : Index to replace.

#### `editor_treeSpline_splineMgr.setTreeSplines(splines)`

Replaces the whole list of splines (cross-spline undo/redo).

- `splines` (*table*) : New list.

#### `editor_treeSpline_splineMgr.singleSplineEditRedo(splineData)`

Redoes the edit of a single spline (history callback).

- `splineData` (*table*) : Action data {old, new}.

#### `editor_treeSpline_splineMgr.singleSplineEditUndo(splineData)`

Undoes the edit of a single spline (editor history callback).

- `splineData` (*table*) : Action data {old, new}.

#### `editor_treeSpline_splineMgr.splitTreeSpline(selIdx, nodeIdx)`

Cuts the selected spline in two at the chosen node (open splines), or unrolls a loop in place. Both halves inherit the foliage parameters and the conformity setting.

- `selIdx` (*integer*) : Spline index.
- `nodeIdx` (*integer*) : Index of the split node.
- **returns**: integer New selected index.

#### `editor_treeSpline_splineMgr.transSplineEditRedo(data)`

Redoes a cross-spline edit.

- `data` (*table*) : Action data {old, new}.

#### `editor_treeSpline_splineMgr.transSplineEditUndo(data)`

Undoes a cross-spline edit (add, delete, reorder across the whole list).

- `data` (*table*) : Action data {old, new}.

#### `editor_treeSpline_splineMgr.updateLinkedTreeSpline(id, points, widths, nmls, isLoop, isConformToTerrain)`

Updates a linked spline with the geometry pushed by the Master Spline (nodes, widths, normals, loop); empties the derived geometry and the trees if fewer than 2 points. The isConformToTerrain parameter is ignored.

- `id` (*string*) : Identifier.
- `points` (*table*) : Nodes.
- `widths` (*table*) : Widths.
- `nmls` (*table*) : Normals.
- `isLoop` (*boolean*) : Closed spline.
- `isConformToTerrain` (*boolean*) : Ignored.

## Calls into the engine (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/treeSpline/splineMgr.lua`.*
