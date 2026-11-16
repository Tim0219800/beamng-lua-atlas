---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/decalSpline/splineMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Spline manager of the editor's Decal Spline tool (prefix "Decal Spline", edit mode decalSplineEditMode): a decal spline follows a path (nodes, widths, normals) on which decals are distributed (spacing, jitter, rotation, atlas rows/columns, scale, frame, up to 4 components). The module keeps the list of splines and an id to index table, creates/deletes/splits/joins splines, handles undo/redo, profile copy, serialization (binary buffer or session JSON table), links with master splines, and rebuilds the geometry and decals of splines marked isDirty.
--- Access: extension `editor_decalSpline_splineMgr`: `extensions.load("editor_decalSpline_splineMgr")`, then the global `editor_decalSpline_splineMgr`
---@class editor_decalSpline_splineMgr
editor_decalSpline_splineMgr = {}

--- Adds a new empty spline at the end with a unique name ("Decal Spline N"), an Engine.generateUUID() UUID and the default parameters.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:83
function editor_decalSpline_splineMgr.addNewDecalSpline() end

--- Converts paths from an image (points in terrain grid) into splines: world coordinates via the terrain editor, terrain normals. Paths whose smallest dimension is at most 10 m are not imported (see notes).
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:608
---@param paths table array of {points, widths}
function editor_decalSpline_splineMgr.convertPathsToDecalSplines(paths) end

--- Copies the profile (decal distribution parameters) of a spline, without nodes, widths, nmls or derived geometry.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:466
---@param spline table source spline
---@return table  profile
function editor_decalSpline_splineMgr.copyDecalSplineProfile(spline) end

--- Deep copy (string.buffer encode/decode) of a spline, with the derived geometry cleared.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:198
---@param spline table spline
---@return table  copy
function editor_decalSpline_splineMgr.deepCopyDecalSpline(spline) end

--- Deep copy of all splines (for the undo history).
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:210
---@return table  array of copies
function editor_decalSpline_splineMgr.deepCopyDecalSplineState() end

--- Deserializes a spline from the editor blob (string) or a session JSON table. On the JSON path, the derived tables are empty and the positions rehydrated as vec3 before the first build.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:546
---@param data string|table blob or table
---@param isCreateObject boolean|nil (inferred from code) indicates whether the object must be created
---@return table  spline
function editor_decalSpline_splineMgr.deserializeDecalSpline(data, isCreateObject) end

--- List of enabled splines as {name, id, type} (type = tool prefix), for the selectors of other tools.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:641
---@return table  array of {name, id, type}
function editor_decalSpline_splineMgr.getCurrentDecalSplineList() end

--- Returns the splines table (reference, not copied).
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:61
---@return table  array of splines
function editor_decalSpline_splineMgr.getDecalSplines() end

--- Returns the default slider values of the interface.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:80
---@return table  spacing, jitter, rot, randomSeed, numRows, numCols, scale, frame...
function editor_decalSpline_splineMgr.getDefaultSliderParams() end

--- Returns the edit mode key ("decalSplineEditMode").
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:58
---@return string  key
function editor_decalSpline_splineMgr.getEditModeKey() end

--- Returns the spline id to index table.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:64
---@return table<string, integer>  id to index
function editor_decalSpline_splineMgr.getSplineMap() end

--- Returns the tool prefix ("Decal Spline").
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:55
---@return string  prefix
function editor_decalSpline_splineMgr.getToolPrefixStr() end

--- Indicates whether the spline with the given id is linked to a master spline.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:655
---@param id string spline id
---@return boolean  true if linked
function editor_decalSpline_splineMgr.isLinked(id) end

--- Joins two non-looped splines: the concatenated geometry is applied to the first, the second is deleted. No effect if the node indices are invalid.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:335
---@param splineIdx1 integer index of the first spline (kept)
---@param nodeIdx1 integer end node of the first
---@param splineIdx2 integer index of the second spline (deleted)
---@param nodeIdx2 integer end node of the second
function editor_decalSpline_splineMgr.joinDecalSplines(splineIdx1, nodeIdx1, splineIdx2, nodeIdx2) end

--- Applies a profile to a spline: deletes its decals, copies the parameters (spacing, jitter, rotN, numRowsN, numColsN, scaleN, frameN...) and marks it isDirty.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:481
---@param spline table target spline
---@param profile table profile from copyDecalSplineProfile
function editor_decalSpline_splineMgr.pasteDecalSplineProfile(spline, profile) end

--- Recomputes the id to index table (called by the session utility after a load).
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:565
function editor_decalSpline_splineMgr.recomputeIdMap() end

--- Deletes the splines. With isIncludeDisabled true, all of them; otherwise only those enabled and not linked.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:179
---@param isIncludeDisabled boolean include disabled (and linked) splines
function editor_decalSpline_splineMgr.removeAllDecalSplines(isIncludeDisabled) end

--- Deletes a spline, removes its decals from the scene, updates the index table, and deletes the decal folder if no spline remains.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:158
---@param idx integer index (1-based)
function editor_decalSpline_splineMgr.removeDecalSpline(idx) end

--- Deletes a spline from its id (called when the master layer is deleted). No effect if the id is unknown.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:169
---@param splineId string spline id
function editor_decalSpline_splineMgr.removeLinkedDecalSpline(splineId) end

--- Serializes a spline into a binary blob (string.buffer) for the editor.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:524
---@param spline table spline
---@return string  encoded data
function editor_decalSpline_splineMgr.serializeDecalSpline(spline) end

--- Serializes a spline into a portable table for a session file: derived geometry cleared, scene handle removed, the live spline is not modified.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:537
---@param spline table spline
---@return table  simple table
function editor_decalSpline_splineMgr.serializeDecalSplineToTable(spline) end

--- Places a spline at the given index and marks it isDirty.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:67
---@param spline table spline
---@param idx integer index (1-based)
function editor_decalSpline_splineMgr.setDecalSpline(spline, idx) end

--- Places all splines of an array at the same indices (each marked isDirty); does not delete the others.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:73
---@param splines table array of splines
function editor_decalSpline_splineMgr.setDecalSplines(splines) end

--- Enables or disables the link of a spline with a group, deletes its decals and marks it isDirty.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:661
---@param id string spline id
---@param groupId string|nil link group id
---@param isLink boolean link or unlink
function editor_decalSpline_splineMgr.setLink(id, groupId, isLink) end

--- Redoes a single-spline edit with decalSplineData.new (if present).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:434
---@param decalSplineData table {old, new}
function editor_decalSpline_splineMgr.singleSplineEditRedo(decalSplineData) end

--- Undoes a single-spline edit with decalSplineData.old (if present).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:426
---@param decalSplineData table {old, new}
function editor_decalSpline_splineMgr.singleSplineEditUndo(decalSplineData) end

--- Splits a spline at the given node into two splines. A loop is opened in place, starting at the chosen node.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:219
---@param selectedSplineIdx integer spline index
---@param selectedNodeIdx integer index of the split node
function editor_decalSpline_splineMgr.splitDecalSpline(selectedSplineIdx, selectedNodeIdx) end

--- Redoes a global edit with data.new.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:454
---@param data table {old, new} with arrays of splines
function editor_decalSpline_splineMgr.transSplineEditRedo(data) end

--- Undoes a global edit: deletes all splines, restores data.old, marks everything isDirty and recomputes the index table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:442
---@param data table {old, new} with arrays of splines
function editor_decalSpline_splineMgr.transSplineEditUndo(data) end

--- Unlinks all linked splines and marks all splines isDirty.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:698
function editor_decalSpline_splineMgr.unlinkAll() end

--- Rebuilds the isDirty splines: vertical raycasts of the nodes, Catmull-Rom geometry, decals, length; marks the edit in the session if at least one was rebuilt. Called every frame by the tool.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:568
function editor_decalSpline_splineMgr.updateDirtyDecalSplines() end

--- Updates a linked spline with the geometry of the master spline (nodes, widths, normals, loop). If fewer than 2 points, clears the derived geometry and deletes the decals.
---Source: lua/ge/extensions/editor/decalSpline/splineMgr.lua:676
---@param id string spline id
---@param points table vec3 nodes
---@param widths table widths
---@param nmls table normals
---@param isLoop boolean loop
---@param isConformToTerrain boolean (not used in the function)
function editor_decalSpline_splineMgr.updateLinkedDecalSpline(id, points, widths, nmls, isLoop, isConformToTerrain) end

