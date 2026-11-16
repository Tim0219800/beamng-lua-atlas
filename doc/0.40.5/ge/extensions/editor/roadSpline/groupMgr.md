# `editor_roadSpline_groupMgr`

*File: `lua/ge/extensions/editor/roadSpline/groupMgr.lua` · VM: Game Engine (GE) · 887 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadSpline_groupMgr`: `extensions.load("editor_roadSpline_groupMgr")`, then the global `editor_roadSpline_groupMgr`

Manager of the "groups" of the Road Spline tool: a group = a road (nodes, widths, normals, layers, automatic layer options, terrain painting, locking) with its SimGroup folder in MissionGroup. Handles creation/deletion, rebuilding of dirty groups (updateDirtyGroups: Catmull-Rom sampling or "engineered" geometry, rib points, then layers), deep copy, cutting/joining, serialization (buffer or session JSON table), undo/redo and linking with the Master Spline. A modder uses it to create or modify roads by script.

## Example

```lua
local gm = require('editor/roadSpline/groupMgr')
gm.addNewGroup('Ma route')
local g = gm.getGroups()[#gm.getGroups()]
g.nodes = {vec3(0,0,0), vec3(50,0,0), vec3(100,20,0)}
g.widths = {8, 8, 8}
g.nmls = {vec3(0,0,1), vec3(0,0,1), vec3(0,0,1)}
g.isDirty = true -- rebuilt on the next updateDirtyGroups()
```

## Notes

- Group fields used in the code: name, id (UUID), isLoop, sceneTreeFolderId, isEnabled (false = locked), isDirty, isLink/linkId, nodes (vec3[]), widths, nmls, layers, corners, geometryMode, roadLength, ribPoints, divPoints, divWidths, tangents, binormals, normals, discMap, chunkStartIndices/chunkEndIndices/numChunks, isPainting + paint*.
- The exported name convertPathsToRoadGroups corresponds to the local function convertPathsToRoadSplines.
- convertPathsToRoadGroups creates the group (addNewGroup) BEFORE testing the path size: a path that is too small leaves an empty group, and the "paths too small" log message counts #paths - #groups, so always 0.
- A locked group (isEnabled = false) whose DecalRoads exist is not rebuilt (keepLocked): the tool no longer moves them and does not repaint the terrain.
- Group ids are UUIDs (strings); groupMap maps id -> index and must be recomputed after any insertion/removal (util.computeIdToIdxMap).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadSpline_groupMgr.addGroupToGroupArray(group)` | Adds an already built group to the list, with a unique name; creates its SimGroup folder (cansave = false) in MissionGroup if it does not exist yet. | 55 |
| `editor_roadSpline_groupMgr.addNewGroup(name)` | Creates a new empty group (unique name, UUID, transient SimGroup folder under MissionGroup, initial automatic layers) and adds it to the list. | 281 |
| `editor_roadSpline_groupMgr.adopt(group, ids)` | Takes back the DecalRoads listed by release() (only those still present in the scene) and sets the applied lock state. *(internal)* | 129 |
| `editor_roadSpline_groupMgr.convertPathsToRoadGroups(paths)` | Converts paths from a bitmap into Road Splines: grid points converted to world coordinates via the terrain, normals taken from the terrain; a path whose smallest dimension is less than or equal to 10 m is not imported. | 567 |
| `editor_roadSpline_groupMgr.copyGroupProfile(sourceGroup)` | Copies the "profile" of a group: its non-hidden layers (serializeLayer, without scene ids) and its automatic layer options/settings (widths and offsets of lines and fades). | 381 |
| `editor_roadSpline_groupMgr.deepCopyAllGroups()` | Deep copy of all groups (for the undo history). | 483 |
| `editor_roadSpline_groupMgr.deepCopyGroup(group)` | Deep copy of a group via string.buffer; empties the derived geometry (divPoints, divWidths, tangents, binormals, normals, discMap, divCurv) which will be recomputed. | 470 |
| `editor_roadSpline_groupMgr.deserializeGroup(data, isCreateObject)` | Deserializes a group, either from a blob (string) or from a JSON table: guarantees all tables, rehydrates the layers and vec3s, fills in the default values of the edge decor and creates the scene folder if requested (unless a kept folder still exists). Marks the group dirty. | 632 |
| `editor_roadSpline_groupMgr.findGroup(id)` | Looks up a group by id. | 143 |
| `editor_roadSpline_groupMgr.getCurrentRoadSplineList()` | Lists the active Road Splines (isEnabled), for the link menus of other tools. | 785 |
| `editor_roadSpline_groupMgr.getEditModeKey()` | Returns the tool's edit mode key ("roadSplineEditor"). | 52 |
| `editor_roadSpline_groupMgr.getGroups()` | Returns the live array of the tool's groups (roads). | 43 |
| `editor_roadSpline_groupMgr.getIdToIdxMap()` | Returns the table group id -> index in getGroups(). | 46 |
| `editor_roadSpline_groupMgr.getToolPrefixStr()` | Returns the tool's name prefix ("Road Spline"). | 49 |
| `editor_roadSpline_groupMgr.isLinked(id)` | Indicates whether the road is linked to a Master Spline. | 798 |
| `editor_roadSpline_groupMgr.joinRoadSplines(groupIdx1, nodeIdx1, groupIdx2, nodeIdx2)` | Joins two non-looped roads into one: group1 is modified, group2 is deleted. Does nothing if a group is not found or if the node indices are invalid. | 538 |
| `editor_roadSpline_groupMgr.pasteGroupProfile(targetGroup, profile)` | Applies a profile to the target group: deletes its layers, recreates those of the profile, copies the options (default values if absent), then regenerates the automatic layers and marks the group dirty. | 426 |
| `editor_roadSpline_groupMgr.recomputeIdMap()` | Recomputes the id -> index table (called by the session helper after a load that adds roads). | 782 |
| `editor_roadSpline_groupMgr.recreateAutoGeneratedLayers(group)` | Deletes the hidden (automatic) layers then recreates those whose group option is active (tire marks, repairs, cracks, patches, damaged asphalt, centerline, edge/lane lines, edge fades 1 to 3), and marks the group dirty. | 177 |
| `editor_roadSpline_groupMgr.release(group)` | Before a Lua reload: returns, by layer id, the DecalRoad ids of the locked group, so that adopt() takes them back afterwards (roads, folder and painting stay in the scene). *(internal)* | 120 |
| `editor_roadSpline_groupMgr.removeAllGroups(isIncludeDisabled)` | Deletes the groups. With isIncludeDisabled, deletes everything and empties the list; otherwise only the enabled and unlinked groups (locked and linked ones stay). | 157 |
| `editor_roadSpline_groupMgr.removeGroup(idx)` | Deletes the group at the given index: undoes the terrain painting, deletes its layers (DecalRoads) and its scene folder, then recomputes the id -> index table. | 75 |
| `editor_roadSpline_groupMgr.removeLinkedRoadSpline(splineId)` | Deletes a linked spline by its id (called when the corresponding Master Spline layer is removed). | 149 |
| `editor_roadSpline_groupMgr.serializeGroup(group)` | Serializes a group into a string.buffer blob: undoes the terrain painting if enabled and empties the derived tables before encoding. | 600 |
| `editor_roadSpline_groupMgr.serializeGroupToTable(group)` | Serializes a group into a portable table for a JSON session file: without derived geometry or scene handles, layers reduced to the authoring fields (serializeLayer). The live group is not modified. | 615 |
| `editor_roadSpline_groupMgr.setFixedWidth(group, width)` | Sets the same width on every node of the group and marks it dirty. | 273 |
| `editor_roadSpline_groupMgr.setLink(id, groupId, isLink)` | Enables or disables the link of a road with another spline (linkId field) and marks it dirty. | 804 |
| `editor_roadSpline_groupMgr.singleGroupEditRedo(data)` | Redo of an edit of a single group: restores data.new. *(internal)* | 760 |
| `editor_roadSpline_groupMgr.singleGroupEditUndo(data)` | Undo of an edit of a single group: restores data.old (layers copied back, all fields of the road, painting, folder name if renamed). *(internal)* | 759 |
| `editor_roadSpline_groupMgr.splitGroup(group, groupIdx, selectedNodeIdx)` | Cuts a group at the given node. A loop becomes a reordered open road; an open road is replaced by two new groups "name (1)" and "name (2)" (new UUIDs). The per-corner settings (corners) follow. | 492 |
| `editor_roadSpline_groupMgr.transGroupEditRedo(groupsData)` | Redo of a multi-group edit: reinserts the copies of groupsData.new. *(internal)* | 779 |
| `editor_roadSpline_groupMgr.transGroupEditUndo(groupsData)` | Undo of an edit touching several groups: deletes all groups and reinserts the copies of groupsData.old. *(internal)* | 778 |
| `editor_roadSpline_groupMgr.unlinkAll()` | Detaches all linked roads (isLink = false, linkId = nil) and marks all groups dirty. | 828 |
| `editor_roadSpline_groupMgr.updateDirtyGroups(dragging)` | Rebuilds the groups marked dirty (isDirty): ignores groups with fewer than 2 nodes (layers deleted), snaps the nodes to the terrain (vertical raycast), samples the spline (Catmull-Rom, or clothoid in engineered mode), computes the rib points and the length, repaints the terrain if active, regenerates the automatic layers and updates the DecalRoads. Also updates the individual layers marked dirty. During a handle drag, only the sampling is done and the group stays dirty. | 204 |
| `editor_roadSpline_groupMgr.updateLinkedRoadSpline(id, points, widths, nmls, isLoop, isConformToTerrain)` | Replaces the geometry (nodes, widths, normals, loop) of a linked road and marks it dirty. | 818 |

### Parameter details

#### `editor_roadSpline_groupMgr.addGroupToGroupArray(group)`

Adds an already built group to the list, with a unique name; creates its SimGroup folder (cansave = false) in MissionGroup if it does not exist yet.

- `group` (*table*) : Group to add.

#### `editor_roadSpline_groupMgr.addNewGroup(name)`

Creates a new empty group (unique name, UUID, transient SimGroup folder under MissionGroup, initial automatic layers) and adds it to the list.

- `name` (*string|nil*) : Base name; default "Road Spline N".

#### `editor_roadSpline_groupMgr.adopt(group, ids)`

Takes back the DecalRoads listed by release() (only those still present in the scene) and sets the applied lock state.

- `group` (*table*) : Recreated group.
- `ids` (*table*) : Value returned by release().

#### `editor_roadSpline_groupMgr.convertPathsToRoadGroups(paths)`

Converts paths from a bitmap into Road Splines: grid points converted to world coordinates via the terrain, normals taken from the terrain; a path whose smallest dimension is less than or equal to 10 m is not imported.

- `paths` (*table[]*) : List of {points = {{x=,y=},...}, widths = {...}} in grid coordinates.

#### `editor_roadSpline_groupMgr.copyGroupProfile(sourceGroup)`

Copies the "profile" of a group: its non-hidden layers (serializeLayer, without scene ids) and its automatic layer options/settings (widths and offsets of lines and fades).

- `sourceGroup` (*table*) : Source group.
- **returns**: table Profile ready for pasteGroupProfile or JSON.

#### `editor_roadSpline_groupMgr.deepCopyAllGroups()`

Deep copy of all groups (for the undo history).

- **returns**: table[] List of copies.

#### `editor_roadSpline_groupMgr.deepCopyGroup(group)`

Deep copy of a group via string.buffer; empties the derived geometry (divPoints, divWidths, tangents, binormals, normals, discMap, divCurv) which will be recomputed.

- `group` (*table*) : Group.
- **returns**: table Independent copy.

#### `editor_roadSpline_groupMgr.deserializeGroup(data, isCreateObject)`

Deserializes a group, either from a blob (string) or from a JSON table: guarantees all tables, rehydrates the layers and vec3s, fills in the default values of the edge decor and creates the scene folder if requested (unless a kept folder still exists). Marks the group dirty.

- `data` (*string|table*) : string.buffer blob or session table.
- `isCreateObject` (*boolean*) : true to create the SimGroup folder in MissionGroup.
- **returns**: table The group ready to be added.

#### `editor_roadSpline_groupMgr.findGroup(id)`

Looks up a group by id.

- `id` (*string*) : UUID of the group.
- **returns**: table|nil The group or nil.

#### `editor_roadSpline_groupMgr.getCurrentRoadSplineList()`

Lists the active Road Splines (isEnabled), for the link menus of other tools.

- **returns**: table[] Elements { name, id, type = "Road Spline" }.

#### `editor_roadSpline_groupMgr.getEditModeKey()`

Returns the tool's edit mode key ("roadSplineEditor").

- **returns**: string "roadSplineEditor"

#### `editor_roadSpline_groupMgr.getGroups()`

Returns the live array of the tool's groups (roads).

- **returns**: table[] List of groups, modifiable in place.

#### `editor_roadSpline_groupMgr.getIdToIdxMap()`

Returns the table group id -> index in getGroups().

- **returns**: table<string, integer> Live table.

#### `editor_roadSpline_groupMgr.getToolPrefixStr()`

Returns the tool's name prefix ("Road Spline").

- **returns**: string "Road Spline"

#### `editor_roadSpline_groupMgr.isLinked(id)`

Indicates whether the road is linked to a Master Spline.

- `id` (*string*) : UUID of the group.
- **returns**: boolean true if linked (false if unknown).

#### `editor_roadSpline_groupMgr.joinRoadSplines(groupIdx1, nodeIdx1, groupIdx2, nodeIdx2)`

Joins two non-looped roads into one: group1 is modified, group2 is deleted. Does nothing if a group is not found or if the node indices are invalid.

- `groupIdx1` (*integer*) : Index of the first group.
- `nodeIdx1` (*integer*) : End node of the first group.
- `groupIdx2` (*integer*) : Index of the second group.
- `nodeIdx2` (*integer*) : End node of the second group.

#### `editor_roadSpline_groupMgr.pasteGroupProfile(targetGroup, profile)`

Applies a profile to the target group: deletes its layers, recreates those of the profile, copies the options (default values if absent), then regenerates the automatic layers and marks the group dirty.

- `targetGroup` (*table*) : Target group.
- `profile` (*table*) : Profile from copyGroupProfile.

#### `editor_roadSpline_groupMgr.recreateAutoGeneratedLayers(group)`

Deletes the hidden (automatic) layers then recreates those whose group option is active (tire marks, repairs, cracks, patches, damaged asphalt, centerline, edge/lane lines, edge fades 1 to 3), and marks the group dirty.

- `group` (*table*) : Group.

#### `editor_roadSpline_groupMgr.release(group)`

Before a Lua reload: returns, by layer id, the DecalRoad ids of the locked group, so that adopt() takes them back afterwards (roads, folder and painting stay in the scene).

- `group` (*table*) : Group.
- **returns**: table { [layerId] = {id = decalRoadId, ids = {...}} }

#### `editor_roadSpline_groupMgr.removeAllGroups(isIncludeDisabled)`

Deletes the groups. With isIncludeDisabled, deletes everything and empties the list; otherwise only the enabled and unlinked groups (locked and linked ones stay).

- `isIncludeDisabled` (*boolean|nil*) : true to delete everything, including locked and linked ones.

#### `editor_roadSpline_groupMgr.removeGroup(idx)`

Deletes the group at the given index: undoes the terrain painting, deletes its layers (DecalRoads) and its scene folder, then recomputes the id -> index table.

- `idx` (*integer*) : Index in the list of groups.

#### `editor_roadSpline_groupMgr.removeLinkedRoadSpline(splineId)`

Deletes a linked spline by its id (called when the corresponding Master Spline layer is removed).

- `splineId` (*string*) : UUID of the group.

#### `editor_roadSpline_groupMgr.serializeGroup(group)`

Serializes a group into a string.buffer blob: undoes the terrain painting if enabled and empties the derived tables before encoding.

- `group` (*table*) : Group.
- **returns**: string Encoded data.

#### `editor_roadSpline_groupMgr.serializeGroupToTable(group)`

Serializes a group into a portable table for a JSON session file: without derived geometry or scene handles, layers reduced to the authoring fields (serializeLayer). The live group is not modified.

- `group` (*table*) : Group.
- **returns**: table JSON-compatible table.

#### `editor_roadSpline_groupMgr.setFixedWidth(group, width)`

Sets the same width on every node of the group and marks it dirty.

- `group` (*table*) : Group.
- `width` (*number*) : Width in meters.

#### `editor_roadSpline_groupMgr.setLink(id, groupId, isLink)`

Enables or disables the link of a road with another spline (linkId field) and marks it dirty.

- `id` (*string*) : UUID of the road.
- `groupId` (*string*) : UUID of the master spline (ignored if isLink is false).
- `isLink` (*boolean*) : true to link.

#### `editor_roadSpline_groupMgr.singleGroupEditRedo(data)`

Redo of an edit of a single group: restores data.new.

- `data` (*table*) : { old = group, new = group }

#### `editor_roadSpline_groupMgr.singleGroupEditUndo(data)`

Undo of an edit of a single group: restores data.old (layers copied back, all fields of the road, painting, folder name if renamed).

- `data` (*table*) : { old = group, new = group }

#### `editor_roadSpline_groupMgr.splitGroup(group, groupIdx, selectedNodeIdx)`

Cuts a group at the given node. A loop becomes a reordered open road; an open road is replaced by two new groups "name (1)" and "name (2)" (new UUIDs). The per-corner settings (corners) follow.

- `group` (*table*) : Group to cut.
- `groupIdx` (*integer*) : Group index.
- `selectedNodeIdx` (*integer*) : Index of the cut node.

#### `editor_roadSpline_groupMgr.transGroupEditRedo(groupsData)`

Redo of a multi-group edit: reinserts the copies of groupsData.new.

- `groupsData` (*table*) : { old = groups[], new = groups[] }

#### `editor_roadSpline_groupMgr.transGroupEditUndo(groupsData)`

Undo of an edit touching several groups: deletes all groups and reinserts the copies of groupsData.old.

- `groupsData` (*table*) : { old = groups[], new = groups[] }

#### `editor_roadSpline_groupMgr.updateDirtyGroups(dragging)`

Rebuilds the groups marked dirty (isDirty): ignores groups with fewer than 2 nodes (layers deleted), snaps the nodes to the terrain (vertical raycast), samples the spline (Catmull-Rom, or clothoid in engineered mode), computes the rib points and the length, repaints the terrain if active, regenerates the automatic layers and updates the DecalRoads. Also updates the individual layers marked dirty. During a handle drag, only the sampling is done and the group stays dirty.

- `dragging` (*boolean|nil*) : true during a live drag (heavy rebuild deferred).

#### `editor_roadSpline_groupMgr.updateLinkedRoadSpline(id, points, widths, nmls, isLoop, isConformToTerrain)`

Replaces the geometry (nodes, widths, normals, loop) of a linked road and marks it dirty.

- `id` (*string*) : UUID of the linked road.
- `points` (*vec3[]*) : New nodes.
- `widths` (*number[]*) : Widths in m.
- `nmls` (*vec3[]*) : Normals.
- `isLoop` (*boolean*) : Loop state of the master.
- `isConformToTerrain` (*boolean*) : Received but not used in the code.

## Calls into the engine (C++)

- `Engine.` `generateUUID`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadSpline/groupMgr.lua`.*
