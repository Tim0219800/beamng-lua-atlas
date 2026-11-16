---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/treeSpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor Tree Spline tool: you draw an editable polyline on the terrain and the tool plants a regular row of trees/shrubs (real Forest instances) along it (avenues, hedges). From 2 nodes, the spline plants and replants live when you add/move/delete nodes or change the distribution. "Line" sibling of forestZoneEditor; shares the core of toolUtilities/foliageScatter. Same structure as meshSpline/assemblySpline (editor/<tool>.lua + <tool>/splineMgr.lua + populate.lua). "treeSpline" window and treeSplineEditMode edit mode.
--- Access: extension `editor_treeSpline`: `extensions.load("editor_treeSpline")`, then the global `editor_treeSpline`
---@class editor_treeSpline
editor_treeSpline = {}

--- End-of-mission hook: forgets the lifted trees and deletes all splines.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/treeSpline.lua:592
function editor_treeSpline.onClientEndMission() end

--- After reload: restores the state (splines marked dirty, replanted at the next onEditorGui).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/treeSpline.lua:556
---@param data table|nil Value returned by onSerialize.
function editor_treeSpline.onDeserialized(data) end

--- Before the level is saved: lifts from the forest (scatter.lift) the trees of active splines so they are not written; only the trees of locked splines are part of the level. They are put back on the next frame.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/treeSpline.lua:598
function editor_treeSpline.onEditorBeforeSaveLevel() end

--- Editor frame hook: puts back the lifted trees, replants dirty splines (even when the tool is inactive), draws the window, handles node editing via splineInput and the rendering of splines.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/treeSpline.lua:504
function editor_treeSpline.onEditorGui() end

--- Editor initialization hook: creates editor.editModes.treeSplineEditMode and registers the treeSpline window (330x760).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/treeSpline.lua:579
function editor_treeSpline.onEditorInitialized() end

--- Before the Lua VM reload: for each locked spline, keeps the keys of its trees (keptObjects via populate.release), then takes a snapshot of the definitions and removes the planted instances to avoid orphans. onDeserialized replants them.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/treeSpline.lua:546
---@return table  State of the splines (splineMgr.getState()).
function editor_treeSpline.onSerialize() end

--- Locks/unlocks the tree spline with the given identifier (isEnabled = not isLocked), marks it dirty and replants it immediately. Also used by the Master Spline for linked children. The trees of a locked spline stay in the forest on save. No effect if the id is unknown.
---Source: lua/ge/extensions/editor/treeSpline.lua:118
---@param id string Spline identifier.
---@param isLocked boolean True to lock.
function editor_treeSpline.setLockedById(id, isLocked) end

--- Sets the index of the selected node; called by splineInput on a jump to this tool.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/treeSpline.lua:99
---@param idx integer Node index (1-based).
function editor_treeSpline.setSelectedNodeIdx(idx) end

--- Sets the index of the selected spline; called by splineInput on a jump to this tool.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/treeSpline.lua:98
---@param idx integer Spline index (1-based).
function editor_treeSpline.setSelectedSplineIdx(idx) end

