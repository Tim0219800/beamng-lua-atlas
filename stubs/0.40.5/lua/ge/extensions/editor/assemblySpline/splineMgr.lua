---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data manager of the Assembly Spline tool: holds the list of assembly splines (assemblySplines) and the id -> index table (splineMap), creates/deletes/splits/joins splines, applies kit presets (Wooden Fence, Telegraph Pole, Metal Crash Barrier), handles profile copy/paste, serialization, undo/redo callbacks, links with the Master Spline tool and the update of "dirty" splines (geometry recomputation then repopulation with meshes via populate). Each spline is a table (name, id, nodes, widths, nmls, divPoints, spacing, verticalOffset, normalMode, sag, preRot, jitter*, splineRandomSeed, kitFolderPath, meshKit, moleculeDescription, isEnabled, isDirty, isLink, linkId, sceneTreeFolderId...) and each spline has a SimGroup in MissionGroup (cansave = false until baked).
--- Access: extension `editor_assemblySpline_splineMgr`: `extensions.load("editor_assemblySpline_splineMgr")`, then the global `editor_assemblySpline_splineMgr`
---@class editor_assemblySpline_splineMgr
editor_assemblySpline_splineMgr = {}

--- Adds an empty spline (unique name "Assembly Spline N", UUID, SimGroup) with the default Wooden Fence kit. If the kit fails to load, a warning is logged and the kit is empty. Updates splineMap.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:174
function editor_assemblySpline_splineMgr.addNewAssemblySpline() end

--- Once places the control nodes on the surface below (vertical raycast) then marks the spline dirty. To be rerun after terraforming.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:702
---@param spline table Spline.
function editor_assemblySpline_splineMgr.conformNodesToTerrain(spline) end

--- Converts paths drawn from a bitmap into assembly splines: grid coordinates -> world via the terrain editor, terrain normals for each node. Requires editor_terrainEditor.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:712
---@param paths table[] List of {points = {{x,y}}, widths}.
function editor_assemblySpline_splineMgr.convertPathsToAssemblySplines(paths) end

--- Copies the profile of a spline: deep copy without identity, nodes, widths, normals or derived geometry (what remains: parameters, kit, molecule, enabled states).
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:554
---@param spline table Spline.
---@return table  Profile.
function editor_assemblySpline_splineMgr.copyAssemblySplineProfile(spline) end

--- Deep copy of a spline (string.buffer encode/decode), clearing the derived secondary geometry (divPoints, divWidths, tangents, binormals, normals, discMap).
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:304
---@param spline table Spline.
---@return table  Copy.
function editor_assemblySpline_splineMgr.deepCopyAssemblySpline(spline) end

--- Deep copy of all splines (for the undo history).
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:316
---@return table[]  Copies.
function editor_assemblySpline_splineMgr.deepCopyAssemblySplineState() end

--- Deserializes a spline from an encoded blob (string) or a session JSON table. On the JSON path, ensures the derived tables exist and rehydrates positions as vec3 before the first build.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:624
---@param data string|table Blob or table.
---@param isCreateObject boolean Create the spline's scene SimGroup (inferred from code).
---@return table  Spline.
function editor_assemblySpline_splineMgr.deserializeAssemblySpline(data, isCreateObject) end

--- Finds a live spline by id.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:269
---@param id string Spline id (UUID).
---@return table|nil  Spline or nil.
function editor_assemblySpline_splineMgr.findAssemblySpline(id) end

--- Returns the live table of assembly splines (not copied).
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:94
---@return table[]  Splines.
function editor_assemblySpline_splineMgr.getAssemblySplines() end

--- List of enabled splines as {name, id, type = 'Assembly Spline'} (for the Master Spline tool).
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:744
---@return table[]  Entries.
function editor_assemblySpline_splineMgr.getCurrentAssemblySplineList() end

--- Returns the default slider parameters (those of the Wooden Fence preset): spacing, verticalOffset, normalMode, sag, preRot, jitterForward/Right/Up, splineRandomSeed.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:127
---@return table  Parameters.
function editor_assemblySpline_splineMgr.getDefaultSliderParams() end

--- Returns the edit mode key ('assemblySplineEditMode').
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:91
---@return string  Key.
function editor_assemblySpline_splineMgr.getEditModeKey() end

--- Returns the id -> index table of the splines.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:97
---@return table<string, integer>  splineMap.
function editor_assemblySpline_splineMgr.getSplineMap() end

--- Returns the global prefix of the tool ('Assembly Spline').
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:88
---@return string  Prefix.
function editor_assemblySpline_splineMgr.getToolPrefixStr() end

--- Indicates whether the spline with the given id is linked to a Master Spline.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:758
---@param id string Id.
---@return boolean  true if linked.
function editor_assemblySpline_splineMgr.isLinked(id) end

--- Joins two open splines into one (spline1 modified, spline2 deleted) according to the given end nodes (geom.joinSplineGeometry). Does nothing if the splines or the join case are invalid.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:414
---@param splineIdx1 integer First spline.
---@param nodeIdx1 integer Node of the first.
---@param splineIdx2 integer Second spline.
---@param nodeIdx2 integer Node of the second.
function editor_assemblySpline_splineMgr.joinAssemblySplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2) end

--- Redo callback for an object selection (applies data.new).
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:551
---@param data table {old, new}.
function editor_assemblySpline_splineMgr.objectSelectRedo(data) end

--- Undo callback for an object selection operation (restores data.old).
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:548
---@param data table {old, new}.
function editor_assemblySpline_splineMgr.objectSelectUndo(data) end

--- Applies a copied profile to a spline: first deletes its meshes, copies parameters/kit/molecule/enabled states, then marks it dirty.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:578
---@param spline table Target spline.
---@param profile table Profile from copyAssemblySplineProfile.
function editor_assemblySpline_splineMgr.pasteAssemblySplineProfile(spline, profile) end

--- Recomputes the id -> index table (called by the session helper after a load).
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:659
function editor_assemblySpline_splineMgr.recomputeIdMap() end

--- Deletes all splines if isIncludeDisabled is true; otherwise only those that are enabled and not linked.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:285
---@param isIncludeDisabled boolean Include disabled (locked) and linked ones.
function editor_assemblySpline_splineMgr.removeAllAssemblySplines(isIncludeDisabled) end

--- Deletes the spline at the given index: its meshes (pop.tryRemove), its SimGroup, then removes it from the list and updates splineMap.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:253
---@param idx integer Index.
function editor_assemblySpline_splineMgr.removeAssemblySpline(idx) end

--- Deletes a linked spline by id (called when a Master Spline layer is deleted).
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:275
---@param splineId string Spline id.
function editor_assemblySpline_splineMgr.removeLinkedAssemblySpline(splineId) end

--- Serializes a spline into an encoded blob (string.buffer) for editor persistence (see onSerialize).
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:603
---@param spline table Spline.
---@return string  Encoded data.
function editor_assemblySpline_splineMgr.serializeAssemblySpline(spline) end

--- Serializes a spline into a simple portable table for a session file (toolUtilities/session): derived geometry cleared, scene handle removed, live spline unmodified.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:615
---@param spline table Spline.
---@return table  JSON-serializable table.
function editor_assemblySpline_splineMgr.serializeAssemblySplineToTable(spline) end

--- Places a spline at the given index, creates a SimGroup for it in MissionGroup if needed (unique name + UUID, cansave = false) and marks it dirty.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:100
---@param spline table Spline.
---@param idx integer Index.
function editor_assemblySpline_splineMgr.setAssemblySpline(spline, idx) end

--- Applies setAssemblySpline to each element of the list.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:120
---@param splines table[] Splines.
function editor_assemblySpline_splineMgr.setAssemblySplines(splines) end

--- Links or unlinks a spline (isLink, linkId = groupId), deletes its meshes and marks it dirty.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:764
---@param id string Spline id.
---@param groupId string|nil Id of the link group.
---@param isLink boolean true to link.
function editor_assemblySpline_splineMgr.setLink(id, groupId, isLink) end

--- Applies a preset to the spline: deletes its meshes, reloads the kit (mol.getAssemblyKit), rebuilds the molecule and copies the preset parameters, then marks the spline dirty. Unknown key: only marked dirty.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:142
---@param spline table Spline.
---@param presetStr string 'wooden_fence', 'telegraph_pole' or 'metal_crash_barrier'.
function editor_assemblySpline_splineMgr.setPreset(spline, presetStr) end

--- Redo callback for an edit of a single spline.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:505
---@param assemblySplineData table History action data.
function editor_assemblySpline_splineMgr.singleSplineEditRedo(assemblySplineData) end

--- Undo callback for an edit of a single spline.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:497
---@param assemblySplineData table History action data.
function editor_assemblySpline_splineMgr.singleSplineEditUndo(assemblySplineData) end

--- Splits the selected spline in two at the selected node. Does nothing if the spline is invalid.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:325
---@param selectedSplineIdx integer Spline index.
---@param selectedNodeIdx integer Index of the split node.
function editor_assemblySpline_splineMgr.splitAssemblySpline(selectedSplineIdx, selectedNodeIdx) end

--- Redo callback for a cross-spline edit.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:525
---@param data table History action data.
function editor_assemblySpline_splineMgr.transSplineEditRedo(data) end

--- Undo callback for a cross-spline edit (full state of the splines).
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:513
---@param data table History action data.
function editor_assemblySpline_splineMgr.transSplineEditUndo(data) end

--- Unlinks all splines and marks them dirty.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:802
function editor_assemblySpline_splineMgr.unlinkAll() end

--- For each dirty spline: recomputes the geometry (Catmull-Rom with raycast if isConformToTerrain, otherwise free in 3D), repopulates with meshes (pop.populateAssemblySpline) and updates roadLength. Below 2 nodes, deletes the meshes. Called every frame by onEditorGui.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:662
function editor_assemblySpline_splineMgr.updateDirtyAssemblySplines() end

--- Updates the geometry of a linked spline from the master (nodes, widths, normals, loop, terrain conformity); below 2 points, clears the derived geometry and deletes the meshes; marks dirty.
---Source: lua/ge/extensions/editor/assemblySpline/splineMgr.lua:779
---@param id string Id.
---@param points vec3[] Nodes.
---@param widths number[] Widths.
---@param nmls vec3[] Normals.
---@param isLoop boolean Closed spline.
---@param isConformToTerrain boolean Follow the terrain.
function editor_assemblySpline_splineMgr.updateLinkedAssemblySpline(id, points, widths, nmls, isLoop, isConformToTerrain) end

