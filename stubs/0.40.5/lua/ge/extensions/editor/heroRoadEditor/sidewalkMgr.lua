---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Procedural sidewalks/curbs of a Hero Road Editor group. Thin layer on top of the shared sweep toolUtilities/walkRibbon: reads the actual banked edges of the mesh (meshEdgeL/R, meshEdgeDirL/R) and sweeps curb + paving along each enabled side (group.sidewalkLeft / sidewalkRight). During editing it is a transient ProceduralMesh 'HeroWalk_<id>'; the bake writes it to .dae and places a persistent TSStatic in its place.
--- Access: extension `editor_heroRoadEditor_sidewalkMgr`: `extensions.load("editor_heroRoadEditor_sidewalkMgr")`, then the global `editor_heroRoadEditor_sidewalkMgr`
---@class editor_heroRoadEditor_sidewalkMgr
editor_heroRoadEditor_sidewalkMgr = {}

--- Bake: writes the sidewalk to <dir>/HeroWalk_<id>.dae (centered on its own center) and places a persistent TSStatic (canSave=true) in its place, after deleting the procedural mesh that has the same name. On write failure, logs an error ('heroSidewalk') and the sidewalk disappears from this bake.
---Source: lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua:95
---@param group table Hero Road group.
---@param dir string Bake folder (created if it does not exist), with trailing slash.
---@return string[]  Manifest of the created scene object names (empty if nothing to bake); used to remove the static at unbake.
function editor_heroRoadEditor_sidewalkMgr.burnGroup(group, dir) end

--- Deletes the group's sidewalk mesh and forgets it.
---Source: lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua:61
---@param group table Hero Road group.
function editor_heroRoadEditor_sidewalkMgr.removeGroup(group) end

--- Number of triangles of the group's sidewalk, for the tool's count.
---Source: lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua:87
---@param group table|nil Hero Road group.
---@return integer  Number of triangles, 0 if no sidewalk.
function editor_heroRoadEditor_sidewalkMgr.tris(group) end

--- (Re)builds the group's sidewalks from the current mesh edge and the sidewalkLeft/sidewalkRight toggles. Called right after the mesh rebuild. Does nothing without a scene folder (sceneTreeFolderId); creates nothing if no triangle is produced.
---Source: lua/ge/extensions/editor/heroRoadEditor/sidewalkMgr.lua:70
---@param group table Hero Road group.
function editor_heroRoadEditor_sidewalkMgr.updateGroup(group) end

