---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Baking to DAE files and management of the Edit/Live state of a Hero Road Editor group. The bake writes the group's driving mesh to <level>/art/heroRoad/heroRoad_<id>/heroRoad_<id>_NNN.dae, then puts the group in the disabled (Live) state, where a persistent TSStatic (canSave=true) replaces the editable ProceduralMesh. It also "burns" sidewalks and furniture (sidewalkMgr, barrierMgr) and makes the decals persistent (layerMgr).
--- Access: extension `editor_heroRoadEditor_exportMgr`: `extensions.load("editor_heroRoadEditor_exportMgr")`, then the global `editor_heroRoadEditor_exportMgr`
---@class editor_heroRoadEditor_exportMgr
editor_heroRoadEditor_exportMgr = {}

--- Reconciles the group's mesh with its Edit/Live state. Edit: deletes the baked static and the burned pieces, makes decals and folder transient, marks the group dirty (rebuild). Live: deletes the procedural surface and the preview, makes the baked static appear, makes decals and folder persistent, and reloads the collision (be:reloadCollision). If a Live group has no valid bake (or if the .dae files have disappeared), it goes back to Edit. This is also the level save separation: only a Live road is written.
---Source: lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua:126
---@param group table Hero Road group (isEnabled, bakedManifest, sceneTreeFolderId...).
function editor_heroRoadEditor_exportMgr.applyState(group) end

--- Bakes the group: generates the chunks with LODs and collision mesh (mesh.buildChunkLODs), empties the bake folder, writes the DAEs (daeExport.writeDaeLODs), burns sidewalks and furniture, sets group.isEnabled=false then calls applyState.
---Source: lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua:179
---@param group table Hero Road group with at least 2 nodes.
---@return boolean  true if the bake succeeded.
---@return string  Result or error message (e.g. 'need at least 2 nodes', 'no level loaded...', 'mesh has no geometry', 'write failed: <path>').
function editor_heroRoadEditor_exportMgr.bakeGroup(group) end

--- Indicates whether the group has a bake (final state displayable in disabled mode): terrainFinalized for a terrain road, otherwise a non-empty bakedManifest.
---Source: lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua:91
---@param group table Hero Road group.
---@return boolean  true if a bake exists.
function editor_heroRoadEditor_exportMgr.hasBaked(group) end

--- Cancels the bake: the only way to leave the Live state. Sets isEnabled=true, calls applyState, then clears bakedManifest and terrainFinalized. The DAE files are only deleted at the next bake (wipeFolder).
---Source: lua/ge/extensions/editor/heroRoadEditor/exportMgr.lua:233
---@param group table Hero Road group.
function editor_heroRoadEditor_exportMgr.unbakeGroup(group) end

