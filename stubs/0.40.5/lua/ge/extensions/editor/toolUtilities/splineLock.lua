---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/splineLock.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_toolUtilities_splineLock` : `extensions.load("editor_toolUtilities_splineLock")`, puis la globale `editor_toolUtilities_splineLock`
---@class editor_toolUtilities_splineLock
editor_toolUtilities_splineLock = {}

--- Makes one generated object match the lock state. `collides` = whether it collides once locked; nil leaves collision alone.
---Source : lua/ge/extensions/editor/toolUtilities/splineLock.lua:38
---@param obj any
---@param isLocked any
---@param collides any
function editor_toolUtilities_splineLock.applyObject(obj, isLocked, collides) end

--- Records the hand-editable state of a spline's objects (pose, scale, shape, folder), keyed by object id. Taken before an
---  unlock resets them, so undoing the unlock can put the hand edits back.
---Source : lua/ge/extensions/editor/toolUtilities/splineLock.lua:100
---@param each any
function editor_toolUtilities_splineLock.capture(each) end

--- Drops handles to objects that are gone (e.g. deleted by hand in the scene tree), compacting the list in place.
---Source : lua/ge/extensions/editor/toolUtilities/splineLock.lua:18
---@param list any
function editor_toolUtilities_splineLock.dropDeleted(list) end

--- True if the tool still owns at least one live (not parked) object for the spline.
---Source : lua/ge/extensions/editor/toolUtilities/splineLock.lua:46
---@param each any
function editor_toolUtilities_splineLock.hasAny(each) end

--- Puts a capture back, after the re-lock that undoes an unlock. Objects the unlock made in the meantime (for ones deleted by
---  hand while locked) are deleted again.
---Source : lua/ge/extensions/editor/toolUtilities/splineLock.lua:118
---@param rec any
---@param each any
function editor_toolUtilities_splineLock.restore(rec, each) end

--- Brings a spline's generated objects in line with its lock state. Only acts when the state differs from the last one applied
---  (`applied`: the tool's id -> isLocked table), as new objects are created in the right state. Returns true if it acted.
---Source : lua/ge/extensions/editor/toolUtilities/splineLock.lua:62
---@param applied any
---@param spline any
---@param toolName any
---@param each any
function editor_toolUtilities_splineLock.sync(applied, spline, toolName, each) end

--- Marks a generated object with the spline it came from, so it can be traced back from the scene tree / inspector.
---Source : lua/ge/extensions/editor/toolUtilities/splineLock.lua:31
---@param obj any
---@param toolName any
---@param spline any
function editor_toolUtilities_splineLock.tag(obj, toolName, spline) end

