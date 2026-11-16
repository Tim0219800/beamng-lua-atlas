---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/burn.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Locking ("burn" = lock) of an editor Master Spline. A Master Spline has a stack of linked child splines (mesh, assembly, road, tree, decal); locking it also locks all its children: they stay in their tools, uneditable, and their generated content is saved with the level. Unlocking makes everything editable again.
--- Access: extension `editor_masterSpline_burn`: `extensions.load("editor_masterSpline_burn")`, then the global `editor_masterSpline_burn`
---@class editor_masterSpline_burn
editor_masterSpline_burn = {}

--- Burn button action: locks the Master Spline at index idx (equivalent to setLocked(idx, true)).
---Source: lua/ge/extensions/editor/masterSpline/burn.lua:56
---@param idx integer Index of the Master Spline in the list (1-based).
function editor_masterSpline_burn.run(idx) end

--- Locks or unlocks the Master Spline at index idx, with all its linked children, in a single undoable transaction. Does nothing if the index is invalid.
---Source: lua/ge/extensions/editor/masterSpline/burn.lua:47
---@param idx integer Index of the Master Spline in the list (1-based).
---@param isLocked boolean true to lock, false to unlock.
function editor_masterSpline_burn.setLocked(idx, isLocked) end

