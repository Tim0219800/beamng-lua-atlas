---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/roadMesh.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Creates the procedural meshes (ProceduralMesh scene objects) of Road Architect: sidewalks with curbs (kerbs) on the left or right of the road, and bridges. It keeps internally the mesh tables by road name and by bridge name, so they can be deleted later. It is called by the roads module during finalise/unfinalise and updateRoads.
--- Access: extension `editor_roadArchitect_roadMesh`: `extensions.load("editor_roadArchitect_roadMesh")`, then the global `editor_roadArchitect_roadMesh`
---@class editor_roadArchitect_roadMesh
editor_roadArchitect_roadMesh = {}

--- Replaces the bridges table with an empty table without deleting the scene objects.
---Source: lua/ge/extensions/editor/roadArchitect/roadMesh.lua:888
function editor_roadArchitect_roadMesh.clearBridges() end

--- Splits the road into lateral sections and creates a sidewalk + curb mesh for each 'sidewalk' lane (left or right side depending on isLeftSide). Stores the meshes under the road name.
---Source: lua/ge/extensions/editor/roadArchitect/roadMesh.lua:669
---@param r table Road with renderData.
---@param roadMeshIdx integer Index of the road, used to name the created objects.
---@param folder userdata Scene SimGroup that receives the meshes.
function editor_roadArchitect_roadMesh.createRoad(r, roadMeshIdx, folder) end

--- Removes from the scene the meshes created for the road (if any) and forgets the entry.
---Source: lua/ge/extensions/editor/roadArchitect/roadMesh.lua:686
---@param roadName string Name of the road.
function editor_roadArchitect_roadMesh.tryRemove(roadName) end

--- Deletes the bridge mesh object and forgets it.
---Source: lua/ge/extensions/editor/roadArchitect/roadMesh.lua:879
---@param name string Name (identifier) of the bridge type road.
function editor_roadArchitect_roadMesh.tryRemoveBridge(name) end

--- (Re)creates the procedural mesh of a bridge: deletes the old one, computes the vertex rings from the renderData (lanes -1 to 1), generates surface and caps, and adds it to the folder.
---Source: lua/ge/extensions/editor/roadArchitect/roadMesh.lua:697
---@param r table Bridge type road, with renderData.
---@param folder userdata SimGroup "Road Architect - Bridge <name>".
function editor_roadArchitect_roadMesh.updateBridge(r, folder) end

