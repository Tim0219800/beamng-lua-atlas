---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/roadRiver.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : extension `editor_api_roadRiver` : `extensions.load("editor_api_roadRiver")`, puis la globale `editor_api_roadRiver`
---@class editor_api_roadRiver
editor_api_roadRiver = {}

---Source : lua/ge/extensions/editor/api/roadRiver.lua:238
---@param editorInstance any
function editor_api_roadRiver.initialize(editorInstance) end

--- Classe locale `editor` de lua/ge/extensions/editor/api/roadRiver.lua
---@class editor_api_roadRiver_editor
local editor_api_roadRiver_editor = {}

---Source : lua/ge/extensions/editor/api/roadRiver.lua:142
---@param meshObjectId any
---@param nodeInfo any
function editor_api_roadRiver_editor.addMeshNode(meshObjectId, nodeInfo) end

--- Add a new road node to a road object.
---  @param roadObjectId the road object id
---  @param nodeInfo the node info table, fields:
---  *position* - node position
---  *width* - node width
---  *index* - node index to insert node into. Use U32_MAX to insert at the end.
---  @returns new node id
---Source : lua/ge/extensions/editor/api/roadRiver.lua:38
---@param roadObjectId any
---@param nodeInfo any
function editor_api_roadRiver_editor.addRoadNode(roadObjectId, nodeInfo) end

---Source : lua/ge/extensions/editor/api/roadRiver.lua:154
---@param type any
---@param nodes any
---@param fields any
function editor_api_roadRiver_editor.createMesh(type, nodes, fields) end

--- Create a new road object.
---  @param nodes list of nodes to create the road with, fields per node:
---  *pos* - position of the node
---  *width* - width of the node
---  @param roadInfo dictionary with the fields that should be set for the new road
---  @returns road object id
---Source : lua/ge/extensions/editor/api/roadRiver.lua:67
---@param nodes any
---@param roadInfo any
function editor_api_roadRiver_editor.createRoad(nodes, roadInfo) end

---Source : lua/ge/extensions/editor/api/roadRiver.lua:202
---@param meshObjectId any
function editor_api_roadRiver_editor.deleteMesh(meshObjectId) end

---Source : lua/ge/extensions/editor/api/roadRiver.lua:149
---@param mesh any
---@param nodeID any
function editor_api_roadRiver_editor.deleteMeshNode(mesh, nodeID) end

--- Delete the road object specified by its id.
---  @param roadObjectId the road object id
---Source : lua/ge/extensions/editor/api/roadRiver.lua:91
---@param roadObjectId any
function editor_api_roadRiver_editor.deleteRoad(roadObjectId) end

--- Delete a road node by its id.
---  @param roadObjectId the road object id
---  @param nodeId the node id
---Source : lua/ge/extensions/editor/api/roadRiver.lua:120
---@param roadObjectId any
---@param nodeID any
function editor_api_roadRiver_editor.deleteRoadNode(roadObjectId, nodeID) end

---Source : lua/ge/extensions/editor/api/roadRiver.lua:207
function editor_api_roadRiver_editor.getAllRoads() end

---Source : lua/ge/extensions/editor/api/roadRiver.lua:211
function editor_api_roadRiver_editor.getAllSplines() end

---Source : lua/ge/extensions/editor/api/roadRiver.lua:127
---@param object any
function editor_api_roadRiver_editor.getNodes(object) end

---Source : lua/ge/extensions/editor/api/roadRiver.lua:215
function editor_api_roadRiver_editor.initializeLevelRoadsVertices() end

---Source : lua/ge/extensions/editor/api/roadRiver.lua:229
function editor_api_roadRiver_editor.regenerateAllDecalRoads() end

---Source : lua/ge/extensions/editor/api/roadRiver.lua:21
function editor_api_roadRiver_editor.resetRoadList() end

---Source : lua/ge/extensions/editor/api/roadRiver.lua:51
---@param object any
---@param nodeID any
---@param depth any
function editor_api_roadRiver_editor.setNodeDepth(object, nodeID, depth) end

---Source : lua/ge/extensions/editor/api/roadRiver.lua:56
---@param object any
---@param nodeID any
---@param position any
function editor_api_roadRiver_editor.setNodePosition(object, nodeID, position) end

---Source : lua/ge/extensions/editor/api/roadRiver.lua:46
---@param object any
---@param nodeID any
---@param width any
function editor_api_roadRiver_editor.setNodeWidth(object, nodeID, width) end

---Source : lua/ge/extensions/editor/api/roadRiver.lua:9
---@param road any
function editor_api_roadRiver_editor.updateRoadVertices(road) end

