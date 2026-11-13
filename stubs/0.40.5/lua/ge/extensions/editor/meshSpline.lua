---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshSpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_meshSpline` : `extensions.load("editor_meshSpline")`, puis la globale `editor_meshSpline`
---@class editor_meshSpline
editor_meshSpline = {}

--- The splineLock `each` for the mesh spline with this id (nothing if it is gone).
---Source : lua/ge/extensions/editor/meshSpline.lua:108
---@param id any
---@param fn any
function editor_meshSpline.eachObjectById(id, fn) end

--- Called when leaving the map. Removes all mesh splines.
---Source : lua/ge/extensions/editor/meshSpline.lua:1907
function editor_meshSpline.onClientEndMission() end

--- Deserialise callback.
---Source : lua/ge/extensions/editor/meshSpline.lua:164
---@param data any
function editor_meshSpline.onDeserialized(data) end

--- World editor main callback.
---Source : lua/ge/extensions/editor/meshSpline.lua:1782
function editor_meshSpline.onEditorGui() end

--- Called upon world editor initialization.
---Source : lua/ge/extensions/editor/meshSpline.lua:1886
function editor_meshSpline.onEditorInitialized() end

--- Serialise callback.
---Source : lua/ge/extensions/editor/meshSpline.lua:141
function editor_meshSpline.onSerialize() end

--- Locks/unlocks the mesh spline with this id and rebuilds it now (also used by the Master Spline for linked children).
---Source : lua/ge/extensions/editor/meshSpline.lua:98
---@param id any
---@param isLocked any
function editor_meshSpline.setLockedById(id, isLocked) end

--- Sets the selected node index (for cross-tool selection).
---Source : lua/ge/extensions/editor/meshSpline.lua:138
---@param idx any
function editor_meshSpline.setSelectedNodeIdx(idx) end

--- Sets the selected spline index (for cross-tool selection).
---Source : lua/ge/extensions/editor/meshSpline.lua:135
---@param idx any
function editor_meshSpline.setSelectedSplineIdx(idx) end

