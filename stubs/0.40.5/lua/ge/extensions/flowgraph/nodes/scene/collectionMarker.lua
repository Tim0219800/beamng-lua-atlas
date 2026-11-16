---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_collectionMarker_C
local flowgraph_nodes_scene_collectionMarker_C = {}

--- Called when the graph stops: deletes the marker.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua:42
function flowgraph_nodes_scene_collectionMarker_C:_executionStopped() end

--- Called when the node is destroyed: deletes the marker.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua:94
function flowgraph_nodes_scene_collectionMarker_C:destroy() end

--- Deletes the marker object and the light and sets the references back to nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua:30
function flowgraph_nodes_scene_collectionMarker_C:hideMarker() end

--- Nothing to initialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua:25
---@param mgr any flowgraph manager
---@param ... any
function flowgraph_nodes_scene_collectionMarker_C:init(mgr, ...) end

--- End-of-mission hook: deletes the marker.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua:89
function flowgraph_nodes_scene_collectionMarker_C:onClientEndMission() end

--- On reset, calls self:clearMarkers(). On flow, creates the TSStatic and the PointLight if needed, then updates position (with sinusoidal vertical oscillation), rotation, instance color and light (radius 3).
---Source: lua/ge/extensions/flowgraph/nodes/scene/collectionMarker.lua:47
function flowgraph_nodes_scene_collectionMarker_C:work() end

