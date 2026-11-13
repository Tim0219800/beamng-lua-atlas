---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/roadMesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_roadArchitect_roadMesh` : `extensions.load("editor_roadArchitect_roadMesh")`, puis la globale `editor_roadArchitect_roadMesh`
---@class editor_roadArchitect_roadMesh
editor_roadArchitect_roadMesh = {}

--- Clears the bridges structure.
---Source : lua/ge/extensions/editor/roadArchitect/roadMesh.lua:888
function editor_roadArchitect_roadMesh.clearBridges() end

--- Creates a road mesh from the given rendering data.
---  [The index of the road is used outside this module to reference the mesh later].
---Source : lua/ge/extensions/editor/roadArchitect/roadMesh.lua:669
---@param r any
---@param roadMeshIdx any
---@param folder any
function editor_roadArchitect_roadMesh.createRoad(r, roadMeshIdx, folder) end

--- Attempts to removes the meshes of the road with the given name, from the scene (if it exists).
---Source : lua/ge/extensions/editor/roadArchitect/roadMesh.lua:686
---@param roadName any
function editor_roadArchitect_roadMesh.tryRemove(roadName) end

--- Attempts to remove the bridge with the given index.
---Source : lua/ge/extensions/editor/roadArchitect/roadMesh.lua:879
---@param name any
function editor_roadArchitect_roadMesh.tryRemoveBridge(name) end

--- Updates the given bridge.
---Source : lua/ge/extensions/editor/roadArchitect/roadMesh.lua:697
---@param r any
---@param folder any
function editor_roadArchitect_roadMesh.updateBridge(r, folder) end

