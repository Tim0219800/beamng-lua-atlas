---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_assemblySpline_splineMgr` : `extensions.load("editor_assemblySpline_splineMgr")`, puis la globale `editor_assemblySpline_splineMgr`
---@class editor_assemblySpline_splineMgr
editor_assemblySpline_splineMgr = {}

--- Adds a new assembly spline.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:174
function editor_assemblySpline_splineMgr.addNewAssemblySpline() end

--- One-shot: drops the spline's control nodes onto the surface below (raycast). The build stays free in 3D, so this simply moves
---  the nodes down to the terrain/objects; run it again after terraforming to re-snap.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:702
---@param spline any
function editor_assemblySpline_splineMgr.conformNodesToTerrain(spline) end

--- Converts the given paths (traced from a bitmap) to assembly splines.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:712
---@param paths any
function editor_assemblySpline_splineMgr.convertPathsToAssemblySplines(paths) end

--- Copies the profile of the given assembly spline.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:554
---@param spline any
function editor_assemblySpline_splineMgr.copyAssemblySplineProfile(spline) end

--- Deep copies the given assembly spline.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:304
---@param spline any
function editor_assemblySpline_splineMgr.deepCopyAssemblySpline(spline) end

--- Deep copies the full assembly spline state.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:316
function editor_assemblySpline_splineMgr.deepCopyAssemblySplineState() end

--- Deserializes an assembly spline. `data` is either the editor's buffer-encoded blob (string) or a plain table straight from a
---  JSON session file. On the JSON path the derived scratch tables are empty and node positions arrive as plain {x,y,z}, so
---  guarantee the tables exist and rehydrate them to vec3 before the first build.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:624
---@param data any
---@param isCreateObject any
function editor_assemblySpline_splineMgr.deserializeAssemblySpline(data, isCreateObject) end

--- Finds a live assembly spline by id (nil if not present).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:269
---@param id any
function editor_assemblySpline_splineMgr.findAssemblySpline(id) end

--- Fetches the assembly splines.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:94
function editor_assemblySpline_splineMgr.getAssemblySplines() end

--- Returns the current list of assembly splines.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:744
function editor_assemblySpline_splineMgr.getCurrentAssemblySplineList() end

--- Returns the default slider parameters (from the wooden fence preset).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:127
function editor_assemblySpline_splineMgr.getDefaultSliderParams() end

--- Fetches the edit mode key.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:91
function editor_assemblySpline_splineMgr.getEditModeKey() end

--- Fetches the assembly spline map.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:97
function editor_assemblySpline_splineMgr.getSplineMap() end

--- Fetches the tool prefix string.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:88
function editor_assemblySpline_splineMgr.getToolPrefixStr() end

--- Returns true if the given assembly spline is linked, false otherwise.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:758
---@param id any
function editor_assemblySpline_splineMgr.isLinked(id) end

--- Joins two unlooped Assembly Splines into one, modifying spline1 and deleting spline2.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:414
---@param splineIdx1 any
---@param nodeIdx1 any
---@param splineIdx2 any
---@param nodeIdx2 any
function editor_assemblySpline_splineMgr.joinAssemblySplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2) end

--- Redo callback for object select operations.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:551
---@param data any
function editor_assemblySpline_splineMgr.objectSelectRedo(data) end

--- Undo callback for object select operations.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:548
---@param data any
function editor_assemblySpline_splineMgr.objectSelectUndo(data) end

--- Pastes the profile to the given assembly spline.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:578
---@param spline any
---@param profile any
function editor_assemblySpline_splineMgr.pasteAssemblySplineProfile(spline, profile) end

--- Recompute the spline id -> index map (called by the shared session helper after a load appends the loaded splines).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:659
function editor_assemblySpline_splineMgr.recomputeIdMap() end

--- Removes all assembly splines.
---  [If isIncludeDisabled is true, then all assembly splines will be removed, including disabled ones.]
---  [If isIncludeDisabled is false, then only enabled assembly splines will be removed.]
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:285
---@param isIncludeDisabled any
function editor_assemblySpline_splineMgr.removeAllAssemblySplines(isIncludeDisabled) end

--- Removes the assembly spline with the given index.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:253
---@param idx any
function editor_assemblySpline_splineMgr.removeAssemblySpline(idx) end

--- Removes a linked assembly spline by ID (called from master spline layer removal).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:275
---@param splineId any
function editor_assemblySpline_splineMgr.removeLinkedAssemblySpline(splineId) end

--- Serializes an assembly spline to a table.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:603
---@param spline any
function editor_assemblySpline_splineMgr.serializeAssemblySpline(spline) end

--- Serialises an assembly spline to a portable plain table for a session file (see toolUtilities/session): derived geometry
---  emptied (rebuilt by the dirty pass), runtime scene handle dropped, live spline never mutated.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:615
---@param spline any
function editor_assemblySpline_splineMgr.serializeAssemblySplineToTable(spline) end

--- Sets the assembly spline with the given index.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:100
---@param spline any
---@param idx any
function editor_assemblySpline_splineMgr.setAssemblySpline(spline, idx) end

--- Sets the assembly splines (full table).
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:120
---@param splines any
function editor_assemblySpline_splineMgr.setAssemblySplines(splines) end

--- Sets the given linked assembly spline to be linked or not.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:764
---@param id any
---@param groupId any
---@param isLink any
function editor_assemblySpline_splineMgr.setLink(id, groupId, isLink) end

--- Sets the given spline to the given preset.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:142
---@param spline any
---@param presetStr any
function editor_assemblySpline_splineMgr.setPreset(spline, presetStr) end

--- Handles the redo for a single assembly spline.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:505
---@param assemblySplineData any
function editor_assemblySpline_splineMgr.singleSplineEditRedo(assemblySplineData) end

--- Handles the undo for a single assembly spline.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:497
---@param assemblySplineData any
function editor_assemblySpline_splineMgr.singleSplineEditUndo(assemblySplineData) end

--- Splits the selected assembly spline into two, at the selected node.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:325
---@param selectedSplineIdx any
---@param selectedNodeIdx any
function editor_assemblySpline_splineMgr.splitAssemblySpline(selectedSplineIdx, selectedNodeIdx) end

--- Handles the redo for trans assembly spline edits.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:525
---@param data any
function editor_assemblySpline_splineMgr.transSplineEditRedo(data) end

--- Handles the undo for trans assembly spline edits.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:513
---@param data any
function editor_assemblySpline_splineMgr.transSplineEditUndo(data) end

--- Unlinks all assembly splines.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:802
function editor_assemblySpline_splineMgr.unlinkAll() end

--- Updates the geometry and meshes of any dirty assembly splines.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:662
function editor_assemblySpline_splineMgr.updateDirtyAssemblySplines() end

--- Updates the given linked assembly spline with the given geometry.
---Source : lua/ge/extensions/editor/assemblySpline/splineMgr.lua:779
---@param id any
---@param points any
---@param widths any
---@param nmls any
---@param isLoop any
---@param isConformToTerrain any
function editor_assemblySpline_splineMgr.updateLinkedAssemblySpline(id, points, widths, nmls, isLoop, isConformToTerrain) end

