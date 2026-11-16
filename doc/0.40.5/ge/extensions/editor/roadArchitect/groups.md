# `editor_roadArchitect_groups`

*File: `lua/ge/extensions/editor/roadArchitect/groups.lua` · VM: Game Engine (GE) · 473 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `editor_roadArchitect_groups`: `extensions.load("editor_roadArchitect_groups")`, then the global `editor_roadArchitect_groups`

Road Architect group management (GE editor). Two notions coexist: prefab groups (reusable road templates, such as intersections or roundabouts, loaded from JSON files or created by the user) and placed groups (sets of road nodes already present in the session). The module can audition a prefab (rotating camera at 1000 m altitude), place it in the session, create a group from a polygon, serialize, save, load and move the camera to a group.

## Example

```lua
local g = extensions.editor_roadArchitect_groups
g.getDefaultGroups()
local noms = g.addGroupToRoadsPlace(1, false) -- returns the names (UUIDs) of the added roads
```

## Notes

- The default data is read via jsonReadFile from roadArchitect/groups/*.json (12 prefabs: Urban Block, Staggered Junction, Double Roundabout, RIRO Intersection, etc.); getDefaultGroups does nothing if groups already contains elements.
- importGroup (creating a prefab from roads) is local and not exported; it is reached via load() or getDefaultGroups().
- Placed group names are imgui buffers (im.ArrayChar(32, name)), not Lua strings; copyPlacedGroup converts them with ffi.string.
- The audition roads are shifted by -center and raised by 1000 m (auditionHeight) and stay hidden (isHidden = true).
- The saved group file has the form { data = { group = {name, roads} } }.
- save(idx) and load() handle a single group at a time despite their description ("collection"): save writes groups[idx], load adds one group.
- createGroup modifies gPolygon in place (z set to 0) and ignores junction roads (isJctRoad) and bridges (isBridge).

## Functions

| Function | Description | Line |
|---|---|---|
| `editor_roadArchitect_groups.addGroupToRoadsAudition(gIdx)` | Copies the roads of prefab group gIdx into roadMgr.roads for auditioning: roads centered on the origin, raised to the audition pose (+1000 m) and hidden. Recomputes the road map, and reframes the camera if already in group view. | 117 |
| `editor_roadArchitect_groups.addGroupToRoadsPlace(gIdx, isConformGroupToTerrain)` | Places prefab group gIdx in the session: copies its roads with unique UUID names (Engine.generateUUID), visible, registers a placed group (32-character name, node list) then deletes the hidden roads. | 158 |
| `editor_roadArchitect_groups.copyPlacedGroup(pg)` | Deep copy of a placed group, with the name converted from the imgui buffer to a string. | 240 |
| `editor_roadArchitect_groups.createGroup(gPolygon, roads)` | Creates a placed group from the road nodes located inside a 2D polygon (the polygon is flattened to z = 0 in place). Junction roads and bridges are ignored. Creates nothing if no node is in the polygon; the group is named "New Group". | 207 |
| `editor_roadArchitect_groups.createPrefabGroup(g)` | Turns a placed group into a prefab group: copies each concerned road (once) with a new UUID name and adds to groups an element named "User N". | 247 |
| `editor_roadArchitect_groups.deserialiseGroup(gSer)` | Rebuilds a prefab group from a serialized group via roadMgr.deserialiseRoad. | 315 |
| `editor_roadArchitect_groups.getDefaultGroups()` | Loads the 12 default prefab groups from the roadArchitect/groups/ JSON files. Does nothing if groups is not empty. | 351 |
| `editor_roadArchitect_groups.getPlacedGroups()` | Returns the collection of placed groups of the session. | 380 |
| `editor_roadArchitect_groups.goToGroupView(gIdx, timer, time)` | Puts the camera in the group's audition view if not already there: stores the current camera pose, resets the timer and calls the pose update. Returns the adjusted time. | 105 |
| `editor_roadArchitect_groups.goToOldView()` | Returns the camera to the pose stored before group view and leaves the group view state. | 297 |
| `editor_roadArchitect_groups.goToPlacedGroup(idx)` | Puts the free camera directly above the placed group, looking down, at a height computed from the field of view to frame everything. Does nothing if the extent is less than 0.1 m in x and y. | 405 |
| `editor_roadArchitect_groups.load()` | Opens a JSON open dialog, reads the group (data.group), deserializes it and adds it to groups via importGroup. | 338 |
| `editor_roadArchitect_groups.manageRotateCam()` | Rotates the audition camera by a step of pi/500 around the audition center (called every frame by the UI). *(internal)* | 198 |
| `editor_roadArchitect_groups.removePlacedGroupHard(groupIdx)` | Removes a placed group and deletes its roads, except those still belonging to another group. Then calls updateGroupsAfterRoadRemove. | 389 |
| `editor_roadArchitect_groups.removePlacedGroupSoft(groupIdx)` | Removes a placed group from the collection without touching the roads it contains. | 386 |
| `editor_roadArchitect_groups.save(idx)` | Opens a JSON save dialog and writes groups[idx] (serialized) to the chosen file, in the form { data = { group = ... } }. | 325 |
| `editor_roadArchitect_groups.serialiseGroup(g)` | Serializes a prefab group into a { name, roads } table via roadMgr.serialiseRoad. | 305 |
| `editor_roadArchitect_groups.setPlacedGroups(pg)` | Replaces the collection of placed groups. | 383 |
| `editor_roadArchitect_groups.updateGroupsAfterRoadRemove()` | Iterates over the placed groups and removes those for which at least one road no longer exists in roadMgr. | 364 |

### Parameter details

#### `editor_roadArchitect_groups.addGroupToRoadsAudition(gIdx)`

Copies the roads of prefab group gIdx into roadMgr.roads for auditioning: roads centered on the origin, raised to the audition pose (+1000 m) and hidden. Recomputes the road map, and reframes the camera if already in group view.

- `gIdx` (*integer*) : Index of the group in groups.

#### `editor_roadArchitect_groups.addGroupToRoadsPlace(gIdx, isConformGroupToTerrain)`

Places prefab group gIdx in the session: copies its roads with unique UUID names (Engine.generateUUID), visible, registers a placed group (32-character name, node list) then deletes the hidden roads.

- `gIdx` (*integer*) : Index of the group in groups.
- `isConformGroupToTerrain` (*boolean*) : If true, the copied roads are conformed to the terrain.
- **returns**: string[] Names (UUIDs) of the added roads.

#### `editor_roadArchitect_groups.copyPlacedGroup(pg)`

Deep copy of a placed group, with the name converted from the imgui buffer to a string.

- `pg` (*table*) : Placed group { name = imgui buffer, list = {{r = road name, n = node index}} }.
- **returns**: table { name = string, list = table }.

#### `editor_roadArchitect_groups.createGroup(gPolygon, roads)`

Creates a placed group from the road nodes located inside a 2D polygon (the polygon is flattened to z = 0 in place). Junction roads and bridges are ignored. Creates nothing if no node is in the polygon; the group is named "New Group".

- `gPolygon` (*vec3[]*) : Polygon vertices; modified in place (z = 0).
- `roads` (*table[]*) : Roads to test.

#### `editor_roadArchitect_groups.createPrefabGroup(g)`

Turns a placed group into a prefab group: copies each concerned road (once) with a new UUID name and adds to groups an element named "User N".

- `g` (*table*) : Placed group (list field of {r, n}).

#### `editor_roadArchitect_groups.deserialiseGroup(gSer)`

Rebuilds a prefab group from a serialized group via roadMgr.deserialiseRoad.

- `gSer` (*table*) : Serialized group { name, roads }.
- **returns**: table Group { name, roads }.

#### `editor_roadArchitect_groups.getPlacedGroups()`

Returns the collection of placed groups of the session.

- **returns**: table[] Placed groups.

#### `editor_roadArchitect_groups.goToGroupView(gIdx, timer, time)`

Puts the camera in the group's audition view if not already there: stores the current camera pose, resets the timer and calls the pose update. Returns the adjusted time.

- `gIdx` (*integer*) : Index of the group to audition.
- `timer` (*table*) : Timer; calls timer:stopAndReset() on entering group view.
- `time` (*number*) : Current time; replaced by 0 on the first call.
- **returns**: number 0.0 if the view has just been activated, otherwise time unchanged.

#### `editor_roadArchitect_groups.goToPlacedGroup(idx)`

Puts the free camera directly above the placed group, looking down, at a height computed from the field of view to frame everything. Does nothing if the extent is less than 0.1 m in x and y.

- `idx` (*integer*) : Index of the placed group.

#### `editor_roadArchitect_groups.removePlacedGroupHard(groupIdx)`

Removes a placed group and deletes its roads, except those still belonging to another group. Then calls updateGroupsAfterRoadRemove.

- `groupIdx` (*integer*) : Index of the placed group.

#### `editor_roadArchitect_groups.removePlacedGroupSoft(groupIdx)`

Removes a placed group from the collection without touching the roads it contains.

- `groupIdx` (*integer*) : Index of the placed group.

#### `editor_roadArchitect_groups.save(idx)`

Opens a JSON save dialog and writes groups[idx] (serialized) to the chosen file, in the form { data = { group = ... } }.

- `idx` (*integer*) : Index of the group to save.

#### `editor_roadArchitect_groups.serialiseGroup(g)`

Serializes a prefab group into a { name, roads } table via roadMgr.serialiseRoad.

- `g` (*table*) : Prefab group { name, roads }.
- **returns**: table Serialized group, usable by jsonWriteFile.

#### `editor_roadArchitect_groups.setPlacedGroups(pg)`

Replaces the collection of placed groups.

- `pg` (*table[]*) : New collection.

## Fields

| Field | Type | Description |
|---|---|---|
| `groups` | table | Array of available prefab group templates, each element having the form { name = string, roads = table[] }. It is the same table as the one filled by getDefaultGroups, createPrefabGroup and load. |

## Calls into the engine (C++)

- `Engine.` `generateUUID`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/editor/roadArchitect/groups.lua`.*
