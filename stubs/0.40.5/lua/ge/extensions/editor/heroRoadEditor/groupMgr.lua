---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_heroRoadEditor_groupMgr` : `extensions.load("editor_heroRoadEditor_groupMgr")`, puis la globale `editor_heroRoadEditor_groupMgr`
---@class editor_heroRoadEditor_groupMgr
---@field defaultCrossingDepthM number
---@field defaultPotholeRadiusM number
---@field defaultRepairLengthM number
editor_heroRoadEditor_groupMgr = {}

--- Adds a placeable barrier segment at normalized position t01 (a guardrail run on one side over a length window).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1218
---@param group any
---@param t01 any
function editor_heroRoadEditor_groupMgr.addBarrier(group, t01) end

--- Adds a pedestrian crossing at normalized position t01. Returns the new crossing.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1097
---@param group any
---@param t01 any
function editor_heroRoadEditor_groupMgr.addCrossing(group, t01) end

--- Adds a group to the groups array.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:112
---@param group any
function editor_heroRoadEditor_groupMgr.addGroupToGroupArray(group) end

--- Adds a junction bell-mouth at normalized position t01.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1246
---@param group any
---@param t01 any
function editor_heroRoadEditor_groupMgr.addJunction(group, t01) end

--- Adds a new group.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:557
---@param name any
function editor_heroRoadEditor_groupMgr.addNewGroup(name) end

--- Adds a procedural pothole at normalized position t01. Returns the new pothole. Shares the crossing frame/projection/clamp
---  (a pothole sits at a station like a crossing); its along-road extent for the end-clearance clamp is ~2*radius (the diameter).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1154
---@param group any
---@param t01 any
function editor_heroRoadEditor_groupMgr.addPothole(group, t01) end

--- Adds a repair-patch cluster at normalized position t01. Returns the new cluster. Shares the crossing frame/projection/
---  clamp (a cluster sits at a station like a crossing); lengthM is its along-road extent for the end-clearance clamp.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1122
---@param group any
---@param t01 any
function editor_heroRoadEditor_groupMgr.addRepair(group, t01) end

--- Adds a placeable widening at normalized position t01.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1183
---@param group any
---@param t01 any
function editor_heroRoadEditor_groupMgr.addWidening(group, t01) end

--- Applies a profile preset (see profilePresets) to the group.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:219
---@param group any
---@param key any
function editor_heroRoadEditor_groupMgr.applyProfilePreset(group, key) end

---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1212
function editor_heroRoadEditor_groupMgr.barrierDefaults() end

--- The along-road extent of a barrier segment (its length), used to keep it clear of the road ends.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1215
---@param b any
function editor_heroRoadEditor_groupMgr.barrierExtent(b) end

--- Clamp a normalized crossing position so the band (+ a small clearance) stays clear of both road ends. With no room
---  (too-short road) the crossing still gets placed at mid-road.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1023
---@param group any
---@param t01 any
---@param depthM any
function editor_heroRoadEditor_groupMgr.clampCrossingT(group, t01, depthM) end

--- Drag hide: tear down a group's heavy rendered geometry.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:264
---@param group any
function editor_heroRoadEditor_groupMgr.clearGroupVisuals(group) end

--- One-shot 'Drape to Terrain'.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:228
---@param group any
function editor_heroRoadEditor_groupMgr.conformGroupToTerrain(group) end

--- Converts the given paths (traced from a bitmap) to Road Splines.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1370
---@param paths any
function editor_heroRoadEditor_groupMgr.convertPathsToRoadGroups(paths) end

--- Copies the layer profile from the given group (only the layers).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:784
---@param sourceGroup any
function editor_heroRoadEditor_groupMgr.copyGroupProfile(sourceGroup) end

--- World frame of a crossing at normalized t01: centre point + carriageway-edge endpoints (p0 = left, p1 = right of
---  travel). nil if the geometry isn't ready. Drives the placement ghost + drag handles + the zebra span.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1067
---@param group any
---@param t01 any
function editor_heroRoadEditor_groupMgr.crossingFrame(group, t01) end

--- Deep copies the full group state.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1287
function editor_heroRoadEditor_groupMgr.deepCopyAllGroups() end

---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1275
---@param group any
function editor_heroRoadEditor_groupMgr.deepCopyGroup(group) end

--- Deserialises a group. `data` is either the editor's buffer-encoded blob (string) or a plain table straight from a JSON
---  session file -- so the same backfill + scene-reconcile path serves both the editor's own serialize and Load Session.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1417
---@param data any
---@param isCreateObject any
function editor_heroRoadEditor_groupMgr.deserializeGroup(data, isCreateObject) end

--- Session-load deserialize.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1607
---@param gt any
function editor_heroRoadEditor_groupMgr.deserializeSessionGroup(gt) end

--- Keeps the sparse per-corner override array index-aligned with the nodes.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:187
---@param group any
function editor_heroRoadEditor_groupMgr.ensureCornerArray(group) end

--- Returns the current list of Road Splines.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1796
function editor_heroRoadEditor_groupMgr.getCurrentRoadSplineList() end

--- Gets the edit mode key for the road spline tool.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:109
function editor_heroRoadEditor_groupMgr.getEditModeKey() end

--- Gets the current road splines array.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:100
function editor_heroRoadEditor_groupMgr.getGroups() end

--- Gets the group id -> index map.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:103
function editor_heroRoadEditor_groupMgr.getIdToIdxMap() end

--- Gets the prefix string for the tool.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:106
function editor_heroRoadEditor_groupMgr.getToolPrefixStr() end

--- True when the profile is one-way (a side has zero lanes).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:197
---@param group any
function editor_heroRoadEditor_groupMgr.isOneWayProfile(group) end

--- Joins two unlooped road group splines into one, modifying group1 and deleting group2.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1340
---@param groupIdx1 any
---@param nodeIdx1 any
---@param groupIdx2 any
---@param nodeIdx2 any
function editor_heroRoadEditor_groupMgr.joinRoadSplines(groupIdx1, nodeIdx1, groupIdx2, nodeIdx2) end

--- Default flare/length/bevel for a new junction bell-mouth (also the slider reset-to values in the UI).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:93
function editor_heroRoadEditor_groupMgr.junctionDefaults() end

--- Total along-road extent (m) of a junction mouth: near bevel + throat + far bevel. Used for end-clearance clamping and,
---  via the widening trapezoid mapping, for the mesh flare (widthM=flareM, taperIn=taperOut=bevelM, bayLen=lengthM).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:97
---@param j any
function editor_heroRoadEditor_groupMgr.junctionExtent(j) end

--- Pastes a layer profile onto the given group.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:898
---@param targetGroup any
---@param profile any
function editor_heroRoadEditor_groupMgr.pasteGroupProfile(targetGroup, profile) end

--- Light rebuild for groundmodel painting.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:532
---@param group any
function editor_heroRoadEditor_groupMgr.rebuildSurfaceOnly(group) end

--- Recompute the group id -> index map (called by the shared session helper after a load appends the loaded roads).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1615
function editor_heroRoadEditor_groupMgr.recomputeIdMap() end

--- Removes all auto-generated (hidden) layers, then recreates them.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:239
---@param group any
function editor_heroRoadEditor_groupMgr.recreateAutoGeneratedLayers(group) end

--- Removes all groups from the session.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:167
---@param isIncludeDisabled any
function editor_heroRoadEditor_groupMgr.removeAllGroups(isIncludeDisabled) end

--- Removes the barrier at index idx.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1238
---@param group any
---@param idx any
function editor_heroRoadEditor_groupMgr.removeBarrier(group, idx) end

--- Removes the crossing at index idx.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1113
---@param group any
---@param idx any
function editor_heroRoadEditor_groupMgr.removeCrossing(group, idx) end

--- Removes the group at the given index.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:135
---@param idx any
function editor_heroRoadEditor_groupMgr.removeGroup(idx) end

--- Removes the junction at index idx.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1268
---@param group any
---@param idx any
function editor_heroRoadEditor_groupMgr.removeJunction(group, idx) end

--- Removes a linked road spline by ID (called from master spline layer removal).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:159
---@param splineId any
function editor_heroRoadEditor_groupMgr.removeLinkedRoadSpline(splineId) end

--- Removes the pothole at index idx.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1175
---@param group any
---@param idx any
function editor_heroRoadEditor_groupMgr.removePothole(group, idx) end

--- Removes the repair cluster at index idx.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1145
---@param group any
---@param idx any
function editor_heroRoadEditor_groupMgr.removeRepair(group, idx) end

--- Removes the widening at index idx.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1205
---@param group any
---@param idx any
function editor_heroRoadEditor_groupMgr.removeWidening(group, idx) end

--- Serialises a group.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1404
---@param group any
function editor_heroRoadEditor_groupMgr.serializeGroup(group) end

--- One group as a clean, portable plain table (deep-copied through the buffer codec so the LIVE group is never mutated).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1583
---@param group any
function editor_heroRoadEditor_groupMgr.serializeGroupToTable(group) end

--- Sets the width of the group to a fixed value at every node.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:539
---@param group any
---@param width any
function editor_heroRoadEditor_groupMgr.setFixedWidth(group, width) end

--- Sets the lane profile (lane counts + optional lane width) and marks the group dirty so widths/markings rebuild.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:547
---@param group any
---@param lanesLeft any
---@param lanesRight any
---@param laneWidthM any
function editor_heroRoadEditor_groupMgr.setLaneProfile(group, lanesLeft, lanesRight, laneWidthM) end

---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1774
---@param data any
function editor_heroRoadEditor_groupMgr.singleGroupEditRedo(data) end

--- Handles the undo/redo for single group edits.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1772
---@param data any
function editor_heroRoadEditor_groupMgr.singleGroupEditUndo(data) end

--- Splits the given group at the selected node index.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1296
---@param group any
---@param groupIdx any
---@param selectedNodeIdx any
function editor_heroRoadEditor_groupMgr.splitGroup(group, groupIdx, selectedNodeIdx) end

--- Derives the carriageway width from the lane profile.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:204
---@param group any
function editor_heroRoadEditor_groupMgr.syncProfileWidth(group) end

--- Normalized crossing position for a world point projected onto the road (clamped clear of the ends). Used while
---  dragging a crossing handle. nil if no ribbon.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1059
---@param group any
---@param p any
---@param depthM any
function editor_heroRoadEditor_groupMgr.tForPointOnGroup(group, p, depthM) end

---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1793
---@param groupsData any
function editor_heroRoadEditor_groupMgr.transGroupEditRedo(groupsData) end

--- Handles the undo/redo for trans-group edits.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:1791
---@param groupsData any
function editor_heroRoadEditor_groupMgr.transGroupEditUndo(groupsData) end

--- Updates the dirty groups.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:402
---@param dragging any
function editor_heroRoadEditor_groupMgr.updateDirtyGroups(dragging) end

--- Default width/bay/taper for a new widening (also the slider reset-to values in the UI).
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:87
function editor_heroRoadEditor_groupMgr.wideningDefaults() end

--- Total along-road extent (m) of a widening: entry taper + full-width bay + exit taper. Used for end-clearance clamping.
---Source : lua/ge/extensions/editor/heroRoadEditor/groupMgr.lua:90
---@param w any
function editor_heroRoadEditor_groupMgr.wideningExtent(w) end

