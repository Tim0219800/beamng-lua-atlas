---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Main window of the world editor's Road Architect editor: a tool for creating roads, profiles, prefab groups, junctions (including auto-junction), terraforming, OpenDRIVE (.xodr) import/export and conversion of DecalRoads to Road Architect roads. This file is mostly the ImGui interface and orchestration; the logic is delegated to the editor/roadArchitect/* modules (roads, profiles, groups, junctions, link, render, terraform, staticMeshMgr, utilities, openDriveImport, openDriveExport). It is only useful to a modder for understanding the lifecycle (edit mode registration, session serialization) or by opening the editor.
--- Access: extension `editor_roadArchitect`: `extensions.load("editor_roadArchitect")`, then the global `editor_roadArchitect`
---@class editor_roadArchitect
editor_roadArchitect = {}

--- Reads temp/roadArchitect.json back after a Lua reload and rebuilds profiles (first), roads, groups, junctions and the placed groups list; updates the road conditions, recomputes the render data and the lane flags of the selected road's profile.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadArchitect.lua:8073
function editor_roadArchitect.onDeserialized() end

--- Editor render callback, called every frame by the world editor. Returns immediately if Road Architect is not active; otherwise reads the mouse state (position projected onto the map, left/right clicks, double-click) and draws the tool's ImGui windows and visual aids.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadArchitect.lua:7697
function editor_roadArchitect.onEditorGui() end

--- Called when the world editor initializes. Registers the roadArchitectEditMode edit mode (autobahn icon), adds the "Convert to Road Architect" entry to the scene tree context menu, registers the tool's windows (main, materials, meshes, nodes, profiles, groups, import), fetches the terrain, and clears the roads/junctions if the level has changed since the last session.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadArchitect.lua:7947
function editor_roadArchitect.onEditorInitialized() end

--- Serializes the session (roads, profiles, groups, junctions, placed groups) to temp/roadArchitect.json before a Lua reload. First closes the profile/group list windows and the mesh selection window if open, then removes roads, meshes and decals from the scene.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/roadArchitect.lua:7993
---@return table  { d = { name = 'roadArchitectSerializationData' } } ; the data itself is written to the temporary file.
function editor_roadArchitect.onSerialize() end

