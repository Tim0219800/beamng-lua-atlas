---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/bake.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared 'Bake' helper of the editor's spline tools. As long as a spline belongs to its tool, its generated objects (TSStatic, DecalRoad, river) are transient (canSave=false). Bake commits them to the level: sets objects and SimGroup folder to canSave=true and removes the spline from the tool without deleting anything. Everything is driven by a `spec` table provided by the tool (toolId, displayName, getBakeTarget, rebuildNow, burn, detach, finalizeFolder, removeFromTool, captureState, restoreState, findSpline, optionally iconColor/iconSize/bakeIcon/canBake/rowIconSize). The operation is a single undoable history transaction, without a dialog.
--- Access: extension `editor_toolUtilities_bake`: `extensions.load("editor_toolUtilities_bake")`, then the global `editor_toolUtilities_bake`
---@class editor_toolUtilities_bake
editor_toolUtilities_bake = {}

--- Master-Spline propagation: bakes the spline with the given id (typically a linked child) without opening its own history transaction; the Master Spline wraps everything in one action.
---Source: lua/ge/extensions/editor/toolUtilities/bake.lua:166
---@param spec table Configuration table (must have findSpline).
---@param id any Spline id.
---@return table|nil  { manifest, items, folderId } to allow undo, or nil if the id is not found.
function editor_toolUtilities_bake.burnById(spec, id) end

--- Column variant: draws the Bake button as a column cell (the caller must increase its im.Columns by 1). If there is no bakeable spline selected, the cell is an empty Dummy.
---Source: lua/ge/extensions/editor/toolUtilities/bake.lua:142
---@param spec table Tool configuration table (see module).
function editor_toolUtilities_bake.renderButton(spec) end

--- Inline variant: draws the Bake button (or a Dummy) without column handling; the caller does its own im.SameLine() beforehand.
---Source: lua/ge/extensions/editor/toolUtilities/bake.lua:151
---@param spec table Tool configuration table.
function editor_toolUtilities_bake.renderButtonInline(spec) end

--- Row variant: Bake button for the spline of a list row (small icon), or Dummy if it is not bakeable. A click bakes immediately and returns true.
---Source: lua/ge/extensions/editor/toolUtilities/bake.lua:178
---@param spec table Tool configuration table.
---@param spline table Spline of the row.
---@return boolean  true if a bake occurred (the caller must end its window). Always false in LOCK mode.
function editor_toolUtilities_bake.rowButton(spec, spline) end

--- Locks/unlocks `spline` in one undoable history transaction. Used by the flame button and the tool's lock toggle.
---Source: lua/ge/extensions/editor/toolUtilities/bake.lua:114
---@param spec table Configuration table (must have setLockedById).
---@param spline table Spline (uses spline.id).
---@param isLocked boolean true to lock, false to unlock.
function editor_toolUtilities_bake.setLocked(spec, spline, isLocked) end

--- Resumes a bake: deletes the burned objects and the planted forest items, reloads the collision and sets the folder back to transient (cansave=false).
---Source: lua/ge/extensions/editor/toolUtilities/bake.lua:72
---@param data table Record from doBake/burnById (manifest, items, folderId).
function editor_toolUtilities_bake.unburn(data) end

