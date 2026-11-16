---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline/jumpTables.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Master Spline tool utility module: groups dispatch tables keyed by a layer's link type (tool prefix of meshSpline, assemblySpline, decalSpline, roadSpline, treeSpline). Each table maps that type to the matching tool function _anon(create, restore, unlink, delete, lock, serialize...). Useful to understand how a Master Spline drives its child splines.
--- Access: extension `editor_masterSpline_jumpTables`: `extensions.load("editor_masterSpline_jumpTables")`, then the global `editor_masterSpline_jumpTables`
---@class editor_masterSpline_jumpTables
---@field createJumpTable table<string, function> Creates a new spline in the target tool (addNewMeshSpline, addNewAssemblySpline, addNewDecalSpline, addNewGroup, addNewTreeSpline).
---@field eachObjectJumpTable table<string, function(id: any, fn: function)> Iterates over the objects of a linked spline (eachObjectById), for splineLock; mesh and assembly only.
---@field getLastCreatedSplineJumpTable table<string, function> Returns the last spline of the tool's list (or nil if empty); optimized for undo/redo.
---@field removeJumpTable table<string, function> Deletes a linked spline (removeLinkedXxx of each tool).
---@field restoreJumpTable table<string, function(data: table)> Restores a spline from data: deep copy, added to the tool's list, id-to-index table recomputed; returns the spline.
---@field serializeJumpTable table<string, function(linkedSplineId: any)> Returns a deep copy of the linked spline (deepCopyXxx), or nil if not found.
---@field setLinkJumpTable table<string, function> setLink of each tool: sets the link state of a layer.
---@field setLinkedSplineDirtyJumpTable table<string, function(id: any)> Sets isDirty = true on the linked spline, if it exists.
---@field setLockedJumpTable table<string, function(id: any, isLocked: boolean)> Locks/unlocks a child spline via the tool's setLockedById; follows the lock of its Master Spline.
---@field setNameJumpTable table<string, function(id: any, splineName: string)> Renames the linked spline (name field); for mesh, assembly and road, also renames the scene tree folder (sceneTreeFolderId) and refreshes the tree window.
---@field toolNavigation table<string, table> For each type: uiModule (extension name, e.g. 'editor_meshSpline'), getModeKey, getSplines and getIdToIdxMap, to navigate to the matching tool.
---@field unlinkJumpTable table<string, function(linkedSplineId: any)> Unlinks the spline: isLink = false, linkId = nil, isDirty = true.
editor_masterSpline_jumpTables = {}

