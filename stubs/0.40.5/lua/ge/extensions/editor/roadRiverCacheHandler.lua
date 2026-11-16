---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadRiverCacheHandler.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Small editor manager that maintains the DecalRoad vertex cache: it initializes it for all the level's DecalRoads when the editor starts, and updates it when a prefab is "exploded" (unpacked) in the scene. No function is meant to be called by a modder.
--- Access: extension `editor_roadRiverCacheHandler`: `extensions.load("editor_roadRiverCacheHandler")`, then the global `editor_roadRiverCacheHandler`
---@class editor_roadRiverCacheHandler
editor_roadRiverCacheHandler = {}

--- Hook called when the editor initializes: initializes the vertices of all the level's roads (editor.initializeLevelRoadsVertices).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadRiverCacheHandler.lua:18
function editor_roadRiverCacheHandler.onEditorInitialized() end

--- Hook called when one or more prefabs are exploded in the editor. For each object of each group, if it is a DecalRoad, recomputes its vertices with editor.updateRoadVertices.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadRiverCacheHandler.lua:7
---@param groups table List of groups (SimGroup) coming from the prefab; each group exposes getObjects() (inferred from code).
function editor_roadRiverCacheHandler.onEditorPrefabExploded(groups) end

