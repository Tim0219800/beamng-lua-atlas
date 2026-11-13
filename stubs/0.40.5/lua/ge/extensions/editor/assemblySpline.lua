---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_assemblySpline` : `extensions.load("editor_assemblySpline")`, puis la globale `editor_assemblySpline`
---@class editor_assemblySpline
editor_assemblySpline = {}

--- The splineLock `each` for the assembly spline with this id (nothing if it is gone).
---Source : lua/ge/extensions/editor/assemblySpline.lua:109
---@param id any
---@param fn any
function editor_assemblySpline.eachObjectById(id, fn) end

--- Called when leaving the map.
---Source : lua/ge/extensions/editor/assemblySpline.lua:1768
function editor_assemblySpline.onClientEndMission() end

--- Deserialise callback.
---Source : lua/ge/extensions/editor/assemblySpline.lua:161
---@param data any
function editor_assemblySpline.onDeserialized(data) end

--- World editor main callback.
---Source : lua/ge/extensions/editor/assemblySpline.lua:1646
function editor_assemblySpline.onEditorGui() end

--- Called upon world editor initialization.
---Source : lua/ge/extensions/editor/assemblySpline.lua:1748
function editor_assemblySpline.onEditorInitialized() end

--- Serialise callback.
---Source : lua/ge/extensions/editor/assemblySpline.lua:142
function editor_assemblySpline.onSerialize() end

--- Locks/unlocks the assembly spline with this id and rebuilds it now (also used by the Master Spline for linked children).
---Source : lua/ge/extensions/editor/assemblySpline.lua:99
---@param id any
---@param isLocked any
function editor_assemblySpline.setLockedById(id, isLocked) end

--- Sets the selected node index (for cross-tool selection).
---Source : lua/ge/extensions/editor/assemblySpline.lua:139
---@param idx any
function editor_assemblySpline.setSelectedNodeIdx(idx) end

--- Sets the selected spline index (for cross-tool selection).
---Source : lua/ge/extensions/editor/assemblySpline.lua:136
---@param idx any
function editor_assemblySpline.setSelectedSplineIdx(idx) end

