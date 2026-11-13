---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/decalSpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_decalSpline` : `extensions.load("editor_decalSpline")`, puis la globale `editor_decalSpline`
---@class editor_decalSpline
editor_decalSpline = {}

--- Called when leaving the map. We need to remove all decal splines.
---Source : lua/ge/extensions/editor/decalSpline.lua:1745
function editor_decalSpline.onClientEndMission() end

--- Deserialise callback.
---Source : lua/ge/extensions/editor/decalSpline.lua:127
---@param data any
function editor_decalSpline.onDeserialized(data) end

--- World editor main callback.
---Source : lua/ge/extensions/editor/decalSpline.lua:1664
function editor_decalSpline.onEditorGui() end

--- Called upon world editor initialisation.
---Source : lua/ge/extensions/editor/decalSpline.lua:1731
function editor_decalSpline.onEditorInitialized() end

--- Serialise callback.
---Source : lua/ge/extensions/editor/decalSpline.lua:108
function editor_decalSpline.onSerialize() end

--- Locks/unlocks the decal spline with this id and rebuilds it now (also used by the Master Spline for linked children). Its
---  decals save through the decal persistence manager either way, so the lock only makes the spline uneditable.
---Source : lua/ge/extensions/editor/decalSpline.lua:96
---@param id any
---@param isLocked any
function editor_decalSpline.setLockedById(id, isLocked) end

--- Sets the selected node index (for cross-tool selection).
---Source : lua/ge/extensions/editor/decalSpline.lua:92
---@param idx any
function editor_decalSpline.setSelectedNodeIdx(idx) end

--- Sets the selected spline index (for cross-tool selection).
---Source : lua/ge/extensions/editor/decalSpline.lua:89
---@param idx any
function editor_decalSpline.setSelectedSplineIdx(idx) end

