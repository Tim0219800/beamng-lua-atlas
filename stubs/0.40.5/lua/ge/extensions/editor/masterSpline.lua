---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/masterSpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_masterSpline` : `extensions.load("editor_masterSpline")`, puis la globale `editor_masterSpline`
---@class editor_masterSpline
---@field dependencies table
editor_masterSpline = {}

--- Called when leaving the map. We need to remove all Master Splines.
---Source : lua/ge/extensions/editor/masterSpline.lua:1922
function editor_masterSpline.onClientEndMission() end

--- Deserialisation callback.
---Source : lua/ge/extensions/editor/masterSpline.lua:203
---@param data any
function editor_masterSpline.onDeserialized(data) end

--- Main editor callback.
---Source : lua/ge/extensions/editor/masterSpline.lua:1788
function editor_masterSpline.onEditorGui() end

--- Editor initialisation.
---Source : lua/ge/extensions/editor/masterSpline.lua:1908
function editor_masterSpline.onEditorInitialized() end

--- Serialisation callback.
---Source : lua/ge/extensions/editor/masterSpline.lua:183
function editor_masterSpline.onSerialize() end

--- Sets the selected node index (for cross-tool selection).
---Source : lua/ge/extensions/editor/masterSpline.lua:145
---@param idx any
function editor_masterSpline.setSelectedNodeIdx(idx) end

--- Sets the selected spline index (for cross-tool selection).
---Source : lua/ge/extensions/editor/masterSpline.lua:142
---@param idx any
function editor_masterSpline.setSelectedSplineIdx(idx) end

