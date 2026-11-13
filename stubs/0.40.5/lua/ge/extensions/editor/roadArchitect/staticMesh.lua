---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/staticMesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadArchitect_staticMesh` : `extensions.load("editor_roadArchitect_staticMesh")`, puis la globale `editor_roadArchitect_staticMesh`
---@class editor_roadArchitect_staticMesh
editor_roadArchitect_staticMesh = {}

--- Creates all the appropriate static meshes for a given road.
---Source : lua/ge/extensions/editor/roadArchitect/staticMesh.lua:228
---@param r any
---@param roadIdx any
---@param folder any
function editor_roadArchitect_staticMesh.createStaticMeshes(r, roadIdx, folder) end

--- Attempts to removes the meshes of the road with the given name, from the scene (if it exists).
---  [This is done through road indices; the actual handling of the meshes structure should be private to this module].
---Source : lua/ge/extensions/editor/roadArchitect/staticMesh.lua:246
---@param roadName any
function editor_roadArchitect_staticMesh.tryRemove(roadName) end

