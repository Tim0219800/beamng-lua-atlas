---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/roadRiver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Editor API for creating, modifying and deleting roads (DecalRoad) and node-based meshes such as rivers (River, via createMesh). It also keeps a local list of the level's roads (allRoads) and, if the roadTemplates.general.loadTemplates preference is enabled, their midpoints (roadSplines). initialize(editor) adds all these functions to the editor object. Each modification calls editor.setDirty().
--- Access: extension `editor_api_roadRiver`: `extensions.load("editor_api_roadRiver")`, then the global `editor_api_roadRiver`
---@class editor_api_roadRiver
editor_api_roadRiver = {}

--- Registers all the module's functions on the editor object. Called when the editor API is loaded.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/editor/api/roadRiver.lua:238
---@param editorInstance table Global editor object.
function editor_api_roadRiver.initialize(editorInstance) end

--- Functions added to the editor object by initialize.
---@class editor_api_roadRiver_editor
local editor_api_roadRiver_editor = {}

--- Inserts a node into a mesh (river, etc.).
---Source: lua/ge/extensions/editor/api/roadRiver.lua:142
---@param meshObjectId integer Mesh id.
---@param nodeInfo table {pos, width, depth, normal, index}.
---@return integer  Result of insertNode (node id).
function editor_api_roadRiver_editor.addMeshNode(meshObjectId, nodeInfo) end

--- Inserts a node into a road and updates its vertices.
---Source: lua/ge/extensions/editor/api/roadRiver.lua:38
---@param roadObjectId integer Road id.
---@param nodeInfo table {pos = vec3, width = number, index = integer}; index U32_MAX to insert at the end.
---@return integer  Id of the new node (value returned by insertNode).
function editor_api_roadRiver_editor.addRoadNode(roadObjectId, nodeInfo) end

--- Creates a node-based mesh of the given type. For 'River', sets default values (waves, speeds, base color 45 108 171 255, water textures). Applies fields via editor.pasteFields, registers it under a unique name "New<type>", adds it to MissionGroup, positions the object on the first node and adds the nodes.
---Source: lua/ge/extensions/editor/api/roadRiver.lua:154
---@param type string Object class, e.g. 'River'.
---@param nodes table List of {pos, width, depth, normal}.
---@param fields table Fields to apply.
---@return integer  Mesh id.
function editor_api_roadRiver_editor.createMesh(type, nodes, fields) end

--- Creates a DecalRoad (improvedSpline, BlankWhite material), registers it, applies roadInfo via editor.pasteFields, adds it to MissionGroup then adds the nodes. Without a terrain in the level, overObjects is forced to true.
---Source: lua/ge/extensions/editor/api/roadRiver.lua:67
---@param nodes table List of {pos = vec3, width = number}.
---@param roadInfo table Fields to apply to the road (e.g. overObjects).
---@return integer  Id of the created road.
function editor_api_roadRiver_editor.createRoad(nodes, roadInfo) end

--- Deletes a mesh via editor.deleteObject.
---Source: lua/ge/extensions/editor/api/roadRiver.lua:202
---@param meshObjectId integer Mesh id.
function editor_api_roadRiver_editor.deleteMesh(meshObjectId) end

--- Deletes a node from a mesh.
---Source: lua/ge/extensions/editor/api/roadRiver.lua:149
---@param mesh table Mesh object.
---@param nodeID integer Node index.
function editor_api_roadRiver_editor.deleteMeshNode(mesh, nodeID) end

--- Deletes a road, recursively its child roads (childRoads field) and its decorations (decorationIDs), removes it from the lists and marks the editor as modified.
---Source: lua/ge/extensions/editor/api/roadRiver.lua:91
---@param roadObjectId integer Road id.
function editor_api_roadRiver_editor.deleteRoad(roadObjectId) end

--- Deletes a road node and updates its vertices.
---Source: lua/ge/extensions/editor/api/roadRiver.lua:120
---@param roadObjectId integer Road id.
---@param nodeID integer Node index.
function editor_api_roadRiver_editor.deleteRoadNode(roadObjectId, nodeID) end

--- Returns the table of known roads (key = id, value true).
---Source: lua/ge/extensions/editor/api/roadRiver.lua:207
---@return table<integer, boolean>  allRoads.
function editor_api_roadRiver_editor.getAllRoads() end

--- Returns the midpoints remembered per road (only filled if roadTemplates.general.loadTemplates is enabled).
---Source: lua/ge/extensions/editor/api/roadRiver.lua:211
---@return table<integer, table>  roadSplines.
function editor_api_roadRiver_editor.getAllSplines() end

--- Reads all the nodes of an object: pos, width, and depth/normal if the object provides getNodeDepth/getNodeNormal.
---Source: lua/ge/extensions/editor/api/roadRiver.lua:127
---@param object table Road/mesh object.
---@return table  List of {pos, width, depth?, normal?}.
function editor_api_roadRiver_editor.getNodes(object) end

--- Resets the lists then walks all the level's DecalRoads to register them. Logs an error for an invalid name (starting with digits).
---Source: lua/ge/extensions/editor/api/roadRiver.lua:215
function editor_api_roadRiver_editor.initializeLevelRoadsVertices() end

--- Calls regenerate() on all known roads.
---Source: lua/ge/extensions/editor/api/roadRiver.lua:229
function editor_api_roadRiver_editor.regenerateAllDecalRoads() end

--- Empties the local lists allRoads and roadSplines.
---Source: lua/ge/extensions/editor/api/roadRiver.lua:21
function editor_api_roadRiver_editor.resetRoadList() end

--- Changes the depth of a node (river-type meshes).
---Source: lua/ge/extensions/editor/api/roadRiver.lua:51
---@param object table Mesh object.
---@param nodeID integer Node index.
---@param depth number Depth.
function editor_api_roadRiver_editor.setNodeDepth(object, nodeID, depth) end

--- Moves a node.
---Source: lua/ge/extensions/editor/api/roadRiver.lua:56
---@param object table Road/mesh object.
---@param nodeID integer Node index.
---@param position vec3 New position.
function editor_api_roadRiver_editor.setNodePosition(object, nodeID, position) end

--- Changes the width of a road or mesh node.
---Source: lua/ge/extensions/editor/api/roadRiver.lua:46
---@param object table Road/mesh object.
---@param nodeID integer Node index.
---@param width number Width.
function editor_api_roadRiver_editor.setNodeWidth(object, nodeID, width) end

--- Registers the road in allRoads and, if road templates are enabled, remembers the midpoint positions of its edges (roadSplines). Logs an error if road is nil.
---Source: lua/ge/extensions/editor/api/roadRiver.lua:9
---@param road table DecalRoad object.
function editor_api_roadRiver_editor.updateRoadVertices(road) end

