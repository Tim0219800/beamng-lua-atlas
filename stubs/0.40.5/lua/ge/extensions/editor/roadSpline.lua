---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadSpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadSpline` : `extensions.load("editor_roadSpline")`, puis la globale `editor_roadSpline`
---@class editor_roadSpline
editor_roadSpline = {}

--- Called when leaving the map. We need to remove all groups and templates.
---Source : lua/ge/extensions/editor/roadSpline.lua:1680
function editor_roadSpline.onClientEndMission() end

--- Deserialisation callback.
---Source : lua/ge/extensions/editor/roadSpline.lua:162
---@param data any
function editor_roadSpline.onDeserialized(data) end

--- Main editor callback.
---Source : lua/ge/extensions/editor/roadSpline.lua:1504
function editor_roadSpline.onEditorGui() end

--- Editor initialization.
---Source : lua/ge/extensions/editor/roadSpline.lua:1657
function editor_roadSpline.onEditorInitialized() end

--- Serialise callback.
---Source : lua/ge/extensions/editor/roadSpline.lua:144
function editor_roadSpline.onSerialize() end

--- Locks/unlocks the road spline with this id and rebuilds it now (also used by the Master Spline for linked children).
---Source : lua/ge/extensions/editor/roadSpline.lua:86
---@param id any
---@param isLocked any
function editor_roadSpline.setLockedById(id, isLocked) end

--- Sets the selected node index (for cross-tool selection).
---Source : lua/ge/extensions/editor/roadSpline.lua:119
---@param idx any
function editor_roadSpline.setSelectedNodeIdx(idx) end

--- Sets the selected spline index (for cross-tool selection).
---Source : lua/ge/extensions/editor/roadSpline.lua:116
---@param idx any
function editor_roadSpline.setSelectedSplineIdx(idx) end

