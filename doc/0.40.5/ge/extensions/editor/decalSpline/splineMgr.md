# `editor_decalSpline_splineMgr`

*File: `lua/ge/extensions/editor/decalSpline/splineMgr.lua` · VM: Game Engine (GE) · 755 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_decalSpline_splineMgr`: `extensions.load("editor_decalSpline_splineMgr")`, then the global `editor_decalSpline_splineMgr`

Spline manager of the editor's Decal Spline tool (prefix "Decal Spline", edit mode decalSplineEditMode): a decal spline follows a path (nodes, widths, normals) on which decals are distributed (spacing, jitter, rotation, atlas rows/columns, scale, frame, up to 4 components). The module keeps the list of splines and an id to index table, creates/deletes/splits/joins splines, handles undo/redo, profile copy, serialization (binary buffer or session JSON table), links with master splines, and rebuilds the geometry and decals of splines marked isDirty.

## Notes

- A spline is a table: name, id (UUID), isDirty, isLoop, isLink/linkId, nodes (vec3), widths, nmls, divPoints/divWidths/tangents/binormals/normals/discMap (recomputed derived geometry), isEnabled, isAliasRoundRobin, roadLength, spacing, jitter, randomSeed, and per component n (1 to 4): rotN, numRowsN, numColsN, scaleN, frameN.
- Slider default values: spacing 0, jitter 0, rot 1, randomSeed 41225, numRows 4, numCols 2, scale 1, frame 3, default material asphalt_patches; minimum 100 subdivisions; minimum path import size 10 m.
- Any modification of a spline goes through isDirty = true: updateDirtyDecalSplines (called every frame by the tool) then rebuilds the geometry (catmullRomRaycast) and the decals (pop.populateDecalSpline). Fewer than 2 nodes: decals and derived geometry deleted.
- A disabled spline (isEnabled = false) whose decals already exist is not rebuilt.
- convertPathsToDecalSplines creates a spline for each path even if the path is too small (the spline then stays empty), and the log message counts #paths - #decalSplines (wrong if splines already existed).
- deepCopyDecalSplineState is listed twice in the public interface (same function).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_decalSpline_splineMgr.addNewDecalSpline()` | Adds a new empty spline at the end with a unique name ("Decal Spline N"), an Engine.generateUUID() UUID and the default parameters. | 83 |
| `editor_decalSpline_splineMgr.convertPathsToDecalSplines(paths)` | Converts paths from an image (points in terrain grid) into splines: world coordinates via the terrain editor, terrain normals. Paths whose smallest dimension is at most 10 m are not imported (see notes). | 608 |
| `editor_decalSpline_splineMgr.copyDecalSplineProfile(spline)` | Copies the profile (decal distribution parameters) of a spline, without nodes, widths, nmls or derived geometry. | 466 |
| `editor_decalSpline_splineMgr.deepCopyDecalSpline(spline)` | Deep copy (string.buffer encode/decode) of a spline, with the derived geometry cleared. | 198 |
| `editor_decalSpline_splineMgr.deepCopyDecalSplineState()` | Deep copy of all splines (for the undo history). | 210 |
| `editor_decalSpline_splineMgr.deserializeDecalSpline(data, isCreateObject)` | Deserializes a spline from the editor blob (string) or a session JSON table. On the JSON path, the derived tables are empty and the positions rehydrated as vec3 before the first build. | 546 |
| `editor_decalSpline_splineMgr.getCurrentDecalSplineList()` | List of enabled splines as {name, id, type} (type = tool prefix), for the selectors of other tools. | 641 |
| `editor_decalSpline_splineMgr.getDecalSplines()` | Returns the splines table (reference, not copied). | 61 |
| `editor_decalSpline_splineMgr.getDefaultSliderParams()` | Returns the default slider values of the interface. | 80 |
| `editor_decalSpline_splineMgr.getEditModeKey()` | Returns the edit mode key ("decalSplineEditMode"). | 58 |
| `editor_decalSpline_splineMgr.getSplineMap()` | Returns the spline id to index table. | 64 |
| `editor_decalSpline_splineMgr.getToolPrefixStr()` | Returns the tool prefix ("Decal Spline"). | 55 |
| `editor_decalSpline_splineMgr.isLinked(id)` | Indicates whether the spline with the given id is linked to a master spline. | 655 |
| `editor_decalSpline_splineMgr.joinDecalSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)` | Joins two non-looped splines: the concatenated geometry is applied to the first, the second is deleted. No effect if the node indices are invalid. | 335 |
| `editor_decalSpline_splineMgr.pasteDecalSplineProfile(spline, profile)` | Applies a profile to a spline: deletes its decals, copies the parameters (spacing, jitter, rotN, numRowsN, numColsN, scaleN, frameN...) and marks it isDirty. | 481 |
| `editor_decalSpline_splineMgr.recomputeIdMap()` | Recomputes the id to index table (called by the session utility after a load). | 565 |
| `editor_decalSpline_splineMgr.removeAllDecalSplines(isIncludeDisabled)` | Deletes the splines. With isIncludeDisabled true, all of them; otherwise only those enabled and not linked. | 179 |
| `editor_decalSpline_splineMgr.removeDecalSpline(idx)` | Deletes a spline, removes its decals from the scene, updates the index table, and deletes the decal folder if no spline remains. | 158 |
| `editor_decalSpline_splineMgr.removeLinkedDecalSpline(splineId)` | Deletes a spline from its id (called when the master layer is deleted). No effect if the id is unknown. | 169 |
| `editor_decalSpline_splineMgr.serializeDecalSpline(spline)` | Serializes a spline into a binary blob (string.buffer) for the editor. | 524 |
| `editor_decalSpline_splineMgr.serializeDecalSplineToTable(spline)` | Serializes a spline into a portable table for a session file: derived geometry cleared, scene handle removed, the live spline is not modified. | 537 |
| `editor_decalSpline_splineMgr.setDecalSpline(spline, idx)` | Places a spline at the given index and marks it isDirty. | 67 |
| `editor_decalSpline_splineMgr.setDecalSplines(splines)` | Places all splines of an array at the same indices (each marked isDirty); does not delete the others. | 73 |
| `editor_decalSpline_splineMgr.setLink(id, groupId, isLink)` | Enables or disables the link of a spline with a group, deletes its decals and marks it isDirty. | 661 |
| `editor_decalSpline_splineMgr.singleSplineEditRedo(decalSplineData)` | Redoes a single-spline edit with decalSplineData.new (if present). *(internal)* | 434 |
| `editor_decalSpline_splineMgr.singleSplineEditUndo(decalSplineData)` | Undoes a single-spline edit with decalSplineData.old (if present). *(internal)* | 426 |
| `editor_decalSpline_splineMgr.splitDecalSpline(selectedSplineIdx, selectedNodeIdx)` | Splits a spline at the given node into two splines. A loop is opened in place, starting at the chosen node. | 219 |
| `editor_decalSpline_splineMgr.transSplineEditRedo(data)` | Redoes a global edit with data.new. *(internal)* | 454 |
| `editor_decalSpline_splineMgr.transSplineEditUndo(data)` | Undoes a global edit: deletes all splines, restores data.old, marks everything isDirty and recomputes the index table. *(internal)* | 442 |
| `editor_decalSpline_splineMgr.unlinkAll()` | Unlinks all linked splines and marks all splines isDirty. | 698 |
| `editor_decalSpline_splineMgr.updateDirtyDecalSplines()` | Rebuilds the isDirty splines: vertical raycasts of the nodes, Catmull-Rom geometry, decals, length; marks the edit in the session if at least one was rebuilt. Called every frame by the tool. *(internal)* | 568 |
| `editor_decalSpline_splineMgr.updateLinkedDecalSpline(id, points, widths, nmls, isLoop, isConformToTerrain)` | Updates a linked spline with the geometry of the master spline (nodes, widths, normals, loop). If fewer than 2 points, clears the derived geometry and deletes the decals. | 676 |

### Parameter details

#### `editor_decalSpline_splineMgr.convertPathsToDecalSplines(paths)`

Converts paths from an image (points in terrain grid) into splines: world coordinates via the terrain editor, terrain normals. Paths whose smallest dimension is at most 10 m are not imported (see notes).

- `paths` (*table*) : array of {points, widths}

#### `editor_decalSpline_splineMgr.copyDecalSplineProfile(spline)`

Copies the profile (decal distribution parameters) of a spline, without nodes, widths, nmls or derived geometry.

- `spline` (*table*) : source spline
- **returns**: table profile

#### `editor_decalSpline_splineMgr.deepCopyDecalSpline(spline)`

Deep copy (string.buffer encode/decode) of a spline, with the derived geometry cleared.

- `spline` (*table*) : spline
- **returns**: table copy

#### `editor_decalSpline_splineMgr.deepCopyDecalSplineState()`

Deep copy of all splines (for the undo history).

- **returns**: table array of copies

#### `editor_decalSpline_splineMgr.deserializeDecalSpline(data, isCreateObject)`

Deserializes a spline from the editor blob (string) or a session JSON table. On the JSON path, the derived tables are empty and the positions rehydrated as vec3 before the first build.

- `data` (*string|table*) : blob or table
- `isCreateObject` (*boolean|nil*) : (inferred from code) indicates whether the object must be created
- **returns**: table spline

#### `editor_decalSpline_splineMgr.getCurrentDecalSplineList()`

List of enabled splines as {name, id, type} (type = tool prefix), for the selectors of other tools.

- **returns**: table array of {name, id, type}

#### `editor_decalSpline_splineMgr.getDecalSplines()`

Returns the splines table (reference, not copied).

- **returns**: table array of splines

#### `editor_decalSpline_splineMgr.getDefaultSliderParams()`

Returns the default slider values of the interface.

- **returns**: table spacing, jitter, rot, randomSeed, numRows, numCols, scale, frame...

#### `editor_decalSpline_splineMgr.getEditModeKey()`

Returns the edit mode key ("decalSplineEditMode").

- **returns**: string key

#### `editor_decalSpline_splineMgr.getSplineMap()`

Returns the spline id to index table.

- **returns**: table<string, integer> id to index

#### `editor_decalSpline_splineMgr.getToolPrefixStr()`

Returns the tool prefix ("Decal Spline").

- **returns**: string prefix

#### `editor_decalSpline_splineMgr.isLinked(id)`

Indicates whether the spline with the given id is linked to a master spline.

- `id` (*string*) : spline id
- **returns**: boolean true if linked

#### `editor_decalSpline_splineMgr.joinDecalSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2)`

Joins two non-looped splines: the concatenated geometry is applied to the first, the second is deleted. No effect if the node indices are invalid.

- `splineIdx1` (*integer*) : index of the first spline (kept)
- `nodeIdx1` (*integer*) : end node of the first
- `splineIdx2` (*integer*) : index of the second spline (deleted)
- `nodeIdx2` (*integer*) : end node of the second

#### `editor_decalSpline_splineMgr.pasteDecalSplineProfile(spline, profile)`

Applies a profile to a spline: deletes its decals, copies the parameters (spacing, jitter, rotN, numRowsN, numColsN, scaleN, frameN...) and marks it isDirty.

- `spline` (*table*) : target spline
- `profile` (*table*) : profile from copyDecalSplineProfile

#### `editor_decalSpline_splineMgr.removeAllDecalSplines(isIncludeDisabled)`

Deletes the splines. With isIncludeDisabled true, all of them; otherwise only those enabled and not linked.

- `isIncludeDisabled` (*boolean*) : include disabled (and linked) splines

#### `editor_decalSpline_splineMgr.removeDecalSpline(idx)`

Deletes a spline, removes its decals from the scene, updates the index table, and deletes the decal folder if no spline remains.

- `idx` (*integer*) : index (1-based)

#### `editor_decalSpline_splineMgr.removeLinkedDecalSpline(splineId)`

Deletes a spline from its id (called when the master layer is deleted). No effect if the id is unknown.

- `splineId` (*string*) : spline id

#### `editor_decalSpline_splineMgr.serializeDecalSpline(spline)`

Serializes a spline into a binary blob (string.buffer) for the editor.

- `spline` (*table*) : spline
- **returns**: string encoded data

#### `editor_decalSpline_splineMgr.serializeDecalSplineToTable(spline)`

Serializes a spline into a portable table for a session file: derived geometry cleared, scene handle removed, the live spline is not modified.

- `spline` (*table*) : spline
- **returns**: table simple table

#### `editor_decalSpline_splineMgr.setDecalSpline(spline, idx)`

Places a spline at the given index and marks it isDirty.

- `spline` (*table*) : spline
- `idx` (*integer*) : index (1-based)

#### `editor_decalSpline_splineMgr.setDecalSplines(splines)`

Places all splines of an array at the same indices (each marked isDirty); does not delete the others.

- `splines` (*table*) : array of splines

#### `editor_decalSpline_splineMgr.setLink(id, groupId, isLink)`

Enables or disables the link of a spline with a group, deletes its decals and marks it isDirty.

- `id` (*string*) : spline id
- `groupId` (*string|nil*) : link group id
- `isLink` (*boolean*) : link or unlink

#### `editor_decalSpline_splineMgr.singleSplineEditRedo(decalSplineData)`

Redoes a single-spline edit with decalSplineData.new (if present).

- `decalSplineData` (*table*) : {old, new}

#### `editor_decalSpline_splineMgr.singleSplineEditUndo(decalSplineData)`

Undoes a single-spline edit with decalSplineData.old (if present).

- `decalSplineData` (*table*) : {old, new}

#### `editor_decalSpline_splineMgr.splitDecalSpline(selectedSplineIdx, selectedNodeIdx)`

Splits a spline at the given node into two splines. A loop is opened in place, starting at the chosen node.

- `selectedSplineIdx` (*integer*) : spline index
- `selectedNodeIdx` (*integer*) : index of the split node

#### `editor_decalSpline_splineMgr.transSplineEditRedo(data)`

Redoes a global edit with data.new.

- `data` (*table*) : {old, new} with arrays of splines

#### `editor_decalSpline_splineMgr.transSplineEditUndo(data)`

Undoes a global edit: deletes all splines, restores data.old, marks everything isDirty and recomputes the index table.

- `data` (*table*) : {old, new} with arrays of splines

#### `editor_decalSpline_splineMgr.updateLinkedDecalSpline(id, points, widths, nmls, isLoop, isConformToTerrain)`

Updates a linked spline with the geometry of the master spline (nodes, widths, normals, loop). If fewer than 2 points, clears the derived geometry and deletes the decals.

- `id` (*string*) : spline id
- `points` (*table*) : vec3 nodes
- `widths` (*table*) : widths
- `nmls` (*table*) : normals
- `isLoop` (*boolean*) : loop
- `isConformToTerrain` (*boolean*) : (not used in the function)

## Calls into the engine (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/decalSpline/splineMgr.lua`.*
