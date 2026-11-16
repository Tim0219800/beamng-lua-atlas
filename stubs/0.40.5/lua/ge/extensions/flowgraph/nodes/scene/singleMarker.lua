---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_singleMarker_C
local flowgraph_nodes_scene_singleMarker_C = {}

--- After the trigger: if flow is false and the marker is shown, tries to hide it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:61
function flowgraph_nodes_scene_singleMarker_C:_afterTrigger() end

--- Resets the position/radius cache.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:73
function flowgraph_nodes_scene_singleMarker_C:_executionStarted() end

--- Hides the marker on stop.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:67
function flowgraph_nodes_scene_singleMarker_C:_executionStopped() end

--- Empty (unused).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:100
function flowgraph_nodes_scene_singleMarker_C:blend() end

--- Called when the node is destroyed: cleans up the created objects.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:148
function flowgraph_nodes_scene_singleMarker_C:destroy() end

--- Reads position (+ data.zOffset on z), radius (2 by default, 1st component if table) and color; returns true if position or radius changed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:76
function flowgraph_nodes_scene_singleMarker_C:fillFields() end

--- Clears the marker (clearMarkers) and forgets it.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:54
function flowgraph_nodes_scene_singleMarker_C:hideMarker() end

--- Initializes the state; data.zOffset = 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:36
---@param mgr any flowgraph manager
---@param ... any
function flowgraph_nodes_scene_singleMarker_C:init(mgr, ...) end

--- End-of-mission hook: cleans up the objects created by the node.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:144
function flowgraph_nodes_scene_singleMarker_C:onClientEndMission() end

--- Draws a circle with an edge pointer on the minimap as long as the marker exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:138
---@param td any minimap drawing data
function flowgraph_nodes_scene_singleMarker_C:onDrawOnMinimap(td) end

--- Offers the marker types as templates for the markerType pin.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:45
function flowgraph_nodes_scene_singleMarker_C:postInit() end

--- On reset, hides the marker; on flow, creates the marker if needed, updates it (setToCheckpoint, color, update) and sets flow to active on output.
---Source: lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua:106
function flowgraph_nodes_scene_singleMarker_C:work() end

