---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/navMeshEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor of the Recast navmesh (AI navigation mesh) in the World Editor, modeled on the river editor: a "Navigation Mesh" edit mode, a toolbar, an interaction in the 3D view and two windows ("NavMesh Overview": 2D grid of the tiles and shapes of the current tile; "navMeshTileView"). Six tools: tiles (selection and locking of tiles so a rebuild does not change them), outline (coverage polygon), areas (typed convex volumes Exclude/Ground/Road/Sidewalk/Water), links (off-mesh jump/drop/climb/teleport links), test (A to B pathfinding) and crowd (live AI agents). Everything is undoable. It drives the C++ functions navmeshEditor* (navmeshEditorBuild, navmeshEditorSave/Load, navmeshEditorFindPath, navmeshEditorCrowd*, etc.). The navmesh is saved with the level (onEditorAfterSaveLevel) and reloaded on opening.
--- Access: extension `editor_navMeshEditor`: `extensions.load("editor_navMeshEditor")`, then the global `editor_navMeshEditor`
---@class editor_navMeshEditor
editor_navMeshEditor = {}

--- Indicates whether the transform gizmo is allowed: true only when the current edit mode is "Navigation Mesh".
---Source: lua/ge/extensions/editor/navMeshEditor.lua:971
---@return boolean  True if the current edit mode is the navmesh one.
function editor_navMeshEditor.allowGizmo() end

--- Hook called after a level is opened in the editor: resets polygons, areas, selection, tiles and links; the navmesh will be reloaded at the next activation of the mode.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/navMeshEditor.lua:964
function editor_navMeshEditor.onEditorAfterOpenLevel() end

--- Hook called after a level is saved in the editor: saves the navmesh with the level.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/navMeshEditor.lua:963
function editor_navMeshEditor.onEditorAfterSaveLevel() end

--- Editor hook called every frame: draws the Overview and tile view windows when the navmesh mode is active (or the missing API message).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/navMeshEditor.lua:900
function editor_navMeshEditor.onEditorGui() end

--- Hook called at editor initialization: registers the two windows, the "navMesh" inspector handler, the navMeshEditMode edit mode and the "Navigation Mesh" menu entry (Gameplay group).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/navMeshEditor.lua:942
function editor_navMeshEditor.onEditorInitialized() end

--- Selects the "Navigation Mesh" edit mode.
---Source: lua/ge/extensions/editor/navMeshEditor.lua:920
function editor_navMeshEditor.show() end

