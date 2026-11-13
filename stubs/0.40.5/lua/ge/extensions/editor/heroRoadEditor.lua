---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_heroRoadEditor` : `extensions.load("editor_heroRoadEditor")`, puis la globale `editor_heroRoadEditor`
---@class editor_heroRoadEditor
editor_heroRoadEditor = {}

--- Called when leaving the map. We need to remove all groups and templates.
---Source : lua/ge/extensions/editor/heroRoadEditor.lua:2888
function editor_heroRoadEditor.onClientEndMission() end

--- Deserialisation callback.
---Source : lua/ge/extensions/editor/heroRoadEditor.lua:270
---@param data any
function editor_heroRoadEditor.onDeserialized(data) end

--- Main editor callback.
---Source : lua/ge/extensions/editor/heroRoadEditor.lua:2618
function editor_heroRoadEditor.onEditorGui() end

--- Editor initialization.
---Source : lua/ge/extensions/editor/heroRoadEditor.lua:2862
function editor_heroRoadEditor.onEditorInitialized() end

--- Serialise callback.
---Source : lua/ge/extensions/editor/heroRoadEditor.lua:258
function editor_heroRoadEditor.onSerialize() end

--- Sets the selected node index (for cross-tool selection).
---Source : lua/ge/extensions/editor/heroRoadEditor.lua:233
---@param idx any
function editor_heroRoadEditor.setSelectedNodeIdx(idx) end

--- Sets the selected spline index (for cross-tool selection).
---Source : lua/ge/extensions/editor/heroRoadEditor.lua:230
---@param idx any
function editor_heroRoadEditor.setSelectedSplineIdx(idx) end

