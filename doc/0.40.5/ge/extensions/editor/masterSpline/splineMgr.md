# `editor_masterSpline_splineMgr`

*File: `lua/ge/extensions/editor/masterSpline/splineMgr.lua` · VM: Game Engine (GE) · 1343 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_masterSpline_splineMgr`: `extensions.load("editor_masterSpline_splineMgr")`, then the global `editor_masterSpline_splineMgr`

Data manager of the editor's Master Spline tool. It stores the list of Master Splines (nodes, widths, nmls, layers, geometry mode "engineered" with clothoids or "spline" Catmull-Rom, homologation), rebuilds the geometry of "dirty" splines, drives the linked layers (via layerMgr) and provides deep copies, serialization, split/join, undo/redo callbacks and grouped session save/load (masters + mesh/assembly/decal/road/tree children).

## Notes

- Constants: tool prefix "Master Spline", edit mode key "masterSpline", minimum 10 subdivisions per segment, minimum import size of a path 10 m.
- A Master Spline notably contains: name, id (UUID), isEnabled, isDirty, isLoop, isConformToTerrain, isAutoBanking, bankStrength, autoBankFalloff, geometryMode, engRadiusM, engTransM, engVertLenM, curveWidenMaxM, curveWidenRunoffM, corners, nodes, widths, nmls, secondary arrays (ribPoints, divPoints, divWidths, tangents, binormals, normals, discMap), layers, roadLength, splineAnalysisMode, homologationPreset, isOptimising and the eXxxNorm error arrays.
- updateDirtyMasterSplines: with fewer than 2 nodes, the secondary geometry is cleared; in conform mode, the nodes are placed on the terrain; otherwise engineeredGeom.sampleInto, with Catmull-Rom fallback (conform, auto-banking or free).
- Session load: new UUIDs are generated for all masters, children and layers; links whose child is not in the batch are removed.
- addToMasterSplineArray does not update the id-to-index table (call recomputeIdMap afterwards).
- Probable minor BUG: in convertPathsToMasterSplines, an empty Master Spline is created even for a path that is too small, and the log message computes "too small" as #paths - #masterSplines, which also counts pre-existing splines.

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_masterSpline_splineMgr.addNewMasterSpline(name)` | Creates an empty Master Spline (engineered mode, unique name, UUID) and adds it to the list, then recomputes the id-to-index table. | 84 |
| `editor_masterSpline_splineMgr.addToMasterSplineArray(spline)` | Adds a Master Spline to the list without recomputing the id-to-index table. | 152 |
| `editor_masterSpline_splineMgr.captureLinkedSplinesState()` | Deep copy of all the child splines linked by the layers of all the Master Splines, grouped by tool. | 261 |
| `editor_masterSpline_splineMgr.captureTransTierState()` | Captures the full state for multi-spline undo/redo: Master Splines and linked splines. | 345 |
| `editor_masterSpline_splineMgr.convertPathsToMasterSplines(paths)` | Converts paths coming from a bitmap into Master Splines: grid points converted to world via the terrain editor, terrain normals; imports only if the smallest AABB dimension exceeds 10 m. Writes a log. | 1259 |
| `editor_masterSpline_splineMgr.deepCopyAllMasterSplines()` | Deep copy of the whole list of Master Splines. | 255 |
| `editor_masterSpline_splineMgr.deepCopyMasterSpline(spline)` | Deep copy of a Master Spline (string.buffer). | 252 |
| `editor_masterSpline_splineMgr.deserializeMasterSpline(data)` | Rebuilds a Master Spline (vec3, layers, empty secondary geometry to be regenerated) from serialized data. | 614 |
| `editor_masterSpline_splineMgr.getEditModeKey()` | Returns the edit mode key "masterSpline". | 66 |
| `editor_masterSpline_splineMgr.getIdToIdxMap()` | Returns the id-to-index table of the Master Splines. | 72 |
| `editor_masterSpline_splineMgr.getMasterSplines()` | Returns the array (live, not copied) of the Master Splines. | 69 |
| `editor_masterSpline_splineMgr.getToolPrefixStr()` | Returns the tool prefix "Master Spline". | 63 |
| `editor_masterSpline_splineMgr.joinMasterSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)` | Joins two open Master Splines: the first receives the concatenated geometry and the second is deleted. Does nothing if the indices are invalid. | 539 |
| `editor_masterSpline_splineMgr.lightSplineRedo(data)` | Redo of light modifications: applies data.new. *(internal)* | 765 |
| `editor_masterSpline_splineMgr.lightSplineUndo(data)` | Undo of light modifications to a Master Spline: applies data.old. *(internal)* | 762 |
| `editor_masterSpline_splineMgr.loadSessionState(state, replace)` | Loads a session state: new UUIDs for masters, children and layers, insertion of the children into their tools, relinking and dirty marking. Returns 0 if state is not a table. | 1030 |
| `editor_masterSpline_splineMgr.manageLiveOptimise(selectedSplineIdx)` | If the selected spline has isOptimising true and more than 2 divPoints, runs homologation.optimiseSpline with the number of iterations per frame. | 243 |
| `editor_masterSpline_splineMgr.recomputeIdMap()` | Recomputes the id-to-index table (called by the session wizard after a load). | 258 |
| `editor_masterSpline_splineMgr.redoAddNewMasterSpline(data)` | Redo of the creation: recreates a Master Spline with the id data.masterSplineId. *(internal)* | 1241 |
| `editor_masterSpline_splineMgr.redoLayerAdd(data)` | Redo of a layer addition. *(internal)* | 1117 |
| `editor_masterSpline_splineMgr.redoLayerRemove(data)` | Redo of a layer deletion. *(internal)* | 1206 |
| `editor_masterSpline_splineMgr.removeAllMasterSplines()` | Deletes all the Master Splines of the session, with their layers and linked children. | 165 |
| `editor_masterSpline_splineMgr.removeMasterSpline(idx)` | Deletes the Master Spline at index idx, all its layers and their linked splines, then recomputes the id-to-index table. | 155 |
| `editor_masterSpline_splineMgr.serializeMasterSpline(spline)` | Serializes a Master Spline into a JSON-safe table (nodes and normals as {x,y,z}, layers, parameters). | 570 |
| `editor_masterSpline_splineMgr.serializeSessionState()` | State for the shared session wizard: all the Master Splines plus each linked child (deduplicated by id), as JSON tables. | 1005 |
| `editor_masterSpline_splineMgr.singleMasterSplineEditRedo(data)` | Redo of an edit of a single Master Spline (data.new); by default recreates the child splines deleted during the action, names and links the new ones. *(internal)* | 940 |
| `editor_masterSpline_splineMgr.singleMasterSplineEditUndo(data)` | Undo of an edit of a single Master Spline (applies data.old). *(internal)* | 831 |
| `editor_masterSpline_splineMgr.splitMasterSpline(spline, splineIdx, selectedNodeIdx)` | Cuts the Master Spline at the chosen node. A loop becomes an open spline restarted at the cut point; otherwise two copies "name (1)" and "name (2)" are created with their turn overrides, and the layers are handled for each half. | 353 |
| `editor_masterSpline_splineMgr.transMasterSplineEditRedo(splinesData)` | Redo of a multi-spline edit. *(internal)* | 966 |
| `editor_masterSpline_splineMgr.transMasterSplineEditUndo(splinesData)` | Undo of a multi-spline edit (full state, masters and children). *(internal)* | 935 |
| `editor_masterSpline_splineMgr.undoAddNewMasterSpline(data)` | Undo of a Master Spline creation: deletes it by data.masterSplineId. *(internal)* | 1232 |
| `editor_masterSpline_splineMgr.undoLayerAdd(data)` | Undo of a layer addition: removes the layer from the Master Spline (data.masterSplineId). *(internal)* | 1095 |
| `editor_masterSpline_splineMgr.undoLayerRemove(data)` | Undo of a layer deletion: restores it. *(internal)* | 1162 |
| `editor_masterSpline_splineMgr.unlinkAllSplines(masterSpline)` | Unlinks all the linked splines of the Master Spline (isLink = false, linkId = nil), without going through undo/redo. | 1248 |
| `editor_masterSpline_splineMgr.updateDirtyMasterSplines(isSplineAnalysisEnabled)` | Rebuilds the geometry of isDirty splines (terrain, engineered or Catmull-Rom, turn widening, rib points, homologation if enabled), updates the linked layers and roadLength. Non-dirty splines only update their dirty layers. Signals the modification to the session if anything was rebuilt. | 173 |
| `editor_masterSpline_splineMgr.updateLinkedSplineName(splineId, linkType, newName)` | Renames the linked spline so that it follows the layer's name (via setNameJumpTable). | 1229 |

### Parameter details

#### `editor_masterSpline_splineMgr.addNewMasterSpline(name)`

Creates an empty Master Spline (engineered mode, unique name, UUID) and adds it to the list, then recomputes the id-to-index table.

- `name` (*string|nil*) : Base name; "Master Spline N" by default.
- **returns**: table The new Master Spline.

#### `editor_masterSpline_splineMgr.addToMasterSplineArray(spline)`

Adds a Master Spline to the list without recomputing the id-to-index table.

- `spline` (*table*) : Master Spline to add.

#### `editor_masterSpline_splineMgr.captureLinkedSplinesState()`

Deep copy of all the child splines linked by the layers of all the Master Splines, grouped by tool.

- **returns**: table Table with the lists meshSpline, assemblySpline, decalSpline, roadSpline, treeSpline.

#### `editor_masterSpline_splineMgr.captureTransTierState()`

Captures the full state for multi-spline undo/redo: Master Splines and linked splines.

- **returns**: table Table { masterSplines, linkedSplines }.

#### `editor_masterSpline_splineMgr.convertPathsToMasterSplines(paths)`

Converts paths coming from a bitmap into Master Splines: grid points converted to world via the terrain editor, terrain normals; imports only if the smallest AABB dimension exceeds 10 m. Writes a log.

- `paths` (*table*) : List of paths { points (x, y grid), widths }.

#### `editor_masterSpline_splineMgr.deepCopyAllMasterSplines()`

Deep copy of the whole list of Master Splines.

- **returns**: table Copy.

#### `editor_masterSpline_splineMgr.deepCopyMasterSpline(spline)`

Deep copy of a Master Spline (string.buffer).

- `spline` (*table*) : Spline to copy.
- **returns**: table Copy.

#### `editor_masterSpline_splineMgr.deserializeMasterSpline(data)`

Rebuilds a Master Spline (vec3, layers, empty secondary geometry to be regenerated) from serialized data.

- `data` (*table*) : Table produced by serializeMasterSpline.
- **returns**: table Master Spline.

#### `editor_masterSpline_splineMgr.getEditModeKey()`

Returns the edit mode key "masterSpline".

- **returns**: string Key.

#### `editor_masterSpline_splineMgr.getIdToIdxMap()`

Returns the id-to-index table of the Master Splines.

- **returns**: table<string, integer> Id-to-index table.

#### `editor_masterSpline_splineMgr.getMasterSplines()`

Returns the array (live, not copied) of the Master Splines.

- **returns**: table Array of Master Splines.

#### `editor_masterSpline_splineMgr.getToolPrefixStr()`

Returns the tool prefix "Master Spline".

- **returns**: string Prefix.

#### `editor_masterSpline_splineMgr.joinMasterSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)`

Joins two open Master Splines: the first receives the concatenated geometry and the second is deleted. Does nothing if the indices are invalid.

- `splineIdx1` (*integer*) : Index of the first spline (kept).
- `nodeIdx1` (*integer*) : Junction node of the first.
- `splineIdx2` (*integer*) : Index of the second spline (deleted).
- `nodeIdx2` (*integer*) : Junction node of the second.

#### `editor_masterSpline_splineMgr.lightSplineRedo(data)`

Redo of light modifications: applies data.new.

- `data` (*table*) : Action { old, new }.

#### `editor_masterSpline_splineMgr.lightSplineUndo(data)`

Undo of light modifications to a Master Spline: applies data.old.

- `data` (*table*) : Action { old, new }.

#### `editor_masterSpline_splineMgr.loadSessionState(state, replace)`

Loads a session state: new UUIDs for masters, children and layers, insertion of the children into their tools, relinking and dirty marking. Returns 0 if state is not a table.

- `state` (*table*) : State produced by serializeSessionState.
- `replace` (*boolean*) : If true, first deletes the whole current graph of masters (and their children).
- **returns**: integer Number of Master Splines loaded.

#### `editor_masterSpline_splineMgr.manageLiveOptimise(selectedSplineIdx)`

If the selected spline has isOptimising true and more than 2 divPoints, runs homologation.optimiseSpline with the number of iterations per frame.

- `selectedSplineIdx` (*integer*) : Index of the selected spline.

#### `editor_masterSpline_splineMgr.redoAddNewMasterSpline(data)`

Redo of the creation: recreates a Master Spline with the id data.masterSplineId.

- `data` (*table*) : Action { masterSplineId }.

#### `editor_masterSpline_splineMgr.redoLayerAdd(data)`

Redo of a layer addition.

- `data` (*table*) : Action data.

#### `editor_masterSpline_splineMgr.redoLayerRemove(data)`

Redo of a layer deletion.

- `data` (*table*) : Action data.

#### `editor_masterSpline_splineMgr.removeMasterSpline(idx)`

Deletes the Master Spline at index idx, all its layers and their linked splines, then recomputes the id-to-index table.

- `idx` (*integer*) : Index (1-based).

#### `editor_masterSpline_splineMgr.serializeMasterSpline(spline)`

Serializes a Master Spline into a JSON-safe table (nodes and normals as {x,y,z}, layers, parameters).

- `spline` (*table*) : Spline.
- **returns**: table Serialized data.

#### `editor_masterSpline_splineMgr.serializeSessionState()`

State for the shared session wizard: all the Master Splines plus each linked child (deduplicated by id), as JSON tables.

- **returns**: table { masterSplines = {...}, children = { [linkType] = {...} } }.

#### `editor_masterSpline_splineMgr.singleMasterSplineEditRedo(data)`

Redo of an edit of a single Master Spline (data.new); by default recreates the child splines deleted during the action, names and links the new ones.

- `data` (*table*) : Action { old, new }.

#### `editor_masterSpline_splineMgr.singleMasterSplineEditUndo(data)`

Undo of an edit of a single Master Spline (applies data.old).

- `data` (*table*) : Action { old, new }.

#### `editor_masterSpline_splineMgr.splitMasterSpline(spline, splineIdx, selectedNodeIdx)`

Cuts the Master Spline at the chosen node. A loop becomes an open spline restarted at the cut point; otherwise two copies "name (1)" and "name (2)" are created with their turn overrides, and the layers are handled for each half.

- `spline` (*table*) : Master Spline to cut.
- `splineIdx` (*integer*) : Index of the spline in the list.
- `selectedNodeIdx` (*integer*) : Index of the cut node.

#### `editor_masterSpline_splineMgr.transMasterSplineEditRedo(splinesData)`

Redo of a multi-spline edit.

- `splinesData` (*table*) : Action { old, new }.

#### `editor_masterSpline_splineMgr.transMasterSplineEditUndo(splinesData)`

Undo of a multi-spline edit (full state, masters and children).

- `splinesData` (*table*) : Action { old, new } from captureTransTierState.

#### `editor_masterSpline_splineMgr.undoAddNewMasterSpline(data)`

Undo of a Master Spline creation: deletes it by data.masterSplineId.

- `data` (*table*) : Action { masterSplineId }.

#### `editor_masterSpline_splineMgr.undoLayerAdd(data)`

Undo of a layer addition: removes the layer from the Master Spline (data.masterSplineId).

- `data` (*table*) : Action data.

#### `editor_masterSpline_splineMgr.undoLayerRemove(data)`

Undo of a layer deletion: restores it.

- `data` (*table*) : Action data.

#### `editor_masterSpline_splineMgr.unlinkAllSplines(masterSpline)`

Unlinks all the linked splines of the Master Spline (isLink = false, linkId = nil), without going through undo/redo.

- `masterSpline` (*table*) : Master Spline.

#### `editor_masterSpline_splineMgr.updateDirtyMasterSplines(isSplineAnalysisEnabled)`

Rebuilds the geometry of isDirty splines (terrain, engineered or Catmull-Rom, turn widening, rib points, homologation if enabled), updates the linked layers and roadLength. Non-dirty splines only update their dirty layers. Signals the modification to the session if anything was rebuilt.

- `isSplineAnalysisEnabled` (*boolean*) : If true, runs homologation.analyseSpline on splines with more than 2 discretized points.

#### `editor_masterSpline_splineMgr.updateLinkedSplineName(splineId, linkType, newName)`

Renames the linked spline so that it follows the layer's name (via setNameJumpTable).

- `splineId` (*string*) : Id of the linked spline.
- `linkType` (*string*) : Link type (tool prefix of the linked spline).
- `newName` (*string*) : New name.

## Calls into the engine (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/masterSpline/splineMgr.lua`.*
