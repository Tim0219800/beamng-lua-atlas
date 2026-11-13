---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshSpline/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_meshSpline_splineMgr` : `extensions.load("editor_meshSpline_splineMgr")`, puis la globale `editor_meshSpline_splineMgr`
---@class editor_meshSpline_splineMgr
editor_meshSpline_splineMgr = {}

--- Adds a new mesh spline.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:610
function editor_meshSpline_splineMgr.addNewMeshSpline() end

--- One-shot: drops the spline's control nodes onto the surface below (raycast). The build stays free in 3D, so this simply moves
---  the nodes down to the terrain/objects; run it again after terraforming to re-snap.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1246
---@param spline any
function editor_meshSpline_splineMgr.conformNodesToTerrain(spline) end

--- Converts the given paths (traced from a bitmap) to mesh splines.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1256
---@param paths any
function editor_meshSpline_splineMgr.convertPathsToMeshSplines(paths) end

--- Copies the profile of the given mesh spline.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1083
---@param spline any
function editor_meshSpline_splineMgr.copyMeshSplineProfile(spline) end

--- Deep copies the given mesh spline.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:707
---@param spline any
function editor_meshSpline_splineMgr.deepCopyMeshSpline(spline) end

--- Deep copies the full mesh spline state.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:719
function editor_meshSpline_splineMgr.deepCopyMeshSplineState() end

--- Deserializes a mesh spline. `data` is either the editor's buffer-encoded blob (string) or a plain table straight from a JSON
---  session file. On the JSON path the derived scratch tables are empty and node positions arrive as plain {x,y,z}, so guarantee
---  the tables exist and rehydrate them to vec3 before the first build.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1180
---@param data any
---@param isCreateObject any
function editor_meshSpline_splineMgr.deserializeMeshSpline(data, isCreateObject) end

--- Finds a live mesh spline by id (nil if not present).
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:672
---@param id any
function editor_meshSpline_splineMgr.findMeshSpline(id) end

--- Returns the current list of mesh splines.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1289
function editor_meshSpline_splineMgr.getCurrentMeshSplineList() end

--- Returns the default slider parameters.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:607
function editor_meshSpline_splineMgr.getDefaultSliderParams() end

--- Fetches the edit mode key.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:476
function editor_meshSpline_splineMgr.getEditModeKey() end

--- Fetches the mesh splines.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:479
function editor_meshSpline_splineMgr.getMeshSplines() end

--- Fetches the mesh spline map.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:482
function editor_meshSpline_splineMgr.getSplineMap() end

--- Fetches the tool prefix string.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:473
function editor_meshSpline_splineMgr.getToolPrefixStr() end

--- Returns true if the given mesh spline is linked, false otherwise.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1303
---@param id any
function editor_meshSpline_splineMgr.isLinked(id) end

--- Joins two unlooped Mesh Splines into one, modifying spline1 and deleting spline2.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:885
---@param splineIdx1 any
---@param nodeIdx1 any
---@param splineIdx2 any
---@param nodeIdx2 any
function editor_meshSpline_splineMgr.joinMeshSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2) end

--- Redo callback for object select operations.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1080
---@param data any
function editor_meshSpline_splineMgr.objectSelectRedo(data) end

--- Undo callback for object select operations.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1077
---@param data any
function editor_meshSpline_splineMgr.objectSelectUndo(data) end

--- Pastes the profile to the given mesh spline.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1098
---@param spline any
---@param profile any
function editor_meshSpline_splineMgr.pasteMeshSplineProfile(spline, profile) end

--- Handles the redo for preset selection (removes meshes before applying).
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1029
---@param meshSplineData any
function editor_meshSpline_splineMgr.presetSelectionRedo(meshSplineData) end

--- Handles the undo for preset selection (removes meshes before applying).
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1015
---@param meshSplineData any
function editor_meshSpline_splineMgr.presetSelectionUndo(meshSplineData) end

--- Recompute the spline id -> index map (called by the shared session helper after a load appends the loaded splines).
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1063
function editor_meshSpline_splineMgr.recomputeIdMap() end

--- Removes all mesh splines.
---  [If isIncludeDisabled is true, then all mesh splines will be removed, including disabled ones.]
---  [If isIncludeDisabled is false, then only enabled mesh splines will be removed.]
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:688
---@param isIncludeDisabled any
function editor_meshSpline_splineMgr.removeAllMeshSplines(isIncludeDisabled) end

--- Removes a linked mesh spline by ID (called from master spline layer removal).
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:678
---@param splineId any
function editor_meshSpline_splineMgr.removeLinkedMeshSpline(splineId) end

--- Removes the mesh spline with the given index.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:656
---@param idx any
function editor_meshSpline_splineMgr.removeMeshSpline(idx) end

--- Serializes a mesh spline to a table.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1158
---@param spline any
function editor_meshSpline_splineMgr.serializeMeshSpline(spline) end

--- Serialises a mesh spline to a portable plain table for a session file (see toolUtilities/session). Deep-copied through the
---  codec so the live spline is never mutated; derived geometry is emptied (rebuilt by the dirty pass) and the runtime scene
---  handle dropped.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1171
---@param spline any
function editor_meshSpline_splineMgr.serializeMeshSplineToTable(spline) end

--- Sets the given linked mesh spline to be linked or not.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1309
---@param id any
---@param groupId any
---@param isLink any
function editor_meshSpline_splineMgr.setLink(id, groupId, isLink) end

--- Sets the mesh spline with the given index.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:485
---@param spline any
---@param idx any
function editor_meshSpline_splineMgr.setMeshSpline(spline, idx) end

--- Sets the mesh splines (full table).
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:505
---@param splines any
function editor_meshSpline_splineMgr.setMeshSplines(splines) end

--- Sets the given spline to the given preset.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:512
---@param spline any
---@param presetStr any
function editor_meshSpline_splineMgr.setPreset(spline, presetStr) end

--- Handles the redo for a single mesh spline.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1007
---@param meshSplineData any
function editor_meshSpline_splineMgr.singleSplineEditRedo(meshSplineData) end

--- Handles the undo for a single mesh spline.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:999
---@param meshSplineData any
function editor_meshSpline_splineMgr.singleSplineEditUndo(meshSplineData) end

--- Splits the selected mesh spline into two, at the selected node.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:728
---@param selectedSplineIdx any
---@param selectedNodeIdx any
function editor_meshSpline_splineMgr.splitMeshSpline(selectedSplineIdx, selectedNodeIdx) end

--- Handles the redo for trans-meshspline edits.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1053
---@param data any
function editor_meshSpline_splineMgr.transSplineEditRedo(data) end

--- Handles the undo for trans-meshspline edits.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1043
---@param data any
function editor_meshSpline_splineMgr.transSplineEditUndo(data) end

--- Unlinks all mesh splines.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1347
function editor_meshSpline_splineMgr.unlinkAll() end

--- Updates the geometry and meshes of any dirty mesh splines.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1218
function editor_meshSpline_splineMgr.updateDirtyMeshSplines() end

--- Updates the given linked mesh spline with the given geometry.
---Source : lua/ge/extensions/editor/meshSpline/splineMgr.lua:1324
---@param id any
---@param points any
---@param widths any
---@param nmls any
---@param isLoop any
---@param isConformToTerrain any
function editor_meshSpline_splineMgr.updateLinkedMeshSpline(id, points, widths, nmls, isLoop, isConformToTerrain) end

