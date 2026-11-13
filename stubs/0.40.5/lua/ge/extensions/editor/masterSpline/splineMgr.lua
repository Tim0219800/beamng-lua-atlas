---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_masterSpline_splineMgr` : `extensions.load("editor_masterSpline_splineMgr")`, puis la globale `editor_masterSpline_splineMgr`
---@class editor_masterSpline_splineMgr
editor_masterSpline_splineMgr = {}

--- Adds a new Master Spline.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:84
---@param name any
function editor_masterSpline_splineMgr.addNewMasterSpline(name) end

--- Adds a Master Spline to the Master Splines array.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:152
---@param spline any
function editor_masterSpline_splineMgr.addToMasterSplineArray(spline) end

--- Captures the state of all linked splines across all master splines.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:261
function editor_masterSpline_splineMgr.captureLinkedSplinesState() end

--- Captures the full trans tier state including both master splines and linked splines.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:345
function editor_masterSpline_splineMgr.captureTransTierState() end

--- Converts the given paths (traced from a bitmap) to Master Splines.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1259
---@param paths any
function editor_masterSpline_splineMgr.convertPathsToMasterSplines(paths) end

--- Deep copies the full master spline state.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:255
function editor_masterSpline_splineMgr.deepCopyAllMasterSplines() end

--- Deep copies the given master spline.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:252
---@param spline any
function editor_masterSpline_splineMgr.deepCopyMasterSpline(spline) end

--- Deserialises a Master Spline.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:614
---@param data any
function editor_masterSpline_splineMgr.deserializeMasterSpline(data) end

--- Returns the edit mode key.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:66
function editor_masterSpline_splineMgr.getEditModeKey() end

--- Gets the Master Spline id -> index map.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:72
function editor_masterSpline_splineMgr.getIdToIdxMap() end

--- Gets the array of Master Splines.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:69
function editor_masterSpline_splineMgr.getMasterSplines() end

--- Returns the tool prefix string.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:63
function editor_masterSpline_splineMgr.getToolPrefixStr() end

--- Joins two unlooped Master Splines into one, modifying spline1 and deleting spline2.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:539
---@param splineIdx1 any
---@param nodeIdx1 any
---@param splineIdx2 any
---@param nodeIdx2 any
function editor_masterSpline_splineMgr.joinMasterSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2) end

--- Handles the redo for light Master Spline changes.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:765
---@param data any
function editor_masterSpline_splineMgr.lightSplineRedo(data) end

--- Handles the undo/redo for light Master Spline changes.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:762
---@param data any
function editor_masterSpline_splineMgr.lightSplineUndo(data) end

--- loadWhole for the shared session helper. Mints fresh ids for every master + child, remaps the layer links, inserts the children
---  into their tools and the masters here, then relinks. `replace` first wipes the whole current master graph (masters + their linked
---  children). Returns the number of masters loaded.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1030
---@param state any
---@param replace any
function editor_masterSpline_splineMgr.loadSessionState(state, replace) end

--- Manages the Live Optimise of the selected Master Spline only.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:243
---@param selectedSplineIdx any
function editor_masterSpline_splineMgr.manageLiveOptimise(selectedSplineIdx) end

--- Recompute the Master Spline id -> index map (called by the shared session helper after a load appends the loaded splines).
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:258
function editor_masterSpline_splineMgr.recomputeIdMap() end

--- Redo callback for adding a new master spline.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1241
---@param data any
function editor_masterSpline_splineMgr.redoAddNewMasterSpline(data) end

---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1117
---@param data any
function editor_masterSpline_splineMgr.redoLayerAdd(data) end

---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1206
---@param data any
function editor_masterSpline_splineMgr.redoLayerRemove(data) end

--- Removes all Master Splines from the session.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:165
function editor_masterSpline_splineMgr.removeAllMasterSplines() end

--- Removes the Master Spline at the given index.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:155
---@param idx any
function editor_masterSpline_splineMgr.removeMasterSpline(idx) end

--- Serialises a Master Spline.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:570
---@param spline any
function editor_masterSpline_splineMgr.serializeMasterSpline(spline) end

--- getState for the shared session helper: bundle all masters + each linked child (deduped by id), all JSON-safe.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1005
function editor_masterSpline_splineMgr.serializeSessionState() end

--- Redefine the redo functions to include enhanced functionality.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:940
---@param data any
function editor_masterSpline_splineMgr.singleMasterSplineEditRedo(data) end

--- Handles the undo/redo for single Master Spline edits.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:831
---@param data any
function editor_masterSpline_splineMgr.singleMasterSplineEditUndo(data) end

--- Splits the given Master Spline at the selected node index.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:353
---@param spline any
---@param splineIdx any
---@param selectedNodeIdx any
function editor_masterSpline_splineMgr.splitMasterSpline(spline, splineIdx, selectedNodeIdx) end

---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:966
---@param splinesData any
function editor_masterSpline_splineMgr.transMasterSplineEditRedo(splinesData) end

--- Handles the undo/redo for trans-Master Spline edits.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:935
---@param splinesData any
function editor_masterSpline_splineMgr.transMasterSplineEditUndo(splinesData) end

--- Undo callback for adding a new master spline.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1232
---@param data any
function editor_masterSpline_splineMgr.undoAddNewMasterSpline(data) end

--- Layer-specific undo/redo operations for adding layers.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1095
---@param data any
function editor_masterSpline_splineMgr.undoLayerAdd(data) end

--- Layer-specific undo/redo operations for removing layers.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1162
---@param data any
function editor_masterSpline_splineMgr.undoLayerRemove(data) end

--- Unlinks all splines from the given Master Spline (separated so as not to be called with undo/redo).
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1248
---@param masterSpline any
function editor_masterSpline_splineMgr.unlinkAllSplines(masterSpline) end

--- Updates the dirty Master Splines.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:173
---@param isSplineAnalysisEnabled any
function editor_masterSpline_splineMgr.updateDirtyMasterSplines(isSplineAnalysisEnabled) end

--- Updates a linked spline's name to match a layer name.
---Source : lua/ge/extensions/editor/masterSpline/splineMgr.lua:1229
---@param splineId any
---@param linkType any
---@param newName any
function editor_masterSpline_splineMgr.updateLinkedSplineName(splineId, linkType, newName) end

