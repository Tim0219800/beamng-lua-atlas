---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data manager of the editor's Master Spline tool. It stores the list of Master Splines (nodes, widths, nmls, layers, geometry mode "engineered" with clothoids or "spline" Catmull-Rom, homologation), rebuilds the geometry of "dirty" splines, drives the linked layers (via layerMgr) and provides deep copies, serialization, split/join, undo/redo callbacks and grouped session save/load (masters + mesh/assembly/decal/road/tree children).
--- Access: extension `editor_masterSpline_splineMgr`: `extensions.load("editor_masterSpline_splineMgr")`, then the global `editor_masterSpline_splineMgr`
---@class editor_masterSpline_splineMgr
editor_masterSpline_splineMgr = {}

--- Creates an empty Master Spline (engineered mode, unique name, UUID) and adds it to the list, then recomputes the id-to-index table.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:84
---@param name string|nil Base name; "Master Spline N" by default.
---@return table  The new Master Spline.
function editor_masterSpline_splineMgr.addNewMasterSpline(name) end

--- Adds a Master Spline to the list without recomputing the id-to-index table.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:152
---@param spline table Master Spline to add.
function editor_masterSpline_splineMgr.addToMasterSplineArray(spline) end

--- Deep copy of all the child splines linked by the layers of all the Master Splines, grouped by tool.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:261
---@return table  Table with the lists meshSpline, assemblySpline, decalSpline, roadSpline, treeSpline.
function editor_masterSpline_splineMgr.captureLinkedSplinesState() end

--- Captures the full state for multi-spline undo/redo: Master Splines and linked splines.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:345
---@return table  Table { masterSplines, linkedSplines }.
function editor_masterSpline_splineMgr.captureTransTierState() end

--- Converts paths coming from a bitmap into Master Splines: grid points converted to world via the terrain editor, terrain normals; imports only if the smallest AABB dimension exceeds 10 m. Writes a log.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:1259
---@param paths table List of paths { points (x, y grid), widths }.
function editor_masterSpline_splineMgr.convertPathsToMasterSplines(paths) end

--- Deep copy of the whole list of Master Splines.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:255
---@return table  Copy.
function editor_masterSpline_splineMgr.deepCopyAllMasterSplines() end

--- Deep copy of a Master Spline (string.buffer).
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:252
---@param spline table Spline to copy.
---@return table  Copy.
function editor_masterSpline_splineMgr.deepCopyMasterSpline(spline) end

--- Rebuilds a Master Spline (vec3, layers, empty secondary geometry to be regenerated) from serialized data.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:614
---@param data table Table produced by serializeMasterSpline.
---@return table  Master Spline.
function editor_masterSpline_splineMgr.deserializeMasterSpline(data) end

--- Returns the edit mode key "masterSpline".
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:66
---@return string  Key.
function editor_masterSpline_splineMgr.getEditModeKey() end

--- Returns the id-to-index table of the Master Splines.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:72
---@return table<string, integer>  Id-to-index table.
function editor_masterSpline_splineMgr.getIdToIdxMap() end

--- Returns the array (live, not copied) of the Master Splines.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:69
---@return table  Array of Master Splines.
function editor_masterSpline_splineMgr.getMasterSplines() end

--- Returns the tool prefix "Master Spline".
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:63
---@return string  Prefix.
function editor_masterSpline_splineMgr.getToolPrefixStr() end

--- Joins two open Master Splines: the first receives the concatenated geometry and the second is deleted. Does nothing if the indices are invalid.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:539
---@param splineIdx1 integer Index of the first spline (kept).
---@param nodeIdx1 integer Junction node of the first.
---@param splineIdx2 integer Index of the second spline (deleted).
---@param nodeIdx2 integer Junction node of the second.
function editor_masterSpline_splineMgr.joinMasterSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2) end

--- Redo of light modifications: applies data.new.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:765
---@param data table Action { old, new }.
function editor_masterSpline_splineMgr.lightSplineRedo(data) end

--- Undo of light modifications to a Master Spline: applies data.old.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:762
---@param data table Action { old, new }.
function editor_masterSpline_splineMgr.lightSplineUndo(data) end

--- Loads a session state: new UUIDs for masters, children and layers, insertion of the children into their tools, relinking and dirty marking. Returns 0 if state is not a table.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:1030
---@param state table State produced by serializeSessionState.
---@param replace boolean If true, first deletes the whole current graph of masters (and their children).
---@return integer  Number of Master Splines loaded.
function editor_masterSpline_splineMgr.loadSessionState(state, replace) end

--- If the selected spline has isOptimising true and more than 2 divPoints, runs homologation.optimiseSpline with the number of iterations per frame.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:243
---@param selectedSplineIdx integer Index of the selected spline.
function editor_masterSpline_splineMgr.manageLiveOptimise(selectedSplineIdx) end

--- Recomputes the id-to-index table (called by the session wizard after a load).
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:258
function editor_masterSpline_splineMgr.recomputeIdMap() end

--- Redo of the creation: recreates a Master Spline with the id data.masterSplineId.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:1241
---@param data table Action { masterSplineId }.
function editor_masterSpline_splineMgr.redoAddNewMasterSpline(data) end

--- Redo of a layer addition.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:1117
---@param data table Action data.
function editor_masterSpline_splineMgr.redoLayerAdd(data) end

--- Redo of a layer deletion.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:1206
---@param data table Action data.
function editor_masterSpline_splineMgr.redoLayerRemove(data) end

--- Deletes all the Master Splines of the session, with their layers and linked children.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:165
function editor_masterSpline_splineMgr.removeAllMasterSplines() end

--- Deletes the Master Spline at index idx, all its layers and their linked splines, then recomputes the id-to-index table.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:155
---@param idx integer Index (1-based).
function editor_masterSpline_splineMgr.removeMasterSpline(idx) end

--- Serializes a Master Spline into a JSON-safe table (nodes and normals as {x,y,z}, layers, parameters).
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:570
---@param spline table Spline.
---@return table  Serialized data.
function editor_masterSpline_splineMgr.serializeMasterSpline(spline) end

--- State for the shared session wizard: all the Master Splines plus each linked child (deduplicated by id), as JSON tables.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:1005
---@return table  { masterSplines = {...}, children = { [linkType] = {...} } }.
function editor_masterSpline_splineMgr.serializeSessionState() end

--- Redo of an edit of a single Master Spline (data.new); by default recreates the child splines deleted during the action, names and links the new ones.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:940
---@param data table Action { old, new }.
function editor_masterSpline_splineMgr.singleMasterSplineEditRedo(data) end

--- Undo of an edit of a single Master Spline (applies data.old).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:831
---@param data table Action { old, new }.
function editor_masterSpline_splineMgr.singleMasterSplineEditUndo(data) end

--- Cuts the Master Spline at the chosen node. A loop becomes an open spline restarted at the cut point; otherwise two copies "name (1)" and "name (2)" are created with their turn overrides, and the layers are handled for each half.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:353
---@param spline table Master Spline to cut.
---@param splineIdx integer Index of the spline in the list.
---@param selectedNodeIdx integer Index of the cut node.
function editor_masterSpline_splineMgr.splitMasterSpline(spline, splineIdx, selectedNodeIdx) end

--- Redo of a multi-spline edit.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:966
---@param splinesData table Action { old, new }.
function editor_masterSpline_splineMgr.transMasterSplineEditRedo(splinesData) end

--- Undo of a multi-spline edit (full state, masters and children).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:935
---@param splinesData table Action { old, new } from captureTransTierState.
function editor_masterSpline_splineMgr.transMasterSplineEditUndo(splinesData) end

--- Undo of a Master Spline creation: deletes it by data.masterSplineId.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:1232
---@param data table Action { masterSplineId }.
function editor_masterSpline_splineMgr.undoAddNewMasterSpline(data) end

--- Undo of a layer addition: removes the layer from the Master Spline (data.masterSplineId).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:1095
---@param data table Action data.
function editor_masterSpline_splineMgr.undoLayerAdd(data) end

--- Undo of a layer deletion: restores it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:1162
---@param data table Action data.
function editor_masterSpline_splineMgr.undoLayerRemove(data) end

--- Unlinks all the linked splines of the Master Spline (isLink = false, linkId = nil), without going through undo/redo.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:1248
---@param masterSpline table Master Spline.
function editor_masterSpline_splineMgr.unlinkAllSplines(masterSpline) end

--- Rebuilds the geometry of isDirty splines (terrain, engineered or Catmull-Rom, turn widening, rib points, homologation if enabled), updates the linked layers and roadLength. Non-dirty splines only update their dirty layers. Signals the modification to the session if anything was rebuilt.
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:173
---@param isSplineAnalysisEnabled boolean If true, runs homologation.analyseSpline on splines with more than 2 discretized points.
function editor_masterSpline_splineMgr.updateDirtyMasterSplines(isSplineAnalysisEnabled) end

--- Renames the linked spline so that it follows the layer's name (via setNameJumpTable).
---Source: lua/ge/extensions/editor/masterSpline/splineMgr.lua:1229
---@param splineId string Id of the linked spline.
---@param linkType string Link type (tool prefix of the linked spline).
---@param newName string New name.
function editor_masterSpline_splineMgr.updateLinkedSplineName(splineId, linkType, newName) end

