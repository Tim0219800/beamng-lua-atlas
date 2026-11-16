---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/staticMesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Places TSStatic objects (.dae files) along the Road Architect roads, from the layers of the lateral profile. Two layer types are handled: type 4 (same mesh repeated over the whole length of the road) and type 5 (a single mesh unit). Called by roads.finalise; the objects are removed by tryRemove on unfinalise or when the road is deleted.
--- Access: extension `editor_roadArchitect_staticMesh`: `extensions.load("editor_roadArchitect_staticMesh")`, then the global `editor_roadArchitect_staticMesh`
---@class editor_roadArchitect_staticMesh
editor_roadArchitect_staticMesh = {}

--- Iterates over the layers of the road's profile and creates the corresponding static objects (type 4: repetition along the road; type 5: single unit).
---Source: lua/ge/extensions/editor/roadArchitect/staticMesh.lua:228
---@param r table Road with profile.layers.
---@param roadIdx integer Index of the road (used for naming).
---@param folder userdata Scene SimGroup.
function editor_roadArchitect_staticMesh.createStaticMeshes(r, roadIdx, folder) end

--- Removes from the scene all static meshes (repeated and unique) created for the road, and forgets their entries.
---Source: lua/ge/extensions/editor/roadArchitect/staticMesh.lua:246
---@param roadName string Name of the road (the code comment talks about an index, but the key is the name).
function editor_roadArchitect_staticMesh.tryRemove(roadName) end

