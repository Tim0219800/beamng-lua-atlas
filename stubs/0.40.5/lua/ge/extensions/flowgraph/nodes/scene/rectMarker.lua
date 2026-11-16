---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_rectMarker_C
local flowgraph_nodes_scene_rectMarker_C = {}

--- Resets stopTimer to 1 and marks the state as changed.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:91
function flowgraph_nodes_scene_rectMarker_C:_executionStarted() end

--- Calls clear when the graph stops.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:96
function flowgraph_nodes_scene_rectMarker_C:_executionStopped() end

--- Restores nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:404
---@param res any saved data
function flowgraph_nodes_scene_rectMarker_C:_onDeserialized(res) end

--- Saves nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:400
---@param res any save table
function flowgraph_nodes_scene_rectMarker_C:_onSerialize(res) end

--- Tests whether the 8 corners of the vehicle's bounding box are inside the trigger, colors the markers and computes the outputs (inside, partlyInside, distances, stopping).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:132
function flowgraph_nodes_scene_rectMarker_C:checkParking() end

--- Deletes the created trigger and markers and resets the state to zero.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:66
function flowgraph_nodes_scene_rectMarker_C:clear() end

--- Creates a corner-marker TSStatic registered under the given name and adds it to the MissionGroup.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:240
---@param markerName any object name
function flowgraph_nodes_scene_rectMarker_C:createCornerMarker(markerName) end

--- Creates the 4 corner markers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:266
function flowgraph_nodes_scene_rectMarker_C:createMarkers() end

--- Editor properties panel (empty).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:227
function flowgraph_nodes_scene_rectMarker_C:drawCustomProperties() end

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:232
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_scene_rectMarker_C:drawMiddle(builder, style) end

--- Initializes trigger, markers, debug=false and stopTimer=1.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:56
---@param mgr any flowgraph manager
---@param ... any
function flowgraph_nodes_scene_rectMarker_C:init(mgr, ...) end

--- Creates the BeamNGTrigger (position, scale, rotation) on the first call, then updates it if the pins change.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:331
function flowgraph_nodes_scene_rectMarker_C:manageTrigger() end

--- End-of-mission hook: calls clear.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:100
function flowgraph_nodes_scene_rectMarker_C:onClientEndMission() end

--- If the spot changed, repositions each marker on the ground (raycast) aligning its normal, or flat if staticMarkers.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:273
function flowgraph_nodes_scene_rectMarker_C:updateMarkerPositions() end

--- On clear, deletes everything and empties the outputs; on flow, handles the trigger, repositions the markers and checks the parking.
---Source: lua/ge/extensions/flowgraph/nodes/scene/rectMarker.lua:105
---@param args any unused
function flowgraph_nodes_scene_rectMarker_C:work(args) end

