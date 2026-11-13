---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/decalSpline/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_decalSpline_splineMgr` : `extensions.load("editor_decalSpline_splineMgr")`, puis la globale `editor_decalSpline_splineMgr`
---@class editor_decalSpline_splineMgr
editor_decalSpline_splineMgr = {}

--- Adds a new decal spline.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:83
function editor_decalSpline_splineMgr.addNewDecalSpline() end

--- Converts the given paths (traced from a bitmap) to decal splines.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:608
---@param paths any
function editor_decalSpline_splineMgr.convertPathsToDecalSplines(paths) end

--- Copies the profile of the given decal spline.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:466
---@param spline any
function editor_decalSpline_splineMgr.copyDecalSplineProfile(spline) end

--- Deep copies the given decal spline.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:198
---@param spline any
function editor_decalSpline_splineMgr.deepCopyDecalSpline(spline) end

--- Deep copies the full decal spline state.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:210
function editor_decalSpline_splineMgr.deepCopyDecalSplineState() end

--- Deserialises a decal spline. `data` is either the editor's buffer-encoded blob (string) or a plain table straight from a JSON
---  session file. On the JSON path the derived scratch tables are empty and node positions arrive as plain {x,y,z}, so guarantee
---  the tables exist and rehydrate them to vec3 before the first build.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:546
---@param data any
---@param isCreateObject any
function editor_decalSpline_splineMgr.deserializeDecalSpline(data, isCreateObject) end

--- Returns the current list of decal splines.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:641
function editor_decalSpline_splineMgr.getCurrentDecalSplineList() end

--- Fetches the decal splines.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:61
function editor_decalSpline_splineMgr.getDecalSplines() end

--- Returns the default slider parameters.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:80
function editor_decalSpline_splineMgr.getDefaultSliderParams() end

--- Fetches the edit mode key.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:58
function editor_decalSpline_splineMgr.getEditModeKey() end

--- Fetches the decal spline map.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:64
function editor_decalSpline_splineMgr.getSplineMap() end

--- Fetches the tool prefix string.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:55
function editor_decalSpline_splineMgr.getToolPrefixStr() end

--- Returns true if the given decal spline is linked, false otherwise.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:655
---@param id any
function editor_decalSpline_splineMgr.isLinked(id) end

--- Joins two unlooped Decal Splines into one, modifying spline1 and deleting spline2.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:335
---@param splineIdx1 any
---@param nodeIdx1 any
---@param splineIdx2 any
---@param nodeIdx2 any
function editor_decalSpline_splineMgr.joinDecalSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2) end

--- Pastes the profile to the given decal spline.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:481
---@param spline any
---@param profile any
function editor_decalSpline_splineMgr.pasteDecalSplineProfile(spline, profile) end

--- Recompute the spline id -> index map (called by the shared session helper after a load appends the loaded splines).
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:565
function editor_decalSpline_splineMgr.recomputeIdMap() end

--- Removes all decal splines.
---  [If isIncludeDisabled is true, then all decal splines will be removed, including disabled ones.]
---  [If isIncludeDisabled is false, then only enabled decal splines will be removed.]
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:179
---@param isIncludeDisabled any
function editor_decalSpline_splineMgr.removeAllDecalSplines(isIncludeDisabled) end

--- Removes the decal spline with the given index.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:158
---@param idx any
function editor_decalSpline_splineMgr.removeDecalSpline(idx) end

--- Removes a linked decal spline by ID (called from master spline layer removal).
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:169
---@param splineId any
function editor_decalSpline_splineMgr.removeLinkedDecalSpline(splineId) end

--- Serialises a decal spline to a table.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:524
---@param spline any
function editor_decalSpline_splineMgr.serializeDecalSpline(spline) end

--- Serialises a decal spline to a portable plain table for a session file (see toolUtilities/session): derived geometry emptied
---  (rebuilt by the dirty pass), runtime scene handle dropped, live spline never mutated.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:537
---@param spline any
function editor_decalSpline_splineMgr.serializeDecalSplineToTable(spline) end

--- Sets the decal spline with the given index.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:67
---@param spline any
---@param idx any
function editor_decalSpline_splineMgr.setDecalSpline(spline, idx) end

--- Sets the decal splines (full table).
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:73
---@param splines any
function editor_decalSpline_splineMgr.setDecalSplines(splines) end

--- Sets the given linked decal spline to be linked or not.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:661
---@param id any
---@param groupId any
---@param isLink any
function editor_decalSpline_splineMgr.setLink(id, groupId, isLink) end

--- Handles the redo for a single decal spline.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:434
---@param decalSplineData any
function editor_decalSpline_splineMgr.singleSplineEditRedo(decalSplineData) end

--- Handles the undo for a single decal spline.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:426
---@param decalSplineData any
function editor_decalSpline_splineMgr.singleSplineEditUndo(decalSplineData) end

--- Splits the selected decal spline into two, at the selected node.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:219
---@param selectedSplineIdx any
---@param selectedNodeIdx any
function editor_decalSpline_splineMgr.splitDecalSpline(selectedSplineIdx, selectedNodeIdx) end

--- Handles the redo for trans decal spline edits.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:454
---@param data any
function editor_decalSpline_splineMgr.transSplineEditRedo(data) end

--- Handles the undo for trans decal spline edits.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:442
---@param data any
function editor_decalSpline_splineMgr.transSplineEditUndo(data) end

--- Unlinks all decal splines.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:698
function editor_decalSpline_splineMgr.unlinkAll() end

--- Updates the geometry and templates/instances of any dirty decal splines.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:568
function editor_decalSpline_splineMgr.updateDirtyDecalSplines() end

--- Updates the given linked decal spline with the given geometry.
---Source : lua/ge/extensions/editor/decalSpline/splineMgr.lua:676
---@param id any
---@param points any
---@param widths any
---@param nmls any
---@param isLoop any
---@param isConformToTerrain any
function editor_decalSpline_splineMgr.updateLinkedDecalSpline(id, points, widths, nmls, isLoop, isConformToTerrain) end

