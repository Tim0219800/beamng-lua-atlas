---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/treeSpline/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_treeSpline_splineMgr` : `extensions.load("editor_treeSpline_splineMgr")`, puis la globale `editor_treeSpline_splineMgr`
---@class editor_treeSpline_splineMgr
editor_treeSpline_splineMgr = {}

--- Adds a new (empty) tree spline; the user then clicks on the terrain to place its nodes.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:83
function editor_treeSpline_splineMgr.addNewTreeSpline() end

--- Profile copy/paste (foliage params only; splineInput needs these callbacks). Geometry is left untouched.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:259
---@param spline any
function editor_treeSpline_splineMgr.copyTreeSplineProfile(spline) end

--- Deep copies a single tree spline (geometry + runtime handles stripped: they rebuild from nodes/params).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:142
---@param spline any
function editor_treeSpline_splineMgr.deepCopyTreeSpline(spline) end

--- Deep copies the whole tree spline list (for trans-spline undo/redo).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:162
function editor_treeSpline_splineMgr.deepCopyTreeSplineState() end

--- `data` is either the editor's buffer-encoded blob (string) or a plain table straight from a JSON session file. Either way the
---  derived scratch/scatter tables are (re)initialised; on the JSON path node positions arrive as plain {x,y,z} so rehydrate them.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:296
---@param data any
function editor_treeSpline_splineMgr.deserializeTreeSpline(data) end

--- Returns the current list of tree splines (for Master Spline linking; each entry carries the type prefix).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:364
function editor_treeSpline_splineMgr.getCurrentTreeSplineList() end

--- Fetches the edit mode key.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:49
function editor_treeSpline_splineMgr.getEditModeKey() end

--- Numeric distribution defaults for a fresh tree spline (no scenetree access, safe to read at module load).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:58
function editor_treeSpline_splineMgr.getFoliageParamDefaults() end

--- Returns the id -> index map.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:55
function editor_treeSpline_splineMgr.getSplineMap() end

--- Full-state snapshot as plain data (all splines) for onSerialize.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:317
function editor_treeSpline_splineMgr.getState() end

--- Fetches the tool prefix string.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:46
function editor_treeSpline_splineMgr.getToolPrefixStr() end

--- Returns the list of tree splines.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:52
function editor_treeSpline_splineMgr.getTreeSplines() end

--- Returns true if the given tree spline is linked, false otherwise.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:377
---@param id any
function editor_treeSpline_splineMgr.isLinked(id) end

--- Builds the default foliage distribution for a fresh tree spline (a single ticked species so it plants).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:72
function editor_treeSpline_splineMgr.makeFoliageDefaults() end

---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:265
---@param spline any
---@param profile any
function editor_treeSpline_splineMgr.pasteTreeSplineProfile(spline, profile) end

--- Recompute the spline id -> index map (called by the shared session helper after a load appends the loaded splines).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:314
function editor_treeSpline_splineMgr.recomputeIdMap() end

--- Removes all tree splines and their planted instances.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:131
---@param isIncludeDisabled any
function editor_treeSpline_splineMgr.removeAllTreeSplines(isIncludeDisabled) end

--- Removes a linked tree spline by id (called from Master Spline layer removal).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:414
---@param splineId any
function editor_treeSpline_splineMgr.removeLinkedTreeSpline(splineId) end

--- Removes the tree spline (and its planted instances) at the given index.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:122
---@param idx any
function editor_treeSpline_splineMgr.removeTreeSpline(idx) end

--- Serialize / deserialize (session hot-reload persistence via the tool's onSerialize/onDeserialized).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:274
---@param spline any
function editor_treeSpline_splineMgr.serializeTreeSpline(spline) end

--- Portable plain table for a session file (see toolUtilities/session). serializeTreeSpline already whitelists just the primary
---  fields (no derived geometry / runtime handles), so decode its blob to a plain table; jsonWriteFile flattens the vec3 nodes.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:290
---@param spline any
function editor_treeSpline_splineMgr.serializeTreeSplineToTable(spline) end

--- Sets the given tree spline to be linked (or not) to a Master Spline group.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:383
---@param id any
---@param groupId any
---@param isLink any
function editor_treeSpline_splineMgr.setLink(id, groupId, isLink) end

--- Restores the whole tree spline list from a plain snapshot (flags all dirty so they re-scatter).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:324
---@param state any
function editor_treeSpline_splineMgr.setState(state) end

--- Replaces a single tree spline record (used by the object-select undo path in splineInput).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:203
---@param spline any
---@param idx any
function editor_treeSpline_splineMgr.setTreeSpline(spline, idx) end

--- Replaces the whole tree spline list (used by trans-spline undo/redo).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:215
---@param splines any
function editor_treeSpline_splineMgr.setTreeSplines(splines) end

---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:244
---@param splineData any
function editor_treeSpline_splineMgr.singleSplineEditRedo(splineData) end

--- Undo/redo for a single tree spline edit.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:243
---@param splineData any
function editor_treeSpline_splineMgr.singleSplineEditUndo(splineData) end

--- Splits the selected tree spline into two at the selected node (open splines), or unwraps a loop in place.
---  Both halves inherit the source's foliage params + conform setting. Returns the new selected index.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:180
---@param selIdx any
---@param nodeIdx any
function editor_treeSpline_splineMgr.splitTreeSpline(selIdx, nodeIdx) end

---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:252
---@param data any
function editor_treeSpline_splineMgr.transSplineEditRedo(data) end

--- Undo/redo for trans-spline edits (add / remove / reorder across the whole list).
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:247
---@param data any
function editor_treeSpline_splineMgr.transSplineEditUndo(data) end

--- Unlinks all tree splines.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:422
function editor_treeSpline_splineMgr.unlinkAll() end

--- Rebuilds geometry and re-plants any dirty tree splines. Safe to call every frame.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:332
function editor_treeSpline_splineMgr.updateDirtyTreeSplines() end

--- Updates the given linked tree spline with the geometry pushed from the Master Spline. Tree rows always drape onto the surface
---  (2D on terrain, like roadSpline), so the master's conform flag is intentionally ignored.
---Source : lua/ge/extensions/editor/treeSpline/splineMgr.lua:395
---@param id any
---@param points any
---@param widths any
---@param nmls any
---@param isLoop any
---@param isConformToTerrain any
function editor_treeSpline_splineMgr.updateLinkedTreeSpline(id, points, widths, nmls, isLoop, isConformToTerrain) end

