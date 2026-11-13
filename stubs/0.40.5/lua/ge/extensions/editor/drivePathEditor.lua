---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/drivePathEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_drivePathEditor` : `extensions.load("editor_drivePathEditor")`, puis la globale `editor_drivePathEditor`
---@class editor_drivePathEditor
editor_drivePathEditor = {}

--- Called once when leaving the map. We need to remove all drive path splines.
---Source : lua/ge/extensions/editor/drivePathEditor.lua:1231
function editor_drivePathEditor.onClientEndMission() end

--- Deserialise callback.
---Source : lua/ge/extensions/editor/drivePathEditor.lua:99
---@param data any
function editor_drivePathEditor.onDeserialized(data) end

--- World editor main callback.
---Source : lua/ge/extensions/editor/drivePathEditor.lua:1087
function editor_drivePathEditor.onEditorGui() end

--- Called upon world editor initialization.
---Source : lua/ge/extensions/editor/drivePathEditor.lua:1217
function editor_drivePathEditor.onEditorInitialized() end

--- Serialise callback.
---Source : lua/ge/extensions/editor/drivePathEditor.lua:86
function editor_drivePathEditor.onSerialize() end

--- Sets the selected node index (for cross-tool selection).
---Source : lua/ge/extensions/editor/drivePathEditor.lua:83
---@param idx any
function editor_drivePathEditor.setSelectedNodeIdx(idx) end

--- Sets the selected spline index (for cross-tool selection).
---Source : lua/ge/extensions/editor/drivePathEditor.lua:80
---@param idx any
function editor_drivePathEditor.setSelectedSplineIdx(idx) end

