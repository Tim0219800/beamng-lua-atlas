---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Node class.
---@class flowgraph_nodes_events_customizedTriggerBox_C
local flowgraph_nodes_events_customizedTriggerBox_C = {}

--- Resets the inside/outside states and marks the trigger for recomputation.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:51
function flowgraph_nodes_events_customizedTriggerBox_C:_executionStarted() end

--- Forgets the stored position, scale and points.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:59
function flowgraph_nodes_events_customizedTriggerBox_C:_executionStopped() end

--- Rereads triggerType from res.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:263
---@param res table Saved data
function flowgraph_nodes_events_customizedTriggerBox_C:_onDeserialized(res) end

--- Saves triggerType in res.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:259
---@param res table Serialization table
function flowgraph_nodes_events_customizedTriggerBox_C:_onSerialize(res) end

--- Tests whether any of the vehicle's points is inside the zone (containsOBB_point or containsEllipsoid_Point) and updates enterFlag, exitFlag, vehInside.
---Source: lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:66
function flowgraph_nodes_events_customizedTriggerBox_C:checkIntersections() end

--- Draws a colored box with edges via debugDrawer (debug mode).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:178
---@param corner vec3 Starting corner
---@param x vec3 x-axis vector
---@param y vec3 y-axis vector
---@param z vec3 z-axis vector
---@param clr table Color (color(...))
function flowgraph_nodes_events_customizedTriggerBox_C:drawAxisBox(corner, x, y, z, clr) end

--- Editor: trigger type dropdown; returns the change reason.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:235
function flowgraph_nodes_events_customizedTriggerBox_C:drawCustomProperties() end

--- Node drawing in the editor.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:255
---@param builder any
---@param style any
function flowgraph_nodes_events_customizedTriggerBox_C:drawMiddle(builder, style) end

--- Initializes the flags, triggerType = 'Box', data.highPrecision and data.debug to false.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:40
---@param mgr table Flowgraph manager
---@param ... any
function flowgraph_nodes_events_customizedTriggerBox_C:init(mgr, ...) end

--- Recomputes the zone if needed, gets the vehicle's points, calls checkIntersections and fills the output pins.
---Source: lua/ge/extensions/flowgraph/nodes/events/customizedTriggerBox.lua:93
---@param args table Flowgraph arguments
function flowgraph_nodes_events_customizedTriggerBox_C:work(args) end

