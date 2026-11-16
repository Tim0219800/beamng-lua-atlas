---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- "Hero Road" editor: creation and editing of roads by splines (road groups with nodes, profiles, layers, mesh, sidewalks, barriers, lighting and placed objects, terraforming, painting, export). The associated modules are in editor/heroRoadEditor/ (groupMgr, layerMgr, profile, mesh, exportMgr, sidewalkMgr, barrierMgr, placeablesUI, import) and editor/toolUtilities/. It registers the "Hero Road" edit mode and a scene tree context menu "Convert to Hero Road" to import selected DecalRoads. The roads' state survives a Lua reload via onSerialize/onDeserialized.
--- Access: extension `editor_heroRoadEditor`: `extensions.load("editor_heroRoadEditor")`, then the global `editor_heroRoadEditor`
---@class editor_heroRoadEditor
editor_heroRoadEditor = {}

--- Hook called when leaving the map: deletes all road groups and recomputes the id to index table.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/heroRoadEditor.lua:2888
function editor_heroRoadEditor.onClientEndMission() end

--- Deserialization hook after Lua reload: recreates the road groups from the data and recomputes the id to index table. Accepts the old format (bare array of groups).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/heroRoadEditor.lua:270
---@param data table Table {groups = {...}} returned by onSerialize, or old array of groups
function editor_heroRoadEditor.onDeserialized(data) end

--- Hook called every frame by the editor: the tool's main callback. Handles hiding during drags (node, crosswalk, corner handle, "live" cursor), rebuilding of modified groups, rendering of the splines and the tool window.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/heroRoadEditor.lua:2618
function editor_heroRoadEditor.onEditorGui() end

--- Hook called at editor initialization: registers the "Hero Road" edit mode, the tool window, the material selection window and the "Convert to Hero Road" scene tree menu entry.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/heroRoadEditor.lua:2862
function editor_heroRoadEditor.onEditorInitialized() end

--- Hook called before a Lua reload: serializes all road groups, then deletes them (removeAllGroups).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/heroRoadEditor.lua:258
---@return table  {groups = <serialized groups>}
function editor_heroRoadEditor.onSerialize() end

--- Sets the index of the selected node (selection shared between tools).
---Source: lua/ge/extensions/editor/heroRoadEditor.lua:233
---@param idx integer|nil Index of the node in the selected spline
function editor_heroRoadEditor.setSelectedNodeIdx(idx) end

--- Sets the index of the selected spline (road group) (selection shared between tools).
---Source: lua/ge/extensions/editor/heroRoadEditor.lua:230
---@param idx integer|nil Index of the group in the group list
function editor_heroRoadEditor.setSelectedSplineIdx(idx) end

