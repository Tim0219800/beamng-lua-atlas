---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/splineLock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Lock state shared by the editor's custom spline tools. A locked spline (isEnabled == false) stays in its tool, but the generated objects belong to the level: they are saved (canSave = true) and collide. An unlocked spline produces transient preview objects (canSave = false, no collision). Each tool calls sync() from its rebuild, and provides an iterator `each(fn)` that calls fn(obj, collides, isParked) for each object it owns. While locked, the tool neither moves nor redoes the existing objects: manual touch-ups are kept.
--- Access: extension `editor_toolUtilities_splineLock`: `extensions.load("editor_toolUtilities_splineLock")`, then the global `editor_toolUtilities_splineLock`
---@class editor_toolUtilities_splineLock
editor_toolUtilities_splineLock = {}

--- Puts a generated object in the lock state: canSave = isLocked, and collisionType = 'Collision Mesh' if locked and `collides`, otherwise 'None'.
---Source: lua/ge/extensions/editor/toolUtilities/splineLock.lua:38
---@param obj userdata Scene object.
---@param isLocked boolean Spline locked.
---@param collides boolean|nil Collision once locked; nil leaves the collision unchanged.
function editor_toolUtilities_splineLock.applyObject(obj, isLocked, collides) end

--- Records the hand-editable state of a spline's objects (transform, scale, shape for TSStatic, folder), keyed by object id. To be taken before an unlock that resets them, so it can be undone.
---Source: lua/ge/extensions/editor/toolUtilities/splineLock.lua:100
---@param each function Tool iterator.
---@return table  id -> { xf, scale, shape, groupId }.
function editor_toolUtilities_splineLock.capture(each) end

--- Removes from a list the references to objects that no longer exist (e.g. deleted by hand in the scene tree). Compacts the list in place.
---Source: lua/ge/extensions/editor/toolUtilities/splineLock.lua:18
---@param list table Array of scene objects, modified in place.
function editor_toolUtilities_splineLock.dropDeleted(list) end

--- True if the tool still owns at least one live (non-parked) object for the spline.
---Source: lua/ge/extensions/editor/toolUtilities/splineLock.lua:46
---@param each function Tool iterator.
---@return boolean  A live object exists.
function editor_toolUtilities_splineLock.hasAny(each) end

--- Puts a capture back in place after the re-lock that undoes an unlock: shape (shapeName + postApply), transform, scale, folder. Objects created in the meantime and absent from the capture are deleted. Calls be:reloadCollision().
---Source: lua/ge/extensions/editor/toolUtilities/splineLock.lua:118
---@param rec table Capture result.
---@param each function Tool iterator.
function editor_toolUtilities_splineLock.restore(rec, each) end

--- Aligns the generated objects of a spline with its lock state. Only acts if the state differs from the last applied one (`applied` table id -> isLocked). Updates the scene folder (canSave, tag), the objects (applyObject, tag, put back in the folder if moved by hand). On unlock, deletes the objects in the folder carrying the spline's tag but not owned by the tool. Calls be:reloadCollision().
---Source: lua/ge/extensions/editor/toolUtilities/splineLock.lua:62
---@param applied table<any, boolean> Table spline id -> last applied state; modified.
---@param spline table Spline (id, name, isEnabled, sceneTreeFolderId).
---@param toolName string Tool name, used for the tag.
---@param each function Tool iterator.
---@return boolean  True if an action was taken.
function editor_toolUtilities_splineLock.sync(applied, spline, toolName, each) end

--- Marks a generated object with the source spline (dynamic fields sourceTool, sourceSplineId, sourceSplineName) to find it in the scene tree or the inspector.
---Source: lua/ge/extensions/editor/toolUtilities/splineLock.lua:31
---@param obj userdata Scene object.
---@param toolName string Tool name.
---@param spline table Spline with .id and .name.
function editor_toolUtilities_splineLock.tag(obj, toolName, spline) end

