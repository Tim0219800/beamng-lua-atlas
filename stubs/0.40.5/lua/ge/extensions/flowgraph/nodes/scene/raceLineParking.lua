---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Flowgraph node class (returned by _flowgraph_createNode(C)). The methods are called by the flowgraph manager or the editor.
---@class flowgraph_nodes_scene_raceLineParking_C
local flowgraph_nodes_scene_raceLineParking_C = {}

--- Resets stopTimer to nil when the graph starts.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:44
function flowgraph_nodes_scene_raceLineParking_C:_executionStarted() end

--- Resets stopTimer to nil when the graph stops.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:48
function flowgraph_nodes_scene_raceLineParking_C:_executionStopped() end

--- Restores nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:268
---@param res any saved data
function flowgraph_nodes_scene_raceLineParking_C:_onDeserialized(res) end

--- Saves nothing.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:264
---@param res any save table
function flowgraph_nodes_scene_raceLineParking_C:_onSerialize(res) end

--- Computes the outputs (dotAngle, forward, sideDistance, forwardDistance, inside, stopping, stoppedPercent, stopped) for the tracked vehicle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:151
function flowgraph_nodes_scene_raceLineParking_C:checkParking() end

--- Draws with debugDrawer semi-transparent triangles (spot box, left/right sides) colored according to the state.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:272
function flowgraph_nodes_scene_raceLineParking_C:drawDebug() end

--- Draws the 280x300 imgui preview: spot edges (green/yellow/red), vehicle outline, front axle and stop progress circle.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:110
function flowgraph_nodes_scene_raceLineParking_C:drawImgui() end

--- Draws a 2D polyline in the current ImDrawList.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:90
---@param line any list of {x,y} points
---@param color any imgui U32 color (white by default)
---@param thickness any thickness in pixels
function flowgraph_nodes_scene_raceLineParking_C:drawLine(line, color, thickness) end

--- Draws the central content of the node in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:260
---@param builder any imgui node builder
---@param style any node style
function flowgraph_nodes_scene_raceLineParking_C:drawMiddle(builder, style) end

--- Returns the center of the two frontmost wheels, then the position of each wheel (vec3), or nothing if vehicle/pos is nil.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:236
---@param vehicle any vehicle object
---@param pos any vec3 (must be non-nil)
function flowgraph_nodes_scene_raceLineParking_C:getVehicleFrontwheelsCenterPosition(vehicle, pos) end

--- Nothing to initialize.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:40
---@param mgr any flowgraph manager
---@param ... any
function flowgraph_nodes_scene_raceLineParking_C:init(mgr, ...) end

--- Mission end hook: calls _executionStopped.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:52
function flowgraph_nodes_scene_raceLineParking_C:onClientEndMission() end

--- Converts a world position into 2D coordinates of the imgui preview, relative to the spot.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:77
---@param pos any world vec3
function flowgraph_nodes_scene_raceLineParking_C:toInternal2d(pos) end

--- On clear, resets the outputs to nil; on flow, calls checkParking, drawDebug and optionally drawImgui.
---Source: lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:58
---@param args any unused
function flowgraph_nodes_scene_raceLineParking_C:work(args) end

--- Converts a list of world points into 2D preview points (table reused between calls).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/scene/raceLineParking.lua:101
---@param line any list of vec3
function flowgraph_nodes_scene_raceLineParking_C:worldLineToMapLine(line) end

