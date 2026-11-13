---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/groups.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadArchitect_groups` : `extensions.load("editor_roadArchitect_groups")`, puis la globale `editor_roadArchitect_groups`
---@class editor_roadArchitect_groups
---@field groups table
editor_roadArchitect_groups = {}

--- Adds a prefab group to the roads container, so it will be rendered for the purpose of auditioning.
---  [Roads will be elevated to the audition pose and remain hidden in the roads array].
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:117
---@param gIdx any
function editor_roadArchitect_groups.addGroupToRoadsAudition(gIdx) end

--- Adds a group template to the session (adds all the group roads to roads list).
---  [The user has chosen this group, so the roads will not be elevated to the audition pose and will not be hidden].
---  [Unique name ids will be given to each profile and road in the group].
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:158
---@param gIdx any
---@param isConformGroupToTerrain any
function editor_roadArchitect_groups.addGroupToRoadsPlace(gIdx, isConformGroupToTerrain) end

--- Deep copies the given placed group.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:240
---@param pg any
function editor_roadArchitect_groups.copyPlacedGroup(pg) end

--- Identifies group (from given polygon) and creates a new prefab group.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:207
---@param gPolygon any
---@param roads any
function editor_roadArchitect_groups.createGroup(gPolygon, roads) end

--- Turns the given placed group to a saved prefab group.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:247
---@param g any
function editor_roadArchitect_groups.createPrefabGroup(g) end

--- De-serialises a prefab group.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:315
---@param gSer any
function editor_roadArchitect_groups.deserialiseGroup(gSer) end

--- Populates the collection of default prefab groups, from the corresponding data files.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:351
function editor_roadArchitect_groups.getDefaultGroups() end

--- Gets the collection of placed groups.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:380
function editor_roadArchitect_groups.getPlacedGroups() end

--- Moves the camera to the prefab group preview pose.
---  [Also adjusts the timing parameters respectively].
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:105
---@param gIdx any
---@param timer any
---@param time any
function editor_roadArchitect_groups.goToGroupView(gIdx, timer, time) end

--- Returns the camera to the stored old view.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:297
function editor_roadArchitect_groups.goToOldView() end

--- Moves the camera above the placed group with the given index.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:405
---@param idx any
function editor_roadArchitect_groups.goToPlacedGroup(idx) end

--- Loads a collection of current prefab groups from disk.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:338
function editor_roadArchitect_groups.load() end

--- Manages the rotation of the audition camera.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:198
function editor_roadArchitect_groups.manageRotateCam() end

--- Removes a placed group from the placed group collection, including the roads inside it.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:389
---@param groupIdx any
function editor_roadArchitect_groups.removePlacedGroupHard(groupIdx) end

--- Removes a placed group from the placed group collection, but not the roads inside it.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:386
---@param groupIdx any
function editor_roadArchitect_groups.removePlacedGroupSoft(groupIdx) end

--- Saves the collection of current prefab groups to disk.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:325
---@param idx any
function editor_roadArchitect_groups.save(idx) end

--- Serialises a prefab group.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:305
---@param g any
function editor_roadArchitect_groups.serialiseGroup(g) end

--- Sets the collection of placed groups.
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:383
---@param pg any
function editor_roadArchitect_groups.setPlacedGroups(pg) end

--- Updates the placed groups list (called after a road has been removed).
---Source : lua/ge/extensions/editor/roadArchitect/groups.lua:364
function editor_roadArchitect_groups.updateGroupsAfterRoadRemove() end

