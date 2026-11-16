---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/treeSpline/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Data manager of the Tree Spline tool: holds the list of tree splines (treeSplines) and the id -> index table (splineMap), creates/deletes/copies/splits splines, handles serialization (Lua reload and JSON session files), undo/redo, the links with the Master Spline and the rebuild of dirty splines (geometry then replanting via editor/treeSpline/populate). Used by editor/treeSpline.lua and by the shared tools (splineInput, session).
--- Access: extension `editor_treeSpline_splineMgr`: `extensions.load("editor_treeSpline_splineMgr")`, then the global `editor_treeSpline_splineMgr`
---@class editor_treeSpline_splineMgr
editor_treeSpline_splineMgr = {}

--- Adds a new empty spline (unique name, UUID Engine.generateUUID, isConformToTerrain = true); the user then places its nodes by clicking on the terrain.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:83
---@return integer  Index of the new spline.
function editor_treeSpline_splineMgr.addNewTreeSpline() end

--- Copies the profile (foliage parameters only, not the geometry); callback required by splineInput.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:259
---@param spline table Source spline.
---@return table  Copied profile.
function editor_treeSpline_splineMgr.copyTreeSplineProfile(spline) end

--- Deep copy of a spline, without the derived geometry or the runtime handles (rebuilt from the nodes and parameters).
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:142
---@param spline table Spline to copy.
---@return table  Copy.
function editor_treeSpline_splineMgr.deepCopyTreeSpline(spline) end

--- Deep copy of the whole list (for cross-spline undo/redo).
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:162
---@return table  Copied list.
function editor_treeSpline_splineMgr.deepCopyTreeSplineState() end

--- Rebuilds a spline from an encoded blob (string) or a JSON table. Resets the derived tables, marks the spline dirty, rehydrates the vec3 (nodes, nmls) and takes back the kept trees (keptObjects) via pop.adopt.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:296
---@param data string|table Editor blob or table from a session file.
---@return table  Rebuilt spline.
function editor_treeSpline_splineMgr.deserializeTreeSpline(data) end

--- List of active splines as {name, id, type} for the link with the Master Spline.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:364
---@return table[]  Entries {name, id, type = tool prefix}.
function editor_treeSpline_splineMgr.getCurrentTreeSplineList() end

--- Returns the tool's edit mode key.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:49
---@return string  Edit mode key.
function editor_treeSpline_splineMgr.getEditModeKey() end

--- Default numeric distribution values for a new spline (no scenetree access, safe at module load).
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:58
---@return table  class, spacingM, posVariance, scaleVariance, alignToNormal, slopeMaxDeg, seed.
function editor_treeSpline_splineMgr.getFoliageParamDefaults() end

--- Returns the id -> index table of the splines.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:55
---@return table<string, integer>  Table id to index.
function editor_treeSpline_splineMgr.getSplineMap() end

--- Full snapshot (all splines) as plain data, for onSerialize.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:317
---@return table  List of serialized blobs.
function editor_treeSpline_splineMgr.getState() end

--- Returns the tool's name prefix (used to name splines and identify the type in the Master Spline).
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:46
---@return string  Tool prefix.
function editor_treeSpline_splineMgr.getToolPrefixStr() end

--- Returns the list (live, not copied) of tree splines.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:52
---@return table  List of splines.
function editor_treeSpline_splineMgr.getTreeSplines() end

--- Tells whether the spline with the given identifier is linked to a Master Spline.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:377
---@param id string Spline identifier.
---@return boolean  True if linked.
function editor_treeSpline_splineMgr.isLinked(id) end

--- Builds the default foliage distribution of a new spline: the numeric values plus one checked species (species) with its weight 1.0 (speciesWeights).
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:72
---@return table  Foliage parameters.
function editor_treeSpline_splineMgr.makeFoliageDefaults() end

--- Applies a foliage profile to a spline; the geometry stays unchanged.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:265
---@param spline table Target spline.
---@param profile table Profile returned by copyTreeSplineProfile.
function editor_treeSpline_splineMgr.pasteTreeSplineProfile(spline, profile) end

--- Recomputes the id -> index table; called by the session helper after a load that adds splines.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:314
function editor_treeSpline_splineMgr.recomputeIdMap() end

--- Deletes all splines (and their trees). Without isIncludeDisabled, only active, non-linked splines are deleted.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:131
---@param isIncludeDisabled boolean True to include locked or linked splines.
function editor_treeSpline_splineMgr.removeAllTreeSplines(isIncludeDisabled) end

--- Deletes a linked spline by id (called when a Master Spline layer is removed).
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:414
---@param splineId string Identifier.
function editor_treeSpline_splineMgr.removeLinkedTreeSpline(splineId) end

--- Deletes the spline at the given index and removes its planted trees. No effect if the index is invalid.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:122
---@param idx integer Spline index.
function editor_treeSpline_splineMgr.removeTreeSpline(idx) end

--- Serializes a spline (whitelist of primary fields, without derived geometry) into an encoded blob, for persistence across Lua reload.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:274
---@param spline table Spline.
---@return string  Encoded blob.
function editor_treeSpline_splineMgr.serializeTreeSpline(spline) end

--- Plain portable table for a session file (toolUtilities/session): decodes the blob from serializeTreeSpline; jsonWriteFile flattens the vec3 nodes.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:290
---@param spline table Spline.
---@return table  JSON-serializable table.
function editor_treeSpline_splineMgr.serializeTreeSplineToTable(spline) end

--- Links or unlinks the spline to a Master Spline group (linkId), removes its trees and marks it dirty.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:383
---@param id string Spline identifier.
---@param groupId string Master Spline group identifier.
---@param isLink boolean True to link.
function editor_treeSpline_splineMgr.setLink(id, groupId, isLink) end

--- Restores the whole list from a snapshot (deletes everything first); the splines are marked dirty and replanted.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:324
---@param state table|nil Snapshot from getState.
function editor_treeSpline_splineMgr.setState(state) end

--- Replaces a spline's record (undo path of object selection in splineInput).
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:203
---@param spline table New spline.
---@param idx integer Index to replace.
function editor_treeSpline_splineMgr.setTreeSpline(spline, idx) end

--- Replaces the whole list of splines (cross-spline undo/redo).
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:215
---@param splines table New list.
function editor_treeSpline_splineMgr.setTreeSplines(splines) end

--- Redoes the edit of a single spline (history callback).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:244
---@param splineData table Action data {old, new}.
function editor_treeSpline_splineMgr.singleSplineEditRedo(splineData) end

--- Undoes the edit of a single spline (editor history callback).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:243
---@param splineData table Action data {old, new}.
function editor_treeSpline_splineMgr.singleSplineEditUndo(splineData) end

--- Cuts the selected spline in two at the chosen node (open splines), or unrolls a loop in place. Both halves inherit the foliage parameters and the conformity setting.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:180
---@param selIdx integer Spline index.
---@param nodeIdx integer Index of the split node.
---@return integer  New selected index.
function editor_treeSpline_splineMgr.splitTreeSpline(selIdx, nodeIdx) end

--- Redoes a cross-spline edit.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:252
---@param data table Action data {old, new}.
function editor_treeSpline_splineMgr.transSplineEditRedo(data) end

--- Undoes a cross-spline edit (add, delete, reorder across the whole list).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:247
---@param data table Action data {old, new}.
function editor_treeSpline_splineMgr.transSplineEditUndo(data) end

--- Unlinks all linked splines and marks them dirty.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:422
function editor_treeSpline_splineMgr.unlinkAll() end

--- Rebuilds the geometry and replants dirty splines; may be called every frame. Reports the edit to the session (session.markEdited).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:332
function editor_treeSpline_splineMgr.updateDirtyTreeSplines() end

--- Updates a linked spline with the geometry pushed by the Master Spline (nodes, widths, normals, loop); empties the derived geometry and the trees if fewer than 2 points. The isConformToTerrain parameter is ignored.
---Source: lua/ge/extensions/editor/treeSpline/splineMgr.lua:395
---@param id string Identifier.
---@param points table Nodes.
---@param widths table Widths.
---@param nmls table Normals.
---@param isLoop boolean Closed spline.
---@param isConformToTerrain boolean Ignored.
function editor_treeSpline_splineMgr.updateLinkedTreeSpline(id, points, widths, nmls, isLoop, isConformToTerrain) end

