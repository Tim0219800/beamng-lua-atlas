---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/groups.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Road Architect group management (GE editor). Two notions coexist: prefab groups (reusable road templates, such as intersections or roundabouts, loaded from JSON files or created by the user) and placed groups (sets of road nodes already present in the session). The module can audition a prefab (rotating camera at 1000 m altitude), place it in the session, create a group from a polygon, serialize, save, load and move the camera to a group.
--- Access: extension `editor_roadArchitect_groups`: `extensions.load("editor_roadArchitect_groups")`, then the global `editor_roadArchitect_groups`
---@class editor_roadArchitect_groups
---@field groups table Array of available prefab group templates, each element having the form { name = string, roads = table[] }. It is the same table as the one filled by getDefaultGroups, createPrefabGroup and load.
editor_roadArchitect_groups = {}

--- Copies the roads of prefab group gIdx into roadMgr.roads for auditioning: roads centered on the origin, raised to the audition pose (+1000 m) and hidden. Recomputes the road map, and reframes the camera if already in group view.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:117
---@param gIdx integer Index of the group in groups.
function editor_roadArchitect_groups.addGroupToRoadsAudition(gIdx) end

--- Places prefab group gIdx in the session: copies its roads with unique UUID names (Engine.generateUUID), visible, registers a placed group (32-character name, node list) then deletes the hidden roads.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:158
---@param gIdx integer Index of the group in groups.
---@param isConformGroupToTerrain boolean If true, the copied roads are conformed to the terrain.
---@return string[]  Names (UUIDs) of the added roads.
function editor_roadArchitect_groups.addGroupToRoadsPlace(gIdx, isConformGroupToTerrain) end

--- Deep copy of a placed group, with the name converted from the imgui buffer to a string.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:240
---@param pg table Placed group { name = imgui buffer, list = {{r = road name, n = node index}} }.
---@return table  { name = string, list = table }.
function editor_roadArchitect_groups.copyPlacedGroup(pg) end

--- Creates a placed group from the road nodes located inside a 2D polygon (the polygon is flattened to z = 0 in place). Junction roads and bridges are ignored. Creates nothing if no node is in the polygon; the group is named "New Group".
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:207
---@param gPolygon vec3[] Polygon vertices; modified in place (z = 0).
---@param roads table[] Roads to test.
function editor_roadArchitect_groups.createGroup(gPolygon, roads) end

--- Turns a placed group into a prefab group: copies each concerned road (once) with a new UUID name and adds to groups an element named "User N".
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:247
---@param g table Placed group (list field of {r, n}).
function editor_roadArchitect_groups.createPrefabGroup(g) end

--- Rebuilds a prefab group from a serialized group via roadMgr.deserialiseRoad.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:315
---@param gSer table Serialized group { name, roads }.
---@return table  Group { name, roads }.
function editor_roadArchitect_groups.deserialiseGroup(gSer) end

--- Loads the 12 default prefab groups from the roadArchitect/groups/ JSON files. Does nothing if groups is not empty.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:351
function editor_roadArchitect_groups.getDefaultGroups() end

--- Returns the collection of placed groups of the session.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:380
---@return table[]  Placed groups.
function editor_roadArchitect_groups.getPlacedGroups() end

--- Puts the camera in the group's audition view if not already there: stores the current camera pose, resets the timer and calls the pose update. Returns the adjusted time.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:105
---@param gIdx integer Index of the group to audition.
---@param timer table Timer; calls timer:stopAndReset() on entering group view.
---@param time number Current time; replaced by 0 on the first call.
---@return number  0.0 if the view has just been activated, otherwise time unchanged.
function editor_roadArchitect_groups.goToGroupView(gIdx, timer, time) end

--- Returns the camera to the pose stored before group view and leaves the group view state.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:297
function editor_roadArchitect_groups.goToOldView() end

--- Puts the free camera directly above the placed group, looking down, at a height computed from the field of view to frame everything. Does nothing if the extent is less than 0.1 m in x and y.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:405
---@param idx integer Index of the placed group.
function editor_roadArchitect_groups.goToPlacedGroup(idx) end

--- Opens a JSON open dialog, reads the group (data.group), deserializes it and adds it to groups via importGroup.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:338
function editor_roadArchitect_groups.load() end

--- Rotates the audition camera by a step of pi/500 around the audition center (called every frame by the UI).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:198
function editor_roadArchitect_groups.manageRotateCam() end

--- Removes a placed group and deletes its roads, except those still belonging to another group. Then calls updateGroupsAfterRoadRemove.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:389
---@param groupIdx integer Index of the placed group.
function editor_roadArchitect_groups.removePlacedGroupHard(groupIdx) end

--- Removes a placed group from the collection without touching the roads it contains.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:386
---@param groupIdx integer Index of the placed group.
function editor_roadArchitect_groups.removePlacedGroupSoft(groupIdx) end

--- Opens a JSON save dialog and writes groups[idx] (serialized) to the chosen file, in the form { data = { group = ... } }.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:325
---@param idx integer Index of the group to save.
function editor_roadArchitect_groups.save(idx) end

--- Serializes a prefab group into a { name, roads } table via roadMgr.serialiseRoad.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:305
---@param g table Prefab group { name, roads }.
---@return table  Serialized group, usable by jsonWriteFile.
function editor_roadArchitect_groups.serialiseGroup(g) end

--- Replaces the collection of placed groups.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:383
---@param pg table[] New collection.
function editor_roadArchitect_groups.setPlacedGroups(pg) end

--- Iterates over the placed groups and removes those for which at least one road no longer exists in roadMgr.
---Source: lua/ge/extensions/editor/roadArchitect/groups.lua:364
function editor_roadArchitect_groups.updateGroupsAfterRoadRemove() end

